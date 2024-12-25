// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:core_dashboard/bloc/bloc/instructor_bloc.dart';
import 'package:core_dashboard/bloc/classes_bloc.dart';
import 'package:core_dashboard/model/courses_model.dart';
import 'package:core_dashboard/provider/course_provider.dart';
import 'package:core_dashboard/provider/create_categories_provider.dart';
import 'package:core_dashboard/provider/create_course_provider.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../../../shared/constants/ghaps.dart';

class CoursesList extends StatefulWidget {
  const CoursesList({super.key});

  @override
  State<CoursesList> createState() => _CoursesListState();
}

class _CoursesListState extends State<CoursesList> {
  final quill.QuillController _controller = quill.QuillController.basic();

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _slugController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // final TextEditingController _courseCategoryIdController =
  // TextEditingController();
  final TextEditingController _instructorController = TextEditingController();
  dynamic selectedCourseCatId;
  dynamic selectedInstructorID;
  dynamic classesID;
  bool _isCreateCourse = false;

  // bool _isGeneral = false;
  // bool _isRequirement = false;
  // bool _isPrice = false;
  // bool _isMedia = false;
  // bool _isSEO = false;
  // bool _isCompleted = false;

  // bool _isChecked = false;

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
    Provider.of<CreateCategoriesProvider>(context, listen: false)
        .getCoursesCategories();
    context.read<ClassesBloc>().add(FetchClassesEvent());
    context.read<InstructorBloc>().add(GetInstructorEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isCreateCourse == false
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
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: const BorderSide(
                                          color: Colors.red, width: 2.0),
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
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:
                                        const Color.fromARGB(255, 46, 82, 244),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        // horizontal: ,
                                        vertical: 9.5,
                                      ),
                                      child: TextButton.icon(
                                        onPressed: () {
                                          setState(() {
                                            _isCreateCourse = true;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        label: Text(
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
                                      )),
                                ),
                              ),
                            ],
                          ),
                          gapH20,
                          const Divider(),
                          gapH8,
                          const Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child:
                                      Text("ID", textAlign: TextAlign.start)),
                              Expanded(
                                  child: Text("TITLE",
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text("CATEGORY",
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text("INSTRUCTOR",
                                      textAlign: TextAlign.center)),
                              // Expanded(
                              //     child: Text("CONTENT",
                              //         textAlign: TextAlign.center)),
                              // Expanded(
                              //     child: Text("ENROLLMENT",
                              //         textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text("PRICE",
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text("COURSE TYPE",
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text("STATUS",
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text("VISIBILITY",
                                      textAlign: TextAlign.center)),
                              Expanded(
                                  child: Text("ACTION",
                                      textAlign: TextAlign.center)),
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
                                      itemCount: courseProvider
                                              .courseResponse?.courses.length ??
                                          0,
                                      itemBuilder: (context, index) {
                                        final courses = courseProvider
                                            .courseResponse?.courses[index];
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // ID
                                            Expanded(
                                              child: Text(
                                                courses?.id.toString() ?? "",
                                                textAlign: TextAlign.start,
                                              ),
                                            ),

                                            // Title
                                            Expanded(
                                              // flex:
                                              //     2, // Adjust flex if necessary to control the space
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                courses?.title.toString() ?? "",
                                              ),
                                            ),

                                            // Category
                                            Expanded(
                                              // flex:
                                              //     3, // Adjust flex to balance space allocation
                                              child: Text(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                textAlign: TextAlign.center,
                                                courses?.category.title ??
                                                    "N/A",
                                              ),
                                            ),

                                            // Language
                                            Expanded(
                                              child: Text(
                                                courses?.instructorId == null
                                                    ? "-"
                                                    : courses?.instructorId
                                                            .toString() ??
                                                        "",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            // Expanded(
                                            //   child: Text(
                                            //     courses?.language.toString() ??
                                            //         "",
                                            //     textAlign: TextAlign.center,
                                            //   ),
                                            // ),

                                            // Price
                                            Expanded(
                                              child: Text(
                                                courses?.price?.toString() ??
                                                    "0",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            // Course Type
                                            Expanded(
                                              child: Text(
                                                courses?.courseType
                                                        .toString() ??
                                                    "",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            // Status
                                            Expanded(
                                              child: Text(
                                                courses?.statusId.toString() ??
                                                    "",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            // Visibility
                                            Expanded(
                                              child: Text(
                                                courses?.visibilityId
                                                        .toString() ??
                                                    "",
                                                textAlign: TextAlign.center,
                                              ),
                                            ),

                                            // Action (Icon)
                                            const Expanded(
                                              child: Icon(Icons.more_horiz),
                                            ),
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
        : createCourse(context);
  }

  Widget createCourse(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Create Courses",
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
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              fontSize: 16,
                              color:
                                  Colors.blue, // Example for AppColors.primary
                            ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                      const TextSpan(text: " / "),
                      TextSpan(
                        text: "Courses",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              fontSize: 16,
                              color:
                                  Colors.blue, // Example for AppColors.primary
                            ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            setState(() {
                              _isCreateCourse = false;
                            });
                          },
                      ),
                      const TextSpan(text: " / "),
                      TextSpan(
                        text: "Create Course",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                              fontSize: 16,
                              color:
                                  Colors.grey, // Example for AppColors.textGrey
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
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "Course Title",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "*",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                    return value == null || value.isEmpty
                        ? "Title is required"
                        : null;
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Enter Title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  maxLines: 1,
                ),
                gapH(15),
                Row(
                  children: [
                    Text(
                      "Course Type",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "*",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
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
                  controller: _slugController,
                  validator: (value) {
                    return value == null || value.isEmpty
                        ? "course type is required"
                        : null;
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Enter Course type",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  maxLines: 1,
                ),
                gapH(15),
                Row(
                  children: [
                    Text(
                      "Description",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "*",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _descriptionController,
                  validator: (value) {
                    return _descriptionController.text.isEmpty
                        ? "Description is required"
                        : "";
                  },
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    hintText: "Enter description",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black26),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  maxLines: 5,
                ),
                gapH(15),
                Row(
                  children: [
                    Text(
                      "Course category",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "*",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                      ),
                    ),
                  ],
                ),
                gapH20,
                Consumer<CreateCategoriesProvider>(
                  builder: (context, provider, _) {
                    if (provider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    // If no courses are available
                    if (provider.courseCategoriesModel?.isEmpty ?? true) {
                      return const Text("No classes available");
                    }

                    // Use LinkedHashSet to maintain unique courses by categoryId
                    final uniqueCourses =
                        provider.courseCategoriesModel!.toSetBy(
                      (course) => course.id,
                    );

                    return DropdownButtonFormField<String>(
                      value: selectedCourseCatId,
                      items: uniqueCourses.map((course) {
                        return DropdownMenuItem<String>(
                          value: course.id.toString(),
                          child: Text(course.title),
                        );
                      }).toList(),
                      hint: const Text("Select a course category"),
                      onChanged: (val) {
                        setState(() {
                          selectedCourseCatId = val;
                        });
                        log("Selected Course ID: $selectedCourseCatId");
                      },
                      decoration: const InputDecoration(
                        // labelText: 'Course Category',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                      ),
                    );
                  },
                ),
                gapH(15),
                Row(
                  children: [
                    Text(
                      "Class",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "*",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                      ),
                    ),
                  ],
                ),
                gapH20,
                BlocConsumer<ClassesBloc, ClassesState>(
                  listener: (context, state) {
                    if (state is ClassesGetFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.error)),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is ClassesLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ClassesGetSucess) {
                      final uniqueClasses = state.reponseData
                          .map((item) =>
                              {'id': item['id'], 'name': item['name']})
                          .toSet()
                          .toList();

                      return DropdownButtonFormField<String>(
                        value: classesID,
                        items: uniqueClasses.map((classData) {
                          return DropdownMenuItem<String>(
                            value: classData['id'].toString(),
                            child: Text(classData['name']),
                          );
                        }).toList(),
                        onChanged: (val) {
                          classesID = val;
                          log("Selected class ID: $classesID");
                        },
                        hint: const Text("Select a class"),
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black26),
                          ),
                        ),
                      );
                    } else {
                      return const Text("No Classes Available");
                    }
                  },
                ),
                gapH(20),
                // Row(
                //   children: [
                //     Text(
                //       "Instructor",
                //       style:
                //           Theme.of(context).textTheme.headlineLarge!.copyWith(
                //                 fontSize: 16,
                //                 color: Colors.black,
                //               ),
                //     ),
                //     const SizedBox(width: 2),
                //     Padding(
                //       padding: const EdgeInsets.only(bottom: 3),
                //       child: Text(
                //         "*",
                //         style:
                //             Theme.of(context).textTheme.headlineLarge!.copyWith(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 10,
                //                   color: Colors.red,
                //                 ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 16),
                // TextFormField(
                //   controller: _instructorController,
                //   validator: (value) {
                //     return value == null || value.isEmpty
                //         ? "Instructor id is required"
                //         : null;
                //   },
                //   decoration: const InputDecoration(
                //     fillColor: Colors.white,
                //     hintText: "Enter instructor id",
                //     border: OutlineInputBorder(
                //       borderSide: BorderSide(),
                //       borderRadius: BorderRadius.all(Radius.circular(5)),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.black26),
                //       borderRadius: BorderRadius.all(Radius.circular(5)),
                //     ),
                //     focusedBorder: OutlineInputBorder(
                //       borderSide: BorderSide(color: Colors.black26),
                //       borderRadius: BorderRadius.all(Radius.circular(5)),
                //     ),
                //   ),
                //   maxLines: 1,
                // ),
                // BlocConsumer<InstructorBloc, InstructorState>(
                //   listener: (context, state) {
                //     if (state is GetInstructorFailure) {
                //       // Show error message when data fetching fails
                //       ScaffoldMessenger.of(context).showSnackBar(
                //         SnackBar(content: Text(state.error)),
                //       );
                //     }
                //   },
                //   builder: (context, state) {
                //     if (state is InstructorLoadingState) {
                //       // Show a loading spinner while data is being fetched
                //       return const Center(child: CircularProgressIndicator());
                //     } else if (state is GetInstructorSuccess) {
                //       // Extract instructor names and IDs from the state
                //       final instructors = state.responseData.instructors;

                //       return DropdownButtonFormField<int>(
                //         value:
                //             selectedInstructorID, // Holds the selected instructor ID
                //         items: instructors.map((instructor) {
                //           return DropdownMenuItem<int>(
                //             value: instructor.id,
                //             child: Text(instructor
                //                 .user.name), // Display the instructor name
                //           );
                //         }).toList(),
                //         onChanged: (val) {
                //           selectedInstructorID = val;
                //           log("Selected Instructor ID: $selectedInstructorID");
                //         },
                //         hint: const Text("Select an Instructor"),
                //         decoration: const InputDecoration(
                //           contentPadding:
                //               EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                //           enabledBorder: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.black26),
                //           ),
                //         ),
                //       );
                //     } else {
                //       // Fallback when no data is available
                //       return const NoDataWidget();
                //     }
                //   },
                // ),
                // gapH(15),
                Row(
                  children: [
                    Text(
                      "Thumbnail",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                    ),
                    const SizedBox(width: 2),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3),
                      child: Text(
                        "*",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.red,
                                ),
                      ),
                    ),
                  ],
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
                        child: _webImage != null
                            ? Image.memory(
                                _webImage!,
                                fit: BoxFit.fill,
                              )
                            : Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Colors.grey[400],
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
                gapH20,
                Align(
                  alignment: Alignment.bottomRight,
                  child: CustomBtn(
                      title: "Submit",
                      onPresses: () {
                        setState(() {
                          if (_titleController.text.isNotEmpty &&
                                  _descriptionController.text.isNotEmpty
                              // &&                              _instructorController.text.isNotEmpty
                              ) {
                            Provider.of<CreateCourseProvider>(context,
                                    listen: false)
                                .createCourses(
                              _titleController.text,
                              _slugController.text,
                              _descriptionController.text,
                              webImageFile!,
                              classesID,
                              // selectedInstructorID,
                              selectedCourseCatId,
                              context,
                            )
                                .then((val) {
                              setState(() {
                                _isCreateCourse = false;
                              });
                            });
                          } else {
                            showSnackBar(
                                // Provider.of<CreateCourseProvider>(context,
                                //         listen: false)
                                //     .courseResponse
                                //     .toString(),
                                "All fields are required",
                                context,
                                Colors.red);
                          }
                        });
                      }),
                ),
                gapH20,
              ],
            ),
          ),
        ),
      ],
    );
  }

  // courseCreate(BuildContext context) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         const SizedBox(height: 20),
  //         Container(
  //           width: double.infinity,
  //           decoration: const BoxDecoration(
  //               color: Colors.white,
  //               borderRadius: BorderRadius.all(Radius.circular(8))),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text(
  //                   "Create Courses",
  //                   style: Theme.of(context).textTheme.headlineLarge!.copyWith(
  //                         fontWeight: FontWeight.w600,
  //                         fontSize: 16,
  //                         color: Colors.black,
  //                       ),
  //                 ),
  //                 RichText(
  //                   text: TextSpan(
  //                     children: [
  //                       TextSpan(
  //                         text: "Dashboard",
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headlineLarge!
  //                             .copyWith(
  //                               // fontWeight: FontWeight.w600,
  //                               fontSize: 16,
  //                               color: AppColors.primary,
  //                             ),
  //                         recognizer: TapGestureRecognizer()..onTap = () {},
  //                       ),
  //                       TextSpan(
  //                         text: " / ",
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headlineLarge!
  //                             .copyWith(
  //                               // fontWeight: FontWeight.w600,
  //                               fontSize: 16,
  //                               color: AppColors.textGrey,
  //                             ),
  //                         recognizer: TapGestureRecognizer()..onTap = () {},
  //                       ),
  //                       TextSpan(
  //                         text: "Courses",
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headlineLarge!
  //                             .copyWith(
  //                               // fontWeight: FontWeight.w600,
  //                               fontSize: 16,
  //                               color: AppColors.primary,
  //                             ),
  //                         recognizer: TapGestureRecognizer()
  //                           ..onTap = () {
  //                             setState(() {
  //                               _isCreateCourse = false;
  //                             });
  //                           },
  //                       ),
  //                       TextSpan(
  //                         text: " / ",
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headlineLarge!
  //                             .copyWith(
  //                               // fontWeight: FontWeight.w600,
  //                               fontSize: 16,
  //                               color: AppColors.textGrey,
  //                             ),
  //                         recognizer: TapGestureRecognizer()..onTap = () {},
  //                       ),
  //                       TextSpan(
  //                         text: "Create Course  ",
  //                         style: Theme.of(context)
  //                             .textTheme
  //                             .headlineLarge!
  //                             .copyWith(
  //                               // fontWeight: FontWeight.w600,
  //                               fontSize: 16,
  //                               color:
  //                                   //  _isAddCertificateTemplate
  //                                   // ? AppColors.primary
  //                                   // :
  //                                   AppColors.textGrey,
  //                             ),
  //                         recognizer: TapGestureRecognizer()..onTap = () {},
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 10),
  //         Container(
  //           width: double.infinity,
  //           decoration: const BoxDecoration(
  //             color: Colors.white,
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(8),
  //             ),
  //           ),
  //           child: ConstrainedBox(
  //             constraints: const BoxConstraints(maxWidth: 1200),
  //             child: Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 18.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   // const SizedBox(height: 20),
  //                   // // _buildStepper(context),
  //                   // const SizedBox(height: 20),
  //                   // // const Divider(),
  //                   const SizedBox(height: 16),
  //                   _isRequirement == false
  //                       ? Column(
  //                           crossAxisAlignment: CrossAxisAlignment.start,
  //                           mainAxisAlignment: MainAxisAlignment.start,
  //                           children: [
  //                             Row(
  //                               children: [
  //                                 Text(
  //                                   "Course Title",
  //                                   style: Theme.of(context)
  //                                       .textTheme
  //                                       .headlineLarge!
  //                                       .copyWith(
  //                                         // fontWeight: FontWeight.w600,
  //                                         fontSize: 16,
  //                                         color: Colors.black,
  //                                       ),
  //                                 ),
  //                                 const SizedBox(width: 2),
  //                                 Padding(
  //                                   padding: const EdgeInsets.only(bottom: 3),
  //                                   child: Text(
  //                                     "*",
  //                                     style: Theme.of(context)
  //                                         .textTheme
  //                                         .headlineLarge!
  //                                         .copyWith(
  //                                           fontWeight: FontWeight.w600,
  //                                           fontSize: 10,
  //                                           color: Colors.red,
  //                                         ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             const SizedBox(height: 16),
  //                             TextFormField(
  //                               controller: _titleController,
  //                               validator: (value) {
  //                                 title = value;
  //                                 return value!.isEmpty
  //                                     ? "Title is requires"
  //                                     : "";
  //                               },
  //                               decoration: const InputDecoration(
  //                                 fillColor: Colors.white,
  //                                 hintText: "Enter Title",
  //                                 border: OutlineInputBorder(
  //                                   borderSide: BorderSide(),
  //                                   borderRadius: BorderRadius.all(
  //                                     Radius.circular(5),
  //                                   ),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderSide:
  //                                       BorderSide(color: Colors.black26),
  //                                   borderRadius: BorderRadius.all(
  //                                     Radius.circular(5),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderSide:
  //                                       BorderSide(color: Colors.black26),
  //                                   borderRadius: BorderRadius.all(
  //                                     Radius.circular(5),
  //                                   ),
  //                                 ),
  //                               ),
  //                               maxLines: 1,
  //                             ),
  //                             const SizedBox(height: 20),
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               children: [
  //                                 Row(
  //                                   children: [
  //                                     Text(
  //                                       "Course Type",
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .headlineLarge!
  //                                           .copyWith(
  //                                             // fontWeight: FontWeight.w600,
  //                                             fontSize: 16,
  //                                             color: Colors.black,
  //                                           ),
  //                                     ),
  //                                     const SizedBox(width: 2),
  //                                     Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(bottom: 3),
  //                                       child: Text(
  //                                         "*",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 10,
  //                                               color: Colors.red,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 SizedBox(
  //                                     width: MediaQuery.of(context).size.width *
  //                                         0.2),
  //                                 Row(
  //                                   children: [
  //                                     Text(
  //                                       "Instructor",
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .headlineLarge!
  //                                           .copyWith(
  //                                             // fontWeight: FontWeight.w600,
  //                                             fontSize: 16,
  //                                             color: Colors.black,
  //                                           ),
  //                                     ),
  //                                     const SizedBox(width: 2),
  //                                     Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(bottom: 3),
  //                                       child: Text(
  //                                         "*",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 10,
  //                                               color: Colors.red,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 SizedBox(
  //                                     width: MediaQuery.of(context).size.width *
  //                                         0.21),
  //                                 Row(
  //                                   children: [
  //                                     Text(
  //                                       "Level",
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .headlineLarge!
  //                                           .copyWith(
  //                                             // fontWeight: FontWeight.w600,
  //                                             fontSize: 16,
  //                                             color: Colors.black,
  //                                           ),
  //                                     ),
  //                                     const SizedBox(width: 2),
  //                                     Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(bottom: 3),
  //                                       child: Text(
  //                                         "*",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 10,
  //                                               color: Colors.red,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             ),
  //                             const SizedBox(height: 15),
  //                             Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.22,
  //                                   height: 50,
  //                                   child: const DropdownMenu(
  //                                     hintText: "Live",
  //                                     dropdownMenuEntries: [
  //                                       DropdownMenuEntry(
  //                                           value: "1", label: "Live"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Record"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Text"),
  //                                     ],
  //                                     expandedInsets: EdgeInsets.zero,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.22,
  //                                   height: 50,
  //                                   child: const DropdownMenu(
  //                                     hintText: "Select Instructor",
  //                                     dropdownMenuEntries: [
  //                                       DropdownMenuEntry(
  //                                           value: "1", label: "Admin"),
  //                                     ],
  //                                     expandedInsets: EdgeInsets.zero,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.22,
  //                                   height: 50,
  //                                   child: const DropdownMenu(
  //                                     hintText: "Select Level",
  //                                     dropdownMenuEntries: [
  //                                       DropdownMenuEntry(
  //                                           value: "1", label: "Begineer"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Intermediate"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Advanced"),
  //                                     ],
  //                                     expandedInsets: EdgeInsets.zero,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             const SizedBox(height: 20),
  //                             Text(
  //                               "Short description",
  //                               style: Theme.of(context)
  //                                   .textTheme
  //                                   .headlineLarge!
  //                                   .copyWith(
  //                                     // fontWeight: FontWeight.w600,
  //                                     fontSize: 16,
  //                                     color: Colors.black,
  //                                   ),
  //                             ),
  //                             const SizedBox(height: 20),
  //                             TextField(
  //                               controller: _instructorController,
  //                               decoration: const InputDecoration(
  //                                 fillColor: Colors.white,
  //                                 hintText: "Enter Title",
  //                                 border: OutlineInputBorder(
  //                                   borderSide: BorderSide(),
  //                                   borderRadius: BorderRadius.all(
  //                                     Radius.circular(5),
  //                                   ),
  //                                 ),
  //                                 enabledBorder: OutlineInputBorder(
  //                                   borderSide:
  //                                       BorderSide(color: Colors.black26),
  //                                   borderRadius: BorderRadius.all(
  //                                     Radius.circular(5),
  //                                   ),
  //                                 ),
  //                                 focusedBorder: OutlineInputBorder(
  //                                   borderSide:
  //                                       BorderSide(color: Colors.black26),
  //                                   borderRadius: BorderRadius.all(
  //                                     Radius.circular(5),
  //                                   ),
  //                                 ),
  //                               ),
  //                               maxLines: 5,
  //                             ),
  //                             const SizedBox(height: 20),
  //                             Text(
  //                               "Description",
  //                               style: Theme.of(context)
  //                                   .textTheme
  //                                   .headlineLarge!
  //                                   .copyWith(
  //                                     // fontWeight: FontWeight.w600,
  //                                     fontSize: 16,
  //                                     color: Colors.black,
  //                                   ),
  //                             ),
  //                             const SizedBox(height: 15),
  //                             Container(
  //                               // height: 200,
  //                               width: double.infinity,
  //                               decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(5),
  //                                   border: Border.all(color: Colors.black38)),
  //                               child: Column(
  //                                 children: [
  //                                   Row(
  //                                     crossAxisAlignment:
  //                                         CrossAxisAlignment.center,
  //                                     // mainAxisAlignment: MainAxisAlignment.center,
  //                                     children: [
  //                                       Padding(
  //                                         padding: const EdgeInsets.fromLTRB(
  //                                             8, 8, 8, 1),
  //                                         child: SizedBox(
  //                                           width: MediaQuery.of(context)
  //                                                   .size
  //                                                   .width *
  //                                               0.12,
  //                                           height: 35,
  //                                           child:
  //                                               DropdownButtonFormField<String>(
  //                                             decoration: const InputDecoration(
  //                                               // Remove the border
  //                                               border: OutlineInputBorder(
  //                                                 borderSide: BorderSide.none,
  //                                               ),
  //                                               enabledBorder:
  //                                                   OutlineInputBorder(
  //                                                 borderSide: BorderSide.none,
  //                                               ),
  //                                               focusedBorder:
  //                                                   OutlineInputBorder(
  //                                                 borderSide: BorderSide.none,
  //                                               ),
  //                                               // Remove padding if necessary
  //                                               contentPadding:
  //                                                   EdgeInsets.symmetric(
  //                                                       horizontal: 10),
  //                                             ),
  //                                             hint: const Text("Paragraph"),
  //                                             items: const [
  //                                               DropdownMenuItem(
  //                                                 value: "1",
  //                                                 child: Text("Paragraph"),
  //                                               ),
  //                                               DropdownMenuItem(
  //                                                 value: "2",
  //                                                 child: Text("Headline 3"),
  //                                               ),
  //                                               DropdownMenuItem(
  //                                                 value: "3",
  //                                                 child: Text("Headline 2"),
  //                                               ),
  //                                               DropdownMenuItem(
  //                                                 value: "4",
  //                                                 child: Text("Headline 1"),
  //                                               ),
  //                                             ],
  //                                             onChanged: (value) {
  //                                               // Handle change here
  //                                             },
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       _verticalDivider(),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const Icon(Icons.format_bold),
  //                                       ),
  //                                       const SizedBox(width: 5),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const Icon(
  //                                           Icons.format_italic_sharp,
  //                                         ),
  //                                       ),
  //                                       _verticalDivider(),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const Icon(
  //                                           Icons.format_list_bulleted_outlined,
  //                                         ),
  //                                       ),
  //                                       const SizedBox(width: 10),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const Icon(
  //                                           Icons.format_list_numbered_outlined,
  //                                         ),
  //                                       ),
  //                                       _verticalDivider(),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: Transform.rotate(
  //                                           angle:
  //                                               2, // Rotation angle in radians (1.5 radians ≈ 86 degrees)
  //                                           child: const Icon(
  //                                             Icons.link_outlined,
  //                                             size: 25,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       const SizedBox(width: 10),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const Icon(
  //                                           Icons.video_library_outlined,
  //                                         ),
  //                                       ),
  //                                       _verticalDivider(),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const RotatedBox(
  //                                           quarterTurns: 2,
  //                                           child: Icon(
  //                                             Icons.format_quote,
  //                                           ),
  //                                         ),
  //                                       ),
  //                                       _verticalDivider(),
  //                                       TextButton.icon(
  //                                         style: const ButtonStyle(
  //                                           padding: WidgetStatePropertyAll(
  //                                               EdgeInsets.zero),
  //                                         ),
  //                                         onPressed: () {},
  //                                         icon: const Icon(
  //                                           Icons.table_view,
  //                                           color: Colors.black,
  //                                         ),
  //                                         label: const Icon(
  //                                           Icons.keyboard_arrow_down,
  //                                           color: Colors.black,
  //                                         ),
  //                                       ),
  //                                       _verticalDivider(),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const Icon(
  //                                           Icons.undo,
  //                                         ),
  //                                       ),
  //                                       const SizedBox(width: 10),
  //                                       InkWell(
  //                                         onTap: () {},
  //                                         child: const Icon(
  //                                           Icons.redo,
  //                                           color: Colors.black45,
  //                                         ),
  //                                       ),
  //                                     ],
  //                                   ),
  //                                   const Divider(color: Colors.black38),
  //                                   TextField(
  //                                     controller: _descriptionController,
  //                                     decoration: const InputDecoration(
  //                                       fillColor: Colors.white,
  //                                       filled: true,
  //                                       hintText: "Enter Description",
  //                                       border: OutlineInputBorder(
  //                                         borderSide: BorderSide.none,
  //                                       ),
  //                                       disabledBorder: OutlineInputBorder(
  //                                         borderSide: BorderSide.none,
  //                                       ),
  //                                       focusedBorder: OutlineInputBorder(
  //                                         borderSide: BorderSide.none,
  //                                       ),
  //                                     ),
  //                                     maxLines: 5,
  //                                   )
  //                                 ],
  //                               ),
  //                             ),
  //                             const SizedBox(height: 20),
  //                             Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Row(
  //                                   children: [
  //                                     Text(
  //                                       "Category",
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .headlineLarge!
  //                                           .copyWith(
  //                                             // fontWeight: FontWeight.w600,
  //                                             fontSize: 16,
  //                                             color: Colors.black,
  //                                           ),
  //                                     ),
  //                                     const SizedBox(width: 2),
  //                                     Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(bottom: 3),
  //                                       child: Text(
  //                                         "*",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 10,
  //                                               color: Colors.red,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 // SizedBox(
  //                                 //     width:
  //                                 //         MediaQuery.of(context).size.width * 0.2),
  //                                 Row(
  //                                   children: [
  //                                     const SizedBox(width: 45),
  //                                     Text(
  //                                       "Status",
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .headlineLarge!
  //                                           .copyWith(
  //                                             // fontWeight: FontWeight.w600,
  //                                             fontSize: 16,
  //                                             color: Colors.black,
  //                                           ),
  //                                     ),
  //                                     const SizedBox(width: 2),
  //                                     Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(bottom: 3),
  //                                       child: Text(
  //                                         "*",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 10,
  //                                               color: Colors.red,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 // SizedBox(
  //                                 //     width:
  //                                 //         MediaQuery.of(context).size.width * 0.21),
  //                                 Row(
  //                                   children: [
  //                                     const SizedBox(width: 45),
  //                                     Text(
  //                                       "Visibility",
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .headlineLarge!
  //                                           .copyWith(
  //                                             // fontWeight: FontWeight.w600,
  //                                             fontSize: 16,
  //                                             color: Colors.black,
  //                                           ),
  //                                     ),
  //                                     const SizedBox(width: 2),
  //                                     Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(bottom: 3),
  //                                       child: Text(
  //                                         "*",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 10,
  //                                               color: Colors.red,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 // SizedBox(
  //                                 //     width:
  //                                 //         MediaQuery.of(context).size.width * 0.21),
  //                                 Row(
  //                                   children: [
  //                                     const SizedBox(width: 50),
  //                                     Text(
  //                                       "Language",
  //                                       style: Theme.of(context)
  //                                           .textTheme
  //                                           .headlineLarge!
  //                                           .copyWith(
  //                                             // fontWeight: FontWeight.w600,
  //                                             fontSize: 16,
  //                                             color: Colors.black,
  //                                           ),
  //                                     ),
  //                                     const SizedBox(width: 2),
  //                                     Padding(
  //                                       padding:
  //                                           const EdgeInsets.only(bottom: 3),
  //                                       child: Text(
  //                                         "*",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 10,
  //                                               color: Colors.red,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                                 const Text(''),
  //                               ],
  //                             ),
  //                             const SizedBox(height: 15),
  //                             Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.18,
  //                                   height: 50,
  //                                   child: const DropdownMenu(
  //                                     hintText: "Select Category",
  //                                     dropdownMenuEntries: [
  //                                       DropdownMenuEntry(
  //                                           value: "1", label: "Music"),
  //                                     ],
  //                                     expandedInsets: EdgeInsets.zero,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.18,
  //                                   height: 50,
  //                                   child: const DropdownMenu(
  //                                     hintText: "Active",
  //                                     dropdownMenuEntries: [
  //                                       DropdownMenuEntry(
  //                                           value: "1", label: "Active"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Inactive"),
  //                                     ],
  //                                     expandedInsets: EdgeInsets.zero,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.18,
  //                                   height: 50,
  //                                   child: const DropdownMenu(
  //                                     hintText: "Draft",
  //                                     dropdownMenuEntries: [
  //                                       DropdownMenuEntry(
  //                                           value: "1", label: "Draft"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Public"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Private"),
  //                                     ],
  //                                     expandedInsets: EdgeInsets.zero,
  //                                   ),
  //                                 ),
  //                                 SizedBox(
  //                                   width: MediaQuery.of(context).size.width *
  //                                       0.18,
  //                                   height: 50,
  //                                   child: const DropdownMenu(
  //                                     hintText: "English",
  //                                     dropdownMenuEntries: [
  //                                       DropdownMenuEntry(
  //                                           value: "1", label: "English"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Hindi"),
  //                                       DropdownMenuEntry(
  //                                           value: "2", label: "Russian"),
  //                                     ],
  //                                     expandedInsets: EdgeInsets.zero,
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                             gapH20,
  //                             Row(
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 Container(
  //                                   width: 100,
  //                                   decoration: BoxDecoration(
  //                                     borderRadius: BorderRadius.circular(5),
  //                                     color: const Color.fromARGB(
  //                                         255, 46, 82, 244),
  //                                   ),
  //                                   child: Padding(
  //                                     padding: const EdgeInsets.symmetric(
  //                                       horizontal: 20,
  //                                       vertical: 15,
  //                                     ),
  //                                     child: Center(
  //                                       child: Text(
  //                                         "Back",
  //                                         style: Theme.of(context)
  //                                             .textTheme
  //                                             .headlineLarge!
  //                                             .copyWith(
  //                                               fontWeight: FontWeight.w600,
  //                                               fontSize: 16,
  //                                               color: Colors.white,
  //                                             ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 InkWell(
  //                                   onTap: () {
  //                                     setState(() {
  //                                       if (_titleController.text.isNotEmpty &&
  //                                           _instructorController
  //                                               .text.isNotEmpty &&
  //                                           _descriptionController
  //                                               .text.isNotEmpty) {
  //                                         _isRequirement = true;
  //                                       } else if (_titleController
  //                                           .text.isEmpty) {
  //                                         showSnackBar(
  //                                             "Course title is required.",
  //                                             context,
  //                                             Colors.red);
  //                                       } else if (_instructorController
  //                                           .text.isEmpty) {
  //                                         showSnackBar(
  //                                             "Short Description is required.",
  //                                             context,
  //                                             Colors.red);
  //                                       } else if (_descriptionController
  //                                           .text.isEmpty) {
  //                                         showSnackBar(
  //                                             "Description is required.",
  //                                             context,
  //                                             Colors.red);
  //                                       }
  //                                     });
  //                                   },
  //                                   child: Container(
  //                                     width: 100,
  //                                     decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       color: const Color.fromARGB(
  //                                           255, 46, 82, 244),
  //                                     ),
  //                                     child: Padding(
  //                                       padding: const EdgeInsets.symmetric(
  //                                         horizontal: 20,
  //                                         vertical: 15,
  //                                       ),
  //                                       child: Center(
  //                                         child: Text(
  //                                           "Next",
  //                                           style: Theme.of(context)
  //                                               .textTheme
  //                                               .headlineLarge!
  //                                               .copyWith(
  //                                                 fontWeight: FontWeight.w600,
  //                                                 fontSize: 16,
  //                                                 color: Colors.white,
  //                                               ),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ),
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         )
  //                       : _isPrice == false
  //                           ? Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Text(
  //                                   "Course Requirements",
  //                                   style: Theme.of(context)
  //                                       .textTheme
  //                                       .headlineLarge!
  //                                       .copyWith(
  //                                         // fontWeight: FontWeight.w600,
  //                                         fontSize: 16,
  //                                         color: Colors.black,
  //                                       ),
  //                                 ),
  //                                 const SizedBox(height: 15),
  //                                 Container(
  //                                   // height: 200,
  //                                   width: double.infinity,
  //                                   decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       border:
  //                                           Border.all(color: Colors.black38)),
  //                                   child: Column(
  //                                     children: [
  //                                       Row(
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.center,
  //                                         // mainAxisAlignment: MainAxisAlignment.center,
  //                                         children: [
  //                                           Padding(
  //                                             padding:
  //                                                 const EdgeInsets.fromLTRB(
  //                                                     8, 8, 8, 1),
  //                                             child: SizedBox(
  //                                               width: MediaQuery.of(context)
  //                                                       .size
  //                                                       .width *
  //                                                   0.12,
  //                                               height: 35,
  //                                               child: DropdownButtonFormField<
  //                                                   String>(
  //                                                 decoration:
  //                                                     const InputDecoration(
  //                                                   // Remove the border
  //                                                   border: OutlineInputBorder(
  //                                                     borderSide:
  //                                                         BorderSide.none,
  //                                                   ),
  //                                                   enabledBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide:
  //                                                         BorderSide.none,
  //                                                   ),
  //                                                   focusedBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide:
  //                                                         BorderSide.none,
  //                                                   ),
  //                                                   // Remove padding if necessary
  //                                                   contentPadding:
  //                                                       EdgeInsets.symmetric(
  //                                                           horizontal: 10),
  //                                                 ),
  //                                                 hint: const Text("Paragraph"),
  //                                                 items: const [
  //                                                   DropdownMenuItem(
  //                                                     value: "1",
  //                                                     child: Text("Paragraph"),
  //                                                   ),
  //                                                   DropdownMenuItem(
  //                                                     value: "2",
  //                                                     child: Text("Headline 3"),
  //                                                   ),
  //                                                   DropdownMenuItem(
  //                                                     value: "3",
  //                                                     child: Text("Headline 2"),
  //                                                   ),
  //                                                   DropdownMenuItem(
  //                                                     value: "4",
  //                                                     child: Text("Headline 1"),
  //                                                   ),
  //                                                 ],
  //                                                 onChanged: (value) {
  //                                                   // Handle change here
  //                                                 },
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child:
  //                                                 const Icon(Icons.format_bold),
  //                                           ),
  //                                           const SizedBox(width: 5),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.format_italic_sharp,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons
  //                                                   .format_list_bulleted_outlined,
  //                                             ),
  //                                           ),
  //                                           const SizedBox(width: 10),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons
  //                                                   .format_list_numbered_outlined,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: Transform.rotate(
  //                                               angle:
  //                                                   2, // Rotation angle in radians (1.5 radians ≈ 86 degrees)
  //                                               child: const Icon(
  //                                                 Icons.link_outlined,
  //                                                 size: 25,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           const SizedBox(width: 10),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.video_library_outlined,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const RotatedBox(
  //                                               quarterTurns: 2,
  //                                               child: Icon(
  //                                                 Icons.format_quote,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           TextButton.icon(
  //                                             style: const ButtonStyle(
  //                                               padding: WidgetStatePropertyAll(
  //                                                   EdgeInsets.zero),
  //                                             ),
  //                                             onPressed: () {},
  //                                             icon: const Icon(
  //                                               Icons.table_view,
  //                                               color: Colors.black,
  //                                             ),
  //                                             label: const Icon(
  //                                               Icons.keyboard_arrow_down,
  //                                               color: Colors.black,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.undo,
  //                                             ),
  //                                           ),
  //                                           const SizedBox(width: 10),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.redo,
  //                                               color: Colors.black45,
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                       const Divider(color: Colors.black38),
  //                                       const TextField(
  //                                         decoration: InputDecoration(
  //                                           fillColor: Colors.white,
  //                                           filled: true,
  //                                           hintText: "Enter Description",
  //                                           border: OutlineInputBorder(
  //                                             borderSide: BorderSide.none,
  //                                           ),
  //                                           disabledBorder: OutlineInputBorder(
  //                                             borderSide: BorderSide.none,
  //                                           ),
  //                                           focusedBorder: OutlineInputBorder(
  //                                             borderSide: BorderSide.none,
  //                                           ),
  //                                         ),
  //                                         maxLines: 5,
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 gapH20,
  //                                 Text(
  //                                   "Course Outcomes",
  //                                   style: Theme.of(context)
  //                                       .textTheme
  //                                       .headlineLarge!
  //                                       .copyWith(
  //                                         // fontWeight: FontWeight.w600,
  //                                         fontSize: 16,
  //                                         color: Colors.black,
  //                                       ),
  //                                 ),
  //                                 const SizedBox(height: 15),
  //                                 Container(
  //                                   // height: 200,
  //                                   width: double.infinity,
  //                                   decoration: BoxDecoration(
  //                                       borderRadius: BorderRadius.circular(5),
  //                                       border:
  //                                           Border.all(color: Colors.black38)),
  //                                   child: Column(
  //                                     children: [
  //                                       Row(
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.center,
  //                                         // mainAxisAlignment: MainAxisAlignment.center,
  //                                         children: [
  //                                           Padding(
  //                                             padding:
  //                                                 const EdgeInsets.fromLTRB(
  //                                                     8, 8, 8, 1),
  //                                             child: SizedBox(
  //                                               width: MediaQuery.of(context)
  //                                                       .size
  //                                                       .width *
  //                                                   0.12,
  //                                               height: 35,
  //                                               child: DropdownButtonFormField<
  //                                                   String>(
  //                                                 decoration:
  //                                                     const InputDecoration(
  //                                                   // Remove the border
  //                                                   border: OutlineInputBorder(
  //                                                     borderSide:
  //                                                         BorderSide.none,
  //                                                   ),
  //                                                   enabledBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide:
  //                                                         BorderSide.none,
  //                                                   ),
  //                                                   focusedBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide:
  //                                                         BorderSide.none,
  //                                                   ),
  //                                                   // Remove padding if necessary
  //                                                   contentPadding:
  //                                                       EdgeInsets.symmetric(
  //                                                           horizontal: 10),
  //                                                 ),
  //                                                 hint: const Text("Paragraph"),
  //                                                 items: const [
  //                                                   DropdownMenuItem(
  //                                                     value: "1",
  //                                                     child: Text("Paragraph"),
  //                                                   ),
  //                                                   DropdownMenuItem(
  //                                                     value: "2",
  //                                                     child: Text("Headline 3"),
  //                                                   ),
  //                                                   DropdownMenuItem(
  //                                                     value: "3",
  //                                                     child: Text("Headline 2"),
  //                                                   ),
  //                                                   DropdownMenuItem(
  //                                                     value: "4",
  //                                                     child: Text("Headline 1"),
  //                                                   ),
  //                                                 ],
  //                                                 onChanged: (value) {
  //                                                   // Handle change here
  //                                                 },
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child:
  //                                                 const Icon(Icons.format_bold),
  //                                           ),
  //                                           const SizedBox(width: 5),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.format_italic_sharp,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons
  //                                                   .format_list_bulleted_outlined,
  //                                             ),
  //                                           ),
  //                                           const SizedBox(width: 10),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons
  //                                                   .format_list_numbered_outlined,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: Transform.rotate(
  //                                               angle:
  //                                                   2, // Rotation angle in radians (1.5 radians ≈ 86 degrees)
  //                                               child: const Icon(
  //                                                 Icons.link_outlined,
  //                                                 size: 25,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           const SizedBox(width: 10),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.video_library_outlined,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const RotatedBox(
  //                                               quarterTurns: 2,
  //                                               child: Icon(
  //                                                 Icons.format_quote,
  //                                               ),
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           TextButton.icon(
  //                                             style: const ButtonStyle(
  //                                               padding: WidgetStatePropertyAll(
  //                                                   EdgeInsets.zero),
  //                                             ),
  //                                             onPressed: () {},
  //                                             icon: const Icon(
  //                                               Icons.table_view,
  //                                               color: Colors.black,
  //                                             ),
  //                                             label: const Icon(
  //                                               Icons.keyboard_arrow_down,
  //                                               color: Colors.black,
  //                                             ),
  //                                           ),
  //                                           _verticalDivider(),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.undo,
  //                                             ),
  //                                           ),
  //                                           const SizedBox(width: 10),
  //                                           InkWell(
  //                                             onTap: () {},
  //                                             child: const Icon(
  //                                               Icons.redo,
  //                                               color: Colors.black45,
  //                                             ),
  //                                           ),
  //                                         ],
  //                                       ),
  //                                       const Divider(color: Colors.black38),
  //                                       const TextField(
  //                                         decoration: InputDecoration(
  //                                           fillColor: Colors.white,
  //                                           filled: true,
  //                                           hintText: "Enter Description",
  //                                           border: OutlineInputBorder(
  //                                             borderSide: BorderSide.none,
  //                                           ),
  //                                           disabledBorder: OutlineInputBorder(
  //                                             borderSide: BorderSide.none,
  //                                           ),
  //                                           focusedBorder: OutlineInputBorder(
  //                                             borderSide: BorderSide.none,
  //                                           ),
  //                                         ),
  //                                         maxLines: 5,
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ),
  //                                 gapH20,
  //                                 Row(
  //                                   mainAxisAlignment:
  //                                       MainAxisAlignment.spaceBetween,
  //                                   children: [
  //                                     InkWell(
  //                                       onTap: () {
  //                                         setState(() {
  //                                           _isRequirement = false;
  //                                         });
  //                                       },
  //                                       child: Container(
  //                                         width: 100,
  //                                         decoration: BoxDecoration(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           color: const Color.fromARGB(
  //                                               255, 46, 82, 244),
  //                                         ),
  //                                         child: Padding(
  //                                           padding: const EdgeInsets.symmetric(
  //                                             horizontal: 20,
  //                                             vertical: 15,
  //                                           ),
  //                                           child: Center(
  //                                             child: Text(
  //                                               "Back",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .headlineLarge!
  //                                                   .copyWith(
  //                                                     fontWeight:
  //                                                         FontWeight.w600,
  //                                                     fontSize: 16,
  //                                                     color: Colors.white,
  //                                                   ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                     InkWell(
  //                                       onTap: () {
  //                                         setState(() {
  //                                           _isPrice = true;
  //                                         });
  //                                       },
  //                                       child: Container(
  //                                         width: 100,
  //                                         decoration: BoxDecoration(
  //                                           borderRadius:
  //                                               BorderRadius.circular(5),
  //                                           color: const Color.fromARGB(
  //                                               255, 46, 82, 244),
  //                                         ),
  //                                         child: Padding(
  //                                           padding: const EdgeInsets.symmetric(
  //                                             horizontal: 20,
  //                                             vertical: 15,
  //                                           ),
  //                                           child: Center(
  //                                             child: Text(
  //                                               "Next",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .headlineLarge!
  //                                                   .copyWith(
  //                                                     fontWeight:
  //                                                         FontWeight.w600,
  //                                                     fontSize: 16,
  //                                                     color: Colors.white,
  //                                                   ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ],
  //                             )
  //                           : _isMedia == false
  //                               ? Column(
  //                                   crossAxisAlignment:
  //                                       CrossAxisAlignment.start,
  //                                   children: [
  //                                     CheckboxListTile(
  //                                       contentPadding: EdgeInsets.zero,
  //                                       splashRadius: 20,
  //                                       checkboxShape: RoundedRectangleBorder(
  //                                           borderRadius:
  //                                               BorderRadius.circular(20)),
  //                                       title: const Text(
  //                                         'Is It Free Course',
  //                                         style: TextStyle(fontSize: 16.0),
  //                                       ),
  //                                       value: _isChecked,
  //                                       onChanged: (bool? value) {
  //                                         setState(() {
  //                                           _isChecked = value ?? false;
  //                                         });
  //                                       },
  //                                       activeColor: Colors.blue,
  //                                       checkColor: Colors.white,
  //                                       controlAffinity:
  //                                           ListTileControlAffinity.leading,
  //                                     ),
  //                                     if (_isChecked == false)
  //                                       Column(
  //                                         crossAxisAlignment:
  //                                             CrossAxisAlignment.start,
  //                                         children: [
  //                                           gapH8,
  //                                           Text(
  //                                             "Course Price",
  //                                             style: Theme.of(context)
  //                                                 .textTheme
  //                                                 .headlineLarge!
  //                                                 .copyWith(
  //                                                   // fontWeight: FontWeight.w600,
  //                                                   fontSize: 16,
  //                                                   color: Colors.black,
  //                                                 ),
  //                                           ),
  //                                           const SizedBox(height: 10),
  //                                           const TextField(
  //                                             decoration: InputDecoration(
  //                                               fillColor: Colors.white,
  //                                               hintText: "Enter Price",
  //                                               border: OutlineInputBorder(
  //                                                 borderSide: BorderSide(),
  //                                                 borderRadius:
  //                                                     BorderRadius.all(
  //                                                   Radius.circular(5),
  //                                                 ),
  //                                               ),
  //                                               enabledBorder:
  //                                                   OutlineInputBorder(
  //                                                 borderSide: BorderSide(
  //                                                     color: Colors.black26),
  //                                                 borderRadius:
  //                                                     BorderRadius.all(
  //                                                   Radius.circular(5),
  //                                                 ),
  //                                               ),
  //                                               focusedBorder:
  //                                                   OutlineInputBorder(
  //                                                 borderSide: BorderSide(
  //                                                     color: Colors.black26),
  //                                                 borderRadius:
  //                                                     BorderRadius.all(
  //                                                   Radius.circular(5),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             // maxLines: 5,
  //                                           ),
  //                                           gapH8,
  //                                           CheckboxListTile(
  //                                             contentPadding: EdgeInsets.zero,
  //                                             splashRadius: 20,
  //                                             checkboxShape:
  //                                                 RoundedRectangleBorder(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             20)),
  //                                             title: const Text(
  //                                               'Check Discount Price',
  //                                               style:
  //                                                   TextStyle(fontSize: 16.0),
  //                                             ),
  //                                             value: _isChecked,
  //                                             onChanged: (bool? value) {
  //                                               setState(() {
  //                                                 _isChecked = value ?? false;
  //                                               });
  //                                             },
  //                                             activeColor: Colors.blue,
  //                                             checkColor: Colors.white,
  //                                             controlAffinity:
  //                                                 ListTileControlAffinity
  //                                                     .leading,
  //                                           ),
  //                                           Row(
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment
  //                                                     .spaceBetween,
  //                                             children: [
  //                                               Column(
  //                                                 crossAxisAlignment:
  //                                                     CrossAxisAlignment.start,
  //                                                 children: [
  //                                                   Text(
  //                                                     "Course Discount",
  //                                                     style: Theme.of(context)
  //                                                         .textTheme
  //                                                         .headlineLarge!
  //                                                         .copyWith(
  //                                                           // fontWeight: FontWeight.w600,
  //                                                           fontSize: 16,
  //                                                           color: Colors.black,
  //                                                         ),
  //                                                   ),
  //                                                   gapH8,
  //                                                   SizedBox(
  //                                                     height: 50,
  //                                                     width:
  //                                                         MediaQuery.of(context)
  //                                                                 .size
  //                                                                 .width *
  //                                                             0.365,
  //                                                     child: const TextField(
  //                                                       decoration:
  //                                                           InputDecoration(
  //                                                         fillColor:
  //                                                             Colors.white,
  //                                                         hintText:
  //                                                             "Enter discount",
  //                                                         border:
  //                                                             OutlineInputBorder(
  //                                                           borderSide:
  //                                                               BorderSide(),
  //                                                           borderRadius:
  //                                                               BorderRadius
  //                                                                   .all(
  //                                                             Radius.circular(
  //                                                                 5),
  //                                                           ),
  //                                                         ),
  //                                                         enabledBorder:
  //                                                             OutlineInputBorder(
  //                                                           borderSide: BorderSide(
  //                                                               color: Colors
  //                                                                   .black26),
  //                                                           borderRadius:
  //                                                               BorderRadius
  //                                                                   .all(
  //                                                             Radius.circular(
  //                                                                 5),
  //                                                           ),
  //                                                         ),
  //                                                         focusedBorder:
  //                                                             OutlineInputBorder(
  //                                                           borderSide: BorderSide(
  //                                                               color: Colors
  //                                                                   .black26),
  //                                                           borderRadius:
  //                                                               BorderRadius
  //                                                                   .all(
  //                                                             Radius.circular(
  //                                                                 5),
  //                                                           ),
  //                                                         ),
  //                                                       ),
  //                                                       // maxLines: 5,
  //                                                     ),
  //                                                   ),
  //                                                 ],
  //                                               ),
  //                                               Column(
  //                                                 crossAxisAlignment:
  //                                                     CrossAxisAlignment.start,
  //                                                 children: [
  //                                                   Text(
  //                                                     "Discount Type",
  //                                                     style: Theme.of(context)
  //                                                         .textTheme
  //                                                         .headlineLarge!
  //                                                         .copyWith(
  //                                                           // fontWeight: FontWeight.w600,
  //                                                           fontSize: 16,
  //                                                           color: Colors.black,
  //                                                         ),
  //                                                   ),
  //                                                   gapH8,
  //                                                   SizedBox(
  //                                                     width:
  //                                                         MediaQuery.of(context)
  //                                                                 .size
  //                                                                 .width *
  //                                                             0.365,
  //                                                     height: 55,
  //                                                     child: const DropdownMenu(
  //                                                       hintText: "Fixed",
  //                                                       dropdownMenuEntries: [
  //                                                         DropdownMenuEntry(
  //                                                           value: "1",
  //                                                           label: "Fixed",
  //                                                         ),
  //                                                         DropdownMenuEntry(
  //                                                           value: "2",
  //                                                           label: "Percentage",
  //                                                         ),
  //                                                       ],
  //                                                       expandedInsets:
  //                                                           EdgeInsets.zero,
  //                                                     ),
  //                                                   ),
  //                                                 ],
  //                                               ),
  //                                             ],
  //                                           ),
  //                                           gapH16,
  //                                           Row(
  //                                             mainAxisAlignment:
  //                                                 MainAxisAlignment
  //                                                     .spaceBetween,
  //                                             children: [
  //                                               InkWell(
  //                                                 onTap: () {
  //                                                   setState(() {
  //                                                     _isPrice = false;
  //                                                   });
  //                                                 },
  //                                                 child: Container(
  //                                                   width: 100,
  //                                                   decoration: BoxDecoration(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             5),
  //                                                     color:
  //                                                         const Color.fromARGB(
  //                                                             255, 46, 82, 244),
  //                                                   ),
  //                                                   child: Padding(
  //                                                     padding: const EdgeInsets
  //                                                         .symmetric(
  //                                                       horizontal: 20,
  //                                                       vertical: 15,
  //                                                     ),
  //                                                     child: Center(
  //                                                       child: Text(
  //                                                         "Back",
  //                                                         style: Theme.of(
  //                                                                 context)
  //                                                             .textTheme
  //                                                             .headlineLarge!
  //                                                             .copyWith(
  //                                                               fontWeight:
  //                                                                   FontWeight
  //                                                                       .w600,
  //                                                               fontSize: 16,
  //                                                               color: Colors
  //                                                                   .white,
  //                                                             ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                               InkWell(
  //                                                 onTap: () {
  //                                                   setState(() {
  //                                                     _isMedia = true;
  //                                                   });
  //                                                 },
  //                                                 child: Container(
  //                                                   width: 100,
  //                                                   decoration: BoxDecoration(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             5),
  //                                                     color:
  //                                                         const Color.fromARGB(
  //                                                             255, 46, 82, 244),
  //                                                   ),
  //                                                   child: Padding(
  //                                                     padding: const EdgeInsets
  //                                                         .symmetric(
  //                                                       horizontal: 20,
  //                                                       vertical: 15,
  //                                                     ),
  //                                                     child: Center(
  //                                                       child: Text(
  //                                                         "Next",
  //                                                         style: Theme.of(
  //                                                                 context)
  //                                                             .textTheme
  //                                                             .headlineLarge!
  //                                                             .copyWith(
  //                                                               fontWeight:
  //                                                                   FontWeight
  //                                                                       .w600,
  //                                                               fontSize: 16,
  //                                                               color: Colors
  //                                                                   .white,
  //                                                             ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ],
  //                                           ),
  //                                         ],
  //                                       ),
  //                                   ],
  //                                 )
  //                               : _isSEO == false
  //                                   ? Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: [
  //                                         Text(
  //                                           "Course Preview Type",
  //                                           style: Theme.of(context)
  //                                               .textTheme
  //                                               .headlineLarge!
  //                                               .copyWith(
  //                                                 // fontWeight: FontWeight.w600,
  //                                                 fontSize: 16,
  //                                                 color: Colors.black,
  //                                               ),
  //                                         ),
  //                                         gapH8,
  //                                         const SizedBox(
  //                                           width: double.infinity,
  //                                           height: 55,
  //                                           child: DropdownMenu(
  //                                             hintText: "Fixed",
  //                                             dropdownMenuEntries: [
  //                                               DropdownMenuEntry(
  //                                                 value: "1",
  //                                                 label: "Fixed",
  //                                               ),
  //                                               DropdownMenuEntry(
  //                                                 value: "2",
  //                                                 label: "Percentage",
  //                                               ),
  //                                             ],
  //                                             expandedInsets: EdgeInsets.zero,
  //                                           ),
  //                                         ),
  //                                         gapH16,
  //                                         Text(
  //                                           "Video URL",
  //                                           style: Theme.of(context)
  //                                               .textTheme
  //                                               .headlineLarge!
  //                                               .copyWith(
  //                                                 // fontWeight: FontWeight.w600,
  //                                                 fontSize: 16,
  //                                                 color: Colors.black,
  //                                               ),
  //                                         ),
  //                                         gapH8,
  //                                         const SizedBox(
  //                                           height: 50,
  //                                           width: double.infinity,
  //                                           child: TextField(
  //                                             decoration: InputDecoration(
  //                                               fillColor: Colors.white,
  //                                               hintText:
  //                                                   "https;//youtube.be/316Q4QL-J4Q",
  //                                               border: OutlineInputBorder(
  //                                                 borderSide: BorderSide(),
  //                                                 borderRadius:
  //                                                     BorderRadius.all(
  //                                                   Radius.circular(5),
  //                                                 ),
  //                                               ),
  //                                               enabledBorder:
  //                                                   OutlineInputBorder(
  //                                                 borderSide: BorderSide(
  //                                                     color: Colors.black26),
  //                                                 borderRadius:
  //                                                     BorderRadius.all(
  //                                                   Radius.circular(5),
  //                                                 ),
  //                                               ),
  //                                               focusedBorder:
  //                                                   OutlineInputBorder(
  //                                                 borderSide: BorderSide(
  //                                                     color: Colors.black26),
  //                                                 borderRadius:
  //                                                     BorderRadius.all(
  //                                                   Radius.circular(5),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         gapH16,
  //                                         Text(
  //                                           "Thumbnail",
  //                                           style: Theme.of(context)
  //                                               .textTheme
  //                                               .headlineLarge!
  //                                               .copyWith(
  //                                                 // fontWeight: FontWeight.w600,
  //                                                 fontSize: 16,
  //                                                 color: Colors.black,
  //                                               ),
  //                                         ),
  //                                         gapH16,
  //                                         SizedBox(
  //                                           width: double.infinity,
  //                                           height: 180,
  //                                           child: InkWell(
  //                                             onTap: () {
  //                                               _pickImageWeb();
  //                                             },
  //                                             child: DottedBorder(
  //                                               dashPattern: const [4],
  //                                               color: Colors.grey,
  //                                               child: Center(
  //                                                 child: _webImage != null
  //                                                     ? Image.memory(
  //                                                         _webImage!,
  //                                                         fit: BoxFit.fill,
  //                                                       )
  //                                                     : Icon(
  //                                                         Icons
  //                                                             .add_photo_alternate_outlined,
  //                                                         color:
  //                                                             Colors.grey[400],
  //                                                         size: 50,
  //                                                       ),
  //                                               ),
  //                                             ),
  //                                           ),
  //                                         ),
  //                                         const SizedBox(height: 20),
  //                                         const Text(
  //                                           "NB : Icon size will 35px x 35px and not more than 1mb",
  //                                         ),
  //                                         const SizedBox(height: 20),
  //                                         Row(
  //                                           mainAxisAlignment:
  //                                               MainAxisAlignment.spaceBetween,
  //                                           children: [
  //                                             InkWell(
  //                                               onTap: () {
  //                                                 setState(() {
  //                                                   _isMedia = false;
  //                                                 });
  //                                               },
  //                                               child: Container(
  //                                                 width: 100,
  //                                                 decoration: BoxDecoration(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           5),
  //                                                   color: const Color.fromARGB(
  //                                                       255, 46, 82, 244),
  //                                                 ),
  //                                                 child: Padding(
  //                                                   padding: const EdgeInsets
  //                                                       .symmetric(
  //                                                     horizontal: 20,
  //                                                     vertical: 15,
  //                                                   ),
  //                                                   child: Center(
  //                                                     child: Text(
  //                                                       "Back",
  //                                                       style: Theme.of(context)
  //                                                           .textTheme
  //                                                           .headlineLarge!
  //                                                           .copyWith(
  //                                                             fontWeight:
  //                                                                 FontWeight
  //                                                                     .w600,
  //                                                             fontSize: 16,
  //                                                             color:
  //                                                                 Colors.white,
  //                                                           ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             InkWell(
  //                                               onTap: () {
  //                                                 if (_webImage!.isNotEmpty &&
  //                                                     _webImage != null) {
  //                                                   setState(() {
  //                                                     _isSEO = true;
  //                                                   });
  //                                                 } else {
  //                                                   showSnackBar(
  //                                                       "Thumbnail is required",
  //                                                       context,
  //                                                       Colors.red);
  //                                                   setState(() {});
  //                                                 }
  //                                               },
  //                                               child: Container(
  //                                                 width: 100,
  //                                                 decoration: BoxDecoration(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           5),
  //                                                   color: const Color.fromARGB(
  //                                                       255, 46, 82, 244),
  //                                                 ),
  //                                                 child: Padding(
  //                                                   padding: const EdgeInsets
  //                                                       .symmetric(
  //                                                     horizontal: 20,
  //                                                     vertical: 15,
  //                                                   ),
  //                                                   child: Center(
  //                                                     child: Text(
  //                                                       "Next",
  //                                                       style: Theme.of(context)
  //                                                           .textTheme
  //                                                           .headlineLarge!
  //                                                           .copyWith(
  //                                                             fontWeight:
  //                                                                 FontWeight
  //                                                                     .w600,
  //                                                             fontSize: 16,
  //                                                             color:
  //                                                                 Colors.white,
  //                                                           ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ],
  //                                     )
  //                                   : _isCompleted == false
  //                                       ? Column(
  //                                           crossAxisAlignment:
  //                                               CrossAxisAlignment.start,
  //                                           children: [
  //                                             gapH16,
  //                                             Text(
  //                                               "Meta Title",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .headlineLarge!
  //                                                   .copyWith(
  //                                                     // fontWeight: FontWeight.w600,
  //                                                     fontSize: 16,
  //                                                     color: Colors.black,
  //                                                   ),
  //                                             ),
  //                                             gapH8,
  //                                             const SizedBox(
  //                                               height: 50,
  //                                               width: double.infinity,
  //                                               child: TextField(
  //                                                 decoration: InputDecoration(
  //                                                   fillColor: Colors.white,
  //                                                   hintText:
  //                                                       "Enter Meta Title",
  //                                                   border: OutlineInputBorder(
  //                                                     borderSide: BorderSide(),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                   enabledBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide: BorderSide(
  //                                                         color:
  //                                                             Colors.black26),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                   focusedBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide: BorderSide(
  //                                                         color:
  //                                                             Colors.black26),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             gapH20,
  //                                             Text(
  //                                               "Meta Keyword",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .headlineLarge!
  //                                                   .copyWith(
  //                                                     // fontWeight: FontWeight.w600,
  //                                                     fontSize: 16,
  //                                                     color: Colors.black,
  //                                                   ),
  //                                             ),
  //                                             gapH8,
  //                                             const SizedBox(
  //                                               height: 50,
  //                                               width: double.infinity,
  //                                               child: TextField(
  //                                                 decoration: InputDecoration(
  //                                                   fillColor: Colors.white,
  //                                                   hintText:
  //                                                       "Enter Meta Title",
  //                                                   border: OutlineInputBorder(
  //                                                     borderSide: BorderSide(),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                   enabledBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide: BorderSide(
  //                                                         color:
  //                                                             Colors.black26),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                   focusedBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide: BorderSide(
  //                                                         color:
  //                                                             Colors.black26),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             gapH20,
  //                                             Text(
  //                                               "Meta Description",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .headlineLarge!
  //                                                   .copyWith(
  //                                                     // fontWeight: FontWeight.w600,
  //                                                     fontSize: 16,
  //                                                     color: Colors.black,
  //                                                   ),
  //                                             ),
  //                                             gapH8,
  //                                             const SizedBox(
  //                                               height: 50,
  //                                               width: double.infinity,
  //                                               child: TextField(
  //                                                 decoration: InputDecoration(
  //                                                   fillColor: Colors.white,
  //                                                   hintText:
  //                                                       "Enter meta description",
  //                                                   border: OutlineInputBorder(
  //                                                     borderSide: BorderSide(),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                   enabledBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide: BorderSide(
  //                                                         color:
  //                                                             Colors.black26),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                   focusedBorder:
  //                                                       OutlineInputBorder(
  //                                                     borderSide: BorderSide(
  //                                                         color:
  //                                                             Colors.black26),
  //                                                     borderRadius:
  //                                                         BorderRadius.all(
  //                                                       Radius.circular(5),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             gapH20,
  //                                             Text(
  //                                               "Meta Image",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .headlineLarge!
  //                                                   .copyWith(
  //                                                     // fontWeight: FontWeight.w600,
  //                                                     fontSize: 16,
  //                                                     color: Colors.black,
  //                                                   ),
  //                                             ),
  //                                             gapH20,
  //                                             SizedBox(
  //                                               width: double.infinity,
  //                                               height: 180,
  //                                               child: InkWell(
  //                                                 onTap: () {
  //                                                   _pickImageWeb();
  //                                                 },
  //                                                 child: DottedBorder(
  //                                                   dashPattern: const [4],
  //                                                   color: Colors.grey,
  //                                                   child: Center(
  //                                                     child: _webImage != null
  //                                                         ? Image.memory(
  //                                                             _webImage!,
  //                                                             fit: BoxFit.fill,
  //                                                           )
  //                                                         : Icon(
  //                                                             Icons
  //                                                                 .add_photo_alternate_outlined,
  //                                                             color: Colors
  //                                                                 .grey[400],
  //                                                             size: 50,
  //                                                           ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             gapH20,
  //                                             const Text(
  //                                               "NB : Icon size will 35px x 35px and not more than 1mb",
  //                                             ),
  //                                             gapH20,
  //                                             Row(
  //                                               mainAxisAlignment:
  //                                                   MainAxisAlignment
  //                                                       .spaceBetween,
  //                                               children: [
  //                                                 InkWell(
  //                                                   onTap: () {
  //                                                     setState(() {
  //                                                       _isSEO = false;
  //                                                     });
  //                                                   },
  //                                                   child: Container(
  //                                                     width: 100,
  //                                                     decoration: BoxDecoration(
  //                                                       borderRadius:
  //                                                           BorderRadius
  //                                                               .circular(5),
  //                                                       color: const Color
  //                                                           .fromARGB(
  //                                                           255, 46, 82, 244),
  //                                                     ),
  //                                                     child: Padding(
  //                                                       padding:
  //                                                           const EdgeInsets
  //                                                               .symmetric(
  //                                                         horizontal: 20,
  //                                                         vertical: 15,
  //                                                       ),
  //                                                       child: Center(
  //                                                         child: Text(
  //                                                           "Back",
  //                                                           style: Theme.of(
  //                                                                   context)
  //                                                               .textTheme
  //                                                               .headlineLarge!
  //                                                               .copyWith(
  //                                                                 fontWeight:
  //                                                                     FontWeight
  //                                                                         .w600,
  //                                                                 fontSize: 16,
  //                                                                 color: Colors
  //                                                                     .white,
  //                                                               ),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                                 InkWell(
  //                                                   onTap: () {
  //                                                     setState(() {
  //                                                       _isCompleted = true;
  //                                                     });
  //                                                   },
  //                                                   child: Container(
  //                                                     width: 100,
  //                                                     decoration: BoxDecoration(
  //                                                       borderRadius:
  //                                                           BorderRadius
  //                                                               .circular(5),
  //                                                       color: const Color
  //                                                           .fromARGB(
  //                                                           255, 46, 82, 244),
  //                                                     ),
  //                                                     child: Padding(
  //                                                       padding:
  //                                                           const EdgeInsets
  //                                                               .symmetric(
  //                                                         horizontal: 20,
  //                                                         vertical: 15,
  //                                                       ),
  //                                                       child: Center(
  //                                                         child: Text(
  //                                                           "Next",
  //                                                           style: Theme.of(
  //                                                                   context)
  //                                                               .textTheme
  //                                                               .headlineLarge!
  //                                                               .copyWith(
  //                                                                 fontWeight:
  //                                                                     FontWeight
  //                                                                         .w600,
  //                                                                 fontSize: 16,
  //                                                                 color: Colors
  //                                                                     .white,
  //                                                               ),
  //                                                         ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ],
  //                                             ),
  //                                           ],
  //                                         )
  //                                       : Column(
  //                                           children: [
  //                                             Center(
  //                                               child: Text(
  //                                                 "Everything looks good",
  //                                                 style: Theme.of(context)
  //                                                     .textTheme
  //                                                     .headlineLarge!
  //                                                     .copyWith(
  //                                                       fontWeight:
  //                                                           FontWeight.w500,
  //                                                       fontSize: 35,
  //                                                       color: Colors.black,
  //                                                     ),
  //                                               ),
  //                                             ),
  //                                             gapH8,
  //                                             Text(
  //                                               "Click on the button below to submit your form",
  //                                               style: Theme.of(context)
  //                                                   .textTheme
  //                                                   .headlineLarge!
  //                                                   .copyWith(
  //                                                     fontSize: 16,
  //                                                     color: Colors.black45,
  //                                                   ),
  //                                             ),
  //                                             gapH8,
  //                                             InkWell(
  //                                               onTap: () {
  //                                                 // setState(() {
  //                                                 //   if (_titleController
  //                                                 //           .text.isNotEmpty &&
  //                                                 //       _descriptionController
  //                                                 //           .text.isNotEmpty &&
  //                                                 //       _shortDescriptionController
  //                                                 //           .text.isNotEmpty) {
  //                                                 //     Provider.of<CreateCourseProvider>(
  //                                                 //             context,
  //                                                 //             listen: false)
  //                                                 //         .createCourses(
  //                                                 //       _titleController.text,
  //                                                 //       _titleController.text
  //                                                 //           .toLowerCase(),
  //                                                 //       _descriptionController
  //                                                 //           .text,
  //                                                 //       _shortDescriptionController
  //                                                 //           .text,
  //                                                 //       webImageFile!,
  //                                                 //       context,
  //                                                 //     )
  //                                                 //         .then(
  //                                                 //       (value) {
  //                                                 //         if (Provider.of<CreateCourseProvider>(
  //                                                 //                         context,
  //                                                 //                         listen:
  //                                                 //                             false)
  //                                                 //                     .resStatusCode ==
  //                                                 //                 200 ||
  //                                                 //             Provider.of<CreateCourseProvider>(
  //                                                 //                         context,
  //                                                 //                         listen:
  //                                                 //                             false)
  //                                                 //                     .resStatusCode ==
  //                                                 //                 201) {
  //                                                 //           setState(() {
  //                                                 //             _isCreateCourse =
  //                                                 //                 false;
  //                                                 //             _isRequirement =
  //                                                 //                 false;
  //                                                 //             _isPrice = false;
  //                                                 //             _isMedia = false;
  //                                                 //             _isSEO = false;
  //                                                 //             _isCompleted =
  //                                                 //                 false;
  //                                                 //           });
  //                                                 //         }
  //                                                 //       },
  //                                                 //     );
  //                                                 //   } else {
  //                                                 //     showSnackBar(
  //                                                 //         Provider.of<CreateCourseProvider>(
  //                                                 //                 context,
  //                                                 //                 listen: false)
  //                                                 //             .courseResponse
  //                                                 //             .toString(),
  //                                                 //         context,
  //                                                 //         Colors.red);
  //                                                 //   }
  //                                                 // });
  //                                               },
  //                                               child: Container(
  //                                                 width: 100,
  //                                                 decoration: BoxDecoration(
  //                                                   borderRadius:
  //                                                       BorderRadius.circular(
  //                                                           5),
  //                                                   color: const Color.fromARGB(
  //                                                       255, 46, 82, 244),
  //                                                 ),
  //                                                 child: Padding(
  //                                                   padding: const EdgeInsets
  //                                                       .symmetric(
  //                                                     horizontal: 20,
  //                                                     vertical: 15,
  //                                                   ),
  //                                                   child: Center(
  //                                                     child: Text(
  //                                                       "Sumbit",
  //                                                       style: Theme.of(context)
  //                                                           .textTheme
  //                                                           .headlineLarge!
  //                                                           .copyWith(
  //                                                             // fontWeight:
  //                                                             //     FontWeight
  //                                                             //         .w600,
  //                                                             fontSize: 15,
  //                                                             color:
  //                                                                 Colors.white,
  //                                                           ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                             gapH16,
  //                                             Align(
  //                                               alignment: Alignment.bottomLeft,
  //                                               child: InkWell(
  //                                                 onTap: () {
  //                                                   _isCompleted = false;
  //                                                   setState(() {});
  //                                                 },
  //                                                 child: Container(
  //                                                   width: 100,
  //                                                   decoration: BoxDecoration(
  //                                                     borderRadius:
  //                                                         BorderRadius.circular(
  //                                                             5),
  //                                                     color:
  //                                                         const Color.fromARGB(
  //                                                             255, 46, 82, 244),
  //                                                   ),
  //                                                   child: Padding(
  //                                                     padding: const EdgeInsets
  //                                                         .symmetric(
  //                                                       horizontal: 20,
  //                                                       vertical: 15,
  //                                                     ),
  //                                                     child: Center(
  //                                                       child: Text(
  //                                                         "Back",
  //                                                         style: Theme.of(
  //                                                                 context)
  //                                                             .textTheme
  //                                                             .headlineLarge!
  //                                                             .copyWith(
  //                                                               // fontWeight:
  //                                                               //     FontWeight
  //                                                               //         .w600,
  //                                                               fontSize: 15,
  //                                                               color: Colors
  //                                                                   .white,
  //                                                             ),
  //                                                       ),
  //                                                     ),
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ],
  //                                         ),
  //                   gapH20,
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //         gapH20,
  //         Container(
  //           width: double.infinity,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(5),
  //             color: Colors.white,
  //           ),
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 15.0),
  //             child: Center(
  //               child: Text(
  //                 bottomText,
  //                 style: Theme.of(context).textTheme.headlineLarge!.copyWith(
  //                       fontSize: 17,
  //                       color: Colors.grey,
  //                     ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         gapH20,
  //       ],
  //     ),
  //   );
  // }

  SizedBox _verticalDivider() {
    return const SizedBox(
      height: 35,
      child: VerticalDivider(
        color: Colors.black38,
      ),
    );
  }

  // Widget _buildStepper(BuildContext context) {
  //   return Wrap(
  //     spacing: 10,
  //     children: [
  //       _buildStepperButton('General', () {
  //         setState(() {
  //           _isGeneral = true;
  //           _isRequirement = false;
  //           _isPrice = false;
  //           _isMedia = false;
  //           _isSEO = false;
  //           _isCompleted = false;
  //         });
  //       }, _isGeneral, true),
  //       _buildStepperButton('Requirements', () {
  //         setState(() {
  //           _isGeneral = true;
  //           _isRequirement = true;
  //           _isPrice = false;
  //           _isMedia = false;
  //           _isSEO = false;
  //           _isCompleted = false;
  //         });
  //       }, _isRequirement, _isRequirement),
  //       _buildStepperButton('Price', () {
  //         setState(() {
  //           _isGeneral = true;
  //           _isRequirement = true;
  //           _isPrice = true;
  //           _isMedia = false;
  //           _isSEO = false;
  //           _isCompleted = false;
  //         });
  //       }, _isPrice, _isPrice),
  //       _buildStepperButton('Media', () {
  //         setState(() {
  //           _isGeneral = true;
  //           _isRequirement = true;
  //           _isPrice = true;
  //           _isMedia = true;
  //           _isSEO = false;
  //           _isCompleted = false;
  //         });
  //       }, _isMedia, _isMedia),
  //       _buildStepperButton('SEO', () {
  //         setState(() {
  //           _isGeneral = true;
  //           _isRequirement = true;
  //           _isPrice = true;
  //           _isMedia = true;
  //           _isSEO = true;
  //           _isCompleted = false;
  //         });
  //       }, _isSEO, _isSEO),
  //       _buildStepperButton('Complete', () {
  //         setState(() {
  //           _isGeneral = true;
  //           _isRequirement = true;
  //           _isPrice = true;
  //           _isMedia = true;
  //           _isSEO = true;
  //           _isCompleted = true;
  //         });
  //       }, _isCompleted, _isCompleted),
  //     ],
  //   );
  // }

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
// List<CustomerModel> customerDummyData = [
//   CustomerModel(
//       'Alice', 'alice@theflutterway.com', '4', '\$384', '12.8%', '8', '16'),
//   CustomerModel(
//       'Bob', 'bob@theflutterway.com', '7', '\$287', '17.1%', '5', '11'),
//   CustomerModel(
//       'Charlie', 'charlie@theflutterway.com', '3', '\$184', '9.2%', '3', '7'),
//   CustomerModel(
//       'David', 'david@theflutterway.com', '5', '\$384', '12.8%', '8', '16'),
//   CustomerModel(
//       'Eve', 'eve@theflutterway.com', '2', '\$287', '17.1%', '5', '11'),
//   CustomerModel(
//       'Frank', 'frank@theflutterway.com', '6', '\$184', '9.2%', '3', '7'),
//   CustomerModel(
//       'Alice', 'alice@theflutterway.com', '4', '\$384', '12.8%', '8', '16'),
//   CustomerModel(
//       'Bob', 'bob@theflutterway.com', '7', '\$287', '17.1%', '5', '11'),
//   CustomerModel(
//       'Charlie', 'charlie@theflutterway.com', '3', '\$184', '9.2%', '3', '7'),
//   CustomerModel(
//       'David', 'david@theflutterway.com', '5', '\$384', '12.8%', '8', '16'),
//   CustomerModel(
//       'Eve', 'eve@theflutterway.com', '2', '\$287', '17.1%', '5', '11'),
//   CustomerModel(
//       'Frank', 'frank@theflutterway.com', '6', '\$184', '9.2%', '3', '7'),
//   CustomerModel(
//       'Alice', 'alice@theflutterway.com', '4', '\$384', '12.8%', '8', '16'),
//   CustomerModel(
//       'Bob', 'bob@theflutterway.com', '7', '\$287', '17.1%', '5', '11'),
//   CustomerModel(
//       'Charlie', 'charlie@theflutterway.com', '3', '\$184', '9.2%', '3', '7'),
//   CustomerModel(
//       'David', 'david@theflutterway.com', '5', '\$384', '12.8%', '8', '16'),
//   CustomerModel(
//       'Eve', 'eve@theflutterway.com', '2', '\$287', '17.1%', '5', '11'),
//   CustomerModel(
//       'Frank', 'frank@theflutterway.com', '6', '\$184', '9.2%', '3', '7'),
// ];

// class _List extends StatelessWidget {
//   const _List();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(AppDefaults.padding),
//       decoration: const BoxDecoration(
//         color: AppColors.bgSecondayLight,
//         borderRadius:
//             BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const SectionTitle(
//                 title: "Customers",
//                 color: AppColors.secondaryLavender,
//               ),
//               if (!Responsive.isMobile(context)) gapW16,
//               if (!Responsive.isMobile(context))
//                 Expanded(
//                   child: Row(
//                     children: [
//                       Expanded(
//                         flex: 2,
//                         child: TextFormField(
//                           // style: Theme.of(context).textTheme.labelLarge,
//                           decoration: InputDecoration(
//                             hintText: "Search by name or email...",
//                             prefixIcon: Padding(
//                               padding: const EdgeInsets.only(
//                                   left: AppDefaults.padding,
//                                   right: AppDefaults.padding / 2),
//                               child: SvgPicture.asset(
//                                   "assets/icons/search_light.svg"),
//                             ),
//                             filled: true,
//                             fillColor:
//                                 Theme.of(context).scaffoldBackgroundColor,
//                             border: AppDefaults.outlineInputBorder,
//                             focusedBorder:
//                                 AppDefaults.focusedOutlineInputBorder,
//                           ),
//                         ),
//                       ),
//                       gapW16,
//                       const Expanded(child: SizedBox.shrink()),
//                     ],
//                   ),
//                 ),
//               if (!Responsive.isMobile(context)) ...[
//                 gapW8,
//                 Chip(
//                   label: const Text('Active'),
//                   backgroundColor: AppColors.textGrey.withOpacity(0.5),
//                   side: BorderSide.none,
//                 ),
//                 gapW8,
//                 const Chip(
//                   label: Text('New'),
//                   backgroundColor: AppColors.bgLight,
//                   side: BorderSide.none,
//                 ),
//               ],
//             ],
//           ),
//           if (Responsive.isMobile(context)) gapH8,
//           if (Responsive.isMobile(context))
//             TextFormField(
//               decoration: InputDecoration(
//                 hintText: "Search by name or email...",
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.only(
//                       left: AppDefaults.padding,
//                       right: AppDefaults.padding / 2),
//                   child: SvgPicture.asset("assets/icons/search_light.svg"),
//                 ),
//                 filled: true,
//                 fillColor: Theme.of(context).scaffoldBackgroundColor,
//                 border: AppDefaults.outlineInputBorder,
//                 focusedBorder: AppDefaults.focusedOutlineInputBorder,
//               ),
//             ),
//           if (Responsive.isMobile(context)) gapH8,
//           if (Responsive.isMobile(context))
//             DropdownMenu(
//               controller: TextEditingController(text: "Active"),
//               dropdownMenuEntries: const [
//                 DropdownMenuEntry(value: "Active", label: "Active"),
//                 DropdownMenuEntry(value: "New", label: "New")
//               ],
//             ),
//           gapH24,
//           Responsive.isMobile(context)
//               ? const _MobileTable()
//               : const _DesktopTable(),
//         ],
//       ),
//     );
//   }
// }

// class _MobileTable extends StatelessWidget {
//   const _MobileTable();

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: customerDummyData.length,
//       itemBuilder: (context, index) {
//         final customer = customerDummyData[index];
//         return Column(
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius:
//                       BorderRadius.circular(AppDefaults.inputFieldRadius),
//                   child: Image.asset(
//                     "assets/images/illustration/dummy-customer.png",
//                     width: 85,
//                     height: 85,
//                   ),
//                 ),
//                 gapW16,
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         customer.name,
//                         maxLines: 2,
//                         overflow: TextOverflow.ellipsis,
//                         style:
//                             Theme.of(context).textTheme.labelMedium!.copyWith(
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                       ),
//                       gapH4,
//                       Text(
//                         customer.email,
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                         style:
//                             Theme.of(context).textTheme.labelMedium!.copyWith(
//                                   color: AppColors.textGrey,
//                                 ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 gapW8,
//                 Column(
//                   children: [
//                     Chip(
//                       side: BorderSide.none,
//                       backgroundColor: AppColors.textGrey.withOpacity(0.2),
//                       label: Text(customer.price),
//                       padding: EdgeInsets.zero,
//                     ),
//                     gapW8,
//                     const Icon(
//                       Icons.arrow_upward,
//                       size: 18,
//                       color: AppColors.success,
//                     ),
//                     Text(
//                       customer.sales,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             gapH8,
//             const Divider(),
//             gapH16,
//           ],
//         );
//       },
//     );
//   }
// }

// class _DesktopTable extends StatelessWidget {
//   const _DesktopTable();

//   @override
//   Widget build(BuildContext context) {
//     return Table(
//       border: const TableBorder(
//         horizontalInside: BorderSide(
//           color: AppColors.bgLight,
//           width: 1,
//         ),
//       ),
//       defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//       columnWidths: const {
//         0: FlexColumnWidth(1),
//         1: FlexColumnWidth(5),
//         2: FlexColumnWidth(4),
//         3: FlexColumnWidth(2),
//         4: FlexColumnWidth(3),
//         5: FlexColumnWidth(2),
//         6: FlexColumnWidth(2),
//       },
//       children: [
//         TableRow(
//           children: [
//             TableCell(
//               child: Checkbox(value: false, onChanged: (v) {}),
//             ),
//             TableCell(
//               child: Text(
//                 'Name',
//                 style: Theme.of(context).textTheme.labelMedium,
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 'Email',
//                 style: Theme.of(context).textTheme.labelMedium,
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 'Purchase',
//                 style: Theme.of(context).textTheme.labelMedium,
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 'Lifetime',
//                 style: Theme.of(context).textTheme.labelMedium,
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 'Comments',
//                 style: Theme.of(context).textTheme.labelMedium,
//               ),
//             ),
//             TableCell(
//               child: Text(
//                 'Likes',
//                 style: Theme.of(context).textTheme.labelMedium,
//               ),
//             ),
//           ],
//         ),
//         for (var customer in customerDummyData)
//           TableRow(
//             children: [
//               TableCell(child: Checkbox(value: false, onChanged: (v) {})),
//               TableCell(
//                 child: Row(
//                   children: [
//                     ClipRRect(
//                       borderRadius:
//                           BorderRadius.circular(AppDefaults.inputFieldRadius),
//                       child: Image.asset(
//                         "assets/images/illustration/dummy-customer.png",
//                         width: 85,
//                         height: 85,
//                       ),
//                     ),
//                     gapW16,
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             customer.name,
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelMedium!
//                                 .copyWith(
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                           ),
//                           gapH4,
//                           Text(
//                             '@username',
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .labelMedium!
//                                 .copyWith(
//                                   color: AppColors.textGrey,
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               TableCell(
//                 child: Text(
//                   customer.email,
//                   style: Theme.of(context).textTheme.labelMedium,
//                 ),
//               ),
//               TableCell(
//                 child: Align(
//                   alignment: Alignment.centerLeft,
//                   child: Chip(
//                     side: BorderSide.none,
//                     backgroundColor: AppColors.success.withOpacity(0.3),
//                     label: Text(
//                       customer.purchase,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ),
//                 ),
//               ),
//               TableCell(
//                 child: Row(
//                   children: [
//                     Chip(
//                       side: BorderSide.none,
//                       backgroundColor: AppColors.textGrey.withOpacity(0.3),
//                       label: Text(
//                         customer.price,
//                         style: Theme.of(context).textTheme.labelMedium,
//                       ),
//                     ),
//                     gapW8,
//                     const Icon(
//                       Icons.arrow_upward,
//                       size: 18,
//                       color: AppColors.success,
//                     ),
//                     Text(
//                       customer.sales,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ],
//                 ),
//               ),
//               TableCell(
//                 child: Text(
//                   customer.comments,
//                   style: Theme.of(context).textTheme.labelMedium,
//                 ),
//               ),
//               TableCell(
//                 child: Text(
//                   customer.likes,
//                   style: Theme.of(context).textTheme.labelMedium,
//                 ),
//               ),
//             ],
//           ),
//       ],
//     );
//   }
// }
extension UniqueBy<T> on Iterable<T> {
  Iterable<T> toSetBy(Object Function(T) keySelector) {
    final seenKeys = <Object>{};
    return where((element) => seenKeys.add(keySelector(element)));
  }
}
