// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class GeneralSettingsScreen extends StatefulWidget {
  const GeneralSettingsScreen({super.key});

  @override
  State<GeneralSettingsScreen> createState() => GeneralSettingsScreenState();
}

class GeneralSettingsScreenState extends State<GeneralSettingsScreen> {
  bool _isHover = false;

  TextEditingController controller = TextEditingController();
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
                  "General Settings",
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
                        text: "General Settings  ",
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
          // height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapH(50),
                        Text(
                          "General",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                        ),
                        gapH20,
                        title(context, "Application Name", true),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          "Classwix",
                          "Name is required",
                          1,
                        ),
                        gapH16,
                        title(context, "Application Details", true),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          "Lorem ipsum dolor sit amet consectetur. Morbi cras sodales elementum sed. Suspendisse adipiscing arcu magna leo sodales pellentesque. Ac iaculis mattis ornare rhoncus nibh mollis arcu.",
                          "Name is required",
                          4,
                        ),
                        gapH16,
                        title(context, "Logo", false),
                        gapH8,
                        GestureDetector(
                          // onTap: pickImage,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.363,
                            // height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black12, width: 0.5)),
                            // child: _image == null
                            //     ? const Icon(Icons.camera_alt)
                            //     : Image.file(File(_image!.path),
                            //         fit: BoxFit.cover),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.grey),
                                      ),
                                      onPressed: () {},
                                      child: const Text("Browse"),
                                    ),
                                  ),
                                ),
                                gapW(15),
                                Text(
                                  "Browse Logo",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        gapH16,
                        title(context, "Favicon", false),
                        gapH8,
                        GestureDetector(
                          // onTap: pickImage,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.363,
                            // height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black12, width: 0.5)),
                            // child: _image == null
                            //     ? const Icon(Icons.camera_alt)
                            //     : Image.file(File(_image!.path),
                            //         fit: BoxFit.cover),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.grey),
                                      ),
                                      onPressed: () {},
                                      child: const Text("Browse"),
                                    ),
                                  ),
                                ),
                                gapW(15),
                                Text(
                                  "Browse favicon",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        gapH16,
                        title(context, "Date Formats", true),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "jS M,Y",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "Y-M-D",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Y-D-M",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "D-M-Y",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "M-D-Y",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH16,
                        title(context, "Country", true),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "India",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "India",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Bangladesh",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "America",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH16,
                        title(context, "Email Address", true),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          "+91 5856 555 555",
                          "Phone number is required",
                          1,
                        ),
                        gapH16,
                        title(context, "OPEN AI KEY", false),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          "Enter OPEN AI KEY",
                          "",
                          1,
                        ),
                        gapH16,
                        title(context, "Payment Gateway", true),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "Off",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "Off",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "ON",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH24,
                        Text(
                          "Signup With OTP Verification",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                        ),
                        gapH24,
                        title(context, "Payment Gateway", true),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "Email",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "None",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Email",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "SMS",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Both",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH24,
                        Text(
                          "Theme(Dark Mode)-Frontend",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                        ),
                        gapH24,
                        title(
                          context,
                          "Primary Color",
                          false,
                        ),
                        gapH8,
                        textfieldCustom(
                            context, controller, "Primary Color", "", 1),
                        gapH16,
                        title(
                          context,
                          "Secondary Color",
                          false,
                        ),
                        gapH8,
                        textfieldCustom(
                            context, controller, "Secondary Color", "", 1),
                        gapH16,
                        title(
                          context,
                          "Tertiary Color",
                          false,
                        ),
                        gapH8,
                        textfieldCustom(
                            context, controller, "Tertiary Color", "", 1),
                        gapH16,
                        title(
                          context,
                          "Primary Color Button",
                          false,
                        ),
                        gapH8,
                        textfieldCustom(
                            context, controller, "Primary Color Button", "", 1),
                      ],
                    ),

                    //RIGHT SIDE
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        gapH(50),
                        Text(
                          "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.black,
                              ),
                        ),
                        gapH20,
                        title(context, "Footer Text", true),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          bottomText,
                          "this field is required",
                          1,
                        ),
                        gapH16,
                        title(context, "Application Map Address", true),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3176328.0190763366!2d-108.19558402634385!3d38.972343352127425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x874014749b1856b7%3A0xc75483314990a7ff!2sColorado%2C%20USA!5e0!3m2!1sen!2sbd!4v1682586333488!5m2!1sen!2sbd",
                          "",
                          4,
                        ),
                        gapH16,
                        title(context, "Dark Logo", false),
                        gapH8,
                        GestureDetector(
                          // onTap: pickImage,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.363,
                            // height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black12, width: 0.5)),
                            // child: _image == null
                            //     ? const Icon(Icons.camera_alt)
                            //     : Image.file(File(_image!.path),
                            //         fit: BoxFit.cover),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.grey),
                                      ),
                                      onPressed: () {},
                                      child: const Text("Browse"),
                                    ),
                                  ),
                                ),
                                gapW(15),
                                Text(
                                  "browse logo",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        gapH16,
                        title(context, "Default Language", true),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "English",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "English",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Hindi",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH16,
                        title(context, "Currency", true),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "Dollars (\$)",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "Dollars (\$)",
                              ),
                              DropdownMenuEntry(
                                value: "1",
                                label: "Rupees (₹)",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH16,
                        title(context, "TimeZone", true),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "Asia/Dhaka",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "Asia/Dhaka",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Asia/Dili",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Asia/Colombo",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH16,
                        title(context, "Office Address", true),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          "Dhaka, Bangladesh",
                          "Address is required",
                          1,
                        ),
                        gapH16,
                        title(context, "Office Hours", true),
                        gapH8,
                        textfieldCustom(
                          context,
                          controller,
                          "Monday - Friday : 10:00an to 6:00pm",
                          "",
                          1,
                        ),
                        gapH16,
                        title(context, "Empty Table", true),
                        gapH8,
                        GestureDetector(
                          // onTap: pickImage,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.363,
                            // height: 100,
                            decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.black12, width: 0.5)),
                            // child: _image == null
                            //     ? const Icon(Icons.camera_alt)
                            //     : Image.file(File(_image!.path),
                            //         fit: BoxFit.cover),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.grey),
                                      ),
                                      onPressed: () {},
                                      child: const Text("Browse"),
                                    ),
                                  ),
                                ),
                                gapW(15),
                                Text(
                                  "Browse",
                                  style: GoogleFonts.poppins(
                                      color: Colors.black54,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                        gapH24,
                        Text(
                          "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                        ),
                        gapH24,
                        title(context, "Student Account", false),
                        gapH8,
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.363,
                          height: 50,
                          child: const DropdownMenu(
                            hintText: "Email",
                            dropdownMenuEntries: [
                              DropdownMenuEntry(
                                value: "1",
                                label: "None",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Email",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "SMS",
                              ),
                              DropdownMenuEntry(
                                value: "2",
                                label: "Both",
                              ),
                            ],
                            expandedInsets: EdgeInsets.zero,
                          ),
                        ),
                        gapH24,
                        Text(
                          "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.black,
                              ),
                        ),
                        gapH24,
                        title(
                          context,
                          "Primary Color RGB",
                          false,
                        ),
                        gapH8,
                        textfieldCustom(
                            context, controller, "Primary Color RGB", "", 1),
                        gapH16,
                        title(
                          context,
                          "Secondary Color RGB",
                          false,
                        ),
                        gapH8,
                        textfieldCustom(
                            context, controller, "Secondary Color RGB", "", 1),
                        gapH16,
                        title(
                          context,
                          "Tertiary Color RGB",
                          false,
                        ),
                        gapH8,
                        textfieldCustom(
                            context, controller, "Tertiary Color RGB", "", 1),
                        gapH16,
                        gapH(30),
                      ],
                    ),
                  ],
                ),
                gapH(20),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomBtn(
                    title: "Update",
                    onPresses: () {},
                  ),
                ),
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

  SizedBox textfieldCustom(
    BuildContext context,
    TextEditingController controller,
    String hintText,
    String validatorText,
    // double widthMediaquary,
    int maxLine,
  ) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.363,
      // width:/ double.infinity,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          return validatorText;
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26),
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
        ),
        maxLines: maxLine == 0 ? 1 : maxLine,
      ),
    );
  }

  RichText title(BuildContext context, String title, bool isRequired) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          if (isRequired)
            const TextSpan(
              text: " *",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}
