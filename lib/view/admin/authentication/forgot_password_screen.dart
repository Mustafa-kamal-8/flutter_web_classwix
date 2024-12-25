import 'dart:developer';

import 'package:core_dashboard/view/admin/authentication/verify_forgot_pass_phone_otp.dart';
import 'package:core_dashboard/view/admin/entry_point.dart';
import 'package:core_dashboard/provider/forgot_pass_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool isRemember = false;

  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // List otpValues = ["", "", "", ""];

  @override
  void initState() {
    // _phoneController.text = "6203002599";
    // _passwordController.text = "Saurabh@123";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Determine the device type
              double containerWidth = constraints.maxWidth > 1200
                  ? MediaQuery.of(context).size.width *
                      0.4 // For large screens (Desktop)
                  : constraints.maxWidth > 800
                      ? MediaQuery.of(context).size.width *
                          0.6 // For medium screens (Tablets)
                      : MediaQuery.of(context).size.width *
                          0.9; // For small screens (Mobile)

              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 0),
                    width: containerWidth,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: constraints.maxWidth > 1200 ? 90 : 30,
                      ), // Adjust padding for different screen sizes
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 60),
                          Image.asset(
                            "assets/logo/Logo_g.png",
                            width: 200,
                          ),
                          const SizedBox(height: 40),
                          Text(
                            "Forgot Password",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          // Text(
                          //   "welcome back please login to your account",
                          //   style: GoogleFonts.poppins(
                          //     color: Colors.black87,
                          //   ),
                          // ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Phone",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  " *",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 15,
                                        color: Colors.red,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Enter Your phone number",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 20),

                          const SizedBox(height: 80),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_formKey.currentState!.validate()) {
                                  if (_phoneController.text.isNotEmpty) {
                                    Provider.of<ForgotPassProvider>(context,
                                            listen: false)
                                        .forgotPassSendOtp(
                                      _phoneController.text,
                                      context,
                                    )
                                        .then(
                                      (value) {
                                        if (Provider.of<ForgotPassProvider>(
                                                    context,
                                                    listen: false)
                                                .signInRes?['message'] ==
                                            "OTP resent successfully") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return VerifyForgotPassPhoneOtp(
                                                  numbar: _phoneController.text,
                                                );
                                              },
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  }
                                }
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromARGB(255, 46, 82, 244),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                child: Center(
                                  child: Text(
                                    "Send OTP",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 100),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
