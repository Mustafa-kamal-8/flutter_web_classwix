// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';

class DiscountCourseListScreen extends StatefulWidget {
  const DiscountCourseListScreen({super.key});

  @override
  State<DiscountCourseListScreen> createState() =>
      DiscountCourseListScreenState();
}

class DiscountCourseListScreenState extends State<DiscountCourseListScreen> {
  bool _isHover = false;
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
                  "Discount Course List",
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
                        text: "Discount Course List  ",
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
          height: 500,
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
                  const Spacer(),
                  CustomBtn(
                    title: "Add",
                    onPresses: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.white,
                            content: SingleChildScrollView(
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Create Featured Course',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 50,
                                          child: MouseRegion(
                                            onEnter: (_) {
                                              setState(() {
                                                _isHover = true;
                                              });
                                            },
                                            onExit: (_) {
                                              setState(() {
                                                _isHover = false;
                                              });
                                            },
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                padding:
                                                    WidgetStateProperty.all(
                                                        EdgeInsets.zero),
                                                shape: WidgetStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    WidgetStateProperty.all(
                                                  _isHover
                                                      ? AppColors.primary
                                                      : Colors.grey
                                                          .withOpacity(0.25),
                                                ),
                                              ),
                                              onPressed: () {},
                                              child: Center(
                                                child: Icon(
                                                  Icons.clear,
                                                  color: _isHover
                                                      ? Colors.white
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    gapH(12),
                                    Row(
                                      children: [
                                        Text(
                                          "Course",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.black),
                                        ),
                                        const SizedBox(width: 3),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 3),
                                          child: Text(
                                            "*",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Colors.red,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                      // width: MediaQuery.of(context).size.width * 0.35,
                                      width: double.infinity,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          fillColor: Colors.white,
                                          hintText: "Select Course",
                                          hintStyle: HINT_TEXT_STYLE,
                                          border: const OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        maxLines: 1,
                                      ),
                                    ),
                                    gapH(12),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Course Discount",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                            ),
                                            gapH8,
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.345,
                                              // width: double.infinity,
                                              child: TextField(
                                                decoration: InputDecoration(
                                                  fillColor: Colors.white,
                                                  hintText: "Select Course",
                                                  hintStyle: HINT_TEXT_STYLE,
                                                  border:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black26),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(5),
                                                    ),
                                                  ),
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Discount Type",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge!
                                                  .copyWith(
                                                      fontSize: 16,
                                                      color: Colors.black),
                                            ),
                                            gapH8,
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.345,
                                              height: 50,
                                              child: const DropdownMenu(
                                                hintText: "Fixed",
                                                dropdownMenuEntries: [
                                                  DropdownMenuEntry(
                                                      value: "1",
                                                      label: "Fixed"),
                                                  DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Percentage",
                                                  ),
                                                ],
                                                expandedInsets: EdgeInsets.zero,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 3),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    gapH(12),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: CustomBtn(
                                        title: "Create",
                                        onPresses: () {},
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add,
                      // size: 18,
                      color: Colors.white,
                    ),
                    isIcon: true,
                  ),
                  gapW(15)
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
                    child: Text("SL"),
                  ),
                  Text("TITLE"),
                  Text("INSTRUCTOR"),
                  Text("PRICE"),
                  Text("DISCOUNT"),
                  Text("TYPE DISCOUNT"),
                  Text("DISCOUNT PRICE"),
                  Text("STATUS"),
                  Padding(
                    padding: EdgeInsets.only(right: 50.0),
                    child: Text("ACTION"),
                  ),
                ],
              ),
              gapH(20),
              const Divider(),
              const NoDataWidget(),

              // ListView.separated(
              //   shrinkWrap: true,
              //   separatorBuilder: (context, index) => const Divider(),
              //   itemCount: 3,
              //   itemBuilder: (context, index) => Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsets.only(left: 15),
              //         child: Text(index.toString()),
              //       ),
              //       SizedBox(
              //         width: 120,
              //         child: Text(
              //           index == 0
              //               ? "Cash"
              //               : index == 1
              //                   ? "Cheque"
              //                   : "Bank Transfer",
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //       const SizedBox(width: 80),
              //       Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(20),
              //           color: const Color.fromARGB(255, 200, 255, 244)
              //               .withOpacity(0.5),
              //         ),
              //         child: const Padding(
              //           padding:
              //               EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              //           child: Text(
              //             "Active",
              //             style: TextStyle(
              //                 color: Color.fromARGB(255, 10, 139, 14),
              //                 fontSize: 12),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(right: 150.0),
              //         child: InkWell(
              //           onTap: () {},
              //           child: Container(
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20),
              //                 color: Colors.grey),
              //             child: const Padding(
              //               padding: EdgeInsets.all(5),
              //               child: Icon(
              //                 Icons.more_horiz,
              //                 size: 20,
              //                 color: Colors.white,
              //               ),
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
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
