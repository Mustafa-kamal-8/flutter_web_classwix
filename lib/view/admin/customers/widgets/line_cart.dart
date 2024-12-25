import '../../../../shared/constants/defaults.dart';
import '../../../../theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatelessWidget {
  const LineChartSample({super.key, this.showMultiple = false});

  final bool showMultiple;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppDefaults.padding),
          child: AspectRatio(
            aspectRatio: 1.70,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDefaults.padding),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 1,
                    verticalInterval: 1,
                    getDrawingHorizontalLine: (value) {
                      return const FlLine(
                        color: AppColors.highlightLight,
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 42,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: AppColors.highlightLight),
                  ),
                  minX: 0,
                  maxX: 11,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 4),
                        const FlSpot(2.6, 3),
                        const FlSpot(4.9, 6),
                        const FlSpot(6.8, 4.1),
                        const FlSpot(8, 5),
                        const FlSpot(9.5, 4),
                        const FlSpot(11, 5),
                      ],
                      isCurved: true,
                      color: AppColors.primary,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    if (showMultiple) ...[
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 3),
                          const FlSpot(2.6, 2),
                          const FlSpot(4.9, 5),
                          const FlSpot(6.8, 3.1),
                          const FlSpot(8, 4),
                          const FlSpot(9.5, 3),
                          const FlSpot(11, 4),
                        ],
                        isCurved: true,
                        color: AppColors.secondaryMintGreen,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                      LineChartBarData(
                        spots: [
                          const FlSpot(0, 2),
                          const FlSpot(2.6, 1),
                          const FlSpot(4.9, 4),
                          const FlSpot(6.8, 2.1),
                          const FlSpot(8, 3),
                          const FlSpot(9.5, 2),
                          const FlSpot(11, 3),
                        ],
                        isCurved: true,
                        color: AppColors.secondaryBabyBlue,
                        barWidth: 3,
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: false),
                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 12,
      color: AppColors.textGrey,
    );
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 4:
        text = const Text('MAY', style: style);
        break;
      case 6:
        text = const Text('JUL', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      case 10:
        text = const Text('NOV', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 2:
        text = '700';
        break;
      case 4:
        text = '500';
        break;
      case 6:
        text = '300';
        break;
      case 8:
        text = '2000';
        break;
      case 10:
        text = '1700';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }
}
