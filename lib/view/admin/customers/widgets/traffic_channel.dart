import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import '../../dashboard/widgets/product_overview.dart';

class TrafficChannel extends StatelessWidget {
  const TrafficChannel({super.key});

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
          Row(
            children: [
              const SectionTitle(
                title: "Traffic Channel",
                color: AppColors.secondaryLavender,
              ),
              const Spacer(),
              if (!Responsive.isMobile(context))
                DropdownMenu(
                  controller: TextEditingController(text: "This Week"),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(value: "Today", label: "Today"),
                    DropdownMenuEntry(value: "This Week", label: "This Week"),
                    DropdownMenuEntry(value: "This Month", label: "This month"),
                  ],
                ),
            ],
          ),
          gapH24,
          BarChartSample8(),
        ],
      ),
    );
  }
}
