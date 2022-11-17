import 'dart:collection';

import 'package:flutter/material.dart';

class Budget {
  const Budget(this.judul, this.nonimal, this.jenis, this.tanggal);

  final String judul;
  final int nonimal;
  final String jenis;
  final DateTime tanggal;
}

class BudgetModel extends ChangeNotifier {
  final List<Budget> _budgets = [];

  UnmodifiableListView<Budget> get budgets => UnmodifiableListView(_budgets);

  void add(Budget budget) {
    _budgets.add(budget);
  }
}
