import 'dart:developer';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:flutter/material.dart';

class EnrollmentScreen extends StatefulWidget {
  const EnrollmentScreen({super.key});

  @override
  State<EnrollmentScreen> createState() => _EnrollmentScreenState();
}

class _EnrollmentScreenState extends State<EnrollmentScreen> {
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
                  "Course Enrollment",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                ),
                Text(
                  "",
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.black,
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 46, 82, 244),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      child: Text(
                        "Filter",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                      ),
                    ),
                  ),
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
                  Text("COURSE TITLE"),
                  Text("STUDENT"),
                  Text("INSTRUCTOR"),
                  Text("PRICE"),
                  Text("DISCOUNT"),
                  Text("TOTAL AMOUNT"),
                  Text("DATE"),
                  Text("PAYMENT"),
                  Padding(
                    padding: EdgeInsets.only(right: 100.0),
                    child: Text("INVOICE"),
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
                  gapH(20),
                  const Divider(),
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

  Container _customCard(
    BuildContext context,
    Color containerClr,
    Color smallContainerClr,
    String title,
    String number,
    Widget icon,
  ) {
    return Container(
      height: 165,
      width: 360,
      decoration: BoxDecoration(
          color: containerClr, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: smallContainerClr),
              height: 50,
              width: 50,
              child: icon,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black38,
                  ),
            ),
            gapH8,
            Text(
              number,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
