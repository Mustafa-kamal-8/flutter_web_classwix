import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../../../shared/constants/ghaps.dart';
import 'widgets/product_list.dart';
import 'widgets/summary.dart';

class PromotePage extends StatelessWidget {
  const PromotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context)) gapH24,
        Text(
          "Promote",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        gapH16,
        const PromiteSummary(),
        gapH24,
        const PromoteProductsList(),
        gapH24,
      ],
    );
  }
}
