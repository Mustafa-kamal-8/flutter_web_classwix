import '../../../../shared/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../shared/constants/ghaps.dart';
import '../../../../theme/app_colors.dart';

class TopCountry extends StatelessWidget {
  const TopCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: "Top Country",
            color: AppColors.secondaryLavender,
          ),
          gapH24,
          HorizontalChart(),
        ],
      ),
    );
  }
}

class HorizontalChart extends StatelessWidget {
  const HorizontalChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: SfCartesianChart(
        tooltipBehavior: TooltipBehavior(enable: true),
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          minimum: 0,
          maximum: 40,
          interval: 10,
        ),
        borderWidth: 0,
        borderColor: Colors.transparent,
        plotAreaBorderWidth: 0,
        plotAreaBorderColor: Colors.transparent,
        margin: EdgeInsets.zero,
        series: <CartesianSeries<_ChartData, String>>[
          BarSeries<_ChartData, String>(
            enableTooltip: true,
            dataSource: data,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            name: 'Top Country',
            color: AppColors.secondaryMintGreen,
          )
        ],
      ),
    );
  }
}

final data = [
  _ChartData('Vietnam', 12),
  _ChartData('United State', 15),
  _ChartData('Indonesia', 30),
  _ChartData('Hongkong', 6.4),
  _ChartData('Russia', 14),
  _ChartData('Ukraine', 20),
];

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
