import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class CategoryAndAttribute extends StatelessWidget {
  const CategoryAndAttribute({super.key});

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
            title: "Category",
            color: AppColors.secondaryMintGreen,
          ),
          gapH24,
          const DropdownMenu(
            hintText: "Select an option",
            dropdownMenuEntries: [
              DropdownMenuEntry(value: "Option 1", label: "Option 1"),
              DropdownMenuEntry(value: "Option 2", label: "Option 2"),
              DropdownMenuEntry(value: "Option 3", label: "Option 3"),
            ],
          ),
          gapH16,
          Text(
            "Compatibility",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.titleLight),
          ),
          gapH8,
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppDefaults.padding * 10,
            runSpacing: 8,
            children: List.generate(
              10,
              (index) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text("Option $index"),
                ],
              ),
            ),
          ),
          gapH16,
        ],
      ),
    );
  }
}
