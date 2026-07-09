class TransactionModel {
  final String id;
  final String reference;
  final String title;
  final double amount;
  final double fee;
  final String type;
  final String status;
  final String direction;
  final String description;
  final String date;
  bool hasActiveReport;

  TransactionModel({
    required this.id,
    required this.reference,
    required this.title,
    required this.amount,
    required this.fee,
    required this.type,
    required this.status,
    required this.direction,
    required this.description,
    required this.date,
    required this.hasActiveReport,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> map) {
    return TransactionModel(
      id: map["id"],
      reference: map["reference"],
      title: map["title"],
      amount: (map["amount"] as num).toDouble(),
      fee: (map["fee"] as num).toDouble(),
      type: map["type"],
      status: map["status"],
      direction: map["direction"],
      description: map["description"],
      date: map["date"],
      hasActiveReport: map["hasActiveReport"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'title': title,
      'amount': amount,
      'fee': fee,
      'type': type,
      'status': status,
      'direction': direction,
      'description': description,
      'date': date,
      'has_active_report': hasActiveReport,
    };
  }
}
