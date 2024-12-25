// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:core_dashboard/provider/course_provider.dart';
import 'package:core_dashboard/provider/create_course_provider.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../../../shared/constants/ghaps.dart';

class CourseWebviewScreen extends StatefulWidget {
  const CourseWebviewScreen({super.key});

  @override
  State<CourseWebviewScreen> createState() => _CourseWebviewScreenState();
}

class _CourseWebviewScreenState extends State<CourseWebviewScreen> {
  final quill.QuillController _controller = quill.QuillController.basic();

  final TextEditingController _titleController = TextEditingController();
  // final TextEditingController _slugController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final TextEditingController _courseCategoryIdController =
  // TextEditingController();
  final TextEditingController _shortDescriptionController =
      TextEditingController();

  bool _isCreateCourse = false;

  bool _isGeneral = false;
  bool _isRequirement = false;
  bool _isPrice = false;
  bool _isMedia = false;
  bool _isSEO = false;
  bool _isCompleted = false;

  bool _isChecked = false;

  String? title;

  Uint8List? _webImage;
  String? _imageUrl;
  html.File? webImageFile;
  File? mobileImageFile;

  Future<void> _pickImageWeb() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (kIsWeb) {
        // Read image as bytes for web
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes; // Set bytes
          _imageUrl = image.path; // Set image URL (path)
          webImageFile = html.File([bytes], image.name); // Create html.File
        });
        log("Web Image URL: $_imageUrl");
        log("Web Image File: $webImageFile");
      } else {
        // For mobile, create a File instance
        mobileImageFile = File(image.path);
        setState(() {
          _imageUrl = image.path; // Set image URL
        });
        log("Mobile Image URL: $_imageUrl");
        log("Mobile Image File: $mobileImageFile");
      }
    }
  }

  @override
  void initState() {
    Provider.of<CourseProvider>(context, listen: false).getCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCreateCourse == false
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Courses",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
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
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.primary,
                                      ),
                                ),
                                TextSpan(
                                  text: " / ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.textGrey,
                                      ),
                                ),
                                TextSpan(
                                  text: "Course   ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
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
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 460,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Show",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                ),
                                const SizedBox(width: 10),
                                const SizedBox(
                                  width: 180,
                                  height: 50,
                                  child: DropdownMenu(
                                    hintText: "Select categories",
                                    dropdownMenuEntries: [
                                      DropdownMenuEntry(
                                        value: "1",
                                        label: "Music",
                                      ),
                                    ],
                                    expandedInsets: EdgeInsets.zero,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const SizedBox(
                                  width: 180,
                                  height: 50,
                                  child: DropdownMenu(
                                    hintText: "Select Instructor",
                                    dropdownMenuEntries: [
                                      DropdownMenuEntry(
                                        value: "1",
                                        label: "Admin",
                                      ),
                                    ],
                                    expandedInsets: EdgeInsets.zero,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const SizedBox(
                                  width: 180,
                                  height: 50,
                                  child: DropdownMenu(
                                    hintText: "Select status",
                                    dropdownMenuEntries: [
                                      DropdownMenuEntry(
                                        value: "1",
                                        label: "Active",
                                      ),
                                      DropdownMenuEntry(
                                        value: "2",
                                        label: "Pending",
                                      ),
                                    ],
                                    expandedInsets: EdgeInsets.zero,
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
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.black12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.black12),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.red, width: 2.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                            color: Colors.redAccent,
                                            width: 2.0),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:
                                        const Color.fromARGB(255, 46, 82, 244),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 15,
                                    ),
                                    child: Text(
                                      "Filter",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                // InkWell(
                                //   onTap: () {},
                                //   child: Container(
                                //     decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(5),
                                //       color: const Color.fromARGB(
                                //           255, 46, 82, 244),
                                //     ),
                                //     child: Padding(
                                //         padding: const EdgeInsets.symmetric(
                                //           // horizontal: ,
                                //           vertical: 9.5,
                                //         ),
                                //         child: TextButton.icon(
                                //           onPressed: () {
                                //             setState(() {
                                //               _isCreateCourse = true;
                                //             });
                                //           },
                                //           icon: const Icon(
                                //             Icons.add,
                                //             color: Colors.white,
                                //           ),
                                //           label: Text(
                                //             "Add",
                                //             style: Theme.of(context)
                                //                 .textTheme
                                //                 .headlineLarge!
                                //                 .copyWith(
                                //                   fontWeight: FontWeight.w600,
                                //                   fontSize: 16,
                                //                   color: Colors.white,
                                //                 ),
                                //           ),
                                //         )),
                                //   ),
                                // ),
                              ],
                            ),
                            gapH20,
                            const Divider(),
                            gapH8,
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("ID"),
                                Text("TITLE"),
                                Text("CATEGORY"),
                                Text("INSTRUCTOR"),
                                // SizedBox(width: 5),
                                Text("CONTENT"),
                                Text("ENROLLMENT"),
                                Text("PRICE"),
                                Text("COURSE TYPE"),
                                Text("STATUS"),
                                Text("VISIBILITY"),
                                Text("ACTION"),
                              ],
                            ),
                            gapH8,
                            const Divider(),
                            Consumer<CourseProvider>(
                              builder: (context, courseProvider, _) {
                                if (courseProvider.isLoading ||
                                    courseProvider.courseResponse == null) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                return courseProvider.courseResponse == []
                                    ? Column(
                                        children: [
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 35.0),
                                              child: Image.asset(
                                                "assets/logo/no-data.png",
                                                width: 150,
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
                                        ],
                                      )
                                    : ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            const Divider(
                                                height: 35,
                                                color: Colors.black12),
                                        shrinkWrap: true,
                                        itemCount: courseProvider.courseResponse
                                                ?.courses.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          final courses = courseProvider
                                              .courseResponse?.courses[index];
                                          return Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                courses?.id.toString() ?? "",
                                              ),
                                              gapW(30),
                                              SizedBox(
                                                width: 75,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  courses?.title.toString() ??
                                                      "",
                                                ),
                                              ),
                                              gapW(15),
                                              SizedBox(
                                                width: 100,
                                                child: Text(
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  courses?.category.title
                                                          .toString() ??
                                                      "",
                                                ),
                                              ),
                                              gapW(40),
                                              // Text(
                                              //   courses?.instructor.name
                                              //           .toString() ??
                                              //       "",
                                              // ),
                                              gapW(95),
                                              const Text(
                                                "   ",
                                              ),
                                              gapW(100),
                                              const Text("   "),
                                              gapW(100),
                                              Text(
                                                courses?.price == null
                                                    ? "0"
                                                    : courses?.price
                                                            .toString() ??
                                                        "",
                                              ),
                                              gapW(120),
                                              Text(
                                                courses?.courseType
                                                        .toString() ??
                                                    "",
                                              ),
                                              gapW(100),
                                              Text(
                                                courses?.statusId.toString() ??
                                                    "",
                                              ),
                                              gapW(90),
                                              Text(
                                                courses?.visibilityId
                                                        .toString() ??
                                                    "",
                                              ),
                                              gapW(80),
                                              const Text("   "),
                                            ],
                                          );
                                        },
                                      );
                              },
                            ),

                            // if (!Responsive.isMobile(context)) gapH24,
                            // Text(
                            //   "Customer list",
                            //   style: Theme.of(context)
                            //       .textTheme
                            //       .headlineLarge!
                            //       .copyWith(fontWeight: FontWeight.w600),
                            // ),
                            // gapH16,
                            // const _List(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Center(
                          child: Text(
                            bottomText,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            )

          //CREATR COURSES
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Create Courses",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
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
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.primary,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text: " / ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.textGrey,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text: "Courses",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.primary,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      setState(() {
                                        _isCreateCourse = false;
                                      });
                                    },
                                ),
                                TextSpan(
                                  text: " / ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: AppColors.textGrey,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                                TextSpan(
                                  text: "Create Course  ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        // fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color:
                                            //  _isAddCertificateTemplate
                                            // ? AppColors.primary
                                            // :
                                            AppColors.textGrey,
                                      ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {},
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1200),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            _buildStepper(context),
                            const SizedBox(height: 20),
                            const Divider(),
                            const SizedBox(height: 16),
                            _isRequirement == false
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Course Title",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                  // fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                          ),
                                          const SizedBox(width: 2),
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
                                                    fontSize: 10,
                                                    color: Colors.red,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 16),
                                      TextFormField(
                                        controller: _titleController,
                                        validator: (value) {
                                          title = value;
                                          return value!.isEmpty
                                              ? "Title is requires"
                                              : "";
                                        },
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          hintText: "Enter Title",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        maxLines: 1,
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Course Type",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      // fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(width: 2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.2),
                                          Row(
                                            children: [
                                              Text(
                                                "Instructor",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      // fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(width: 2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.21),
                                          Row(
                                            children: [
                                              Text(
                                                "Level",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      // fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(width: 2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "Live",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1", label: "Live"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Record"),
                                                DropdownMenuEntry(
                                                    value: "2", label: "Text"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "Select Instructor",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1", label: "Admin"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.22,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "Select Level",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1",
                                                    label: "Begineer"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Intermediate"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Advanced"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "Short description",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                      ),
                                      const SizedBox(height: 20),
                                      TextField(
                                        controller: _shortDescriptionController,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          hintText: "Enter Title",
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black26),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(5),
                                            ),
                                          ),
                                        ),
                                        maxLines: 5,
                                      ),
                                      const SizedBox(height: 20),
                                      Text(
                                        "Description",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge!
                                            .copyWith(
                                              // fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.black,
                                            ),
                                      ),
                                      const SizedBox(height: 15),
                                      Container(
                                        // height: 200,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                                color: Colors.black38)),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              // mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          8, 8, 8, 1),
                                                  child: SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.12,
                                                    height: 35,
                                                    child:
                                                        DropdownButtonFormField<
                                                            String>(
                                                      decoration:
                                                          const InputDecoration(
                                                        // Remove the border
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide.none,
                                                        ),
                                                        // Remove padding if necessary
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                      ),
                                                      hint: const Text(
                                                          "Paragraph"),
                                                      items: const [
                                                        DropdownMenuItem(
                                                          value: "1",
                                                          child:
                                                              Text("Paragraph"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "2",
                                                          child: Text(
                                                              "Headline 3"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "3",
                                                          child: Text(
                                                              "Headline 2"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "4",
                                                          child: Text(
                                                              "Headline 1"),
                                                        ),
                                                      ],
                                                      onChanged: (value) {
                                                        // Handle change here
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                _verticalDivider(),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                      Icons.format_bold),
                                                ),
                                                const SizedBox(width: 5),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.format_italic_sharp,
                                                  ),
                                                ),
                                                _verticalDivider(),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons
                                                        .format_list_bulleted_outlined,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons
                                                        .format_list_numbered_outlined,
                                                  ),
                                                ),
                                                _verticalDivider(),
                                                InkWell(
                                                  onTap: () {},
                                                  child: Transform.rotate(
                                                    angle:
                                                        2, // Rotation angle in radians (1.5 radians ≈ 86 degrees)
                                                    child: const Icon(
                                                      Icons.link_outlined,
                                                      size: 25,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons
                                                        .video_library_outlined,
                                                  ),
                                                ),
                                                _verticalDivider(),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const RotatedBox(
                                                    quarterTurns: 2,
                                                    child: Icon(
                                                      Icons.format_quote,
                                                    ),
                                                  ),
                                                ),
                                                _verticalDivider(),
                                                TextButton.icon(
                                                  style: const ButtonStyle(
                                                    padding:
                                                        WidgetStatePropertyAll(
                                                            EdgeInsets.zero),
                                                  ),
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.table_view,
                                                    color: Colors.black,
                                                  ),
                                                  label: const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                _verticalDivider(),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.undo,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.redo,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                                color: Colors.black38),
                                            TextField(
                                              controller:
                                                  _descriptionController,
                                              decoration: const InputDecoration(
                                                fillColor: Colors.white,
                                                filled: true,
                                                hintText: "Enter Description",
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide.none,
                                                ),
                                              ),
                                              maxLines: 5,
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Category",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      // fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(width: 2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // SizedBox(
                                          //     width:
                                          //         MediaQuery.of(context).size.width * 0.2),
                                          Row(
                                            children: [
                                              const SizedBox(width: 45),
                                              Text(
                                                "Status",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      // fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(width: 2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // SizedBox(
                                          //     width:
                                          //         MediaQuery.of(context).size.width * 0.21),
                                          Row(
                                            children: [
                                              const SizedBox(width: 45),
                                              Text(
                                                "Visibility",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      // fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(width: 2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          // SizedBox(
                                          //     width:
                                          //         MediaQuery.of(context).size.width * 0.21),
                                          Row(
                                            children: [
                                              const SizedBox(width: 50),
                                              Text(
                                                "Language",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      // fontWeight: FontWeight.w600,
                                                      fontSize: 16,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                              const SizedBox(width: 2),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 3),
                                                child: Text(
                                                  "*",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 10,
                                                        color: Colors.red,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Text(''),
                                        ],
                                      ),
                                      const SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "Select Category",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1", label: "Music"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "Active",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1",
                                                    label: "Active"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Inactive"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "Draft",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1", label: "Draft"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Public"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Private"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.18,
                                            height: 50,
                                            child: const DropdownMenu(
                                              hintText: "English",
                                              dropdownMenuEntries: [
                                                DropdownMenuEntry(
                                                    value: "1",
                                                    label: "English"),
                                                DropdownMenuEntry(
                                                    value: "2", label: "Hindi"),
                                                DropdownMenuEntry(
                                                    value: "2",
                                                    label: "Russian"),
                                              ],
                                              expandedInsets: EdgeInsets.zero,
                                            ),
                                          ),
                                        ],
                                      ),
                                      gapH20,
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 100,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 46, 82, 244),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 15,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Back",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 16,
                                                        color: Colors.white,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (_titleController
                                                        .text.isNotEmpty &&
                                                    _shortDescriptionController
                                                        .text.isNotEmpty &&
                                                    _descriptionController
                                                        .text.isNotEmpty) {
                                                  _isRequirement = true;
                                                } else if (_titleController
                                                    .text.isEmpty) {
                                                  showSnackBar(
                                                      "Course title is required.",
                                                      context,
                                                      Colors.red);
                                                } else if (_shortDescriptionController
                                                    .text.isEmpty) {
                                                  showSnackBar(
                                                      "Short Description is required.",
                                                      context,
                                                      Colors.red);
                                                } else if (_descriptionController
                                                    .text.isEmpty) {
                                                  showSnackBar(
                                                      "Description is required.",
                                                      context,
                                                      Colors.red);
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 100,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: const Color.fromARGB(
                                                    255, 46, 82, 244),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                  vertical: 15,
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Next",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge!
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : _isPrice == false
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Course Requirements",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                  // fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                          ),
                                          const SizedBox(height: 15),
                                          Container(
                                            // height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black38)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(8, 8, 8, 1),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.12,
                                                        height: 35,
                                                        child:
                                                            DropdownButtonFormField<
                                                                String>(
                                                          decoration:
                                                              const InputDecoration(
                                                            // Remove the border
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            // Remove padding if necessary
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                          ),
                                                          hint: const Text(
                                                              "Paragraph"),
                                                          items: const [
                                                            DropdownMenuItem(
                                                              value: "1",
                                                              child: Text(
                                                                  "Paragraph"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "2",
                                                              child: Text(
                                                                  "Headline 3"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "3",
                                                              child: Text(
                                                                  "Headline 2"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "4",
                                                              child: Text(
                                                                  "Headline 1"),
                                                            ),
                                                          ],
                                                          onChanged: (value) {
                                                            // Handle change here
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                          Icons.format_bold),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .format_italic_sharp,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .format_list_bulleted_outlined,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .format_list_numbered_outlined,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Transform.rotate(
                                                        angle:
                                                            2, // Rotation angle in radians (1.5 radians ≈ 86 degrees)
                                                        child: const Icon(
                                                          Icons.link_outlined,
                                                          size: 25,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .video_library_outlined,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const RotatedBox(
                                                        quarterTurns: 2,
                                                        child: Icon(
                                                          Icons.format_quote,
                                                        ),
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    TextButton.icon(
                                                      style: const ButtonStyle(
                                                        padding:
                                                            WidgetStatePropertyAll(
                                                                EdgeInsets
                                                                    .zero),
                                                      ),
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.table_view,
                                                        color: Colors.black,
                                                      ),
                                                      label: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.undo,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.redo,
                                                        color: Colors.black45,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                    color: Colors.black38),
                                                const TextField(
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText:
                                                        "Enter Description",
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                  maxLines: 5,
                                                )
                                              ],
                                            ),
                                          ),
                                          gapH20,
                                          Text(
                                            "Course Outcomes",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineLarge!
                                                .copyWith(
                                                  // fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                  color: Colors.black,
                                                ),
                                          ),
                                          const SizedBox(height: 15),
                                          Container(
                                            // height: 200,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: Colors.black38)),
                                            child: Column(
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  // mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(8, 8, 8, 1),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.12,
                                                        height: 35,
                                                        child:
                                                            DropdownButtonFormField<
                                                                String>(
                                                          decoration:
                                                              const InputDecoration(
                                                            // Remove the border
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                            ),
                                                            // Remove padding if necessary
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            10),
                                                          ),
                                                          hint: const Text(
                                                              "Paragraph"),
                                                          items: const [
                                                            DropdownMenuItem(
                                                              value: "1",
                                                              child: Text(
                                                                  "Paragraph"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "2",
                                                              child: Text(
                                                                  "Headline 3"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "3",
                                                              child: Text(
                                                                  "Headline 2"),
                                                            ),
                                                            DropdownMenuItem(
                                                              value: "4",
                                                              child: Text(
                                                                  "Headline 1"),
                                                            ),
                                                          ],
                                                          onChanged: (value) {
                                                            // Handle change here
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                          Icons.format_bold),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .format_italic_sharp,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .format_list_bulleted_outlined,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .format_list_numbered_outlined,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: Transform.rotate(
                                                        angle:
                                                            2, // Rotation angle in radians (1.5 radians ≈ 86 degrees)
                                                        child: const Icon(
                                                          Icons.link_outlined,
                                                          size: 25,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons
                                                            .video_library_outlined,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const RotatedBox(
                                                        quarterTurns: 2,
                                                        child: Icon(
                                                          Icons.format_quote,
                                                        ),
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    TextButton.icon(
                                                      style: const ButtonStyle(
                                                        padding:
                                                            WidgetStatePropertyAll(
                                                                EdgeInsets
                                                                    .zero),
                                                      ),
                                                      onPressed: () {},
                                                      icon: const Icon(
                                                        Icons.table_view,
                                                        color: Colors.black,
                                                      ),
                                                      label: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    _verticalDivider(),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.undo,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                    InkWell(
                                                      onTap: () {},
                                                      child: const Icon(
                                                        Icons.redo,
                                                        color: Colors.black45,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Divider(
                                                    color: Colors.black38),
                                                const TextField(
                                                  decoration: InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    hintText:
                                                        "Enter Description",
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          BorderSide.none,
                                                    ),
                                                  ),
                                                  maxLines: 5,
                                                )
                                              ],
                                            ),
                                          ),
                                          gapH20,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _isRequirement = false;
                                                  });
                                                },
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: const Color.fromARGB(
                                                        255, 46, 82, 244),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20,
                                                      vertical: 15,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Back",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _isPrice = true;
                                                  });
                                                },
                                                child: Container(
                                                  width: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: const Color.fromARGB(
                                                        255, 46, 82, 244),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 20,
                                                      vertical: 15,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "Next",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : _isMedia == false
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CheckboxListTile(
                                                contentPadding: EdgeInsets.zero,
                                                splashRadius: 20,
                                                checkboxShape:
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20)),
                                                title: const Text(
                                                  'Is It Free Course',
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                value: _isChecked,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isChecked = value ?? false;
                                                  });
                                                },
                                                activeColor: Colors.blue,
                                                checkColor: Colors.white,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                              ),
                                              if (_isChecked == false)
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    gapH8,
                                                    Text(
                                                      "Course Price",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headlineLarge!
                                                          .copyWith(
                                                            // fontWeight: FontWeight.w600,
                                                            fontSize: 16,
                                                            color: Colors.black,
                                                          ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        hintText: "Enter Price",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                      ),
                                                      // maxLines: 5,
                                                    ),
                                                    gapH8,
                                                    CheckboxListTile(
                                                      contentPadding:
                                                          EdgeInsets.zero,
                                                      splashRadius: 20,
                                                      checkboxShape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                      title: const Text(
                                                        'Check Discount Price',
                                                        style: TextStyle(
                                                            fontSize: 16.0),
                                                      ),
                                                      value: _isChecked,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          _isChecked =
                                                              value ?? false;
                                                        });
                                                      },
                                                      activeColor: Colors.blue,
                                                      checkColor: Colors.white,
                                                      controlAffinity:
                                                          ListTileControlAffinity
                                                              .leading,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Course Discount",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headlineLarge!
                                                                  .copyWith(
                                                                    // fontWeight: FontWeight.w600,
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                            ),
                                                            gapH8,
                                                            SizedBox(
                                                              height: 50,
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.365,
                                                              child:
                                                                  const TextField(
                                                                decoration:
                                                                    InputDecoration(
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  hintText:
                                                                      "Enter discount",
                                                                  border:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                              5),
                                                                    ),
                                                                  ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.black26),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                              5),
                                                                    ),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.black26),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .all(
                                                                      Radius
                                                                          .circular(
                                                                              5),
                                                                    ),
                                                                  ),
                                                                ),
                                                                // maxLines: 5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              "Discount Type",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .headlineLarge!
                                                                  .copyWith(
                                                                    // fontWeight: FontWeight.w600,
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                            ),
                                                            gapH8,
                                                            SizedBox(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.365,
                                                              height: 55,
                                                              child:
                                                                  const DropdownMenu(
                                                                hintText:
                                                                    "Fixed",
                                                                dropdownMenuEntries: [
                                                                  DropdownMenuEntry(
                                                                    value: "1",
                                                                    label:
                                                                        "Fixed",
                                                                  ),
                                                                  DropdownMenuEntry(
                                                                    value: "2",
                                                                    label:
                                                                        "Percentage",
                                                                  ),
                                                                ],
                                                                expandedInsets:
                                                                    EdgeInsets
                                                                        .zero,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    gapH16,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              _isPrice = false;
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  46, 82, 244),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 20,
                                                                vertical: 15,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Back",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headlineLarge!
                                                                      .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              _isMedia = true;
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  46, 82, 244),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 20,
                                                                vertical: 15,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Next",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headlineLarge!
                                                                      .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            16,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                            ],
                                          )
                                        : _isSEO == false
                                            ? Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Course Preview Type",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge!
                                                        .copyWith(
                                                          // fontWeight: FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                  gapH8,
                                                  const SizedBox(
                                                    width: double.infinity,
                                                    height: 55,
                                                    child: DropdownMenu(
                                                      hintText: "Fixed",
                                                      dropdownMenuEntries: [
                                                        DropdownMenuEntry(
                                                          value: "1",
                                                          label: "Fixed",
                                                        ),
                                                        DropdownMenuEntry(
                                                          value: "2",
                                                          label: "Percentage",
                                                        ),
                                                      ],
                                                      expandedInsets:
                                                          EdgeInsets.zero,
                                                    ),
                                                  ),
                                                  gapH16,
                                                  Text(
                                                    "Video URL",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge!
                                                        .copyWith(
                                                          // fontWeight: FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                  gapH8,
                                                  const SizedBox(
                                                    height: 50,
                                                    width: double.infinity,
                                                    child: TextField(
                                                      decoration:
                                                          InputDecoration(
                                                        fillColor: Colors.white,
                                                        hintText:
                                                            "https;//youtube.be/316Q4QL-J4Q",
                                                        border:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  gapH16,
                                                  Text(
                                                    "Thumbnail",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge!
                                                        .copyWith(
                                                          // fontWeight: FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                  gapH16,
                                                  SizedBox(
                                                    width: double.infinity,
                                                    height: 180,
                                                    child: InkWell(
                                                      onTap: () {
                                                        _pickImageWeb();
                                                      },
                                                      child: DottedBorder(
                                                        dashPattern: const [4],
                                                        color: Colors.grey,
                                                        child: Center(
                                                          child: _webImage !=
                                                                  null
                                                              ? Image.memory(
                                                                  _webImage!,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )
                                                              : Icon(
                                                                  Icons
                                                                      .add_photo_alternate_outlined,
                                                                  color: Colors
                                                                          .grey[
                                                                      400],
                                                                  size: 50,
                                                                ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  const Text(
                                                    "NB : Icon size will 35px x 35px and not more than 1mb",
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            _isMedia = false;
                                                          });
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: const Color
                                                                .fromARGB(255,
                                                                46, 82, 244),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 20,
                                                              vertical: 15,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "Back",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headlineLarge!
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          if (_webImage!
                                                                  .isNotEmpty &&
                                                              _webImage !=
                                                                  null) {
                                                            setState(() {
                                                              _isSEO = true;
                                                            });
                                                          } else {
                                                            showSnackBar(
                                                                "Thumbnail is required",
                                                                context,
                                                                Colors.red);
                                                            setState(() {});
                                                          }
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: const Color
                                                                .fromARGB(255,
                                                                46, 82, 244),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 20,
                                                              vertical: 15,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "Next",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headlineLarge!
                                                                    .copyWith(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            : _isCompleted == false
                                                ? Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      gapH16,
                                                      Text(
                                                        "Meta Title",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                              // fontWeight: FontWeight.w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                      ),
                                                      gapH8,
                                                      const SizedBox(
                                                        height: 50,
                                                        width: double.infinity,
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            hintText:
                                                                "Enter Meta Title",
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      gapH20,
                                                      Text(
                                                        "Meta Keyword",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                              // fontWeight: FontWeight.w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                      ),
                                                      gapH8,
                                                      const SizedBox(
                                                        height: 50,
                                                        width: double.infinity,
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            hintText:
                                                                "Enter Meta Title",
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      gapH20,
                                                      Text(
                                                        "Meta Description",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                              // fontWeight: FontWeight.w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                      ),
                                                      gapH8,
                                                      const SizedBox(
                                                        height: 50,
                                                        width: double.infinity,
                                                        child: TextField(
                                                          decoration:
                                                              InputDecoration(
                                                            fillColor:
                                                                Colors.white,
                                                            hintText:
                                                                "Enter meta description",
                                                            border:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .black26),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    5),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      gapH20,
                                                      Text(
                                                        "Meta Image",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                              // fontWeight: FontWeight.w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                      ),
                                                      gapH20,
                                                      SizedBox(
                                                        width: double.infinity,
                                                        height: 180,
                                                        child: InkWell(
                                                          onTap: () {
                                                            _pickImageWeb();
                                                          },
                                                          child: DottedBorder(
                                                            dashPattern: const [
                                                              4
                                                            ],
                                                            color: Colors.grey,
                                                            child: Center(
                                                              child: _webImage !=
                                                                      null
                                                                  ? Image
                                                                      .memory(
                                                                      _webImage!,
                                                                      fit: BoxFit
                                                                          .fill,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .add_photo_alternate_outlined,
                                                                      color: Colors
                                                                              .grey[
                                                                          400],
                                                                      size: 50,
                                                                    ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      gapH20,
                                                      const Text(
                                                        "NB : Icon size will 35px x 35px and not more than 1mb",
                                                      ),
                                                      gapH20,
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                _isSEO = false;
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    46,
                                                                    82,
                                                                    244),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 15,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Back",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headlineLarge!
                                                                        .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              setState(() {
                                                                _isCompleted =
                                                                    true;
                                                              });
                                                            },
                                                            child: Container(
                                                              width: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    46,
                                                                    82,
                                                                    244),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      20,
                                                                  vertical: 15,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    "Next",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .headlineLarge!
                                                                        .copyWith(
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          fontSize:
                                                                              16,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                : Column(
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          "Everything looks good",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineLarge!
                                                              .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontSize: 35,
                                                                color: Colors
                                                                    .black,
                                                              ),
                                                        ),
                                                      ),
                                                      gapH8,
                                                      Text(
                                                        "Click on the button below to submit your form",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .copyWith(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black45,
                                                            ),
                                                      ),
                                                      gapH8,
                                                      InkWell(
                                                        onTap: () {
                                                          // setState(() {
                                                          //   if (_titleController.text.isNotEmpty &&
                                                          //       _descriptionController
                                                          //           .text
                                                          //           .isNotEmpty &&
                                                          //       _shortDescriptionController
                                                          //           .text
                                                          //           .isNotEmpty) {
                                                          //     Provider.of<CreateCourseProvider>(
                                                          //             context,
                                                          //             listen:
                                                          //                 false)
                                                          //         .createCourses(
                                                          //       _titleController
                                                          //           .text,
                                                          //       _titleController
                                                          //           .text
                                                          //           .toLowerCase(),
                                                          //       _descriptionController
                                                          //           .text,
                                                          //       _shortDescriptionController
                                                          //           .text,
                                                          //       webImageFile!,
                                                          //       context,
                                                          //     )
                                                          //         .then(
                                                          //       (value) {
                                                          //         if (Provider.of<CreateCourseProvider>(context, listen: false)
                                                          //                     .resStatusCode ==
                                                          //                 200 ||
                                                          //             Provider.of<CreateCourseProvider>(context, listen: false)
                                                          //                     .resStatusCode ==
                                                          //                 201) {
                                                          //           setState(
                                                          //               () {
                                                          //             _isCreateCourse =
                                                          //                 false;
                                                          //             _isRequirement =
                                                          //                 false;
                                                          //             _isPrice =
                                                          //                 false;
                                                          //             _isMedia =
                                                          //                 false;
                                                          //             _isSEO =
                                                          //                 false;
                                                          //             _isCompleted =
                                                          //                 false;
                                                          //           });
                                                          //         }
                                                          //       },
                                                          //     );
                                                          //   } else {
                                                          //     showSnackBar(
                                                          //         Provider.of<CreateCourseProvider>(
                                                          //                 context,
                                                          //                 listen:
                                                          //                     false)
                                                          //             .courseResponse
                                                          //             .toString(),
                                                          //         context,
                                                          //         Colors.red);
                                                          //   }
                                                          // });
                                                        },
                                                        child: Container(
                                                          width: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                            color: const Color
                                                                .fromARGB(255,
                                                                46, 82, 244),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                              horizontal: 20,
                                                              vertical: 15,
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                "Sumbit",
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headlineLarge!
                                                                    .copyWith(
                                                                      // fontWeight:
                                                                      //     FontWeight
                                                                      //         .w600,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      gapH16,
                                                      Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: InkWell(
                                                          onTap: () {
                                                            _isCompleted =
                                                                false;
                                                            setState(() {});
                                                          },
                                                          child: Container(
                                                            width: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: const Color
                                                                  .fromARGB(255,
                                                                  46, 82, 244),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                horizontal: 20,
                                                                vertical: 15,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "Back",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .headlineLarge!
                                                                      .copyWith(
                                                                        // fontWeight:
                                                                        //     FontWeight
                                                                        //         .w600,
                                                                        fontSize:
                                                                            15,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                            gapH20,
                          ],
                        ),
                      ),
                    ),
                  ),
                  gapH20,
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      child: Center(
                        child: Text(
                          bottomText,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontSize: 17,
                                color: Colors.grey,
                              ),
                        ),
                      ),
                    ),
                  ),
                  gapH20,
                ],
              ),
            ),
    );
  }

  SizedBox _verticalDivider() {
    return const SizedBox(
      height: 35,
      child: VerticalDivider(
        color: Colors.black38,
      ),
    );
  }

  Widget _buildStepper(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        _buildStepperButton('General', () {
          setState(() {
            _isGeneral = true;
            _isRequirement = false;
            _isPrice = false;
            _isMedia = false;
            _isSEO = false;
            _isCompleted = false;
          });
        }, _isGeneral, true),
        _buildStepperButton('Requirements', () {
          setState(() {
            _isGeneral = true;
            _isRequirement = true;
            _isPrice = false;
            _isMedia = false;
            _isSEO = false;
            _isCompleted = false;
          });
        }, _isRequirement, _isRequirement),
        _buildStepperButton('Price', () {
          setState(() {
            _isGeneral = true;
            _isRequirement = true;
            _isPrice = true;
            _isMedia = false;
            _isSEO = false;
            _isCompleted = false;
          });
        }, _isPrice, _isPrice),
        _buildStepperButton('Media', () {
          setState(() {
            _isGeneral = true;
            _isRequirement = true;
            _isPrice = true;
            _isMedia = true;
            _isSEO = false;
            _isCompleted = false;
          });
        }, _isMedia, _isMedia),
        _buildStepperButton('SEO', () {
          setState(() {
            _isGeneral = true;
            _isRequirement = true;
            _isPrice = true;
            _isMedia = true;
            _isSEO = true;
            _isCompleted = false;
          });
        }, _isSEO, _isSEO),
        _buildStepperButton('Complete', () {
          setState(() {
            _isGeneral = true;
            _isRequirement = true;
            _isPrice = true;
            _isMedia = true;
            _isSEO = true;
            _isCompleted = true;
          });
        }, _isCompleted, _isCompleted),
      ],
    );
  }

  Widget _buildStepperButton(String label, VoidCallback onTap, bool isActive,
      bool isPreviousStepCompleted) {
    Color color;
    if (isActive) {
      color = AppColors.primary; // Current step is primary color
    } else if (isPreviousStepCompleted) {
      color = AppColors.primary; // Completed steps are green
    } else {
      color = Colors.black87; // Future steps are black
    }

    return SizedBox(
      width: 180,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              width: 0.5,
              color: color,
            ),
          ),
          backgroundColor: Colors.white,
        ),
        onPressed: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.view_in_ar_outlined,
              color: color,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontSize: 16,
                    color: color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
