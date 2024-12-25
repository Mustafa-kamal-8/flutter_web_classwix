import 'package:flutter/material.dart';

import '../../../responsive.dart';
import '../../../shared/constants/ghaps.dart';
import 'widgets/product_activity.dart';
import 'widgets/product_overview.dart';
import 'widgets/products_list.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context)) gapH24,
        Text(
          "Products Dashboard",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        gapH16,
        const ProductOverview(),
        gapH16,
        const ProductActivity(),
        gapH16,
        const ProductsList(),
      ],
    );
  }
}
