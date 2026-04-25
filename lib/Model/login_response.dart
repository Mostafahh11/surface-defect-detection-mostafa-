import 'package:defectscan/Model/user_model.dart';
class LoginResponse {
  final String message;
  final UserModel user;
  final String token;
  final bool requiresEmailVerification;
  final bool requiresPhoneVerification;

  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
    required this.requiresEmailVerification,
    required this.requiresPhoneVerification,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    try {
      return LoginResponse(
        message: (json['message'] ?? '').toString(),
        user: UserModel.fromJson(json['user'] ?? {}),
        token: (json['token'] ?? '').toString(),
        requiresEmailVerification: json['requires_email_verification'] == true,
        requiresPhoneVerification: json['requires_phone_verification'] == true,
      );
    } catch (e) {
   
      rethrow;
    }
  }
}
