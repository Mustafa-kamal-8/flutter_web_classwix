// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:core_dashboard/shared/constants/ghaps.dart';

String bottomText = "© 2024 Classwix . All rights reserved.";

const String BASE_URL = "https://api.classwix.com/api/";

const String APPLOGO = 'assets/logo/Logo_g.png';

class BottomTextDesign extends StatelessWidget {
  Color? color;
  BottomTextDesign({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: color ?? Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
          child: Text(
            bottomText,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 17,
                  color: Colors.grey,
                ),
          ),
        ),
      ),
    );
  }
}

//Snackbar
void showSnackBar(
  String message,
  BuildContext context,
  Color color,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,

      content: Text(message),
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    ),
  );
}

class CustomBtn extends StatelessWidget {
  bool? isIcon;
  Icon? icon;
  final VoidCallback onPresses;
  final String title;
  double? width;
  double? height;

  CustomBtn({
    super.key,
    required this.title,
    this.width,
    this.height,
    this.icon,
    this.isIcon,
    required this.onPresses,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPresses,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: const Color.fromARGB(255, 46, 82, 244),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width ?? 6,
              vertical: height ?? 8.2,
            ),
            child: TextButton.icon(
              onPressed: onPresses,
              icon: isIcon == true ? icon : const SizedBox(),
              label: Text(
                title,
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
              ),
            )),
      ),
    );
  }
}

String formatDate(String? createdAt) {
  if (createdAt == null || createdAt.isEmpty) {
    return "--";
  }

  try {
    DateTime dateTime = DateTime.parse(createdAt);

    return DateFormat("dd-MM-yyyy").format(dateTime);
  } catch (e) {
    return "";
  }
}

// ignore: non_constant_identifier_names
final TextStyle HINT_TEXT_STYLE = TextStyle(
  fontSize: 14,
  color: Colors.grey.shade400,
  fontWeight: FontWeight.w400,
);

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 35.0),
            child: Image.asset(
              "assets/logo/no-data.png",
              width: 100,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Please add a new entity or manage the data table to see the content here",
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 12,
                color: Colors.black,
              ),
        ),
        gapH(80),
        const Divider(),
        // gapH(50),
      ],
    );
  }
}

//customMask
String customMask(String text, int startLength, int endLength,
    {String maskChar = '*'}) {
  if (text.isEmpty || text.length <= startLength + endLength) {
    return text; // Return as-is if too short
  }

  final start = text.substring(0, startLength); // Get the starting characters
  final end =
      text.substring(text.length - endLength); // Get the ending characters

  return '$start${maskChar * (text.length - startLength - endLength)}$end';
}
