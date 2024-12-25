import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../shared/widgets/tabs/tab_with_growth.dart';
import '../../../../theme/app_colors.dart';

class PromiteSummary extends StatelessWidget {
  const PromiteSummary({super.key});
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
                title: "Insights",
                color: AppColors.secondaryPeach,
              ),
              const Spacer(),
              if (!Responsive.isMobile(context))
                DropdownMenu(
                  controller: TextEditingController(text: "Last 7 days"),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                      value: "Last 7 days",
                      label: "Last 7 days",
                    ),
                    DropdownMenuEntry(
                      value: "Last 28 days",
                      label: "Last 28 days",
                    ),
                    DropdownMenuEntry(
                      value: "All time",
                      label: "All time",
                    ),
                  ],
                ),
            ],
          ),
          gapH16,
          if (!Responsive.isMobile(context))
            Row(
              children: [
                const Expanded(
                  child: TabWithGrowth(
                    isVertical: true,
                    iconSrc: "assets/icons/profile_circled_light.svg",
                    iconBgColor: AppColors.secondaryMintGreen,
                    title: "People reached",
                    amount: "256k",
                    growthPercentage: "37.8% this week",
                  ),
                ),
                Container(
                  width: 2,
                  color: AppColors.iconGrey,
                  height: 100,
                ),
                const Expanded(
                  child: TabWithGrowth(
                    isVertical: true,
                    iconSrc: "assets/icons/arrow_up_down_filled.svg",
                    iconBgColor: AppColors.secondaryLavender,
                    title: "Engagement",
                    amount: "1.2x",
                    growthPercentage: "37.8% this week",
                  ),
                ),
                Container(
                  width: 2,
                  color: AppColors.iconGrey,
                  height: 100,
                ),
                const Expanded(
                  child: TabWithGrowth(
                    isVertical: true,
                    iconSrc: "assets/icons/messages_light.svg",
                    iconBgColor: AppColors.secondaryPeach,
                    title: "Comments",
                    amount: "128",
                    growthPercentage: "37.8% this week",
                  ),
                ),
                Container(
                  width: 2,
                  color: AppColors.iconGrey,
                  height: 100,
                ),
                const Expanded(
                  child: TabWithGrowth(
                    isVertical: true,
                    iconSrc: "assets/icons/mouse_pointer.svg",
                    iconBgColor: AppColors.secondaryBabyBlue,
                    title: "Link clicks",
                    amount: "80",
                    growthPercentage: "37.8% this week",
                  ),
                ),
              ],
            ),
          if (Responsive.isMobile(context))
            const Column(
              children: [
                TabWithGrowth(
                  iconRight: true,
                  iconSrc: "assets/icons/profile_circled_light.svg",
                  iconBgColor: AppColors.secondaryMintGreen,
                  title: "People reached",
                  amount: "256k",
                  growthPercentage: "37.8% this week",
                ),
                gapH4,
                Divider(),
                gapH4,
                TabWithGrowth(
                  iconRight: true,
                  iconSrc: "assets/icons/arrow_up_down_filled.svg",
                  iconBgColor: AppColors.secondaryLavender,
                  title: "Engagement",
                  amount: "1.2x",
                  growthPercentage: "37.8% this week",
                ),
                gapH4,
                Divider(),
                gapH4,
                TabWithGrowth(
                  iconRight: true,
                  iconSrc: "assets/icons/messages_light.svg",
                  iconBgColor: AppColors.secondaryPeach,
                  title: "Comments",
                  amount: "128",
                  growthPercentage: "37.8% this week",
                ),
                gapH4,
                Divider(),
                gapH4,
                TabWithGrowth(
                  iconRight: true,
                  iconSrc: "assets/icons/mouse_pointer.svg",
                  iconBgColor: AppColors.secondaryBabyBlue,
                  title: "Link clicks",
                  amount: "80",
                  growthPercentage: "37.8% this week",
                ),
              ],
            ),
        ],
      ),
    );
  }
}
