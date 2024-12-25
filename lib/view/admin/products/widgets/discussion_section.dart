import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class DiscussionSection extends StatefulWidget {
  const DiscussionSection({super.key});

  @override
  State<DiscussionSection> createState() => _DiscussionSectionState();
}

class _DiscussionSectionState extends State<DiscussionSection> {
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
          const SectionTitle(
            title: "Discussion",
            color: AppColors.secondaryPeach,
          ),
          gapH24,
          Text(
            "Message to reviewer",
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
        ],
      ),
    );
  }
}
