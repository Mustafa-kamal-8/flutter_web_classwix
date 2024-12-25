import 'dart:developer';

import 'package:core_dashboard/bloc/bloc/instructor_bloc.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:core_dashboard/view/admin/authentication/forgot_password_screen.dart';
import 'package:core_dashboard/view/admin/entry_point.dart';
import 'package:core_dashboard/provider/sign_in_provider.dart';
import 'package:core_dashboard/view/teacher/auth/sign_in.dart';
import 'package:core_dashboard/view/teacher/pages/entrypoint.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isRemember = false;
  bool isObsecure = true;
  bool isHover = false;

  // final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // _phoneController.text = "6203002599";
    // _passwordController.text = "Saurabh@123";
    context.read<InstructorBloc>().add(GetInstructorEvent());
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
                            "Login",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "welcome back please login to your account",
                            style: GoogleFonts.poppins(
                              color: Colors.black87,
                            ),
                          ),
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
                          // const SizedBox(height: 20),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Email",
                          //       style: GoogleFonts.poppins(
                          //         fontSize: 14,
                          //         fontWeight: FontWeight.normal,
                          //         color: Colors.black,
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.only(bottom: 8.0),
                          //       child: Text(
                          //         " *",
                          //         style: Theme.of(context)
                          //             .textTheme
                          //             .headlineLarge!
                          //             .copyWith(
                          //               fontSize: 15,
                          //               color: Colors.red,
                          //             ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // const SizedBox(height: 3),
                          // SizedBox(
                          //   height: 50,
                          //   width: double.infinity,
                          //   child: TextField(
                          //     controller: _emailController,
                          //     decoration: const InputDecoration(
                          //       fillColor: Colors.white,
                          //       hintText: "Enter Your Email",
                          //       border: OutlineInputBorder(
                          //         borderSide: BorderSide(),
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(5),
                          //         ),
                          //       ),
                          //       enabledBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.black26),
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(5),
                          //         ),
                          //       ),
                          //       focusedBorder: OutlineInputBorder(
                          //         borderSide: BorderSide(color: Colors.black26),
                          //         borderRadius: BorderRadius.all(
                          //           Radius.circular(5),
                          //         ),
                          //       ),
                          //     ),
                          //     maxLines: 1,
                          //   ),
                          // ),
                          // const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Password",
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "*",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontSize: 15,
                                      color: Colors.red,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 3),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: TextField(
                              controller: _passwordController,
                              obscureText: isObsecure,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "Enter Password",
                                border: const OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black26),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isObsecure = !isObsecure;
                                    });
                                  },
                                  icon: Icon(isObsecure
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              maxLines: 1,
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                side: BorderSide(color: Colors.grey.shade300),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                value: isRemember,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isRemember = value ?? false;
                                  });
                                },
                              ),
                              Text(
                                "Remember Me",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  try {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen(),
                                      ),
                                    );
                                  } catch (e) {
                                    log("Navigation Error: $e");
                                  }
                                },
                                child: Text(
                                  "Forgot Password",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_formKey.currentState!.validate()) {
                                  if (_phoneController.text.isNotEmpty &&
                                      _passwordController.text.isNotEmpty) {
                                    Provider.of<SignInProvider>(context,
                                            listen: false)
                                        .signIn(
                                      _phoneController.text,
                                      _passwordController.text,
                                      context,
                                    )
                                        .then(
                                      (value) {
                                        if (Provider.of<SignInProvider>(context,
                                                    listen: false)
                                                .signInRes?['message'] ==
                                            "Login successful") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                // return const TeacherEntryPoint();
                                                return const EntryPoint();
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
                                  child: Provider.of<SignInProvider>(context,
                                              listen: false)
                                          .isLoading
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          "Login",
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
                          const SizedBox(height: 10),
                          Center(
                            child: InkWell(
                              // hoverColor: AppColors.primary,
                              onHover: (value) {
                                setState(() {
                                  isHover = value;
                                });
                              },
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SignInPageTeacher(),
                                  ),
                                );
                              },
                              child: Text(
                                "Teacher Login",
                                style: TextStyle(
                                  color: isHover
                                      ? AppColors.primary
                                      : Colors.black87,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      isHover ? AppColors.primary : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
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
