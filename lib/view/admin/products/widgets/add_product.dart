import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../theme/app_colors.dart';
import 'category_and_attributes.dart';
import 'discussion_section.dart';
import 'files_section.dart';
import 'images_and_cta.dart';
import 'name_and_description.dart';
import 'price_section.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!Responsive.isMobile(context)) gapH24,
        Text(
          "New Product",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        gapH16,
        const NameAndDescription(),
        gapH16,
        const ImagesAndCTA(),
        gapH16,
        const PriceSection(),
        gapH16,
        const CategoryAndAttribute(),
        gapH16,
        const FilesSection(),
        gapH16,
        const DiscussionSection(),
        gapH16,
        Container(
          padding: const EdgeInsets.all(AppDefaults.padding),
          decoration: const BoxDecoration(
            color: AppColors.bgSecondayLight,
            borderRadius:
                BorderRadius.all(Radius.circular(AppDefaults.borderRadius)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text("Save Draft"),
              ),
              gapW16,
              ElevatedButton(
                onPressed: () {},
                child: const Text("Publish now"),
              ),
            ],
          ),
        )
      ],
    );
  }
}
