// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => LanguageScreenState();
}

class LanguageScreenState extends State<LanguageScreen> {
  bool _isAddLanguage = false;
  String _selectedDirection = 'Rtl';
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
                  "Languages",
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
                                  color: _isAddLanguage
                                      ? AppColors.primary
                                      : AppColors.textGrey,
                                ),
                      ),
                      TextSpan(
                        text: "languages",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: _isAddLanguage
                                      ? AppColors.primary
                                      : AppColors.textGrey,
                                ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              _isAddLanguage = false;
                            });
                          },
                      ),
                      if (_isAddLanguage)
                        TextSpan(
                          text: " / ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.textGrey,
                              ),
                        ),
                      if (_isAddLanguage)
                        TextSpan(
                          text: "create languages  ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.textGrey,
                              ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              setState(() {
                                _isAddLanguage = true;
                              });
                            },
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        gapH16,
        _isAddLanguage
            ? addLanguage()
            : Container(
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
                          "Languages",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: Colors.black,
                              ),
                        ),
                        const Spacer(),
                        CustomBtn(
                          title: "Add",
                          onPresses: () {
                            setState(() {
                              _isAddLanguage = true;
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
                          child: Text("ID"),
                        ),
                        Text("NAME"),
                        Text("CODE"),
                        Text("RTL"),
                        Text("ICON"),
                        Padding(
                          padding: EdgeInsets.only(right: 100.0),
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
                            child: Text(index.toString()),
                          ),
                          const Text('English'),
                          const Text('en'),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(5),
                              child: Text(
                                'No',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ),
                          const Icon(Icons.flag),
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey),
                                child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(
                                    Icons.more_horiz,
                                    size: 20,
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

  addLanguage() {
    return Container(
      height: 500,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Name",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: " *",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                          ),
                        ],
                      ),
                    ),
                    gapH8,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.363,
                      // width:/ double.infinity,
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
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Code",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: " *",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                          ),
                        ],
                      ),
                    ),
                    gapH8,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.363,
                      // width:/ double.infinity,
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
                        ),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gapH16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Flag Icon",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          TextSpan(
                            text: " *",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                          ),
                        ],
                      ),
                    ),
                    gapH8,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.363,
                      height: 50,
                      child: const DropdownMenu(
                        hintText: "IN",
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: "US", label: "US"),
                          DropdownMenuEntry(value: "IN", label: "IN"),
                          DropdownMenuEntry(value: "CA", label: "CA"),
                          DropdownMenuEntry(value: "AU", label: "AU"),
                          DropdownMenuEntry(value: "GB", label: "GB"),
                          DropdownMenuEntry(value: "DE", label: "DE"),
                          DropdownMenuEntry(value: "FR", label: "FR"),
                          DropdownMenuEntry(value: "JP", label: "JP"),
                          DropdownMenuEntry(value: "CN", label: "CN"),
                          DropdownMenuEntry(value: "BR", label: "BR"),
                          DropdownMenuEntry(value: "ZA", label: "ZA"),
                          DropdownMenuEntry(value: "NG", label: "NG"),
                          DropdownMenuEntry(value: "RU", label: "RU"),
                          DropdownMenuEntry(value: "MX", label: "MX"),
                          // Add more country codes as needed
                        ],
                        expandedInsets: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Direction",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                    gapH8,
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.363,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio<String>(
                            value: 'Rtl',
                            groupValue: _selectedDirection,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedDirection = value!;
                              });
                            },
                          ),
                          const Text('Rtl'),
                          gapW16,
                          Radio<String>(
                            value: 'Ltr',
                            groupValue: _selectedDirection,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedDirection = value!;
                              });
                            },
                          ),
                          const Text('Ltr'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            gapH(50),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomBtn(
                title: "Submit",
                onPresses: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
