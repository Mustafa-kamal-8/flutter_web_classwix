// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:core_dashboard/bloc/bloc/instructor_bloc.dart';
import 'package:core_dashboard/main.dart';
import 'package:core_dashboard/view/admin/instructors/assign_instructor.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class InstructorListScreen extends StatefulWidget {
  const InstructorListScreen({super.key});

  @override
  State<InstructorListScreen> createState() => _InstructorListScreenState();
}

class _InstructorListScreenState extends State<InstructorListScreen> {
  bool _isCreateInstructor = false;

  int? _hoveredIndex;

  bool _isDeleteInstructor = false;

  @override
  void initState() {
    getUserInfo();
    context.read<InstructorBloc>().add(GetInstructorEvent());
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
    return _isCreateInstructor
        ? const AssignInstructorScreen()
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
                        "Instructor Lists",
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
                                    fontSize: 16,
                                    color: AppColors.primary,
                                  ),
                              recognizer: TapGestureRecognizer()..onTap = () {},
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
                              text: "Instructor Lists  ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontSize: 16,
                                    color: AppColors.textGrey,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  setState(() {
                                    _isCreateInstructor = false;
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
                        CustomBtn(onPresses: () {}, title: 'Filter'),
                        const Spacer(),
                        CustomBtn(
                          width: 0,
                          onPresses: () {
                            setState(() {
                              _isCreateInstructor = true;
                            });
                          },
                          title: 'Add',
                          isIcon: true,
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        gapW(15),
                      ],
                    ),
                    gapH8,
                    const Divider(),
                    gapH(20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text("ID", textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("NAME", textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("COURSE", textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("SALES", textAlign: TextAlign.center)),
                        Expanded(
                            child:
                                Text("BALANCE", textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("STATUS", textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("CREATED AT",
                                textAlign: TextAlign.center)),
                        Expanded(
                            child: Text("ACTION", textAlign: TextAlign.center)),
                      ],
                    ),
                    gapH(20),
                    const Divider(),
                    BlocConsumer<InstructorBloc, InstructorState>(
                      listener: (context, state) {
                        if (state is GetInstructorFailure) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                        }
                      },
                      builder: (context, state) {
                        if (state is GetInstructorSuccess) {
                          if (state.responseData.instructors.isEmpty) {
                            return const NoDataWidget();
                          }

                          return ListView.separated(
                            separatorBuilder: (context, index) =>
                                const Divider(height: 15),
                            shrinkWrap: true,
                            itemCount: state.responseData.instructors.length,
                            itemBuilder: (context, index) {
                              final instructors =
                                  state.responseData.instructors[index];

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      instructors.id.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      instructors.user.name,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      instructors.course.title,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      instructors.course.totalSales.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      instructors.course.price ?? "0",
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      instructors.course.statusId.toString(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      formatDate(instructors.createdAt),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  BlocListener<InstructorBloc, InstructorState>(
                                    listener: (context, state) {
                                      if (state is DeleteInstructorSuccess) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: const Text(
                                                "Instructor deleted successfully!"),
                                            backgroundColor: Colors.green,
                                            duration: Duration(seconds: 2),
                                          ),
                                        );
                                      } else if (state
                                          is DeleteInstructorFailure) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                "Failed to delete instructor: ${state.error}"),
                                            backgroundColor: Colors.red,
                                            duration:
                                                const Duration(seconds: 2),
                                          ),
                                        );
                                      }
                                    },
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 35.0),
                                      child: InkWell(
                                        onHover: (value) {
                                          setState(() {
                                            _hoveredIndex =
                                                value ? index : null;
                                          });
                                        },
                                        onTap: () {
                                          setState(() {
                                            // _isDeleteInstructor = true;
                                            log(
                                              instructors.id.toString(),
                                              name: "Instructor Id",
                                            );
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text(
                                                    "Delete Instructor"),
                                                content: const Text(
                                                    'Are you sure to delete the instructor'),
                                                actions: [
                                                  IconButton(
                                                    hoverColor: Colors.black12,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                      Icons.cancel,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      context
                                                          .read<
                                                              InstructorBloc>()
                                                          .add(DeleteInstructor(
                                                              instructors.id
                                                                  .toString()));
                                                      context
                                                          .read<
                                                              InstructorBloc>()
                                                          .add(
                                                              GetInstructorEvent());
                                                      Navigator.pop(context);
                                                    },
                                                    hoverColor: Colors.black12,
                                                    icon: const Icon(
                                                      Icons.delete,
                                                      color: Colors.red,
                                                    ),
                                                  )
                                                ],
                                              ),
                                            );
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _hoveredIndex == index
                                                ? AppColors.primary
                                                : Colors.grey,
                                          ),
                                          height: 30,
                                          width: 30,
                                          child: const Icon(
                                            Icons.more_horiz,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                        if (state is InstructorLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return const Text("No data available.");
                      },
                    ),
                    const Divider(),
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
