import 'package:get/get.dart';

validinpute(String type, String valuee, min) {
  if (valuee == "") {
    return "can't be empty";
  }
  if (type == "username") {
    if (!GetUtils.isUsername(valuee)) {
      return "is not valid";
    }
    if (type == "email") {
      if (!GetUtils.isEmail(valuee)) {
        return "isnot valid";
      }
    }
  }
  if (valuee.length < min) {
    return "cant't be less than 2";
  }
  if (type == "password") {
    if (GetUtils.isNull(valuee)) {
      return "can't be empty";
    }
  }
}
