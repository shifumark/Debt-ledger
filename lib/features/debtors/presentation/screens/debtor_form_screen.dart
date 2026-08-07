import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/id_generator.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/loading_indicator.dart';
import '../../domain/entities/debtor.dart';
import '../providers/debtor_detail_providers.dart';
import '../providers/debtor_form_providers.dart';
import '../widgets/debtor_avatar.dart';

class DebtorFormScreen extends ConsumerStatefulWidget {
  const DebtorFormScreen({this.debtorId, super.key});

  final int? debtorId;

  bool get isEditing => debtorId != null;

  @override
  ConsumerState<DebtorFormScreen> createState() => _DebtorFormScreenState();
}

class _DebtorFormScreenState extends ConsumerState<DebtorFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _nicknameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _notesController = TextEditingController();
  String? _photoPath;
  bool _initialized = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _nicknameController.dispose();
    _mobileController.dispose();
    _addressController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  void _hydrate(Debtor debtor) {
    if (_initialized) return;
    _initialized = true;
    _fullNameController.text = debtor.fullName;
    _nicknameController.text = debtor.nickname ?? '';
    _mobileController.text = debtor.mobile ?? '';
    _addressController.text = debtor.address ?? '';
    _notesController.text = debtor.notes ?? '';
    _photoPath = debtor.photoPath;
  }

  Future<void> _pickPhoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery, maxWidth: 800);
    if (picked == null) return;
    final docsDir = await getApplicationDocumentsDirectory();
    final destination = p.join(
      docsDir.path,
      'debtor_photos',
      '${IdGenerator.generate()}${p.extension(picked.path)}',
    );
    await Directory(p.dirname(destination)).create(recursive: true);
    await File(picked.path).copy(destination);
    setState(() => _photoPath = destination);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final input = DebtorInput(
      fullName: _fullNameController.text.trim(),
      nickname: _nicknameController.text.trim().isEmpty ? null : _nicknameController.text.trim(),
      mobile: _mobileController.text.trim().isEmpty ? null : _mobileController.text.trim(),
      address: _addressController.text.trim().isEmpty ? null : _addressController.text.trim(),
      notes: _notesController.text.trim().isEmpty ? null : _notesController.text.trim(),
      photoPath: _photoPath,
    );
    final success = await ref
        .read(debtorFormControllerProvider.notifier)
        .submit(existingId: widget.debtorId, input: input);
    if (!mounted) return;
    if (success) {
      if (widget.isEditing) ref.invalidate(debtorByIdProvider(widget.debtorId!));
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(debtorFormControllerProvider);
    final isSubmitting = formState.isLoading;

    final existingAsync =
        widget.isEditing ? ref.watch(debtorByIdProvider(widget.debtorId!)) : null;

    if (existingAsync != null) {
      return existingAsync.when(
        loading: () => const Scaffold(body: LoadingIndicator()),
        error: (e, _) => Scaffold(body: Center(child: Text('Failed to load debtor: $e'))),
        data: (debtor) {
          _hydrate(debtor);
          return _buildForm(context, isSubmitting);
        },
      );
    }
    return _buildForm(context, isSubmitting);
  }

  Widget _buildForm(BuildContext context, bool isSubmitting) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.isEditing ? 'Edit Debtor' : 'Add Debtor')),
      body: AppScaffold(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              Center(
                child: GestureDetector(
                  onTap: _pickPhoto,
                  child: Stack(
                    children: [
                      DebtorAvatar(
                        fullName: _fullNameController.text,
                        photoPath: _photoPath,
                        radius: 44,
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          radius: 14,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Icon(Icons.edit,
                              size: 14, color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(labelText: 'Full name'),
                validator: Validators.fullName,
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _nicknameController,
                decoration: const InputDecoration(labelText: 'Nickname (optional)'),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _mobileController,
                decoration: const InputDecoration(labelText: 'Mobile number (optional)'),
                keyboardType: TextInputType.phone,
                validator: Validators.mobile,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address (optional)'),
                maxLines: 2,
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes (optional)'),
                maxLines: 3,
              ),
              const SizedBox(height: AppSpacing.xl),
              FilledButton(
                onPressed: isSubmitting ? null : _submit,
                child: isSubmitting
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(widget.isEditing ? 'Save changes' : 'Add debtor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
