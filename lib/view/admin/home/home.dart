import 'package:core_dashboard/view/admin/authentication/sign_in_page.dart';
import 'package:core_dashboard/view/admin/home/become_instructor.dart';
import 'package:core_dashboard/view/admin/home/blogs.dart';
import 'package:core_dashboard/view/admin/home/home_courses.dart';
import 'package:core_dashboard/responsive.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:core_dashboard/shared/constants/ghaps.dart';
import 'package:core_dashboard/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ResponsiveAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              color: const Color(0XFFfbfaf7),
            ),
            _buildCourses(false, 'Featured Courses', true, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, "See All"),
            _buildCourses(true, 'Latest Courses', true, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, "See All"),
            _buildCourses(false, 'Best Rated Courses', true, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, "See All"),
            _buildCourses(true, "Most Popular Courses", true, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, "See All"),
            _buildCourses(false, "Discount Courses", true, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, "See All"),
            _buildCourses(false, "Events", true, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, "See All"),
            Container(
              color: const Color(0XFFfbfaf7),
              child: Row(
                children: [
                  gapW(150),
                  Image.asset(
                    "assets/images/illustration/become_instructor.png",
                    height: 500,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Become an instructor",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      gapH(12),
                      const Text(
                        "become instructor",
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: AppColors.textGrey,
                        ),
                      ),
                      gapH(12),
                      MouseRegion(
                        onEnter: (_) => _setHover(true),
                        onExit: (_) => _setHover(false),
                        child: SizedBox(
                          height: 45,
                          child: TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BecomeInstructorScreen(),
                                ),
                              );
                            },
                            icon: Text(
                              "Register Here",
                              style: TextStyle(
                                color:
                                    _isHovered ? Colors.orange : Colors.white,
                              ),
                            ),
                            label: Icon(
                              Icons.arrow_forward,
                              size: 17,
                              color: _isHovered ? Colors.orange : Colors.white,
                            ),
                            style: ButtonStyle(
                              shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              side: WidgetStatePropertyAll(BorderSide(
                                color:
                                    _isHovered ? Colors.orange : Colors.orange,
                              )),
                              backgroundColor: WidgetStatePropertyAll(
                                  _isHovered ? Colors.white : Colors.orange),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            _buildCourses(false, "Testimonials", false, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, ""),
            _buildCourses(true, "Our Recent Blogs", true, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BlogsScreen(),
                ),
              );
            }, "See All Blogs"),
            _buildCourses(false, "Trusted By Thousands", false, () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeCoursesPage(),
                ),
              );
            }, ""),
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

  bool _isHovered = false;

  void _setHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  Container _buildCourses(
    bool color,
    final String title,
    bool isBtn,
    VoidCallback onTap,
    final String seeAll,
  ) {
    return Container(
      width: double.infinity,
      color: color ? const Color(0XFFfbfaf7) : Colors.white,
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double horizontalPadding =
                constraints.maxWidth > 600 ? 150.0 : 20.0;
            double titleFontSize = constraints.maxWidth > 600 ? 28.0 : 20.0;
            double buttonFontSize = constraints.maxWidth > 600 ? 16.0 : 14.0;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: SizedBox(
                width: double.infinity,
                height: 250,
                child: Row(
                  mainAxisAlignment: isBtn
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: isBtn == false
                          ? Center(
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: titleFontSize,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow
                                    .ellipsis, // Avoid overflow in small screens
                              ),
                            )
                          : Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: titleFontSize,
                                color: Colors.black,
                              ),
                              overflow: TextOverflow
                                  .ellipsis, // Avoid overflow in small screens
                            ),
                    ),
                    if (isBtn)
                      ElevatedButton(
                        onPressed: onTap,
                        child: Text(
                          isBtn ? seeAll : "",
                          style: TextStyle(
                            fontSize: buttonFontSize,
                            color: Colors.white,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
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
                  Text("Latest Courses",
                      style: TextStyle(color: Colors.white70)),
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
                  Text("Privacy Policy",
                      style: TextStyle(color: Colors.white70)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
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
