// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:core_dashboard/view/admin/entry_point.dart';
import 'package:core_dashboard/view/admin/organization/create_organization.dart';
import 'package:core_dashboard/shared/widgets/sidemenu/sidebar.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';

class Organization extends StatelessWidget {
  final bool isCreateOrganization;

  const Organization({super.key, required this.isCreateOrganization});

  @override
  Widget build(BuildContext context) {
    return isCreateOrganization
        ? const CreateOrganizationScreen()
        : const OrganizationListScreen();
  }
}

class OrganizationListScreen extends StatefulWidget {
  const OrganizationListScreen({super.key});

  @override
  State<OrganizationListScreen> createState() => _OrganizationListScreenState();
}

class _OrganizationListScreenState extends State<OrganizationListScreen> {
  bool _isCreateOrganization = false;

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
    return _isCreateOrganization
        ? const CreateOrganizationScreen()
        : Column(
            children: [
              gapH16,
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Organization List",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                  ),
                            ),
                            TextSpan(
                              text: " / ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color: AppColors.textGrey,
                                  ),
                            ),
                            TextSpan(
                              text: "Organization List  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 14,
                                    color: AppColors.textGrey,
                                  ),
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
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    gapH(18),
                    Row(
                      children: [
                        const SizedBox(width: 15),
                        Text(
                          "Show",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
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
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "Entries",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
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
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide:
                                    const BorderSide(color: Colors.black12),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                        const SizedBox(height: 25),
                        CustomBtn(onPresses: () {}, title: 'Filter'),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isCreateOrganization = true;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 46, 82, 244),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 15,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  gapW4,
                                  Text(
                                    "Add",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        gapW20,
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
                        Text("COURSE"),
                        Text("SALES"),
                        Text("INCOME"),
                        Text("BALANCE"),
                        Text("STATUS"),
                        Text("CREATED AT"),
                        Padding(
                          padding: EdgeInsets.only(right: 100.0),
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
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
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
}
