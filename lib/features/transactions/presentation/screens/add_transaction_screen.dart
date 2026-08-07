import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/amount_input_field.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../shared/enums/shared_enums.dart';
import '../../../debtors/presentation/providers/debtor_list_providers.dart';
import '../providers/transaction_form_providers.dart';
import '../widgets/transaction_type_selector.dart';

class AddTransactionScreen extends ConsumerStatefulWidget {
  const AddTransactionScreen({this.debtorId, this.initialType, super.key});

  final int? debtorId;
  final String? initialType;

  @override
  ConsumerState<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends ConsumerState<AddTransactionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _reasonController = TextEditingController();

  int? _selectedDebtorId;
  late TransactionType _type;
  AdjustmentDirection _direction = AdjustmentDirection.increase;
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDebtorId = widget.debtorId;
    _type = _parseType(widget.initialType);
  }

  TransactionType _parseType(String? raw) {
    return TransactionType.values.firstWhere(
      (t) => t.name == raw,
      orElse: () => TransactionType.loan,
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime.now().add(const Duration(days: 1)),
    );
    if (picked != null) setState(() => _date = picked);
  }

  Future<void> _submit() async {
    if (_selectedDebtorId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select a debtor first')),
      );
      return;
    }
    if (!_formKey.currentState!.validate()) return;

    final amount = double.parse(_amountController.text.trim());
    final controller = ref.read(transactionFormControllerProvider.notifier);
    bool success;
    switch (_type) {
      case TransactionType.loan:
        success = await controller.submitLoan(
          debtorId: _selectedDebtorId!,
          amount: amount,
          date: _date,
          description: _descriptionController.text.trim(),
        );
      case TransactionType.payment:
        success = await controller.submitPayment(
          debtorId: _selectedDebtorId!,
          amount: amount,
          date: _date,
          description: _descriptionController.text.trim(),
        );
      case TransactionType.adjustment:
        success = await controller.submitAdjustment(
          debtorId: _selectedDebtorId!,
          amount: amount,
          date: _date,
          direction: _direction,
          reason: _reasonController.text.trim(),
        );
      case TransactionType.forgiveness:
        success = await controller.submitForgiveness(
          debtorId: _selectedDebtorId!,
          amount: amount,
          date: _date,
          reason: _reasonController.text.trim(),
        );
    }
    if (!mounted) return;
    if (success) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(transactionFormControllerProvider);
    final isSubmitting = formState.isLoading;

    return Scaffold(
      appBar: AppBar(title: const Text('Add Transaction')),
      body: AppScaffold(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            children: [
              if (widget.debtorId == null) ...[
                _buildDebtorPicker(),
                const SizedBox(height: AppSpacing.lg),
              ],
              TransactionTypeSelector(
                selected: _type,
                onChanged: (type) => setState(() => _type = type),
              ),
              const SizedBox(height: AppSpacing.lg),
              AmountInputField(controller: _amountController),
              const SizedBox(height: AppSpacing.md),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Date'),
                subtitle: Text(DateFormatter.date(_date)),
                trailing: const Icon(Icons.calendar_today_outlined),
                onTap: _pickDate,
              ),
              const SizedBox(height: AppSpacing.md),
              if (_type == TransactionType.adjustment) ...[
                SegmentedButton<AdjustmentDirection>(
                  segments: const [
                    ButtonSegment(
                      value: AdjustmentDirection.increase,
                      label: Text('Increase'),
                      icon: Icon(Icons.add),
                    ),
                    ButtonSegment(
                      value: AdjustmentDirection.decrease,
                      label: Text('Decrease'),
                      icon: Icon(Icons.remove),
                    ),
                  ],
                  selected: {_direction},
                  onSelectionChanged: (values) => setState(() => _direction = values.first),
                ),
                const SizedBox(height: AppSpacing.md),
              ],
              if (_type == TransactionType.adjustment || _type == TransactionType.forgiveness)
                TextFormField(
                  controller: _reasonController,
                  decoration: const InputDecoration(labelText: 'Reason'),
                  validator: Validators.requiredReason,
                  maxLines: 2,
                )
              else
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description (optional)'),
                  maxLines: 2,
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
                    : const Text('Save transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDebtorPicker() {
    final debtorsAsync = ref.watch(debtorListWithBalancesProvider);
    return debtorsAsync.when(
      loading: () => const LinearProgressIndicator(),
      error: (e, _) => Text('Failed to load debtors: $e'),
      data: (debtors) {
        return DropdownButtonFormField<int>(
          initialValue: _selectedDebtorId,
          decoration: const InputDecoration(labelText: 'Debtor'),
          items: debtors
              .map((d) => DropdownMenuItem<int>(
                    value: d.debtor.id,
                    child: Text(d.debtor.fullName),
                  ))
              .toList(),
          onChanged: (value) => setState(() => _selectedDebtorId = value),
          validator: (value) => value == null ? 'Select a debtor' : null,
        );
      },
    );
  }
}
