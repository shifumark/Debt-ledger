import '../../../../core/error/result.dart';
import '../../../transactions/domain/repositories/transaction_repository.dart';
import '../entities/report_entities.dart';

class GenerateAnnualCollectionsReport {
  const GenerateAnnualCollectionsReport(this._transactionRepository);

  final TransactionRepository _transactionRepository;

  Future<Result<AnnualCollectionsReport>> call() async {
    final result = await _transactionRepository.getAnnualCollections();
    return result.fold(
      (failure) => resultFailure(failure),
      (collections) {
        final points = collections
            .map((c) => AnnualCollectionPoint(year: c.year, total: c.total))
            .toList();
        final total = points.fold<double>(0, (sum, p) => sum + p.total);
        return resultSuccess(AnnualCollectionsReport(
          years: points,
          totalAllYears: total,
          generatedAt: DateTime.now(),
        ));
      },
    );
  }
}
