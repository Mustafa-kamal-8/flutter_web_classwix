import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/ghaps.dart';
import 'draft_products_list.dart';

class DraftProductsPage extends StatelessWidget {
  const DraftProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context)) gapH24,
        Text(
          "Drafts",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        gapH16,
        const DraftProductsList(),
      ],
    );
  }
}
