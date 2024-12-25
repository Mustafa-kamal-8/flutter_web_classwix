import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class ImagesAndCTA extends StatelessWidget {
  const ImagesAndCTA({super.key});

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
          const SectionTitle(
            title: "Images & CTA",
            color: AppColors.secondaryBabyBlue,
          ),
          gapH24,
          Text(
            "Cover Images",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.titleLight),
          ),
          gapH8,
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.iconGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
            ),
            child: Chip(
              side: BorderSide.none,
              label: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.upload,
                    color: AppColors.iconGrey,
                  ),
                  gapW8,
                  Text(
                    "Click or drop image",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.iconGrey),
                  ),
                ],
              ),
            ),
          ),
          gapH16,
          Text(
            "Dropdown",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.titleLight),
          ),
          gapH8,
          const DropdownMenu(
            hintText: "Select an option",
            dropdownMenuEntries: [
              DropdownMenuEntry(value: "Option 1", label: "Option 1"),
              DropdownMenuEntry(value: "Option 2", label: "Option 2"),
              DropdownMenuEntry(value: "Option 3", label: "Option 3"),
            ],
          ),
          gapH16,
        ],
      ),
    );
  }
}
