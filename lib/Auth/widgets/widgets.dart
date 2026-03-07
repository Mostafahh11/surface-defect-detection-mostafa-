import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hinttext,
    // required this.labeltext,
    required this.myicon,
    this.keyboardtype,
    required this.isvalid,
    required this.obscure,
    this.onPressed,
    this.maxlength,
  });
  final TextEditingController controller;
  final String hinttext;
  // final String labeltext;
  final Widget myicon;
  final TextInputType? keyboardtype;
  final String? Function(String?)? isvalid;
  final bool obscure;
  final Function()? onPressed;
  final int? maxlength;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardtype,
        validator: isvalid,
        maxLength: maxlength,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          // labelText: labeltext,
          hintText: hinttext,
          hintStyle: TextStyle(color: Colors.black45),
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          errorStyle: TextStyle(color: Colors.red),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(onPressed: onPressed, icon: myicon),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 1,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
    );
  }
}

Widget dividerlogin() {
  return Row(
    children: const [
      Expanded(child: Divider()),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Text("Or continue with"),
      ),
      Expanded(child: Divider()),
    ],
  );
}

Widget socialButton(String text, IconData icon, Color color, bool isgoogle) {
  return Container(
    width: double.infinity,
    height: 43,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black38),
      borderRadius: BorderRadius.circular(4),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isgoogle ? Image(image: AssetImage("")) : Icon(icon, color: color),
        SizedBox(width: 10),
        Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      ],
    ),
  );
}

class MyIconbutton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final void Function() onTap;

  const MyIconbutton({
    super.key,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      
      behavior: HitTestBehavior.opaque,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent, // لضمان استقبال اللمس
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(6),
        ),
        width: 150, // تم تقليله قليلاً لتجنب الـ Overflow في الشاشات الصغيرة
        height: 50,
        child: Center(child: Icon(icon, size: 30, color: color)),
      ),
    );
  }
}
