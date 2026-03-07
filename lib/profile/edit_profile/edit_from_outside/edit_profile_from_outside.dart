// import 'package:defectscan/Auth/widgets/widgets.dart';
// import 'package:flutter/material.dart';

// class EditProfilePage extends StatelessWidget {
//   const EditProfilePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Edit profile",
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: 10),
//               Text("Full Name", style: TextStyle(fontWeight: FontWeight.bold)),
//               CustomTextFormField(
//                 hinttext: "Full name",
//                 myicon: Icon(Icons.person),
//                 isvalid: (e) {
//                   return;
//                 },
//                 obscure: false,
//               ),
//               const SizedBox(height: 15),
//               Text("Email", style: TextStyle(fontWeight: FontWeight.bold)),
//               CustomTextFormField(
//                 hinttext: "email@gmail.com ",
//                 myicon: Icon(Icons.email),
//                 isvalid: (e) {
//                   return;
//                 },
//                 obscure: false,
//               ),
//               const SizedBox(height: 15),
//               Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold)),
//               CustomTextFormField(
//                 hinttext: "Mobile",
//                 myicon: Icon(Icons.phone),
//                 isvalid: (e) {
//                   return;
//                 },
//                 obscure: false,
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   Expanded(
//                     child: DropdownButtonFormField<String>(
//                       items: const [
//                         DropdownMenuItem(
//                           value: "United States",
//                           child: Text("United States"),
//                         ),
//                         DropdownMenuItem(value: "Egypt", child: Text("Egypt")),
//                       ],
//                       onChanged: (value) {},
//                       decoration: const InputDecoration(
//                         labelText: "Country",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: DropdownButtonFormField<String>(
//                       items: const [
//                         DropdownMenuItem(
//                           value: "Female",
//                           child: Text("Female"),
//                         ),
//                         DropdownMenuItem(value: "Male", child: Text("Male")),
//                       ],
//                       onChanged: (value) {},
//                       decoration: const InputDecoration(
//                         labelText: "Gender",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 15),
//               Text("Address ", style: TextStyle(fontWeight: FontWeight.bold)),
//               CustomTextFormField(
//                 hinttext: "Address ",
//                 myicon: Icon(Icons.book),
//                 isvalid: (e) {
//                   return;
//                 },
//                 obscure: false,
//               ),
//               const SizedBox(height: 70),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xff0B132B),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   onPressed: () {},
//                   child: const Text(
//                     "Submit",
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
