import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({super.key});

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
            title: "Price",
            color: AppColors.secondaryMintGreen,
          ),
          gapH24,
          Text(
            "Amount",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.titleLight),
          ),
          gapH8,
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Amount',
              prefixIcon: Container(
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                child: const Text(
                  '\$',
                  style: TextStyle(
                    color: AppColors.iconGrey,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          gapH16,
          Row(
            children: [
              const Expanded(child: Text("Allow customers to pay they want")),
              gapW8,
              Transform.scale(
                scale: 0.8,
                child: Switch.adaptive(
                  value: true,
                  onChanged: (value) {},
                  activeColor: AppColors.primary,
                ),
              ),
            ],
          ),
          gapH16,
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Minimum Amount",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.titleLight),
                    ),
                    gapH8,
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Amount',
                        prefixIcon: Container(
                          width: 40,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                          child: const Text(
                            '\$',
                            style: TextStyle(
                              color: AppColors.iconGrey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!Responsive.isMobile(context)) gapW8,
              if (!Responsive.isMobile(context))
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Maximum Amount",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.titleLight),
                      ),
                      gapH8,
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Amount',
                          prefixIcon: Container(
                            width: 40,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                            child: const Text(
                              '\$',
                              style: TextStyle(
                                color: AppColors.iconGrey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Maximum Amount",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.titleLight),
                ),
                gapH8,
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    prefixIcon: Container(
                      width: 40,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(16, 0, 8, 0),
                      child: const Text(
                        '\$',
                        style: TextStyle(
                          color: AppColors.iconGrey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          gapH16,
        ],
      ),
    );
  }
}
