import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class CustomerMessages extends StatelessWidget {
  const CustomerMessages({super.key});

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
            title: "Messages",
            color: AppColors.secondaryPeach,
          ),
          gapH16,
          ...List.generate(
            5,
            (_) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDefaults.padding / 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    padding: const EdgeInsets.all(AppDefaults.padding),
                    decoration: BoxDecoration(
                      color: AppColors.error.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.network(
                      'https://i.postimg.cc/6pFY96BZ/image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  gapW8,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.titleLight,
                            ),
                        children: const [
                          TextSpan(text: "Winnifred "),
                          TextSpan(
                            text: "@username\n",
                            style: TextStyle(
                              color: AppColors.textLight,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(text: "Message goes here 😎"),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    "2h",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.textLight,
                        ),
                  ),
                ],
              ),
            ),
          ),
          gapH8,
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 55),
            ),
            onPressed: () {},
            child: const Text('View all messages'),
          )
        ],
      ),
    );
  }
}
