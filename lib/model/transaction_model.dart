class TransactionModel {
  final int id;
  final String type;
  final String name;
  double amount;
  final String createdAt;
  bool isRepeatingPayment = false;

  TransactionModel(
      {required this.id,
      required this.type,
      required this.name,
      required this.amount,
      required this.createdAt});
}
