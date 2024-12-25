import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import '../../dashboard/widgets/product_overview.dart';
import 'activity.dart';

class ProductActivity extends StatelessWidget {
  const ProductActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Activity(),
              if (Responsive.isMobile(context)) gapH16,
              if (Responsive.isMobile(context)) const _View(),
            ],
          ),
        ),
        if (!Responsive.isMobile(context)) gapW16,
        if (!Responsive.isMobile(context))
          const Expanded(flex: 2, child: _View()),
      ],
    );
  }
}

class _View extends StatelessWidget {
  const _View();

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
          const SectionTitle(
            title: "Product views",
            color: AppColors.secondaryBabyBlue,
          ),
          gapH(55),
          BarChartSample8(),
        ],
      ),
    );
  }
}
