import 'package:flutter/material.dart';

import '../../../../shared/widgets/responsive_grid_view.dart';
import '../../../../shared/widgets/tabs/tab_with_growth.dart';
import '../../../../theme/app_colors.dart';

class ProductOverviewTabs extends StatelessWidget {
  const ProductOverviewTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridView(
      itemCount: demoData.length,
      itemBuilder: (context, index) {
        final item = demoData[index];
        return TabWithGrowth(
          title: item['title'],
          amount: item['amount'],
          growthPercentage: item['growthPercentage'],
          growthBgColor: item['growthBgColor'],
          iconSrc: item['iconSrc'],
          iconColor: item['iconColor'],
          isVertical: item['isVertical'],
          bgColor: item['bgColor'],
          iconBgColor: item['iconBgColor'],
          isPositiveGrowth: item['isPositiveGrowth'],
        );
      },
      desiredItemWidth: 340,
      desiredItemHeight: 180,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      // padding: EdgeInsets.all(16),
    );
  }
}

final List<Map<String, dynamic>> demoData = [
  {
    'title': 'Earning',
    'amount': '128k',
    'growthPercentage': '37.8% this Week',
    'growthBgColor': AppColors.bgFullLight,
    'iconSrc': 'assets/icons/activity_light.svg',
    'iconColor': AppColors.bgLight,
    'isVertical': true,
    'bgColor': AppColors.secondaryMintGreen.withOpacity(0.2),
    'iconBgColor': AppColors.titleLight,
    'isPositiveGrowth': true,
  },
  {
    'title': 'Customer',
    'amount': '512',
    'growthPercentage': '37.8% this Week',
    'growthBgColor': AppColors.bgFullLight,
    'iconSrc': 'assets/icons/shopping_bag_light.svg',
    'iconColor': AppColors.bgLight,
    'isVertical': true,
    'bgColor': AppColors.secondaryBabyBlue.withOpacity(0.2),
    'iconBgColor': AppColors.titleLight,
    'isPositiveGrowth': false,
  },
  {
    'title': 'Payouts',
    'amount': '64k',
    'growthPercentage': '37.8% this Week',
    'growthBgColor': AppColors.bgFullLight,
    'iconSrc': 'assets/icons/payment_light.svg',
    'iconColor': AppColors.bgLight,
    'isVertical': true,
    'bgColor': AppColors.secondaryLavender.withOpacity(0.2),
    'iconBgColor': AppColors.titleLight,
    'isPositiveGrowth': true,
  },
];
