import 'package:core_dashboard/view/admin/profile/edit_my_profile.dart';
import 'package:core_dashboard/view/admin/profile/update_password.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  bool isEditProfile;
  bool isUpdatePassword;
  MyProfileScreen({
    super.key,
    required this.isEditProfile,
    required this.isUpdatePassword,
  });

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool _isHover = false;
  bool _isPassHover = false;

  @override
  void initState() {
    // widget.isUpdatePassword = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 15),
                height: 600,
                width: MediaQuery.of(context).size.width * 0.25,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey[100],
                            minRadius: 30,
                            child: Image.asset(
                              APPLOGO,
                              width: 55,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Admin",
                                style: GoogleFonts.poppins(
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Super Admin",
                                style: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    // fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      gapH(30),
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0, bottom: 20),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.isEditProfile = false;
                                widget.isUpdatePassword = false;
                              });
                            },
                            onHover: (value) {
                              setState(() {
                                _isHover = value;
                              });
                            },
                            child: Text(
                              "My Profile",
                              style: GoogleFonts.poppins(
                                  color: _isHover
                                      ? AppColors.primary
                                      : Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 70.0, bottom: 25),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.isUpdatePassword = true;
                              });
                            },
                            onHover: (value) {
                              setState(() {
                                _isPassHover = value;
                              });
                            },
                            child: Text(
                              "Update Password",
                              style: GoogleFonts.poppins(
                                  color: _isPassHover && widget.isUpdatePassword
                                      ? AppColors.primary
                                      : Colors.black54,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              widget.isUpdatePassword
                  ? const UpdatePasswordScreen()
                  : widget.isEditProfile
                      ? const EditMyProfileScreen()
                      : Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: MediaQuery.of(context).size.width * 0.515,
                          height: 600,
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 70),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "My Profile",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black,
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    CustomBtn(
                                      title: "Edit",
                                      onPresses: () {
                                        setState(() {
                                          widget.isEditProfile = true;
                                        });
                                      },
                                      isIcon: true,
                                      icon: const Icon(Icons.edit_square,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                                const Divider(height: 50),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 80, width: 80,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[50],
                                        shape:
                                            BoxShape.circle), // minRadius: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Image.asset(
                                        APPLOGO,
                                        width: 55,
                                      ),
                                    ),
                                  ),
                                ),
                                gapH(50),
                                Text(
                                  "Name",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                gapH8,
                                Text(
                                  "Saurabh Kumar",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Divider(height: 50),
                                Text(
                                  "E-Mail Address",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                gapH8,
                                Text(
                                  "saurabh@123.com",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Divider(height: 50),
                                Text(
                                  "Date Of Birth",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                gapH8,
                                Text(
                                  "10-11-2002",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Divider(height: 50),
                                Text(
                                  "Phone",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                                gapH8,
                                Text(
                                  "3215698745",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Divider(height: 50),
                              ],
                            ),
                          ),
                        ),
            ],
          ),
          gapH16,
          BottomTextDesign(),
        ],
      ),
    );
  }
}
