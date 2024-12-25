// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';

class ReviewListScreen extends StatefulWidget {
  const ReviewListScreen({super.key});

  @override
  State<ReviewListScreen> createState() => _ReviewListScreenState();
}

class _ReviewListScreenState extends State<ReviewListScreen> {
  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Map<String, dynamic> userData = await UserDataManager.getLoginInfo();
    log(userData['token'], name: "Token");
    log(userData['id'], name: "UserId");
    log(userData['name'], name: "name");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH16,
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Review Lists",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Dashboard",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: " / ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.textGrey,
                                ),
                      ),
                      TextSpan(
                        text: "Courses",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.primary,
                                ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      TextSpan(
                        text: " / ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: AppColors.textGrey,
                                ),
                      ),
                      TextSpan(
                        text: "Review Lists  ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: AppColors.textGrey,
                                ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        gapH16,
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              gapH(18),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 15),
                  Text(
                    "Show",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(
                    width: 80,
                    height: 50,
                    child: DropdownMenu(
                      hintText: "10",
                      dropdownMenuEntries: [
                        DropdownMenuEntry(
                          value: "1",
                          label: "10",
                        ),
                        DropdownMenuEntry(
                          value: "2",
                          label: "15",
                        ),
                      ],
                      expandedInsets: EdgeInsets.zero,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "Entries",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 200,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "Search",
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        suffixIcon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(color: Colors.black12),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: const BorderSide(
                              color: Colors.redAccent, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  const SizedBox(height: 25),
                  CustomBtn(onPresses: () {}, title: 'Filter'),
                ],
              ),
              gapH8,
              const Divider(),
              gapH(20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text("ID"),
                  ),
                  Text("COURSE"),
                  Text("REVIEW"),
                  Text("RATING"),
                  Padding(
                    padding: EdgeInsets.only(right: 150.0),
                    child: Text("ACTION"),
                  ),
                ],
              ),
              gapH(20),
              const Divider(),
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 35.0),
                      child: Image.asset(
                        "assets/logo/no-data.png",
                        width: 100,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Please add a new entity or manage the data table to see the content here",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                  ),
                  gapH(80),
                  const Divider(),
                  gapH(150),
                ],
              ),
              gapH(100),
            ],
          ),
        ),
        gapH20,
        BottomTextDesign(),
        gapH20,
      ],
    );
  }
}
