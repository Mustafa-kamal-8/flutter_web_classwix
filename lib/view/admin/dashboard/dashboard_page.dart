import 'package:core_dashboard/bloc/bloc/instructor_bloc.dart';
import 'package:core_dashboard/provider/certificate_provider.dart';
import 'package:core_dashboard/provider/course_provider.dart';
import 'package:core_dashboard/provider/users_provider.dart';
import 'package:core_dashboard/shared/constants/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../responsive.dart';
import '../../../shared/constants/ghaps.dart';
import 'widgets/product_overview.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    context.read<UserProvider>().getUsers();
    context.read<CourseProvider>().getCourses();
    context.read<InstructorBloc>().add(GetInstructorEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // Added scrolling for mobile screens
      child: Padding(
        // Added padding for better structure
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!Responsive.isMobile(context)) gapH24,
            Text(
              "Hello, Admin",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                    color: Colors.black,
                  ),
            ),
            gapH20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Repeated widgets can be optimized into a method
                Consumer<UserProvider>(
                  builder: (context, value, _) {
                    return _buildStatsCard(
                      title: "Total Student",
                      value: value.userModel?.users.length.toString() ?? '0',
                      icon: Icons.groups_outlined,
                      iconColor: Colors.green,
                      backgroundColor: Colors.green.withOpacity(0.09),
                    );
                  },
                ),
                Consumer<UserProvider>(
                  builder: (context, value, _) {
                    return _buildStatsCard(
                      title: "Total Student",
                      value: value.userModel?.users.length.toString() ?? '0',
                      icon: Icons.groups_outlined,
                      iconColor: Colors.amber,
                      backgroundColor: Colors.yellow.withOpacity(0.15),
                    );
                  },
                ),
                Consumer<UserProvider>(
                  builder: (context, value, _) {
                    return _buildStatsCard(
                      title: "Total Student",
                      value: value.userModel?.users.length.toString() ?? '0',
                      icon: Icons.auto_stories_outlined,
                      iconColor: Colors.blue,
                      backgroundColor: Colors.blue.withOpacity(0.1),
                    );
                  },
                ),
                Consumer<UserProvider>(
                  builder: (context, value, _) {
                    return _buildStatsCard(
                      title: "Total Student",
                      value: value.userModel?.users.length.toString() ?? '0',
                      icon: Icons.auto_graph_sharp,
                      iconColor: Colors.red,
                      backgroundColor: Colors.red.withOpacity(0.09),
                    );
                  },
                ),
              ],
            ),
            gapH20,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      gapH16,
                      const DashboardProductOverviews(),
                      gapH16,
                      const DashboardSales(),
                      gapH16,
                      _topCourses(context),
                      gapH16,
                      _topFiveStudentsAndInstructor(context),
                      gapH16,
                      BottomTextDesign(),
                      // const GetMoreCustomers(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _topFiveStudentsAndInstructor(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          height: 400,
          width: MediaQuery.of(context).size.width * 0.37,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  "Top Five Students",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: Responsive.isDesktop(context) ? null : 20,
                      ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 100, 0),
                  child: Row(
                    children: [
                      // Use Expanded for equal width columns
                      Expanded(
                        child: Text("ID", textAlign: TextAlign.start),
                      ),
                      Expanded(
                        child: Text("NAME", textAlign: TextAlign.start),
                      ),
                      Expanded(
                        child: Text("EMAIL", textAlign: TextAlign.center),
                      ),
                      Expanded(
                        child: Text("PHONE", textAlign: TextAlign.end),
                      ),
                    ],
                  ),
                ),
                gapH4,
                const Divider(),
                Consumer<UserProvider>(
                  builder: (context, value, _) {
                    return Expanded(
                      // height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: value.userModel?.users.length ?? 0,
                        itemBuilder: (context, index) {
                          final students = value.userModel?.users[index];
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 10, 100, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    students?.id.toString() ?? "",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    students?.name ?? "",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    customMask(students?.email ?? "", 2, 4),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    customMask(students?.phone ?? "", 2, 2),
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                gapH16,
                const Divider(),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          height: 400,
          width: MediaQuery.of(context).size.width * 0.37,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  "Top Five Instructors",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: Responsive.isDesktop(context) ? null : 20,
                      ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 30, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("ID"),
                      Text("NAME"),
                      Text("COURSES"),
                      Text("SALES"),
                      Text("STATUS"),
                    ],
                  ),
                ),
                gapH4,
                const Divider(),
                BlocBuilder<InstructorBloc, InstructorState>(
                  builder: (context, state) {
                    if (state is GetInstructorSuccess) {
                      final instructors = state.responseData.instructors;

                      // Check if the instructors list is empty and show NoDataWidget if it is
                      if (instructors.isEmpty) {
                        return const NoDataWidget();
                      }

                      return Expanded(
                        child: ListView.builder(
                          itemCount: instructors.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(10, 5, 60, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(instructors[index]
                                      .id
                                      .toString()), // Display instructor ID
                                  Text(instructors[index]
                                      .user
                                      .name), // Display instructor name
                                  Text(instructors[index]
                                      .course
                                      .title), // Display course title
                                  Text(instructors[index]
                                      .course
                                      .totalSales
                                      .toString()), // Display total sales
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.green[50],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        instructors[index].course.statusId == 0
                                            ? "Active"
                                            : "Inactive", // Check course statusId and display active/inactive
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: const Color.fromARGB(
                                                  255, 53, 186, 57),
                                              fontSize: 12,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return const NoDataWidget();
                  },
                ),
                // Center(
                //   child: Column(
                //     children: [
                //       Center(
                //         child: Padding(
                //           padding: const EdgeInsets.only(
                //               top: 50.0),
                //           child: Image.asset(
                //             "assets/logo/no-data.png",
                //             width: 110,
                //           ),
                //         ),
                //       ),
                //       const SizedBox(height: 8),
                //       Text(
                //         "Please add a new entity or manage the data table to see the content here",
                //         style: Theme.of(context)
                //             .textTheme
                //             .headlineLarge!
                //             .copyWith(
                //               fontSize: 12,
                //               color: Colors.black,
                //             ),
                //       ),
                //       gapH24,
                //     ],
                //   ),
                // ),
                gapH16,
                const Divider(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _topCourses(BuildContext context) {
    return Consumer<CourseProvider>(
      builder: (context, value, child) {
        // Calculate the width percentage for responsiveness
        double containerWidth = MediaQuery.of(context).size.width;

        return Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          children: [
            // Container for Top Courses
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              height: 400,
              width: containerWidth > 1200
                  ? containerWidth * 0.43 // Desktop
                  : containerWidth > 800
                      ? containerWidth * 0.6 // Tablet
                      : containerWidth, // Mobile
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(
                      "Top Courses",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: Responsive.isDesktop(context) ? null : 20,
                          ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(10, 30, 100, 0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("ID", textAlign: TextAlign.start),
                          ),
                          Expanded(
                            child: Text("NAME", textAlign: TextAlign.start),
                          ),
                          Expanded(
                            child: Text("COURSE CATEGORY",
                                textAlign: TextAlign.start),
                          ),
                          Expanded(
                            child: Text("SALES", textAlign: TextAlign.end),
                          ),
                        ],
                      ),
                    ),
                    gapH4,
                    const Divider(),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        itemCount: value.courseResponse?.courses.length ?? 0,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "${value.courseResponse?.courses[index].id.toString()}",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    value.courseResponse?.courses[index]
                                            .title ??
                                        "",
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    value.courseResponse?.courses[index]
                                            .category.title ??
                                        "",
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "      ${value.courseResponse?.courses[index].totalSales.toString()}" ??
                                        "",
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    gapH16,
                    const Divider(),
                  ],
                ),
              ),
            ),

            // Container for Summary
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                height: 400,
                width: containerWidth > 1200
                    ? containerWidth * 0.3 // Desktop
                    : containerWidth > 800
                        ? containerWidth * 0.4 // Tablet
                        : containerWidth, // Mobile
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 18, 50, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Summary",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize:
                                  Responsive.isDesktop(context) ? null : 20,
                            ),
                      ),
                      gapH24,
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: summary.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                width: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue[50]),
                                child: Padding(
                                  padding: const EdgeInsets.all(2),
                                  child: Icon(
                                    index == 0
                                        ? Icons.group
                                        : index == 1
                                            ? Icons.person_2_outlined
                                            : Icons.book_outlined,
                                    size: 20,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              title: Text(
                                summary[index]['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: Responsive.isDesktop(context)
                                          ? 14
                                          : 20,
                                    ),
                              ),
                              trailing: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: Colors.green[50]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 3),
                                  child: Text(
                                    _getStatValue(index),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.green,
                                          fontSize: 10,
                                        ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  String _getStatValue(int index) {
    switch (index) {
      case 0:
        // Get the number of users
        return context
                .read<UserProvider>()
                .userModel
                ?.users
                .length
                .toString() ??
            "0";
      case 1:
        // Get the number of instructors
        return context.read<InstructorBloc>().state.props.length.toString();
      case 2:
        // Get the number of courses
        return context
                .read<CourseProvider>()
                .courseResponse
                ?.courses
                .length
                .toString() ??
            "0";
      case 3:
        // Get the total sales for the first course
        return context
                .read<CourseProvider>()
                .courseResponse
                ?.courses[index]
                .totalSales
                .toString() ??
            "0";
      case 4:
        // Get the total sales for another course (adjust as necessary)
        return context
                .read<CourseProvider>()
                .courseResponse
                ?.courses[index]
                .totalSales
                .toString() ??
            "0";

      case 5:
        return context
                .read<CertificateProvider>()
                .getCertificateResponse
                ?.length
                .toString() ??
            "0";

      default:
        return "0"; // Default case if no match
    }
  }

  Widget _buildStatsCard({
    required String title,
    required String value,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Set the width based on screen size
        double cardWidth = constraints.maxWidth > 1200
            ? 280 // Desktop
            : constraints.maxWidth > 800
                ? 240 // Tablet
                : constraints.maxWidth *
                    0.9; // Mobile (taking 90% of screen width)

        return Container(
          height: 100,
          width: cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(width: 25),
              CircleAvatar(
                backgroundColor: backgroundColor,
                minRadius: 25,
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

List<FlSpot> getIncomeData() {
  return const [
    FlSpot(0, 1),
    FlSpot(1, 1.5),
    FlSpot(2, 1.4),
    FlSpot(3, 3.4),
    FlSpot(4, 2),
    FlSpot(5, 2.2),
    FlSpot(6, 1.8),
    FlSpot(7, 2.8),
    FlSpot(8, 2.6),
    FlSpot(9, 3.9),
    FlSpot(10, 3),
    FlSpot(11, 4),
  ];
}

List<FlSpot> getExpenseData() {
  return const [
    FlSpot(0, 1.3),
    FlSpot(1, 2.3),
    FlSpot(2, 2.1),
    FlSpot(3, 1.4),
    FlSpot(4, 3.4),
    FlSpot(5, 2),
    FlSpot(6, 3),
    FlSpot(7, 2.6),
    FlSpot(8, 2.4),
    FlSpot(9, 2.9),
    FlSpot(10, 1.8),
    FlSpot(11, 2.4),
  ];
}

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  Widget text;
  switch (value.toInt()) {
    case 0:
      text = const Text('Jan', style: style);
      break;
    case 1:
      text = const Text('Feb', style: style);
      break;
    case 2:
      text = const Text('Mar', style: style);
      break;
    case 3:
      text = const Text('Apr', style: style);
      break;
    case 4:
      text = const Text('May', style: style);
      break;
    case 5:
      text = const Text('Jun', style: style);
      break;
    case 6:
      text = const Text('Jul', style: style);
      break;
    case 7:
      text = const Text('Aug', style: style);
      break;
    case 8:
      text = const Text('Sep', style: style);
      break;
    case 9:
      text = const Text('Oct', style: style);
      break;
    case 10:
      text = const Text('Nov', style: style);
      break;
    case 11:
      text = const Text('Dec', style: style);
      break;
    default:
      text = const Text('jsn', style: style);
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({Key? key, required this.color, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

List<Map<String, dynamic>> summary = [
  {"title": "Total Student"},
  {"title": "Total Instructor"},
  {"title": "Total Active Course"},
  // {"title": "Total Active Course"},
  // {"title": "Total Pending Course"},
  // {"title": "Featured Course"},
  // {"title": "Discount Course"},
  {"title": "Total Sales"},
  {"title": "Certificates"},
  {"title": "Pending Payout"},
  {"title": "Income"},
  {"title": "Expense"},
];
