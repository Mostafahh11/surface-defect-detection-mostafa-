class UserModel {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? avatar;
  final String? role;
  final String? accountStatus;
  final bool? isOnline;
  final DateTime? lastSeenAt;
  final bool? isEmailVerified;
  final DateTime? emailVerifiedAt;
  final bool? isPhoneVerified;
  final DateTime? phoneVerifiedAt;
  final String? theme;
  final int? todayScans;
  final int? totalScans;

  UserModel({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.avatar,
    this.role,
    this.accountStatus,
    this.isOnline,
    this.lastSeenAt,
    this.isEmailVerified,
    this.emailVerifiedAt,
    this.isPhoneVerified,
    this.phoneVerifiedAt,
    this.theme,
    this.todayScans,
    this.totalScans,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      role: json['role'] as String?,
      accountStatus: json['account_status'] as String?,
      isOnline: json['is_online'] as bool?,
      lastSeenAt: json['last_seen_at'] != null 
          ? DateTime.parse(json['last_seen_at'] as String) 
          : null,
      isEmailVerified: json['is_email_verified'] as bool?,
      emailVerifiedAt: json['email_verified_at'] != null 
          ? DateTime.parse(json['email_verified_at'] as String) 
          : null,
      isPhoneVerified: json['is_phone_verified'] as bool?,
      phoneVerifiedAt: json['phone_verified_at'] != null 
          ? DateTime.parse(json['phone_verified_at'] as String) 
          : null,
      theme: json['theme'] as String?,
      todayScans: json['today_scans'] as int?,
      totalScans: json['total_scans'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'role': role,
      'account_status': accountStatus,
      'is_online': isOnline,
      'last_seen_at': lastSeenAt?.toIso8601String(),
      'is_email_verified': isEmailVerified,
      'email_verified_at': emailVerifiedAt?.toIso8601String(),
      'is_phone_verified': isPhoneVerified,
      'phone_verified_at': phoneVerifiedAt?.toIso8601String(),
      'theme': theme,
      'today_scans': todayScans,
      'total_scans': totalScans,
    };
  }
}