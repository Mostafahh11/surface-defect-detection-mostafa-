import 'dart:convert';
import 'dart:io';
import 'package:defectscan/Model/login_response.dart';
import 'package:defectscan/core/service/sharedpreff.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:defectscan/Api/api_linkes.dart';

class ApiService {
  static Future<LoginResponse> login(String email, String password) async {
    final bodyData = {"email": email, "password": password};

    // 1️⃣ اطبع اللي بتبعتُه للسيرفر
    debugPrint("🚀 Sending to Server: $bodyData");

    final response = await http.post(
      Uri.parse(ApiLinkes.login),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode(bodyData),
    );

    // 2️⃣ اطبع اللي راجع من السيرفر قبل أي معالجة
    debugPrint("📥 Raw Response from Server: ${response.body}");

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return LoginResponse.fromJson(body);
    } else {
      throw Exception("Error ${response.statusCode}: ${response.body}");
    }
  }

  //? register
  static Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone, // التأكد إنها String
  }) async {
    final response = await http.post(
      Uri.parse(ApiLinkes.register),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "password_confirmation": confirmPassword,
      }),
    );

    final body = json.decode(response.body);

    if (response.statusCode == 201 || response.statusCode == 200) {
      return body;
    } else if (response.statusCode == 422) {
      final errors = body['errors'];
      String message = errors.values.first[0];
      throw Exception(message);
    } else {
      throw body['message'] ?? "Validation Error";
    }
  }

  static Future<void> sendEmailCode(String email) async {
    await http.post(
      Uri.parse(ApiLinkes.sendemailverfication),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"email": email}), // [cite: 62]
    );
  }

  // 2. دالة التحقق من الكود
  static Future<bool> verifyEmailOTP(String email, String code) async {
    final response = await http.post(
      Uri.parse(ApiLinkes.verifyEmail),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "email": email, // [cite: 77]
        "code": code, // [cite: 78]
      }),
    );

    return response.statusCode == 200; // [cite: 79, 80]
  }

  //? send code again
  static Future<bool> resendCode(String email) async {
    final response = await http.post(
      Uri.parse(ApiLinkes.resendcode),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
      body: jsonEncode({"type": "email", "contact": email}),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // me
  static Future<Map<String, dynamic>?> getMe() async {
    String? token = StorageService.shared.getString("token");

    final response = await http.get(
      Uri.parse(ApiLinkes.me),
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );

    if (response.statusCode != 200) return null;

    var body = jsonDecode(response.body);
    if (body is Map<String, dynamic>) {
      if (body['data'] != null) {
        body = body['data'];
      }
      if (body['user'] != null) {
        body = body['user'];
      }
      return Map<String, dynamic>.from(body);
    }

    return null;
  }

  // log out
  static Future<bool> logoutApi() async {
    String? token = StorageService.shared.getString("token");

    try {
      final response = await http.post(
        Uri.parse(ApiLinkes.logout), // تأكد إن اللينك ده موجود في ApiLinkes
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      // بنرجع true لو السيرفر رد بـ 200 (نجاح) أو حتى لو 401 (لأنه كدة كدة التوكن ملوش لازمة)
      return response.statusCode == 200 || response.statusCode == 401;
    } catch (e) {
      return false;
    }
  }
  //?=============================================================//

  // 1. Update text data (PUT)
  static Future<bool> updateProfileInfo({
    required String name,
    required String phone,
  }) async {
    try {
      String? token = StorageService.shared.getString("token");
      var uri = Uri.parse(
        "https://lightgreen-crane-116703.hostingersite.com/api/profile",
      );

      // Use standard PUT for text data
      var response = await http.put(
        uri,
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"full_name": name, "phone": phone}),
      );
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  // 2. Upload Avatar (POST)
  // عدل الدالة دي لترجع Map بدل bool
  static Future<Map<String, dynamic>?> uploadAvatar(File imageFile) async {
    try {
      String? token = StorageService.shared.getString("token");
      var uri = Uri.parse(
        "https://lightgreen-crane-116703.hostingersite.com/api/upload-avatar",
      );

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });
      request.files.add(
        await http.MultipartFile.fromPath('avatar', imageFile.path),
      );

      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        return jsonDecode(
          response.body,
        ); // هترجع الـ JSON اللي فيه رابط الصورة الجديدة
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  //? user setting
  static Future<bool> updateUserSettings(Map<String, dynamic> settings) async {
    try {
      String? token = StorageService.shared.getString("token");
      var response = await http.put(
        Uri.parse(ApiLinkes.updateusersetting), // اللينك بتاعك
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
          "Accept": "application/json",
        },
        body: jsonEncode(settings),
      );

      return response.statusCode == 200 || response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }

  //!============================================================================//
  static Future<Map<String, dynamic>?> detectDefect(File imageFile) async {
    try {
      String? token = StorageService.shared.getString("token");
      var uri = Uri.parse(ApiLinkes.detectDefect);

      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll({
        "Authorization": "Bearer $token",
        "Accept": "application/json",
      });

      request.files.add(
        await http.MultipartFile.fromPath('image', imageFile.path),
      );

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }
      return null;
    } catch (e) {
      debugPrint("Error in Detect Defect: $e");
      return null;
    }
  }

  static Future<List> getScans() async {
    try {
      String? token = StorageService.shared.getString("token");

      var response = await http.get(
        Uri.parse(ApiLinkes.allScans), // 👈 /api/scans
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      debugPrint("📩 getScans: ${response.body}");

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        // ⚠️ حسب شكل الباك
        if (data is List) {
          return data;
        } else if (data is Map<String, dynamic>) {
          if (data['data'] != null) {
            data = data['data'];
          }
          if (data['scans'] != null) {
            data = data['scans'];
          }
          if (data is List) {
            return data;
          }
        }

        return [];
      } else {
        debugPrint(" Failed: ${response.body}");
        return [];
      }
    } catch (e) {
      debugPrint(" getScans error: $e");
      return [];
    }
  }

  static Future<Map<String, dynamic>?> getScanStatistics() async {
    try {
      String? token = StorageService.shared.getString("token");
      final response = await http.get(
        Uri.parse(ApiLinkes.scanStatistics),
        headers: {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
        },
      );

      if (response.statusCode != 200) return null;

      var data = jsonDecode(response.body);
      if (data is Map<String, dynamic>) {
        if (data['data'] != null) {
          data = data['data'];
        }
        if (data['scan_statistics'] != null) {
          data = data['scan_statistics'];
        }
        if (data is Map<String, dynamic>) {
          return Map<String, dynamic>.from(data);
        }
      }

      return null;
    } catch (e) {
      debugPrint(" Error fetching stats: $e");
      return null;
    }
  }
}
