import 'dart:io';

import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class EditMyProfileScreen extends StatefulWidget {
  const EditMyProfileScreen({
    super.key,
  });

  @override
  State<EditMyProfileScreen> createState() => _EditMyProfileScreenState();
}

class _EditMyProfileScreenState extends State<EditMyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final ImagePicker picker = ImagePicker();

    XFile? image;

    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    DateTime? selectedDate;

    void pickImage() async {
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        image = pickedImage;
      });
    }

    void pickDate() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
        });
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: MediaQuery.of(context).size.width * 0.515,
      height: 600,
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(100, 70, 100, 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Edit My Profile",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Divider(height: 50),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 80, width: 80,
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    shape: BoxShape.circle), // minRadius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset(
                    APPLOGO,
                    width: 55,
                  ),
                ),
              ),
            ),
            gapH(20),
            const Divider(),
            gapH(10),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Image",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      // width: 100,
                      // height: 100,
                      decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.black12, width: 0.5)),
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
                            "Image",
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Name",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "*",
                          style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Date of Birth",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                  gapH(5),
                  GestureDetector(
                    onTap: pickDate,
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: InputDecoration(
                          // 'Date of Birth',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                          hintText: selectedDate == null
                              ? 'Select your date of birth'
                              : '${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}',
                          border: const OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ),
                          suffixIcon: IconButton(
                            onPressed: pickDate,
                            icon: const Icon(Icons.date_range),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Phone",
                          style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                          text: "*",
                          style: GoogleFonts.poppins(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  gapH(8),
                  TextFormField(
                    controller: phoneController,
                    decoration: InputDecoration(
                        hintText: 'Phone',
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontSize: 13,
                        ),
                        border: const OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.3),
                          ),
                        )),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Process data
                        }
                      },
                      label: const Text('Update'),
                      icon: const Icon(
                        Icons.save_outlined,
                        color: Colors.white,
                      ),
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
