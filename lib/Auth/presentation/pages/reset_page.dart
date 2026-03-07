import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Reset Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            const Text(
              "Please type something you'll remember",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Text("New Password", style: TextStyle(fontWeight: FontWeight.bold)),
            // CustomTextFormField(
            //   hinttext: "New Password",
            //   myicon: Icon(Icons.password),
            //   isvalid: (e) {
            //     return;
            //   },
            //   obscure: false,
            // ),
            // const SizedBox(height: 15),
            // Text("New Password", style: TextStyle(fontWeight: FontWeight.bold)),
            // CustomTextFormField(
            //   hinttext: "Confirm Password",
            //   myicon: Icon(Icons.password),
            //               controller: ,

            //   isvalid: (e) {
            //     return;
            //   },
            //   obscure: false,
            // ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff0B132B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "confirm",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            Expanded(child: const SizedBox(height: 10)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account ?"),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
