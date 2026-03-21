import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:consumer_app/resources/transaction-item.dart';
import 'package:flutter/material.dart';

class AccountTransactions extends StatelessWidget {
  const AccountTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = AdaptiveTheme.of(context).theme;
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return const TransactionItem();
      },
      separatorBuilder: (context, index) =>
          Divider(color: theme.colorScheme.outlineVariant),
    );
  }
}
