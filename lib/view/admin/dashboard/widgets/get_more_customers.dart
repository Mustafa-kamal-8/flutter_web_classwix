import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class GetMoreCustomers extends StatelessWidget {
  const GetMoreCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDefaults.padding * 1.25),
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDefaults.borderRadius),
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: "Get more customers!",
            color: AppColors.secondaryBabyBlue,
          ),
          gapH20,
          const Text(
            '50% of new customers explore products because the author sharing the work on the social media network. Gain your earnings right now! 🔥',
          ),
          gapH20,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/facebook_filled.svg',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) gapW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Facebook",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/twitter_light.svg',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) gapW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Twitter",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
              gapW16,
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/instagram_light.svg',
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textLight,
                          BlendMode.srcIn,
                        ),
                      ),
                      if (!Responsive.isMobile(context)) gapW4,
                      if (!Responsive.isMobile(context))
                        Text(
                          "Instagram",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}