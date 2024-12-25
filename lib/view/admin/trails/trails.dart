import 'dart:developer';

import 'package:core_dashboard/view/admin/studyMaterials/study_materials.dart';
import 'package:core_dashboard/provider/course_provider.dart';
import 'package:core_dashboard/provider/trails_provider.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:core_dashboard/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TrailsScreen extends StatefulWidget {
  const TrailsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TrailsScreenState createState() => _TrailsScreenState();
}

class _TrailsScreenState extends State<TrailsScreen> {
  final _formKey = GlobalKey<FormState>();

  String? selectedGroupsId;
  String? selectedcourseID;

  TextEditingController _linkController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  bool _isCreateTrils = true;

  @override
  void initState() {
    context.read<CourseProvider>().getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        gapH(25),
        header(context),
        gapH(25),
        trails(),
        // : createTrails(context),
        gapH8,
        BottomTextDesign(),
      ],
    );
  }

  trails() {
    return Container(
      height: 480,
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Trails",
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  CustomBtn(
                    title: "Trails",
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    isIcon: true,
                    onPresses: () {
                      setState(
                        () {
                          _isCreateTrils = true;
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => createTrails(context),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              const Divider(height: 20),
              title(
                  context, "Select a course to view the details of the trail"),
              gapH(10),
              Consumer<CourseProvider>(
                builder: (context, provider, _) {
                  return DropdownButtonFormField<String>(
                    borderRadius: BorderRadius.circular(15),
                    padding: EdgeInsets.zero,
                    value: selectedGroupsId,
                    items: provider.courseResponse?.courses.map((courses) {
                      return DropdownMenuItem<String>(
                        value: courses.id.toString(),
                        child: Text("${courses.title}"),
                        // - ${courses.id}"),
                      );
                    }).toList(),
                    onChanged: (val) {
                      selectedGroupsId = val;
                      log(selectedGroupsId.toString());
                      context
                          .read<TrailsProvider>()
                          .getTrails(int.tryParse(selectedGroupsId ?? ""));
                      context
                          .read<TrailsProvider>()
                          .getTrailLink(selectedGroupsId, context);
                      // .getTrailLink(6, context);
                    },
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: Colors.black26),
                      ),
                      // hintText: "Select a group id",
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                    ),
                    hint: const Text("Select a course"),
                  );
                },
              ),
              const Divider(height: 30),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    "COURSE NAME",
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                      child: Text(
                    "NAME",
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                      child: Text(
                    "EMAIL",
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                      child: Text(
                    "DESCRIPTION",
                    textAlign: TextAlign.start,
                  )),
                  Expanded(
                      child: Text(
                    "LINK",
                    textAlign: TextAlign.start,
                  )),
                ],
              ),
              const Divider(height: 30),
              // selectedGroupsId == null
              //     ? const NoDataWidget()
              //     :
              Consumer<TrailsProvider>(
                builder: (context, value, _) {
                  if (selectedGroupsId == null) {
                    return const NoDataWidget();
                  }

                  if (value.trailModel?.trialUsers.isEmpty ?? true) {
                    return const NoDataWidget();
                  }

                  // if (value.trailLinkError == 404) {
                  //   return const Text("No data available");
                  // }

                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final link = value.trailLinkModel?.trialLink;

                      return Row(
                        children: [
                          Expanded(
                            child: Text(
                              value.trailModel?.course.toString() ?? "",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              value.trailModel?.trialUsers[index].name
                                      .toString() ??
                                  "",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              value.trailModel?.trialUsers[index].email
                                      .toString() ??
                                  "",
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Expanded(
                            child: value.trailLinkError == 404
                                ? const Text(
                                    "--",
                                    textAlign: TextAlign.start,
                                  )
                                : InkWell(
                                    onTap: () {
                                      launchUrl(Uri.parse(link ?? ""));
                                    },
                                    child: Text(
                                      link ?? "",
                                      textAlign: TextAlign.start,
                                      style: const TextStyle(
                                          color: AppColors.primary),
                                    ),
                                  ),
                          ),
                          Expanded(
                            child: Text(
                              value.trailLinkError == 404
                                  ? "--"
                                  : value.trailLinkModel?.description
                                          .toString() ??
                                      "",
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(height: 20),
                    itemCount: value.trailModel?.trialUsers.length ?? 0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

//Create Trails
  AlertDialog createTrails(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: const Text("Create a trail"),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // const Divider(),
            title(context, "Course"),
            gapH4,
            Consumer<CourseProvider>(
              builder: (context, provider, _) {
                if (provider.isLoading) {
                  return const SizedBox();
                }

                if (provider.courseResponse?.courses.isEmpty ?? true) {
                  return const Text("No course available");
                }

                return DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(15),
                  padding: EdgeInsets.zero,
                  value: selectedcourseID,
                  items: provider.courseResponse?.courses.map((courses) {
                    return DropdownMenuItem<String>(
                      value: courses.id.toString(),
                      child: Text("${courses.title}- ${courses.id}"),
                    );
                  }).toList(),
                  onChanged: (val) {
                    selectedcourseID = val;

                    log(selectedcourseID.toString(),
                        name: "Selected course id");
                  },
                  hint: const Text(
                    "Select a course",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 16,
                    ),
                  ),
                );
              },
            ),
            gapH(15),
            title(context, "Link"),
            gapH4,
            TextField(
              controller: _linkController,
              decoration: InputDecoration(
                // filled: true,
                // fillColor: Colors.white,
                hintText: "Add link",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.redAccent, width: 2.0),
                ),
              ),
            ),
            gapH(15),
            title(context, "Description"),
            gapH4,
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                // filled: true,
                // fillColor: Colors.white,
                hintText: "Description",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.red, width: 2.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide:
                      const BorderSide(color: Colors.redAccent, width: 2.0),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        CustomBtn(
          title: "Cancle",
          onPresses: () {
            Navigator.pop(context);
            _isCreateTrils = false;
            setState(() {});
          },
        ),
        CustomBtn(
          title: "Submit",
          onPresses: () {
            if (_formKey.currentState?.validate() ?? false) {
              if (_linkController.text.isNotEmpty &&
                  _descriptionController.text.isNotEmpty) {
                context.read<TrailsProvider>().setTrailLink(
                      selectedcourseID!,
                      _linkController.text,
                      _descriptionController.text,
                      context,
                    );

                context
                    .read<TrailsProvider>()
                    .createTrails(selectedcourseID)
                    .then((_) {
                  Navigator.pop(context);
                  _isCreateTrils = false;
                });
              } else {
                showSnackBar(
                  "Please provide all the required fields.",
                  context,
                  Colors.red,
                );
              }
            }
          },
        ),
      ],
    );
  }

//Headers
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
              "Trails",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                fontSize: 16,
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
                  ),
                  TextSpan(
                    text: " / ",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: _isCreateTrils
                              ? AppColors.primary
                              : AppColors.textGrey,
                        ),
                  ),
                  TextSpan(
                    text: "Trails",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          // fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: _isCreateTrils
                              ? AppColors.primary
                              : AppColors.textGrey,
                        ),
                  ),
                  if (_isCreateTrils)
                    TextSpan(
                      text: " / ",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.textGrey,
                              ),
                    ),
                  if (_isCreateTrils)
                    TextSpan(
                      text: "Create Trails  ",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color:
                                    //  _isAddCertificateTemplate
                                    // ? AppColors.primary
                                    // :
                                    AppColors.textGrey,
                              ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
