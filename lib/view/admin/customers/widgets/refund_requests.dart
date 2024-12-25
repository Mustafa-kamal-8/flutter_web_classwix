import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class RefundRequests extends StatelessWidget {
  const RefundRequests({super.key});

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
            title: "Refund requests",
            color: AppColors.secondaryPeach,
          ),
          gapH16,
          ...List.generate(
            2,
            (_) => Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: AppDefaults.padding / 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppDefaults.padding),
                    decoration: BoxDecoration(
                      color: AppColors.error.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/basket_light.svg',
                      height: 24,
                      width: 24,
                      colorFilter: const ColorFilter.mode(
                        AppColors.error,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  gapW8,
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: const [
                          TextSpan(text: "You have "),
                          TextSpan(
                            text: "52 open refund requests",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: AppColors.titleLight),
                          ),
                          TextSpan(text: " to action. This includes "),
                          TextSpan(
                            text: "8 new requests.",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
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
            child: const Text('Review refund Requests'),
          )
        ],
      ),
    );
  }
}
