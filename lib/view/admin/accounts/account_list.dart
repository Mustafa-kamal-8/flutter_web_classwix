// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';

class AccountListScreen extends StatefulWidget {
  const AccountListScreen({super.key});

  @override
  State<AccountListScreen> createState() => AccountListScreenState();
}

class AccountListScreenState extends State<AccountListScreen> {
  bool _isHover = false;
  bool checkboxValue = false;
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
                  "Account List",
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
                        text: "Account List  ",
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
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              content: SingleChildScrollView(
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Account Create',
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
                                                      MaterialStateProperty.all(
                                                          EdgeInsets.zero),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              50),
                                                    ),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
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
                                            "Name",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                          const SizedBox(width: 3),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
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
                                            hintText: "Enter Name",
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
                                        children: [
                                          Text(
                                            "Account Name",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                          const SizedBox(width: 3),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
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
                                            hintText: "Enter Account Name",
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
                                        children: [
                                          Text(
                                            "Account Number",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                          const SizedBox(width: 3),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
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
                                            hintText: "Enter Account Number",
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
                                        children: [
                                          Text(
                                            "Code",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                          const SizedBox(width: 3),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
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
                                            hintText: "Enter Code",
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
                                        children: [
                                          Text(
                                            "Branch",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                          const SizedBox(width: 3),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
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
                                            hintText: "Enter Branch",
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
                                        children: [
                                          Text(
                                            "Balance",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                          const SizedBox(width: 3),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
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
                                            hintText: "Enter Balance",
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
                                        children: [
                                          Text(
                                            "Status",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                          const SizedBox(width: 3),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 3),
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
                                      const SizedBox(
                                        // width: MediaQuery.of(context).size.width *
                                        //     0.35,
                                        height: 50,
                                        child: DropdownMenu(
                                          hintText: "Active",
                                          dropdownMenuEntries: [
                                            DropdownMenuEntry(
                                                value: "1", label: "Active"),
                                            DropdownMenuEntry(
                                                value: "2", label: "Inactive"),
                                          ],
                                          expandedInsets: EdgeInsets.zero,
                                        ),
                                      ),
                                      gapH(12),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                checkboxValue =
                                                    !checkboxValue; // Toggles the checkbox value
                                              });
                                            },
                                            child: checkboxValue
                                                ? const Icon(Icons.check_box)
                                                : const Icon(Icons
                                                    .check_box_outline_blank),
                                          ),
                                          const SizedBox(
                                              width:
                                                  8), // Optional: space between icon and text
                                          Text(
                                            "Default",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                    fontSize: 16,
                                                    color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: CustomBtn(
                                          title: "Save",
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
                      });
                    },
                    isIcon: true,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
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
                  Text("NAME"),
                  Text("ACCOUNT NAME"),
                  Text("ACCOUNT NAME"),
                  Text("CODE"),
                  Text("BRANCH"),
                  Text("BALANCE"),
                  Text("DEFAULT"),
                  Text("STATUS"),
                  Padding(
                    padding: EdgeInsets.only(right: 18),
                    child: Text("ACTION"),
                  ),
                ],
              ),
              gapH(20),
              const Divider(),
              // const NoDataWidget(),

              ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 1,
                itemBuilder: (context, index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "$index ",
                        style: _fontStyle(),
                      ),
                    ),
                    Text(
                      "Account $index",
                      style: _fontStyle(),
                    ),
                    Text(
                      "John-Deo",
                      style: _fontStyle(),
                    ),
                    Text(
                      "123456789",
                      style: _fontStyle(),
                    ),
                    Text(
                      "123456789",
                      style: _fontStyle(),
                    ),
                    Text(
                      "California",
                      style: _fontStyle(),
                    ),
                    Text(
                      "0.00",
                      style: _fontStyle(),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 200, 255, 244)
                            .withOpacity(0.5),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: Color.fromARGB(255, 10, 139, 14),
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 200, 255, 244)
                            .withOpacity(0.5),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        child: Text(
                          "Active",
                          style: TextStyle(
                              color: Color.fromARGB(255, 10, 139, 14),
                              fontSize: 12),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey),
                          child: const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.more_horiz,
                              size: 17,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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

  TextStyle _fontStyle() => const TextStyle(fontSize: 12);
}
