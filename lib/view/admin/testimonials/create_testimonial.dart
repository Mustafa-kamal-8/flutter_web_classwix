import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

import 'package:image_picker/image_picker.dart';

class CreateTestimonialScreen extends StatefulWidget {
  const CreateTestimonialScreen({super.key});

  @override
  State<CreateTestimonialScreen> createState() =>
      _CreateTestimonialScreenState();
}

class _CreateTestimonialScreenState extends State<CreateTestimonialScreen> {
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
                  "Create Testimonial",
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
                                  color: AppColors.primary,
                                ),
                      ),
                      TextSpan(
                        text: "Testimonial List",
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
                        text: "Create Testimonial  ",
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
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH(50),
                // Row(
                //   children: [
                //     Text(
                //       "Name",
                //       style: Theme.of(context)
                //           .textTheme
                //           .headlineLarge!
                //           .copyWith(fontSize: 16, color: Colors.black),
                //     ),
                //     const SizedBox(width: 3),
                //     Padding(
                //       padding: const EdgeInsets.only(bottom: 3),
                //       child: Text(
                //         "*",
                //         style:
                //             Theme.of(context).textTheme.headlineLarge!.copyWith(
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 12,
                //                   color: Colors.red,
                //                 ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(height: 8),

                gapH(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Name",
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
                        gapH(8),
                        // SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.37,
                        //   height: 50,
                        //   child: const DropdownMenu(
                        //     hintText: "Active",
                        //     dropdownMenuEntries: [
                        //       DropdownMenuEntry(
                        //         value: "1",
                        //         label: "Active",
                        //       ),
                        //       DropdownMenuEntry(
                        //         value: "2",
                        //         label: "Inavtive",
                        //       ),
                        //     ],
                        //     expandedInsets: EdgeInsets.zero,
                        //   ),
                        // ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.37,
                          // width: double.infinity,
                          child: const TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Enter Name",
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
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Status",
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
                        gapH(8),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.37,
                        //   height: 50,
                        //   child: const DropdownMenu(
                        //     hintText: "Yes",
                        //     dropdownMenuEntries: [
                        //       DropdownMenuEntry(
                        //         value: "1",
                        //         label: "Yes",
                        //       ),
                        //       DropdownMenuEntry(
                        //         value: "2",
                        //         label: "No",
                        //       ),
                        //     ],
                        //     expandedInsets: EdgeInsets.zero,
                        //   ),
                        // ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "Active",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "Active",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Inavtive",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                gapH(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rating",
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
                        gapH(8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "1",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "1",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "2",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Designation",
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
                        gapH(8),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.37,
                          // width: double.infinity,
                          child: const TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Enter Designation",
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
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                gapH(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Content",
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
                        gapH(8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          // height: 50,
                          child: TextField(
                            // controller: _descriptionController,
                            maxLines: 9,
                            // maxLength: 9,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: "Enter Content",
                              hintStyle: const TextStyle(
                                color: Colors.black54,
                                fontSize: 15,
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
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Image",
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
                        gapH(8),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.37,
                          height: 235,
                          child: InkWell(
                            onTap: () {
                              _pickImageWeb();
                            },
                            child: DottedBorder(
                              radius: const Radius.circular(10),
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
                      ],
                    ),
                  ],
                ),
                gapH(15),
                const Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 160),
                    child: Text(
                        "NB : Template type must be png format and not more than 1mb"),
                  ),
                ),
                gapH20,
                CustomBtn(
                    onPresses: () {
                      setState(() {});
                    },
                    title: "Save"),
                gapH(20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
