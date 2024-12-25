import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../responsive.dart';
import '../../constants/config.dart';
import '../../constants/defaults.dart';
import '../../constants/ghaps.dart';
import 'menu_tile.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // width: Responsive.isMobile(context) ? double.infinity : null,
      // width: MediaQuery.of(context).size.width < 1300 ? 260 : null,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: SvgPicture.asset('assets/icons/close_filled.svg'),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding,
                    vertical: AppDefaults.padding * 1.5,
                  ),
                  // child: SvgPicture.asset(
                  //   AppConfig.logo,
                  //   width: 50,
                  // ),
                  child: Image.asset(
                    // "assets/logo/gayanavi_logo.jpg",
                    'assets/logo/Logo_g.png',
                    width: 200,
                  ),
                ),
              ],
            ),
            const Divider(),
            gapH16,
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                child: ListView(
                  children: [
                    //Home
                    MenuTile(
                      isActive: selectedIndex == 0,
                      title: "Dashboard",
                      activeIconSrc: "assets/icons/home_filled.svg",
                      inactiveIconSrc: "assets/icons/home_light.svg",
                      onPressed: () {
                        onChanged.call(0);
                      },
                    ),
                    // Products
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 1 ||
                          selectedIndex == 2 ||
                          selectedIndex == 3,
                      leading: SvgPicture.asset(
                        selectedIndex == 1 ||
                                selectedIndex == 2 ||
                                selectedIndex == 3
                            ? "assets/icons/User-tag-01.svg"
                            : "assets/icons/User-tag-01.svg",
                        height: 20,
                      ),
                      title: Text(
                        "Staffs",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 1,
                          isSubmenu: true,
                          title: "• Roles",
                          onPressed: () {
                            onChanged.call(1);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 2,
                          isSubmenu: true,
                          title: "• Users",
                          onPressed: () {
                            onChanged.call(2);
                          },
                        ),
                        // MenuTile(
                        //   isActive: selectedIndex == 3,
                        //   isSubmenu: true,
                        //   title: "Add Product",
                        //   onPressed: () {
                        //     onChanged.call(3);
                        //   },
                        // ),
                      ],
                    ),
                    // Classes

                    // Shop
                    // MenuTile(
                    //   isActive: selectedIndex == 3,
                    //   title: "AI Support",
                    //   activeIconSrc: "assets/icons/message-icon.svg",
                    //   inactiveIconSrc: "assets/icons/message-icon.svg",
                    //   onPressed: () {
                    //     onChanged.call(3);
                    //   },
                    // ),
                    MenuTile(
                      isActive: selectedIndex == 16,
                      title: "Workshop",
                      activeIconSrc: "assets/icons/message-icon.svg",
                      inactiveIconSrc: "assets/icons/message-icon.svg",
                      onPressed: () {
                        onChanged.call(16);
                      },
                    ),
                    ExpansionTile(
                      initiallyExpanded:
                          selectedIndex == 78 || selectedIndex == 79,
                      leading: SvgPicture.asset(
                        selectedIndex == 78 || selectedIndex == 79
                            ? "assets/icons/User-tag-01.svg"
                            : "assets/icons/User-tag-01.svg",
                        height: 20,
                      ),
                      title: Text(
                        "Classes",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 78,
                          isSubmenu: true,
                          title: "• Classes",
                          onPressed: () {
                            onChanged.call(78);
                          },
                        ),
                        // MenuTile(
                        //   isActive: selectedIndex == 79,
                        //   isSubmenu: true,
                        //   title: "• Create Class",
                        //   onPressed: () {
                        //     onChanged.call(79);
                        //   },
                        // ),
                        // MenuTile(
                        //   isActive: selectedIndex == 3,
                        //   isSubmenu: true,
                        //   title: "Add Product",
                        //   onPressed: () {
                        //     onChanged.call(3);
                        //   },
                        // ),
                      ],
                    ),

                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 3,
                      leading: SvgPicture.asset(
                        selectedIndex == 3
                            ? "assets/icons/User-tag-01.svg"
                            : "assets/icons/User-tag-01.svg",
                        height: 20,
                      ),
                      title: Text(
                        "Study Materials",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 3,
                          isSubmenu: true,
                          title: "• Study Material",
                          onPressed: () {
                            onChanged.call(3);
                          },
                        ),
                        // MenuTile(
                        //   isActive: selectedIndex == 79,
                        //   isSubmenu: true,
                        //   title: "• Create Class",
                        //   onPressed: () {
                        //     onChanged.call(79);
                        //   },
                        // ),
                        // MenuTile(
                        //   isActive: selectedIndex == 3,
                        //   isSubmenu: true,
                        //   title: "Add Product",
                        //   onPressed: () {
                        //     onChanged.call(3);
                        //   },
                        // ),
                      ],
                    ),

                    //VIDEOS
                    MenuTile(
                      isActive: selectedIndex == 80,
                      title: "Videos",
                      activeIconSrc: "assets/icons/message-icon.svg",
                      inactiveIconSrc: "assets/icons/message-icon.svg",
                      onPressed: () {
                        onChanged.call(80);
                      },
                    ),
                    // Income
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 81,
                      leading: SvgPicture.asset(
                        selectedIndex == 81
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Trails",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 81,
                          isSubmenu: true,
                          title: "• Trails",
                          onPressed: () {
                            onChanged.call(81);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded:
                          selectedIndex == 4 || selectedIndex == 5,
                      leading: SvgPicture.asset(
                        selectedIndex == 7 ||
                                selectedIndex == 5 ||
                                selectedIndex == 6 ||
                                selectedIndex == 7 ||
                                selectedIndex == 8 ||
                                selectedIndex == 9 ||
                                selectedIndex == 10
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Courses",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 4,
                          isSubmenu: true,
                          title: "• Categories List",
                          onPressed: () {
                            onChanged.call(4);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 5,
                          isSubmenu: true,
                          title: "• Courses List",
                          onPressed: () {
                            onChanged.call(5);
                          },
                        ),
                        // MenuTile(
                        //   isActive: selectedIndex == 9,
                        //   isSubmenu: true,
                        //   title: "Payouts",
                        //   onPressed: () {
                        //     onChanged.call(9);
                        //   },
                        // ),
                        // MenuTile(
                        //   isActive: selectedIndex == 10,
                        //   isSubmenu: true,
                        //   title: "Statements",
                        //   onPressed: () {
                        //     onChanged.call(10);
                        //   },
                        // ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 6,
                      leading: SvgPicture.asset(
                        selectedIndex == 7 ||
                                selectedIndex == 8 ||
                                selectedIndex == 9 ||
                                selectedIndex == 10
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Assignment",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 6,
                          isSubmenu: true,
                          title: "• Assignment List",
                          onPressed: () {
                            onChanged.call(6);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 7,
                      leading: SvgPicture.asset(
                        selectedIndex == 7 ||
                                selectedIndex == 8 ||
                                selectedIndex == 9 ||
                                selectedIndex == 10
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Quizees",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 7,
                          isSubmenu: true,
                          title: "• Quiz List",
                          onPressed: () {
                            onChanged.call(7);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 8,
                      leading: SvgPicture.asset(
                        selectedIndex == 7 ||
                                selectedIndex == 8 ||
                                selectedIndex == 9 ||
                                selectedIndex == 10
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Enrollment",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 7,
                          isSubmenu: true,
                          title: "• Enrollment List",
                          onPressed: () {
                            onChanged.call(8);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded:
                          selectedIndex == 9 || selectedIndex == 10,
                      leading: SvgPicture.asset(
                        selectedIndex == 7 ||
                                selectedIndex == 8 ||
                                selectedIndex == 9 ||
                                selectedIndex == 10
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Certificate",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 9,
                          isSubmenu: true,
                          title: "• Certificate List",
                          onPressed: () {
                            onChanged.call(9);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 10,
                          isSubmenu: true,
                          title: "• Certificate Template",
                          onPressed: () {
                            onChanged.call(10);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 11 ||
                          selectedIndex == 12 ||
                          selectedIndex == 13 ||
                          selectedIndex == 14,
                      leading: SvgPicture.asset(
                        selectedIndex == 11 ||
                                selectedIndex == 12 ||
                                selectedIndex == 13 ||
                                selectedIndex == 14
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Organization",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color.fromARGB(255, 255, 116, 52),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              child: Text(
                                "Addon",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 11,
                          isSubmenu: true,
                          title: "• Requested Organization",
                          onPressed: () {
                            onChanged.call(11);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 12,
                          isSubmenu: true,
                          title: "• Suspended Organization",
                          onPressed: () {
                            onChanged.call(12);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 13,
                          isSubmenu: true,
                          title: "• Organization List",
                          onPressed: () {
                            onChanged.call(13);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 14,
                          isSubmenu: true,
                          title: "• Create Organization",
                          onPressed: () {
                            onChanged.call(14);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 15 ||
                          selectedIndex == 17 ||
                          selectedIndex == 18 ||
                          selectedIndex == 19,
                      leading: SvgPicture.asset(
                        selectedIndex == 15
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Instructors",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 15,
                          isSubmenu: true,
                          title: "• Requested Instructor",
                          onPressed: () {
                            onChanged.call(15);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 17,
                          isSubmenu: true,
                          title: "• Assign Instructor",
                          // title: "• Suspended Instructor",
                          onPressed: () {
                            onChanged.call(17);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 18,
                          isSubmenu: true,
                          title: "• Instructor List",
                          onPressed: () {
                            onChanged.call(18);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 19,
                          isSubmenu: true,
                          title: "• Create Instructor",
                          onPressed: () {
                            onChanged.call(19);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 20,
                      leading: SvgPicture.asset(
                        selectedIndex == 20 ||
                                selectedIndex == 8 ||
                                selectedIndex == 9 ||
                                selectedIndex == 10
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Students",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 20,
                          isSubmenu: true,
                          title: "• Student List",
                          onPressed: () {
                            onChanged.call(20);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 21,
                      leading: SvgPicture.asset(
                        selectedIndex == 7 ||
                                selectedIndex == 8 ||
                                selectedIndex == 9 ||
                                selectedIndex == 10
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Reviews",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 21,
                          isSubmenu: true,
                          title: "• Reviews List",
                          onPressed: () {
                            onChanged.call(21);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 22 ||
                          selectedIndex == 23 ||
                          selectedIndex == 24 ||
                          selectedIndex == 25,
                      leading: SvgPicture.asset(
                        selectedIndex == 22 ||
                                selectedIndex == 23 ||
                                selectedIndex == 24 ||
                                selectedIndex == 25
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Payouts",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 22,
                          isSubmenu: true,
                          title: "• Requested Payout List",
                          onPressed: () {
                            onChanged.call(22);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 23,
                          isSubmenu: true,
                          title: "• Unpaid Payout List",
                          onPressed: () {
                            onChanged.call(23);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 24,
                          isSubmenu: true,
                          title: "• Rejected Payout List",
                          onPressed: () {
                            onChanged.call(24);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 25,
                          isSubmenu: true,
                          title: "• Payouts List",
                          onPressed: () {
                            onChanged.call(25);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 26 ||
                          selectedIndex == 27 ||
                          selectedIndex == 28 ||
                          selectedIndex == 29,
                      leading: SvgPicture.asset(
                        selectedIndex == 26 ||
                                selectedIndex == 27 ||
                                selectedIndex == 28 ||
                                selectedIndex == 29
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Offline Payment",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 26,
                          isSubmenu: true,
                          title: "• Setting",
                          onPressed: () {
                            onChanged.call(26);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 27,
                          isSubmenu: true,
                          title: "• Course",
                          onPressed: () {
                            onChanged.call(27);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 28,
                          isSubmenu: true,
                          title: "• Event",
                          onPressed: () {
                            onChanged.call(28);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 29,
                          isSubmenu: true,
                          title: "• package",
                          onPressed: () {
                            onChanged.call(29);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 30 ||
                          selectedIndex == 31 ||
                          selectedIndex == 32 ||
                          selectedIndex == 33,
                      leading: SvgPicture.asset(
                        selectedIndex == 30 ||
                                selectedIndex == 31 ||
                                selectedIndex == 32 ||
                                selectedIndex == 33
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Accounts",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 30,
                          isSubmenu: true,
                          title: "• Account List",
                          onPressed: () {
                            onChanged.call(30);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 31,
                          isSubmenu: true,
                          title: "• Income List",
                          onPressed: () {
                            onChanged.call(31);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 32,
                          isSubmenu: true,
                          title: "• Expense List",
                          onPressed: () {
                            onChanged.call(32);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 33,
                          isSubmenu: true,
                          title: "• Transaction List",
                          onPressed: () {
                            onChanged.call(33);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 34,
                      leading: SvgPicture.asset(
                        selectedIndex == 34
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Contacts",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 34,
                          isSubmenu: true,
                          title: "• Contacts",
                          onPressed: () {
                            onChanged.call(34);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded:
                          selectedIndex == 35 || selectedIndex == 36,
                      leading: SvgPicture.asset(
                        selectedIndex == 35 || selectedIndex == 36
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Marketing",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 35,
                          isSubmenu: true,
                          title: "• Features Course List",
                          onPressed: () {
                            onChanged.call(35);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 36,
                          isSubmenu: true,
                          title: "• Discount Course List",
                          onPressed: () {
                            onChanged.call(36);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 37 ||
                          selectedIndex == 38 ||
                          selectedIndex == 39 ||
                          selectedIndex == 41 ||
                          selectedIndex == 42 ||
                          selectedIndex == 43 ||
                          selectedIndex == 40,
                      leading: SvgPicture.asset(
                        selectedIndex == 37 ||
                                selectedIndex == 38 ||
                                selectedIndex == 39 ||
                                selectedIndex == 40 ||
                                selectedIndex == 41 ||
                                selectedIndex == 42 ||
                                selectedIndex == 43 ||
                                selectedIndex == 40
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Reports",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 37,
                          isSubmenu: true,
                          title: "• Student Engagement",
                          onPressed: () {
                            onChanged.call(37);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 38,
                          isSubmenu: true,
                          title: "• Instructor Engagement",
                          onPressed: () {
                            onChanged.call(38);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 39,
                          isSubmenu: true,
                          title: "• Purchase History",
                          onPressed: () {
                            onChanged.call(39);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 40,
                          isSubmenu: true,
                          title: "• Course Completion",
                          onPressed: () {
                            onChanged.call(40);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 41,
                          isSubmenu: true,
                          title: "• Student Performance",
                          onPressed: () {
                            onChanged.call(41);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 42,
                          isSubmenu: true,
                          title: "• Event Booking",
                          onPressed: () {
                            onChanged.call(42);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 43,
                          isSubmenu: true,
                          title: "• Transaction",
                          onPressed: () {
                            onChanged.call(43);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded:
                          selectedIndex == 44 || selectedIndex == 45,
                      leading: SvgPicture.asset(
                        selectedIndex == 44 || selectedIndex == 45
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Testimonials",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 44,
                          isSubmenu: true,
                          title: "• Testimonial List",
                          onPressed: () {
                            onChanged.call(44);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 45,
                          isSubmenu: true,
                          title: "• Create Testimonial",
                          onPressed: () {
                            onChanged.call(45);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded:
                          selectedIndex == 46 || selectedIndex == 47,
                      leading: SvgPicture.asset(
                        selectedIndex == 46 || selectedIndex == 47
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Blogs",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 46,
                          isSubmenu: true,
                          title: "• Blog Category",
                          onPressed: () {
                            onChanged.call(46);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 47,
                          isSubmenu: true,
                          title: "• Blog",
                          onPressed: () {
                            onChanged.call(47);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 48 ||
                          selectedIndex == 49 ||
                          selectedIndex == 51 ||
                          selectedIndex == 52 ||
                          selectedIndex == 53 ||
                          selectedIndex == 50,
                      leading: SvgPicture.asset(
                        selectedIndex == 48 ||
                                selectedIndex == 49 ||
                                selectedIndex == 51 ||
                                selectedIndex == 52 ||
                                selectedIndex == 53 ||
                                selectedIndex == 50
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Row(
                        children: [
                          Text(
                            "Subscription",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color.fromARGB(255, 255, 116, 52),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              child: Text(
                                "Addon",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 48,
                          isSubmenu: true,
                          title: "• Requested Course",
                          onPressed: () {
                            onChanged.call(48);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 49,
                          isSubmenu: true,
                          title: "• Approved Course",
                          onPressed: () {
                            onChanged.call(49);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 50,
                          isSubmenu: true,
                          title: "• Rejected Course",
                          onPressed: () {
                            onChanged.call(50);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 51,
                          isSubmenu: true,
                          title: "• Package Duration Type",
                          onPressed: () {
                            onChanged.call(51);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 52,
                          isSubmenu: true,
                          title: "• Package List",
                          onPressed: () {
                            onChanged.call(52);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 53,
                          isSubmenu: true,
                          title: "• Package Purchase List",
                          onPressed: () {
                            onChanged.call(53);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 54 ||
                          selectedIndex == 55 ||
                          selectedIndex == 56 ||
                          selectedIndex == 58 ||
                          selectedIndex == 57,
                      leading: SvgPicture.asset(
                        selectedIndex == 54 ||
                                selectedIndex == 55 ||
                                selectedIndex == 56 ||
                                selectedIndex == 58 ||
                                selectedIndex == 57
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Row(
                        children: [
                          Text(
                            "Event",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Color.fromARGB(255, 255, 116, 52),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 2,
                              ),
                              child: Text(
                                "Addon",
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 54,
                          isSubmenu: true,
                          title: "• Requested Events",
                          onPressed: () {
                            onChanged.call(54);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 55,
                          isSubmenu: true,
                          title: "• Approved Events",
                          onPressed: () {
                            onChanged.call(55);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 56,
                          isSubmenu: true,
                          title: "• Rejected Event",
                          onPressed: () {
                            onChanged.call(56);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 57,
                          isSubmenu: true,
                          title: "• Event Category",
                          onPressed: () {
                            onChanged.call(57);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 58,
                          isSubmenu: true,
                          title: "• Sale Events",
                          onPressed: () {
                            onChanged.call(58);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 59 ||
                          selectedIndex == 60 ||
                          selectedIndex == 61 ||
                          selectedIndex == 62 ||
                          selectedIndex == 63 ||
                          selectedIndex == 64 ||
                          selectedIndex == 65,
                      leading: SvgPicture.asset(
                        selectedIndex == 59 ||
                                selectedIndex == 60 ||
                                selectedIndex == 61 ||
                                selectedIndex == 62 ||
                                selectedIndex == 63 ||
                                selectedIndex == 64 ||
                                selectedIndex == 65
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Website Setup",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 59,
                          isSubmenu: true,
                          title: "• Slider",
                          onPressed: () {
                            onChanged.call(59);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 60,
                          isSubmenu: true,
                          title: "• Popular Categories",
                          onPressed: () {
                            onChanged.call(60);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 61,
                          isSubmenu: true,
                          title: "• Brand",
                          onPressed: () {
                            onChanged.call(61);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 62,
                          isSubmenu: true,
                          title: "• Page",
                          onPressed: () {
                            onChanged.call(62);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 63,
                          isSubmenu: true,
                          title: "• Image Gallery",
                          onPressed: () {
                            onChanged.call(63);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 64,
                          isSubmenu: true,
                          title: "• Footer Menu",
                          onPressed: () {
                            onChanged.call(64);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 65,
                          isSubmenu: true,
                          title: "• Payment Method",
                          onPressed: () {
                            onChanged.call(65);
                          },
                        ),
                      ],
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 66 ||
                          selectedIndex == 67 ||
                          selectedIndex == 68,
                      leading: SvgPicture.asset(
                        selectedIndex == 66 ||
                                selectedIndex == 67 ||
                                selectedIndex == 68
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Profile",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 66,
                          isSubmenu: true,
                          title: "• My Profile",
                          onPressed: () {
                            onChanged.call(66);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 67,
                          isSubmenu: true,
                          title: "• Edit My Profile",
                          onPressed: () {
                            onChanged.call(67);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 68,
                          isSubmenu: true,
                          title: "• Update Password",
                          onPressed: () {
                            onChanged.call(68);
                          },
                        ),
                      ],
                    ),
                    MenuTile(
                      isActive: selectedIndex == 69,
                      title: "Language",
                      activeIconSrc: "assets/icons/promotion_filled.svg",
                      inactiveIconSrc: "assets/icons/promotion_light.svg",
                      onPressed: () {
                        onChanged.call(69);
                      },
                    ),
                    MenuTile(
                      isActive: selectedIndex == 70,
                      title: "Addons",
                      activeIconSrc: "assets/icons/promotion_filled.svg",
                      inactiveIconSrc: "assets/icons/promotion_light.svg",
                      onPressed: () {
                        onChanged.call(70);
                      },
                    ),
                    ExpansionTile(
                      initiallyExpanded: selectedIndex == 71 ||
                          selectedIndex == 72 ||
                          selectedIndex == 73 ||
                          selectedIndex == 74 ||
                          selectedIndex == 75 ||
                          selectedIndex == 76 ||
                          selectedIndex == 77,
                      leading: SvgPicture.asset(
                        selectedIndex == 71 ||
                                selectedIndex == 72 ||
                                selectedIndex == 73 ||
                                selectedIndex == 74 ||
                                selectedIndex == 75 ||
                                selectedIndex == 76 ||
                                selectedIndex == 77
                            ? "assets/icons/pie_chart_filled.svg"
                            : "assets/icons/pie_chart_light.svg",
                      ),
                      title: Text(
                        "Settings",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      children: [
                        MenuTile(
                          isActive: selectedIndex == 71,
                          isSubmenu: true,
                          title: "• General Setting",
                          onPressed: () {
                            onChanged.call(71);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 72,
                          isSubmenu: true,
                          title: "• Seo Setting",
                          onPressed: () {
                            onChanged.call(72);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 73,
                          isSubmenu: true,
                          title: "• Twillio Settings",
                          onPressed: () {
                            onChanged.call(73);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 74,
                          isSubmenu: true,
                          title: "• Home Section",
                          onPressed: () {
                            onChanged.call(74);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 75,
                          isSubmenu: true,
                          title: "• App Home Section",
                          onPressed: () {
                            onChanged.call(75);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 76,
                          isSubmenu: true,
                          title: "• Storage Settings",
                          onPressed: () {
                            onChanged.call(76);
                          },
                        ),
                        MenuTile(
                          isActive: selectedIndex == 77,
                          isSubmenu: true,
                          title: "• Email Settings",
                          onPressed: () {
                            onChanged.call(77);
                          },
                        ),
                      ],
                    ),

                    // 80used start from 81 index
                    // MenuTile(
                    //   isActive: selectedIndex == 11,
                    //   title: "Promote",
                    //   activeIconSrc: "assets/icons/promotion_filled.svg",
                    //   inactiveIconSrc: "assets/icons/promotion_light.svg",
                    //   onPressed: () {
                    //     onChanged.call(11);
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(AppDefaults.padding),
            //   child: Column(
            //     children: [
            //       if (Responsive.isMobile(context))
            //         const CustomerInfo(
            //           name: 'Tran Mau Tri Tam',
            //           designation: 'Visual Designer',
            //           imageSrc:
            //               'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
            //         ),
            //       gapH8,
            //       const Divider(),
            //       gapH8,
            //       Row(
            //         children: [
            //           SvgPicture.asset(
            //             'assets/icons/help_light.svg',
            //             height: 24,
            //             width: 24,
            //             colorFilter: const ColorFilter.mode(
            //               AppColors.textLight,
            //               BlendMode.srcIn,
            //             ),
            //           ),
            //           gapW8,
            //           Text(
            //             'Help & getting started',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .labelMedium
            //                 ?.copyWith(fontWeight: FontWeight.w600),
            //           ),
            //           const Spacer(),
            //           Chip(
            //             backgroundColor: AppColors.secondaryLavender,
            //             side: BorderSide.none,
            //             padding: const EdgeInsets.symmetric(horizontal: 0.5),
            //             label: Text(
            //               "8",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .labelMedium!
            //                   .copyWith(fontWeight: FontWeight.w700),
            //             ),
            //           ),
            //         ],
            //       ),
            //       gapH20,
            //       const ThemeTabs(),
            //       gapH8,
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
