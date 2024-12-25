import 'dart:developer';

import 'package:core_dashboard/view/admin/authentication/sign_in_page.dart';
import 'package:core_dashboard/view/admin/home/home_courses_provider.dart';
import 'package:core_dashboard/responsive.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/shared/constants/userdatamanager.dart';
import 'package:core_dashboard/shared/widgets/sidemenu/menu_tile.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BlogsScreen extends StatefulWidget {
  const BlogsScreen({super.key});

  @override
  State<BlogsScreen> createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ResponsiveAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header section
            Container(
              color: Colors.black,
              height: isMobile ? 150 : 180,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(left: isMobile ? 20.0 : 155.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Blogs",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 22 : 28,
                      color: Colors.white,
                      letterSpacing: 1.5,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth * 0.05),

            // Filter section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.3,
                  ),
                  gapH(5),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Showing ",
                            style: GoogleFonts.poppins(color: Colors.black)),
                        TextSpan(
                          text: "Result ",
                          style: GoogleFonts.poppins(color: Colors.orange),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: "out of ",
                          style: GoogleFonts.poppins(color: Colors.black),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                        TextSpan(
                          text: "0 Items",
                          style: GoogleFonts.poppins(color: Colors.orange),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            gapH(100),
            Container(
              // height: 100,
              padding:
                  const EdgeInsets.symmetric(vertical: 50, horizontal: 150),
              width: double.infinity,
              color: const Color.fromARGB(255, 3, 0, 35),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                child: Image.asset(
                                  'assets/logo/Logo_g.png',
                                  width: 250,
                                  // color: Colors.white,
                                ),
                              ),
                            ),
                            gapH20,
                            Text(
                              "Lorem ipsum dolor sit amet consectetur. Morbi cras sodales elementum sed. Suspendisse adipiscing arcu magna leo sodales pellentesque. Ac iaculis mattis ornare rhoncus nibh mollis arcu.",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pages",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          gapH(8),
                          Text(
                            "Latest Courses",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                          Text(
                            "Certificate Track",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                          Text(
                            "Best Rated Courses",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                          Text(
                            "Our Recent Blogs",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Custom Links",
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          gapH(8),
                          Text(
                            "About Us",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                          Text(
                            "Contact Us",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                          Text(
                            "Privacy Policy",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                          Text(
                            "Term & Conditions",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                          Text(
                            "Events",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          gapH4,
                        ],
                      ),
                      Text(
                        "Top Categories",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      gapH4,
                    ],
                  ),
                  gapH(20),
                  const Divider(),
                  gapH(20),
                  BottomTextDesign(
                    color: const Color.fromARGB(255, 3, 0, 35),
                  ),
                  gapH(20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _header(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Row(
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              "*",
              style: GoogleFonts.poppins(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _noCoursesFound(double screenWidth) {
    return Container(
      width: screenWidth * 0.559,
      decoration: BoxDecoration(
          color: Colors.orange[50],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.orange.withOpacity(0.2))),
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 18.0),
        child: Center(
            child: Text(
          "No Courses Found",
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        )),
      ),
    );
  }

  // Vertical divider widget
  Widget _verticalDivider() {
    return SizedBox(
      height: 43,
      child: VerticalDivider(
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }

  // Filter options container
  Widget _buildFilterOptions(VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          TextButton(
              onPressed: onTap,
              child: const Text(
                "  Best Rated  ",
                style: TextStyle(color: AppColors.textGrey),
              )),
          _verticalDivider(),
          TextButton(
              onPressed: onTap,
              child: const Text(
                "  Most Popular  ",
                style: TextStyle(color: AppColors.textGrey),
              )),
          _verticalDivider(),
          TextButton(
              onPressed: onTap,
              child: const Text(
                "  Latest  ",
                style: TextStyle(color: AppColors.textGrey),
              )),
          _verticalDivider(),
          TextButton(
              onPressed: onTap,
              child: const Text(
                "  Highest Price  ",
                style: TextStyle(color: AppColors.textGrey),
              )),
          _verticalDivider(),
          TextButton(
              onPressed: onTap,
              child: const Text(
                "  Lowest Price  ",
                style: TextStyle(color: AppColors.textGrey),
              )),
        ],
      ),
    );
  }

  // View switcher container (grid and list view)
  Widget _buildViewSwitcher() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.grid_view_outlined, color: Colors.grey),
          ),
          _verticalDivider(),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

Widget buildFooter() {
  return Container(
    color: Colors.blueGrey.shade900,
    padding: const EdgeInsets.all(20.0),
    child: const Column(
      children: [
        Text(
          "© 2024 Onest LMS. All rights reserved.",
          style: TextStyle(color: Colors.white70),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  "Pages",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("Organization", style: TextStyle(color: Colors.white70)),
                Text("Latest Courses", style: TextStyle(color: Colors.white70)),
                Text("Certificate Track",
                    style: TextStyle(color: Colors.white70)),
              ],
            ),
            Column(
              children: [
                Text(
                  "Custom Links",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("About Us", style: TextStyle(color: Colors.white70)),
                Text("Contact Us", style: TextStyle(color: Colors.white70)),
                Text("Privacy Policy", style: TextStyle(color: Colors.white70)),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

class ResponsiveAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const ResponsiveAppBar({super.key})
      : preferredSize = const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Responsive(
      // Mobile View
      mobile: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        toolbarHeight: screenWidth > 560 ? 60 : 30,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset(
            'assets/logo/Logo_g.png',
            width: 150,
          ),
        ),
        // title: IconButton(
        //   icon: const Icon(Icons.search, color: Colors.grey),
        //   onPressed: () {},
        // ),
        actions: [
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.favorite_outline), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),

      // Tablet View
      tablet: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leadingWidth: 150,
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Image.asset(
            'assets/logo/Logo_g.png',
            width: 120,
          ),
        ),
        title: SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Enter Title",
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.4)),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 10),
                child: Icon(
                  Icons.search,
                  size: 25,
                  color: Colors.grey.withOpacity(0.8),
                ),
              ),
            ),
            maxLines: 1,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Home",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Categories",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
          IconButton(
              icon: const Icon(Icons.favorite_outline), onPressed: () {}),
          gapW16,
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              child: const Text("Sign In")),
          gapW20,
        ],
      ),

      // Desktop View
      desktop: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leadingWidth: 250,
        toolbarHeight: 100,
        leading: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Image.asset(
            'assets/logo/Logo_g.png',
            width: 200,
          ),
        ),
        title: SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.35,
          // width: double.infinity,
          child: const TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: "Search ...",
              hintStyle: TextStyle(
                fontSize: 16,
                color: AppColors.textGrey,
              ),
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            maxLines: 1,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Home",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Categories",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Instructors",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textGrey,
                  fontWeight: FontWeight.w600),
            ),
          ),
          IconButton(
              icon: const Icon(Icons.wb_sunny_outlined), onPressed: () {}),
          SizedBox(
            width: 150,
            height: 45,
            child: DropdownButton<String>(
              underline: const SizedBox(),
              hint: const Text("English"),
              items: const [
                DropdownMenuItem(value: "1", child: Text("English")),
                DropdownMenuItem(value: "2", child: Text("Arabic")),
                DropdownMenuItem(value: "3", child: Text("Turkish")),
                DropdownMenuItem(value: "4", child: Text("Russian")),
              ],
              onChanged: (value) {},
            ),
          ),
          IconButton(
              icon: const Icon(Icons.shopping_cart_outlined), onPressed: () {}),
          gapW8,
          IconButton(
              icon: const Icon(Icons.favorite_outline), onPressed: () {}),
          gapW8,
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              },
              child: const Text("Sign In")),
          gapW(50),
        ],
      ),
    );
  }
}
