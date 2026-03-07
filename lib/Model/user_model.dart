class User {
  final int id;
  final String firstname;
  final String secoundname;

  final String email;
  final String password;
  final String phone;

  User({
    required this.id,
    required this.firstname,
    required this.secoundname,
    required this.email,
    required this.password,
    required this.phone,
  });
}

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.password,
    required super.phone,
    required super.firstname,
    required super.secoundname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      phone: json['phone']?.toString() ?? '',
      firstname: json['firstname'] ?? '',
      secoundname: json['secoundname'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstname': firstname,
      'secoundname': secoundname,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}
