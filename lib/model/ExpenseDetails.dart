class ExpenseDetails {
  String expenseName;
  double amount;
  DateTime date;
  String paymentMethod;

  ExpenseDetails({
    required this.expenseName,
    required this.amount,
    required this.date,
    required this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return {
      'expenseName': expenseName,
      'amount': amount,
      'date': date,
      'paymentMethod': paymentMethod,
    };
  }
}
