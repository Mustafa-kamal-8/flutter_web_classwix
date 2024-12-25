// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:core_dashboard/shared/models/product_view_model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../theme/app_colors.dart';

List<ProductViewModel> productViewDummyData = [
  const ProductViewModel(
      x: "January", y: 27, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(
      x: "February", y: 21, barColor: AppColors.secondaryPeach),
  const ProductViewModel(
      x: "March", y: 30, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(x: "April", y: 19, barColor: AppColors.secondaryPeach),
  const ProductViewModel(
      x: "May", y: 27, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(x: "June", y: 15, barColor: AppColors.secondaryPeach),
  const ProductViewModel(
      x: "July", y: 23, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(
      x: "August", y: 29, barColor: AppColors.secondaryPeach),
  const ProductViewModel(
      x: "September", y: 18, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(
      x: "October", y: 25, barColor: AppColors.secondaryPeach),
  const ProductViewModel(
      x: "November", y: 20, barColor: AppColors.secondaryMintGreen),
  const ProductViewModel(
      x: "December", y: 22, barColor: AppColors.secondaryPeach),
];

class DashboardProductOverviews extends StatefulWidget {
  const DashboardProductOverviews({super.key});

  @override
  State<DashboardProductOverviews> createState() =>
      _DashboardProductOverviewsState();
}

class _DashboardProductOverviewsState extends State<DashboardProductOverviews> {
  bool isIncome = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius:
            BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row(
          //   children: [
          //     SectionTitle(
          //       title: "Revenue",
          //       color: Colors.black,
          //     ),
          //   ],
          // ),
          Text(
            "Revenue",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: Responsive.isDesktop(context) ? null : 20,
                ),
          ),
          gapH24,
          BarChartSample8(
            isIncome: isIncome,
          ),
          gapH20,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    isIncome = true;
                  });
                },
                label: Text(
                  "Income",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: isIncome ? Colors.black : Colors.black38,
                        fontSize: Responsive.isDesktop(context) ? 15 : 20,
                      ),
                ),
                icon: isIncome
                    ? Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                          color: Colors.cyan.withOpacity(0.7),
                        ),
                      )
                    : const SizedBox(),
              ),
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    isIncome = false;
                  });
                },
                label: Text(
                  "Expense",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: isIncome ? Colors.black38 : Colors.black,
                        fontSize: Responsive.isDesktop(context) ? 15 : 20,
                      ),
                ),
                icon: isIncome
                    ? const SizedBox()
                    : Container(
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(3)),
                          color: Colors.cyan.withOpacity(0.7),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DashboardSales extends StatefulWidget {
  const DashboardSales({super.key});

  @override
  State<DashboardSales> createState() => _DashboardSalesState();
}

class _DashboardSalesState extends State<DashboardSales> {
  bool isIncome = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius:
            BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sales",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: Responsive.isDesktop(context) ? null : 20,
                ),
          ),
          gapH24,
          BarChartSample8(
            isIncome: isIncome,
          ),
          gapH20,
        ],
      ),
    );
  }
}

class BarChartSample8 extends StatefulWidget {
  bool? isIncome;
  BarChartSample8({
    super.key,
    this.isIncome,
  });

  final Color barBackgroundColor = AppColors.bgSecondayLight;

  @override
  State<StatefulWidget> createState() => BarChartSample8State();
}

class BarChartSample8State extends State<BarChartSample8> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: BarChart(
              randomData(),
              swapAnimationDuration: const Duration(milliseconds: 250),
            ),
          ),
        ],
      ),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y,
    Color color, {
    bool isTouched = false,
  }) {
    return BarChartGroupData(
      x: x,
      // barRods: [
      //   BarChartRodData(
      //     toY: y,
      //     color: isTouched ? AppColors.primary : color,
      //     borderRadius: BorderRadius.circular(2),
      //     width: 20, // Adjust the width as per your design
      //     borderSide: BorderSide(
      //       color: isTouched ? AppColors.primary : color,
      //       width: 2.0,
      //     ),
      //   ),
      // ],
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    );

    // Mapping the values to month names
    List<String> months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    Widget text = widget.isIncome == true
        ? Text(
            months[value.toInt()],
            style: style,
          )
        : const SizedBox();

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }

  // BarChartData randomData() {
  //   return BarChartData(
  //     maxY: 40.0,
  //     barTouchData: BarTouchData(
  //       enabled: true,
  //       touchCallback: (FlTouchEvent event, barTouchResponse) {
  //         setState(() {
  //           if (!event.isInterestedForInteractions ||
  //               barTouchResponse == null ||
  //               barTouchResponse.spot == null) {
  //             touchedIndex = -1;
  //             return;
  //           }
  //           touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
  //         });
  //       },
  //       touchTooltipData: BarTouchTooltipData(
  //         direction: TooltipDirection.auto,
  //         getTooltipItem: (group, groupIndex, rod, rodIndex) {
  //           return BarTooltipItem(
  //             rod.toY.toString(),
  //             const TextStyle(color: Colors.white),
  //           );
  //         },
  //       ),
  //     ),
  //     titlesData: FlTitlesData(
  //       show: true,
  //       bottomTitles: AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: true,
  //           getTitlesWidget: getTitles,
  //           reservedSize: 38,
  //         ),
  //       ),
  //       leftTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           reservedSize: 38,
  //           showTitles: true,
  //         ),
  //       ),
  //       topTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //       rightTitles: const AxisTitles(
  //         sideTitles: SideTitles(
  //           showTitles: false,
  //         ),
  //       ),
  //     ),
  //     borderData: FlBorderData(
  //       show: false,
  //     ),
  //     barGroups: List.generate(
  //       productViewDummyData.length,
  //       (index) => makeGroupData(
  //         index, // Mapping months to index
  //         productViewDummyData[index].y,
  //         productViewDummyData[index].barColor,
  //         isTouched: touchedIndex == index,
  //       ),
  //     ),
  //     gridData: const FlGridData(
  //         show: true, drawVerticalLine: false, drawHorizontalLine: true),
  //   );
  // }
  BarChartData randomData() {
    return BarChartData(
      maxY: 40.0,
      barTouchData: BarTouchData(
        enabled: true,
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
        touchTooltipData: BarTouchTooltipData(
          direction: TooltipDirection.auto,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            return BarTooltipItem(
              rod.toY.toString(),
              const TextStyle(color: Colors.white),
            );
          },
        ),
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            reservedSize: 38,
            showTitles: true,
          ),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(
        productViewDummyData.length,
        (index) => makeGroupData(
          index, // Mapping months to index
          productViewDummyData[index].y,
          productViewDummyData[index].barColor,
          isTouched: touchedIndex == index,
        ),
      ),
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: true,
        horizontalInterval: 5, // Set an interval for the horizontal lines
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.grey,
            strokeWidth: 1,
            dashArray: null,
          );
        },
      ),
    );
  }
}
