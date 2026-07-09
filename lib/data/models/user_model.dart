class UserModel {
  final String name;
  final double walletBalance;
  final String kycLevel;

  const UserModel({
    required this.name,
    required this.walletBalance,
    required this.kycLevel,
  });

// Send to DB
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map["name"],
      walletBalance: map["walletBalance"],
      kycLevel: map["kycLevel"],
    );
  }

// Fetch from DB
  Map<String, dynamic> toJson(){
    return {
      "name": name,
      "walletBalance": walletBalance,
      "kycLevel": kycLevel
    };
  }
}
