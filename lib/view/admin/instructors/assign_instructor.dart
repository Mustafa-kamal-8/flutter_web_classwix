// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:core_dashboard/bloc/bloc/instructor_bloc.dart';
import 'package:core_dashboard/main.dart';
import 'package:core_dashboard/provider/groups_provider.dart';
import 'package:core_dashboard/provider/users_provider.dart';
import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../provider/course_provider.dart';

class AssignInstructorScreen extends StatefulWidget {
  const AssignInstructorScreen({super.key});

  @override
  State<AssignInstructorScreen> createState() => _AssignInstructorScreenState();
}

class _AssignInstructorScreenState extends State<AssignInstructorScreen> {
  TextEditingController _userIdController = TextEditingController();
  // TextEditingController _groupIdController = TextEditingController();

  String? selectedCourse;
  String? selectedGroups;
  String? selectedUserID;

  @override
  void initState() {
    getUserInfo();
    context.read<CourseProvider>().getCourses();
    context.read<GroupsProvider>().getGroupsData();
    context.read<UserProvider>().getUsers();
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
                  "Assign Instructor",
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
                        text: "Assing Instructor  ",
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
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: AppDefaults.padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                gapH(AppDefaults.padding),
                title(context, "User"),
                const SizedBox(height: 8),
                Consumer<UserProvider>(
                  builder: (context, provider, _) {
                    return DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      value: selectedUserID,
                      items: provider.userModel?.users.map((users) {
                        return DropdownMenuItem<String>(
                          value: users.id.toString(),
                          child: Text(users.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        selectedUserID = val;
                        log(selectedUserID.toString());
                      },
                      hint: const Text("Select a user"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        hintText: "Select a user",
                      ),
                    );
                  },
                ),
                gapH(AppDefaults.padding),
                title(context, "Class"),
                gapH8,
                Consumer<CourseProvider>(
                  builder: (context, provider, _) {
                    // if (provider.isLoading) {
                    //   return const Text("Loading..");
                    // }

                    // if (provider.courseResponse?.courses.isEmpty ?? true) {
                    //   return const Text("No classes available");
                    // }

                    // Define a variable to hold the selected value

                    return DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      value: selectedCourse,
                      items: provider.courseResponse?.courses.map((course) {
                        return DropdownMenuItem<String>(
                          value: course.id.toString(),
                          child: Text("${course.title}-${course.id}"),
                        );
                      }).toList(),
                      onChanged: (val) {
                        selectedCourse = val;
                        log(selectedCourse.toString());
                      },
                      hint: const Text("Select a course"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        hintText: "Select a course",
                      ),
                    );
                  },
                ),
                // const Divider(),
                gapH(AppDefaults.padding),
                title(context, "Group"),
                const SizedBox(height: 8),
                Consumer<GroupsProvider>(
                  builder: (context, provider, _) {
                    // if (provider.isLoading) {
                    //   return const Text("Loading..");
                    // }

                    // if (provider.courseResponse?.courses.isEmpty ?? true) {
                    //   return const Text("No classes available");
                    // }

                    // Define a variable to hold the selected value

                    return DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      value: selectedGroups,
                      items: provider.groupsModel?.groups.map((groups) {
                        return DropdownMenuItem<String>(
                          value: groups.id.toString(),
                          child: Text(groups.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        selectedGroups = val;
                        log(selectedGroups.toString());
                      },
                      hint: const Text("Select a group"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        hintText: "Select a group",
                      ),
                    );
                  },
                ),

                gapH(60),
                Align(
                  alignment: Alignment.bottomRight,
                  child: BlocListener<InstructorBloc, InstructorState>(
                    listener: (context, state) {
                      if (state is InstructorCreateSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Instructor assigned successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else if (state is InstructorCreateFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Failed to assign instructor"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    child: CustomBtn(
                      title: "Submit",
                      onPresses: () {
                        context.read<InstructorBloc>().add(
                              CreateInstructorEvent(
                                _userIdController.text,
                                selectedCourse,
                                selectedGroups,
                              ),
                            );
                      },
                    ),
                  ),
                ),
                gapH(130),
              ],
            ),
          ),
        ),
        gapH20,
        BottomTextDesign(),
        gapH20,
      ],
    );
  }

  Row title(BuildContext context, String title) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(width: 3),
        Padding(
          padding: const EdgeInsets.only(bottom: 3),
          child: Text(
            "*",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.red,
                ),
          ),
        ),
      ],
    );
  }
}
