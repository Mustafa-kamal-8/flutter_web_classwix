import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import 'overview_tabs.dart';

class ProductOverview extends StatelessWidget {
  const ProductOverview({super.key});

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
        children: [
          Row(
            children: [
              const SectionTitle(
                title: "Overview",
                color: AppColors.secondaryLavender,
              ),
              const Spacer(),
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
          const ProductOverviewTabs(),
        ],
      ),
    );
  }
}
