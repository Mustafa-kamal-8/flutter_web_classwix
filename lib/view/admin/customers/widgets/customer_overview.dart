import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import 'line_cart.dart';

class CustomersOverview extends StatelessWidget {
  const CustomersOverview({super.key});

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
          Row(
            children: [
              const SectionTitle(
                title: "Total Customers",
                color: AppColors.secondaryPeach,
              ),
              const Spacer(),
              if (!Responsive.isMobile(context))
                DropdownMenu(
                  controller: TextEditingController(text: "Last 28 days"),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                        value: "Last 7 days", label: "Last 7 days"),
                    DropdownMenuEntry(
                        value: "Last 28 days", label: "Last 28 days"),
                    DropdownMenuEntry(value: "All time", label: "All time"),
                  ],
                ),
            ],
          ),
          gapH24,
          Text(
            "1,509 customers",
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          const LineChartSample(),
          Row(
            children: [
              Expanded(
                  child: RichText(
                text: TextSpan(
                  text: "Welcome",
                  style: Theme.of(context).textTheme.bodySmall,
                  children: [
                    TextSpan(
                      text: " 18 new customers with ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(
                      text: "\n a personalmessage 😎",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              )),
              if (!Responsive.isMobile(context))
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppDefaults.padding,
                    vertical: AppDefaults.padding / 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                        Radius.circular(AppDefaults.borderRadius)),
                    border:
                        Border.all(width: 2, color: AppColors.highlightLight),
                  ),
                  child: const Text(
                    'Send Message',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
            ],
          ),
          gapH24,
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://i.postimg.cc/6pFY96BZ/image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    gapH16,
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://i.postimg.cc/6pFY96BZ/image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    gapH16,
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 65,
                      width: 65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://i.postimg.cc/6pFY96BZ/image.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    gapH16,
                    Text(
                      'John Doe',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: 65,
                      width: 65,
                      decoration: BoxDecoration(
                        color: AppColors.highlightLight,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.arrow_forward),
                    ),
                    gapH16,
                    Text(
                      'View all',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
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
