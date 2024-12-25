// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:core_dashboard/model/course_categories_model.dart';
import 'package:core_dashboard/provider/create_categories_provider.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../../responsive.dart';
import '../../../shared/constants/ghaps.dart';

class CategoriesListPage extends StatefulWidget {
  const CategoriesListPage({super.key});

  @override
  State<CategoriesListPage> createState() => _CategoriesListPageState();
}

class _CategoriesListPageState extends State<CategoriesListPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleController = TextEditingController();
  String? selectedCategory;
  String? selectedStatus;

  List<String> categories = ['Music', 'Art', 'Sports'];
  List<String> status = ['Active', 'Inactive'];

  int? selectedCategoryIndex;
  int? selectedStatusIndex;

  bool isParentsCategory = false;
  bool isStatus = false;

  bool isAddCategory = false;

  String searchText = '';

  Uint8List? _webImage;

  Future<void> _pickImageWeb() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      log('Picked Image URL: ${image.path}');

      if (kIsWeb) {
        // For web, use image as bytes
        final bytes = await image.readAsBytes();
        setState(() {
          _webImage = bytes;
        });
      }
    }
  }

  String formatSlug(String name) {
    return name.toLowerCase().replaceAll(' ', '-');
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() &&
        _titleController.text.isNotEmpty &&
        selectedCategory != null &&
        selectedStatus != null) {
      // Create a new entry map
      Provider.of<CreateCategoriesProvider>(context, listen: false)
          .createCoursesCategories(
        _titleController.text,
        formatSlug(_titleController.text),
        1,
        1,
        '',
        // selectedCategory.toString(),
        selectedStatus == "Active" ? 1 : 0,
        true,
      )
          .then(
        (value) {
          Provider.of<CreateCategoriesProvider>(context, listen: false)
                      .resStatusCode ==
                  201
              ? ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Course Categories Created successfully!')),
                )
              : null;
          // isAddCategory = false;
        },
      );

      // Map<String, dynamic> newEntry = {
      //   "id": (allEntries.length + 1).toString(),
      //   "title": _titleController.text,
      //   "icon": "assets/logo/${selectedCategory!.toLowerCase()}_logos.png",
      //   "parent_category": selectedCategory,
      //   "course": "0",
      //   "status": selectedStatus,
      //   "created_at": DateTime.now().toString().split(' ')[0],
      //   "action": const Icon(
      //     Icons.more_horiz,
      //     size: 20,
      //     color: Colors.white,
      //   ),
      // };
      // setState(() {
      //   allEntries.add(newEntry);
      // });

      _titleController.clear();
      selectedCategory = null;
      selectedStatus = null;
    } else {
      log("All fields are required");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("All fields are required")),
      );
    }
  }

  @override
  void initState() {
    Provider.of<CreateCategoriesProvider>(context, listen: false)
        .getCoursesCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredCategories = categories
        .where((category) =>
            category.toLowerCase().contains(searchText.toLowerCase()))
        .toList();
    List<String> filteredStatus = status
        .where((category) =>
            category.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return isAddCategory == false
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!Responsive.isMobile(context)) gapH24,
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Course Category",
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
                              text: "Course Category  ",
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
              gapH16,
              Container(
                height: 460,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                            SizedBox(
                              width: 350,
                              child: TextField(
                                onChanged: (value) {
                                  Provider.of<CreateCategoriesProvider>(context,
                                          listen: false)
                                      .setSearchQuery(value);
                                },
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
                            const SizedBox(width: 12),
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
                                  color: const Color.fromARGB(255, 46, 82, 244),
                                ),
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      // horizontal: ,
                                      vertical: 9.5,
                                    ),
                                    child: TextButton.icon(
                                      onPressed: () {
                                        setState(() {
                                          isAddCategory = true;
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("ID"),
                            Text("TITLE"),
                            Text("ICON"),
                            Text("PARENT CATEGORY"),
                            // SizedBox(width: 5),
                            Text("COURSE"),
                            Text("STATUS"),
                            Text("CREATED AT"),
                            Text("ACTION"),
                          ],
                        ),
                        gapH8,
                        const Divider(),
                        Consumer<CreateCategoriesProvider>(
                          builder: (context, createCategoriesProvider, _) {
                            if (createCategoriesProvider.isLoading ||
                                createCategoriesProvider
                                        .courseCategoriesModel ==
                                    null) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }

                            // Use filteredCategories for displaying the list
                            final filteredCategories =
                                createCategoriesProvider.filteredCategories;

                            return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const Divider(height: 50),
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              itemCount: filteredCategories?.length ??
                                  0, // Count filtered categories
                              itemBuilder: (context, index) {
                                // Get the current course category from filtered list
                                final courseCategory = filteredCategories![
                                    index]; // Use non-null assertion

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(courseCategory.id.toString()),
                                    gapW(35),
                                    SizedBox(
                                      width: 200,
                                      child: Text(
                                        courseCategory.title,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    gapW(15),

                                    Image.asset(
                                      "assets/logo/music_logos.png",
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                            "assets/logo/music_logos.png");
                                      },
                                    ),
                                    gapW(160),

                                    Text(courseCategory.parentId?.toString() ??
                                        " "),
                                    gapW(190),
                                    const Text("0"),
                                    gapW(122),

                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                                255, 30, 255, 30)
                                            .withOpacity(0.2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 2),
                                        child: Text(
                                          courseCategory.statusId == 1
                                              ? "Active"
                                              : "Inactive",
                                          style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 30, 118, 6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    gapW(100),

                                    // Assuming formatDate is defined elsewhere in your code
                                    Text(formatDate(
                                        courseCategory.createdAt.toString())),
                                    gapW(110),
                                    InkWell(
                                      onTap: () {
                                        // Define tap action here if needed
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),
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
                                  ],
                                );
                              },
                            );
                          },
                        ),
                        const Divider(),
                        gapH16,
                      ],
                    ),
                  ),
                ),
              ),
              gapH(20),
              BottomTextDesign(),
              gapH(5),
            ],
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                // isAddCategory = false;
              });
            },
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      // height: 50,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 22),
                        child: Row(
                          children: [
                            const SizedBox(width: 20),
                            Text(
                              "Create Course Category",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                            ),
                            const Spacer(),
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
                                      ..onTap = () {
                                        setState(() {
                                          isAddCategory = false;
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
                                          color: AppColors.primary,
                                        ),
                                  ),
                                  TextSpan(
                                    text: "Course Category  ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontSize: 16,
                                          color: AppColors.primary,
                                        ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        setState(() {
                                          isAddCategory = false;
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
                                  ),
                                  TextSpan(
                                    text: "Create Course Category  ",
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
                    const SizedBox(height: 30),
                    Container(
                      // height: 500,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 18),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  Text(
                                    "Title",
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
                                    padding: const EdgeInsets.only(bottom: 3),
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
                              const SizedBox(height: 5),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: TextFormField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: "Enter Title",
                                    hintStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'This field is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(height: 25),
                              //         // if (_titleController.text.isEmpty)
                              //         // Text(
                              //         //   "Title is required",
                              //         //   style: Theme.of(context)
                              //         //       .textTheme
                              //         //       .headlineLarge!
                              //         //       .copyWith(
                              //         //         // fontWeight: FontWeight.w600,
                              //         //         fontSize: 16,
                              //         //         color: Colors.red,
                              //         //       ),
                              //         // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Parent Category",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3),
                                  Row(
                                    children: [
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
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
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
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.35,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 0.2,
                                            color: Colors.grey,
                                          ),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                selectedCategory ??
                                                    "Select Parent Category",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .copyWith(
                                                      fontSize: 15,
                                                      color: Colors.black,
                                                    ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isParentsCategory =
                                                      !isParentsCategory;
                                                });
                                              },
                                              icon: Icon(isParentsCategory
                                                  ? Icons.arrow_drop_up
                                                  : Icons.arrow_drop_down),
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (isParentsCategory)
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 50.0),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.35,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                width: 0.2,
                                                color: Colors.grey,
                                              ),
                                              color: Colors.white,
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30,
                                                      vertical: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextField(
                                                    onChanged: (value) {
                                                      setState(() {
                                                        searchText = value;
                                                      });
                                                    },
                                                    decoration: InputDecoration(
                                                      // hintText: "",
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .black12),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    "Select Parent Category",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineLarge!
                                                        .copyWith(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                        ),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  ListView.separated(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),

                                                    shrinkWrap: true,
                                                    separatorBuilder:
                                                        (context, index) =>
                                                            const SizedBox(
                                                                height: 10),
                                                    itemCount: filteredCategories
                                                        .length, // Use filtered categories
                                                    itemBuilder:
                                                        (context, index) {
                                                      return GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            selectedCategoryIndex =
                                                                categories.indexOf(
                                                                    filteredCategories[
                                                                        index]);
                                                            selectedCategory =
                                                                filteredCategories[
                                                                    index];
                                                            isParentsCategory =
                                                                false; // Close dropdown
                                                          });
                                                        },
                                                        child: Text(
                                                          filteredCategories[
                                                              index],
                                                          style: TextStyle(
                                                            color: selectedCategoryIndex ==
                                                                    categories.indexOf(
                                                                        filteredCategories[
                                                                            index])
                                                                ? AppColors
                                                                    .titleLight
                                                                : Colors.black,
                                                            fontWeight: selectedCategoryIndex ==
                                                                    categories.indexOf(
                                                                        filteredCategories[
                                                                            index])
                                                                ? FontWeight
                                                                    .bold
                                                                : FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.35,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                              width: 0.2,
                                              color: Colors.grey,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text(
                                                  selectedStatus ?? "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineLarge!
                                                      .copyWith(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                      ),
                                                ),
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isStatus = !isStatus;
                                                  });
                                                },
                                                icon: Icon(isStatus
                                                    ? Icons.arrow_drop_up
                                                    : Icons.arrow_drop_down),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (isStatus)
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 50.0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.35,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.grey,
                                                ),
                                                color: Colors.white,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 30,
                                                        vertical: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    TextField(
                                                      onChanged: (value) {
                                                        setState(() {
                                                          searchText = value;
                                                        });
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                        // hintText: "Search Categories",
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .black12),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .black12),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    const SizedBox(height: 10),
                                                    ListView.separated(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              const SizedBox(
                                                                  height: 10),
                                                      itemCount:
                                                          filteredStatus.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              selectedStatusIndex =
                                                                  status.indexOf(
                                                                      filteredStatus[
                                                                          index]);
                                                              selectedStatus =
                                                                  filteredStatus[
                                                                      index];
                                                              isStatus = false;
                                                            });
                                                          },
                                                          child: Text(
                                                            filteredStatus[
                                                                index],
                                                            style: TextStyle(
                                                              color: selectedStatusIndex ==
                                                                      status.indexOf(
                                                                          filteredStatus[
                                                                              index])
                                                                  ? AppColors
                                                                      .titleLight
                                                                  : Colors
                                                                      .black,
                                                              fontWeight: selectedStatusIndex ==
                                                                      status.indexOf(
                                                                          filteredStatus[
                                                                              index])
                                                                  ? FontWeight
                                                                      .bold
                                                                  : FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  Text(
                                    "Icon",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          // fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                  ),
                                  const SizedBox(width: 3),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 3),
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
                              const SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                height: 180,
                                child: InkWell(
                                  onTap: () {
                                    _pickImageWeb(); // No need to wrap with setState here, as _pickImage handles it
                                    log(_webImage.toString(),
                                        name: "Image url");
                                  },
                                  child: DottedBorder(
                                    dashPattern: const [4],
                                    color: Colors.grey,
                                    child: Center(
                                      child: _webImage != null
                                          ? Image.memory(
                                              _webImage!,
                                              fit: BoxFit.cover,
                                            )
                                          : Icon(
                                              Icons
                                                  .add_photo_alternate_outlined,
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
                              const SizedBox(height: 20),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _submitForm();
                                  });
                                },
                                child: Container(
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
                                      "Create",
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
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 10),
                    // const BottomTextDesign(),
                  ],
                ),
              ),
            ),
          );
    // if (!Responsive.isMobile(context)) gapW16,
    // if (!Responsive.isMobile(context))
    //   Expanded(
    //     flex: 3,
    //     child: Column(
    //       children: [
    //         if (!Responsive.isMobile(context)) gapH24,
    //         Text(
    //           " ",
    //           style: Theme.of(context)
    //               .textTheme
    //               .headlineLarge!
    //               .copyWith(fontWeight: FontWeight.w600),
    //         ),
    //         gapH16,
    //         const RefundRequests(),
    //         gapH16,
    //         const TopDevices(),
    //         gapH16,
    //         const TopCountry(),
    //         gapH16,
    //         const CustomerMessages(),
    //         gapH16,
    //         const NewCustomers(),
    //       ],
    //     ),
    //   ),
    // ],
    // );
  }
}

List<Map<String, dynamic>> allEntries = [
  {
    "id": "1",
    "title": "Music",
    "icon": "assets/logo/music_logos.png",
    "parent_category": "-",
    "course": "0",
    "status": "Active",
    "created_at": "01-10-2024",
    "action": const Icon(
      Icons.more_horiz,
      size: 20,
      color: Colors.white,
    ),
  }
];
