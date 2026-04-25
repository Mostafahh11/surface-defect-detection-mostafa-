class UserModel {
  final int id;
  final String fullName;
  final String email;
  final String? phone;
  final String? avatar;
  final String accountStatus;
  final String role;
  final String theme;
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    this.phone,
    this.avatar,
    required this.accountStatus,
    required this.role,
    required this.theme,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    try {
      return UserModel(
        id: (json['id'] ?? 0) is int
            ? json['id']
            : int.tryParse(json['id'].toString()) ?? 0,
        fullName: json['full_name'],
        email: json['email'],
        phone: json['phone'],
        avatar: json['avatar'] ?? '',
        accountStatus: json['account_status'] ?? '',
        role: json['role'] ?? 'user',
        theme: json['theme'] ?? 'light',
      );
    } catch (e) {
      rethrow;
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "full_name": fullName,
      "email": email,
      "phone": phone,
      "avatar": avatar,
      "account_status": accountStatus,
      "role": role,
      'theme': theme,
    };
  }
}
