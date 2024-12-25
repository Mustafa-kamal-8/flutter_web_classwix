// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:core_dashboard/provider/certificate_provider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;

class CertificatesTemplateListSccreen extends StatefulWidget {
  const CertificatesTemplateListSccreen({super.key});

  @override
  State<CertificatesTemplateListSccreen> createState() =>
      _CertificatesTemplateListSccreenState();
}

class _CertificatesTemplateListSccreenState
    extends State<CertificatesTemplateListSccreen> {
  final TextEditingController _descriptionController = TextEditingController();
  bool _isAddCertificateTemplate = false;

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
    getUserInfo();
    Provider.of<CertificateProvider>(context, listen: false)
        .getCertificate(context);
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
                  _isAddCertificateTemplate
                      ? "Add Certificate Template"
                      : "Certificate Template List",
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
                                  fontSize: 13,
                                  color: AppColors.primary,
                                ),
                      ),
                      TextSpan(
                        text: " / ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: AppColors.textGrey,
                                ),
                      ),
                      TextSpan(
                        text: "Certificate Template List  ",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  // fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  color: _isAddCertificateTemplate
                                      ? AppColors.primary
                                      : AppColors.textGrey,
                                ),
                      ),
                      if (_isAddCertificateTemplate == true)
                        TextSpan(
                          text: " / ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: AppColors.textGrey,
                              ),
                        ),
                      if (_isAddCertificateTemplate == true)
                        TextSpan(
                          text: "Add Certificate Template  ",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                // fontWeight: FontWeight.w600,
                                fontSize: 13,
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
        _isAddCertificateTemplate == false
            ? Container(
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
                        const SizedBox(height: 25),
                        CustomBtn(onPresses: () {}, title: 'Filter'),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isAddCertificateTemplate = true;
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
                                  gapW(15),
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
                        Text("COURSE TITLE"),
                        Text("TOTAL POINTS"),
                        Text("POINTS"),
                        Text("STATUS"),
                        Text("PROGRESS"),
                        Padding(
                          padding: EdgeInsets.only(right: 100.0),
                          child: Text("ACTION"),
                        ),
                      ],
                    ),
                    gapH(20),
                    const Divider(),
                    Consumer<CertificateProvider>(
                      builder: (context, certificateProvider, _) {
                        if (certificateProvider.isLoading) {
                          return const CircularProgressIndicator();
                        }
                        final certificate =
                            certificateProvider.getCertificateResponse;

                        // Check if the certificate data is null
                        if (certificate == null) {
                          return const NoDataWidget();
                        }

                        return ListView(
                          shrinkWrap: true,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    certificate['id']?.toString() ??
                                        "", // Ensure id is a string
                                  ),
                                ),
                                const SizedBox(
                                    width:
                                        120), // Add some space between text items
                                Text(
                                  certificate['description'] ??
                                      "", // Display description
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),

                    // Column(
                    //   children: [
                    //     Center(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(top: 35.0),
                    //         child: Image.asset(
                    //           "assets/logo/no-data.png",
                    //           width: 100,
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(height: 8),
                    //     Text(
                    //       "Please add a new entity or manage the data table to see the content here",
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .headlineLarge!
                    //           .copyWith(
                    //             fontSize: 12,
                    //             color: Colors.black,
                    //           ),
                    //     ),
                    //     gapH(20),
                    //     const Divider(),
                    //   ],
                    // ),
                    gapH(100),
                  ],
                ),
              )
            //Add certificate template
            : Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapH(25),
                      Text(
                        "Text Generate Hints",
                        style:
                            Theme.of(context).textTheme.headlineLarge!.copyWith(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                      ),
                      gapH8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Student Name :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                  text: " [name]",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Course Name :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                  text: " [course]",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Instructor Name :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                ),
                                TextSpan(
                                  text: " [instructor]",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge!
                                      .copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Date :",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                  ),
                                  TextSpan(
                                    text: " [date]",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      gapH(50),
                      Row(
                        children: [
                          Text(
                            "Title",
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
                      const SizedBox(height: 8),
                      const SizedBox(
                        height: 50,
                        // width: MediaQuery.of(context).size.width * 0.35,
                        width: double.infinity,
                        child: TextField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Enter Title",
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
                      gapH(10),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Row(
                      //           children: [
                      //             Text(
                      //               "Status",
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .headlineLarge!
                      //                   .copyWith(
                      //                       fontSize: 16, color: Colors.black),
                      //             ),
                      //             const SizedBox(width: 3),
                      //             Padding(
                      //               padding: const EdgeInsets.only(bottom: 3),
                      //               child: Text(
                      //                 "*",
                      //                 style: Theme.of(context)
                      //                     .textTheme
                      //                     .headlineLarge!
                      //                     .copyWith(
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12,
                      //                       color: Colors.red,
                      //                     ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         gapH(8),
                      //         SizedBox(
                      //           width: MediaQuery.of(context).size.width * 0.37,
                      //           height: 50,
                      //           child: const DropdownMenu(
                      //             hintText: "Active",
                      //             dropdownMenuEntries: [
                      //               DropdownMenuEntry(
                      //                 value: "1",
                      //                 label: "Active",
                      //               ),
                      //               DropdownMenuEntry(
                      //                 value: "2",
                      //                 label: "Inavtive",
                      //               ),
                      //             ],
                      //             expandedInsets: EdgeInsets.zero,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Row(
                      //           children: [
                      //             Text(
                      //               "Default",
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .headlineLarge!
                      //                   .copyWith(
                      //                       fontSize: 16, color: Colors.black),
                      //             ),
                      //             const SizedBox(width: 3),
                      //             Padding(
                      //               padding: const EdgeInsets.only(bottom: 3),
                      //               child: Text(
                      //                 "*",
                      //                 style: Theme.of(context)
                      //                     .textTheme
                      //                     .headlineLarge!
                      //                     .copyWith(
                      //                       fontWeight: FontWeight.w600,
                      //                       fontSize: 12,
                      //                       color: Colors.red,
                      //                     ),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         gapH(8),
                      //         SizedBox(
                      //           width: MediaQuery.of(context).size.width * 0.37,
                      //           height: 50,
                      //           child: const DropdownMenu(
                      //             hintText: "Yes",
                      //             dropdownMenuEntries: [
                      //               DropdownMenuEntry(
                      //                 value: "1",
                      //                 label: "Yes",
                      //               ),
                      //               DropdownMenuEntry(
                      //                 value: "2",
                      //                 label: "No",
                      //               ),
                      //             ],
                      //             expandedInsets: EdgeInsets.zero,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      gapH(12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Text(
                          //           "Text",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .headlineLarge!
                          //               .copyWith(
                          //                   fontSize: 16, color: Colors.black),
                          //         ),
                          //         const SizedBox(width: 3),
                          //         Padding(
                          //           padding: const EdgeInsets.only(bottom: 3),
                          //           child: Text(
                          //             "*",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .headlineLarge!
                          //                 .copyWith(
                          //                   fontWeight: FontWeight.w600,
                          //                   fontSize: 12,
                          //                   color: Colors.red,
                          //                 ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //     gapH(8),
                          //     SizedBox(
                          //       width: MediaQuery.of(context).size.width * 0.37,
                          //       // height: 50,
                          //       child: TextField(
                          //         controller: _descriptionController,
                          //         maxLines: 9,
                          //         // maxLength: 9,
                          //         decoration: InputDecoration(
                          //           filled: true,
                          //           fillColor: Colors.white,
                          //           hintText:
                          //               "This is to certify that [name] has successfully completed the course [course] on [date]",
                          //           hintStyle: const TextStyle(
                          //             color: Colors.black54,
                          //             fontSize: 15,
                          //           ),
                          //           enabledBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //             borderSide: const BorderSide(
                          //                 color: Colors.black12),
                          //           ),
                          //           focusedBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //             borderSide: const BorderSide(
                          //                 color: Colors.black12),
                          //           ),
                          //           errorBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //             borderSide: const BorderSide(
                          //                 color: Colors.red, width: 2.0),
                          //           ),
                          //           focusedErrorBorder: OutlineInputBorder(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //             borderSide: const BorderSide(
                          //                 color: Colors.redAccent, width: 2.0),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Template",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 16, color: Colors.black),
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
                                width: MediaQuery.of(context).size.width * 0.73,
                                // width: double.infinity,
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
                                              Icons
                                                  .add_photo_alternate_outlined,
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
                            setState(() {
                              // _isAddCertificateTemplate = false;
                              Provider.of<CertificateProvider>(context,
                                      listen: false)
                                  .createCertificate(
                                webImageFile!,
                                _descriptionController.text,
                                context,
                              )
                                  .then(
                                (value) {
                                  if (Provider.of<CertificateProvider>(context,
                                              listen: false)
                                          .resStatusCode ==
                                      201) {
                                    setState(() {
                                      _isAddCertificateTemplate = false;
                                    });
                                  }
                                },
                              );
                            });
                          },
                          title: "Save"),
                      gapH(20),
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

  Container _customCard(
    BuildContext context,
    Color containerClr,
    Color smallContainerClr,
    String title,
    String number,
    Widget icon,
  ) {
    return Container(
      height: 165,
      width: 360,
      decoration: BoxDecoration(
          color: containerClr, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: smallContainerClr),
              height: 50,
              width: 50,
              child: icon,
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: Colors.black38,
                  ),
            ),
            gapH8,
            Text(
              number,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.black,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
