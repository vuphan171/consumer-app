import 'package:consumer_app/common/extension/transaction.dart';
import 'package:consumer_app/common/model/transaction/transaction_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewTransactionState {
  final TransactionType transactionType;
  const NewTransactionState({this.transactionType = TransactionType.expense});

  NewTransactionState copyWith({TransactionType? transactionType}) {
    return NewTransactionState(
      transactionType: transactionType ?? this.transactionType,
    );
  }
}

class NewTransactionProvider extends StateNotifier<NewTransactionState> {
  final Ref ref;
  NewTransactionProvider({required this.ref}) : super(NewTransactionState());

  void onChangeTransactionType(int value) {
    state = state.copyWith(
      transactionType: TransactionTypeValue.fromValue(value),
    );
  }
}

final newTransactionProvider =
    StateNotifierProvider<NewTransactionProvider, NewTransactionState>((ref) {
      final notifier = NewTransactionProvider(ref: ref);
      return notifier;
    });
