import 'package:consumer_app/common/model/transaction/transaction_model.dart';

extension TransactionTypeValue on TransactionType {
  int toValue() {
    switch (this) {
      case TransactionType.expense:
        return 0;
      case TransactionType.income:
        return 1;
      case TransactionType.transfer:
        return 2;
    }
  }

  static TransactionType fromValue(int value) {
    switch (value) {
      case 0:
        return TransactionType.expense;
      case 1:
        return TransactionType.income;
      case 2:
        return TransactionType.transfer;
      default:
        throw Exception('Invalid TransactionType');
    }
  }
}
