import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width * 0.515,
      height: 600,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 70),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Update Password",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(height: 50),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Current Password",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "*",
                    style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              // controller: nameController,

              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Current Passsword',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 13,
                ),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter current password';
                }
                return null;
              },
            ),
            gapH(20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "New Password",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "*",
                    style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              // controller: nameController,

              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'New Passsword',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 13,
                ),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter new password';
                }
                return null;
              },
            ),
            gapH(20),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Confirm Password",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "*",
                    style: GoogleFonts.poppins(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            TextFormField(
              // controller: nameController,

              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Confirm Passsword',
                hintStyle: GoogleFonts.poppins(
                  color: Colors.black54,
                  fontSize: 13,
                ),
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter confirm password';
                }
                return null;
              },
            ),
            gapH(50),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomBtn(
                title: "Update",
                onPresses: () {},
                isIcon: true,
                icon: const Icon(
                  Icons.save,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
