// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:core_dashboard/bloc/classes_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClassesScreen extends StatefulWidget {
  const ClassesScreen({super.key});

  @override
  State<ClassesScreen> createState() => _ClassesScreenState();
}

class _ClassesScreenState extends State<ClassesScreen> {
  bool _isCreateClasses = false;
  // ignore: prefer_typing_uninitialized_variables
  var _selectedClass;

  @override
  void initState() {
    context.read<ClassesBloc>().add(FetchClassesEvent());
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
        header(context),
        gapH16,
        classes(context),
        gapH20,
        BottomTextDesign(),
        gapH20,
      ],
    );
  }

  Container header(BuildContext context) {
    return Container(
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
              "Classes",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.black,
                  ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Dashboard",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.primary,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  TextSpan(
                    text: " / ",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: _isCreateClasses
                              ? AppColors.primary
                              : AppColors.textGrey,
                        ),
                  ),
                  TextSpan(
                    text: "Classs",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: _isCreateClasses
                              ? AppColors.primary
                              : AppColors.textGrey,
                        ),
                    recognizer: TapGestureRecognizer()..onTap = () {},
                  ),
                  if (_isCreateClasses)
                    TextSpan(
                      text: " / ",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: AppColors.textGrey,
                              ),
                    ),
                  if (_isCreateClasses)
                    TextSpan(
                      text: "Create Classs",
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
    );
  }

  Container classes(BuildContext context) {
    return Container(
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
                      borderSide:
                          const BorderSide(color: Colors.redAccent, width: 2.0),
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
                  isIcon: true,
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPresses: () {
                    setState(() {
                      _isCreateClasses = !_isCreateClasses;

                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          return createClasses(context);
                        },
                      );
                    });
                  }),
              gapW(15)
            ],
          ),
          gapH20,
          const Divider(),
          gapH(20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("ID"),
                Text("CLASS NAME"),
                Padding(
                  padding: EdgeInsets.only(right: 100.0),
                  child: Text("CREATED AT"),
                ),
              ],
            ),
          ),
          const Divider(height: 30),
          BlocConsumer<ClassesBloc, ClassesState>(
            listener: (context, state) {
              if (state is ClassesGetFailure) {
                // Display an error message if fetching data fails
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              if (state is ClassesLoadingState) {
                // Show a loading indicator while the data is being fetched
                return const Center(child: CircularProgressIndicator());
              } else if (state is ClassesGetSucess) {
                return ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const Divider(height: 20),
                  itemCount: state.reponseData.length,
                  itemBuilder: (context, index) {
                    // Parse each class data item
                    final classData = state.reponseData[index];
                    final id = classData['id'];
                    final name = classData['name'];
                    final createdAt = classData['created_at'] ?? 'No Date';

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(id.toString()),
                          // Display class name
                          Text(name),
                          // Display class creation date if available
                          SizedBox(
                            width: 200,
                            child: Text(
                              textAlign: TextAlign.center,
                              formatDate(createdAt),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                // Display state properties as fallback content
                return const NoDataWidget();
              }
            },
          ),
          gapH(220),
        ],
      ),
    );
  }

  //CREATE CLASSES

  AlertDialog createClasses(BuildContext context) {
    return AlertDialog(
      title: const Text("Create Class"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.45,
            child: DropdownMenu<String>(
              hintText: "Select Class",
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "4", label: "Class 4"),
                DropdownMenuEntry(value: "5", label: "Class 5"),
                DropdownMenuEntry(value: "6", label: "Class 6"),
                DropdownMenuEntry(value: "7", label: "Class 7"),
                DropdownMenuEntry(value: "8", label: "Class 8"),
                DropdownMenuEntry(value: "8", label: "Class 8"),
              ],
              onSelected: (String? value) {
                setState(() {
                  _selectedClass = value;
                });
              },
              expandedInsets: EdgeInsets.zero,
            ),
          ),
        ],
      ),
      // actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        CustomBtn(
          title: "Cancle",
          onPresses: () {
            Navigator.pop(context);
          },
        ),
        gapW(20),
        CustomBtn(
          title: "Create",
          onPresses: () {
            context.read<ClassesBloc>().add(
                  ClassPostEvent(
                    "class $_selectedClass",
                  ),
                );
            context.read<ClassesBloc>().add(FetchClassesEvent());
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
