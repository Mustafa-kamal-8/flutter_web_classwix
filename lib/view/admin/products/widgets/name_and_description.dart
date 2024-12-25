import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class NameAndDescription extends StatefulWidget {
  const NameAndDescription({super.key});

  @override
  State<NameAndDescription> createState() => _NameAndDescriptionState();
}

class _NameAndDescriptionState extends State<NameAndDescription> {
  final QuillController _controller = QuillController.basic();
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
          const Row(
            children: [
              SectionTitle(
                title: "Name & description",
                color: AppColors.secondaryMintGreen,
              ),
              Spacer(),
              Chip(
                label: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      size: 18,
                    ),
                    gapW4,
                    Text("Back"),
                  ],
                ),
              ),
            ],
          ),
          gapH24,
          Text(
            "Product title",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.titleLight),
          ),
          gapH8,
          TextFormField(),
          gapH16,
          Text(
            "Description",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.titleLight),
          ),
          gapH8,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
              border: Border.all(
                color: AppColors.iconGrey,
              ),
            ),
            child: Column(
              children: [
                QuillSimpleToolbar(
                  controller: _controller,
                  configurations: const QuillSimpleToolbarConfigurations(
                    multiRowsDisplay: false,
                    toolbarSize: 35,
                  ),
                ),
                QuillEditor.basic(
                  configurations: const QuillEditorConfigurations(
                    padding: EdgeInsets.all(AppDefaults.padding),
                  ),
                  controller: _controller,
                )
              ],
            ),
          ),
          gapH16,
          Text(
            "Key features",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.titleLight),
          ),
          gapH8,
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Value'),
                ),
              ),
              if (!Responsive.isMobile(context)) gapW8,
              if (!Responsive.isMobile(context))
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Value'),
                  ),
                ),
            ],
          ),
          gapH8,
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(hintText: 'Value'),
                ),
              ),
              if (!Responsive.isMobile(context)) gapW8,
              if (!Responsive.isMobile(context))
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(hintText: 'Value'),
                  ),
                ),
            ],
          ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            TextFormField(
              decoration: const InputDecoration(hintText: 'Value'),
            ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            TextFormField(
              decoration: const InputDecoration(hintText: 'Value'),
            ),
          gapH16,
        ],
      ),
    );
  }
}
