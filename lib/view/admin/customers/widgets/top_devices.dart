import 'pie_chart_top_devices.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class TopDevices extends StatelessWidget {
  const TopDevices({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius:
            BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
            title: "Top Devices",
            color: AppColors.secondaryBabyBlue,
          ),
          gapH16,
          PieChartTopDevices(),
        ],
      ),
    );
  }
}
