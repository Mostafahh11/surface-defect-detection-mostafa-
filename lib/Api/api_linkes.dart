class ApiLinkes {
  static const String auth =
      "https://lightgreen-crane-116703.hostingersite.com/api/auth";
  static const String baseurl =
      "https://lightgreen-crane-116703.hostingersite.com/api";
  //!===============================================================//
  static const String login = "$auth/login";
  static const String register = "$auth/register";
  static const String me = "$auth/me";
  static const String verifyEmail = "$auth/verify-email";
  static const String sendphoneverification = "$auth/send-phone-verification";
  static const String verifyphon = '$auth/verify-phon';
  static const String sendemailverfication = '$auth/send-email-verification';
  static const String resendcode = '$auth/resend-code';
  static const String logout = '$auth/logout';
  static const String uploadavatar = '$baseurl/upload-avatar';
  static const String updateusersetting = '$baseurl/profile/settings';
  //?=====================================================================
  static const String detectDefect = '$baseurl/scans/detect-defect';
  static const String allScans = '$baseurl/scans';
  static const String scanWithId = '$baseurl/scans/{id}';
  static const String deleteWithId = '$baseurl/scans/{id}';
  static const String scanStatistics = '$baseurl/scan-statistics';
}
