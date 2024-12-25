import '../../../../responsive.dart';
import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import 'line_cart.dart';

class ActiveCustomers extends StatelessWidget {
  const ActiveCustomers({super.key});

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
                title: "Active Customers",
                color: AppColors.secondaryBabyBlue,
              ),
              const Spacer(),
              if (!Responsive.isMobile(context))
                DropdownMenu(
                  controller: TextEditingController(text: "Last 28 days"),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                        value: "Last 7 days", label: "Last 7 days"),
                    DropdownMenuEntry(
                        value: "Last 28 days", label: "Last 28 days"),
                    DropdownMenuEntry(value: "All time", label: "All time"),
                  ],
                ),
            ],
          ),
          gapH16,
          const LineChartSample(showMultiple: true),
        ],
      ),
    );
  }
}
