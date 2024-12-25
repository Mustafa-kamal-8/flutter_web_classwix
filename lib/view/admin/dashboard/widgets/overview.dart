import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import 'overview_tabs.dart';

class Overview extends StatelessWidget {
  const Overview({super.key});

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
              const SectionTitle(title: "Overview"),
              const Spacer(),
              DropdownMenu(
                controller: TextEditingController(text: "This year"),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "This year", label: "This year"),
                  DropdownMenuEntry(value: "All time", label: "All time"),
                ],
              ),
            ],
          ),
          gapH24,
          const OverviewTabs(),
        ],
      ),
    );
  }
}
