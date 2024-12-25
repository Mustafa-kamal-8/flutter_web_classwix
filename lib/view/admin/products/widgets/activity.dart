import 'package:core_dashboard/shared/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

List<ProductSummaryModel> productSummaryDummyData = [
  ProductSummaryModel('5 Sept - 1 Oct', '8', '24k', '48', '16'),
  ProductSummaryModel('18 Sept - 24 Sept', '12', '18k', '36', '8'),
  ProductSummaryModel('11 Sept - 17 Sept', '6', '12k', '24', '4'),
  ProductSummaryModel('4 Sept - 10 Sept', '4', '8k', '16', '2'),
  ProductSummaryModel('28 Aug - 3 Sept', '2', '4k', '8', '1'),
];

class Activity extends StatelessWidget {
  const Activity({super.key});

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
        children: [
          Row(
            children: [
              const SectionTitle(
                title: "Product Activity",
                color: AppColors.secondaryMintGreen,
              ),
              const Spacer(),
              DropdownMenu(
                controller: TextEditingController(text: "Last 2 weeks"),
                dropdownMenuEntries: const [
                  DropdownMenuEntry(value: "This Week", label: "This Week"),
                  DropdownMenuEntry(
                      value: "Last 2 weeks", label: "Last 2 weeks"),
                ],
              ),
            ],
          ),
          gapH16,
          !Responsive.isMobile(context)
              ? Table(
                  border: const TableBorder(
                    horizontalInside: BorderSide(
                      color: AppColors.bgLight,
                      width: 1,
                    ),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(3),
                    2: FlexColumnWidth(2),
                    3: FlexColumnWidth(2),
                    4: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDefaults.padding),
                            child: Text(
                              "Week",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDefaults.padding),
                            child: Text(
                              "Products",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDefaults.padding),
                            child: Text(
                              "Views",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDefaults.padding),
                            child: Text(
                              "Likes",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDefaults.padding),
                            child: Text(
                              "Comments",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...List.generate(
                      productSummaryDummyData.length,
                      (i) => TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding),
                              child: Text(productSummaryDummyData[i].week),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  backgroundColor: AppColors.secondaryMintGreen,
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDefaults.padding * 0.25,
                                      vertical: AppDefaults.padding * 0.25),
                                  label: Text(productSummaryDummyData[i].total),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  backgroundColor: AppColors.secondaryLavender,
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDefaults.padding * 0.25,
                                      vertical: AppDefaults.padding * 0.25),
                                  label: Text(productSummaryDummyData[i].views),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  backgroundColor: AppColors.secondaryBabyBlue,
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDefaults.padding * 0.25,
                                      vertical: AppDefaults.padding * 0.25),
                                  label: Text(productSummaryDummyData[i].likes),
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  backgroundColor:
                                      AppColors.secondaryPaleYellow,
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDefaults.padding * 0.25,
                                      vertical: AppDefaults.padding * 0.25),
                                  label:
                                      Text(productSummaryDummyData[i].comments),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Table(
                  border: const TableBorder(
                    horizontalInside: BorderSide(
                      color: AppColors.bgLight,
                      width: 1,
                    ),
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(4),
                    1: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Padding(
                            padding: const EdgeInsets.all(AppDefaults.padding),
                            child: Text(
                              "Week",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.bgLight,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(AppDefaults.borderRadius)),
                            ),
                            child: DropdownMenu(
                              controller: TextEditingController(text: "Views"),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(
                                  value: "Products",
                                  label: "Products",
                                ),
                                DropdownMenuEntry(
                                  value: "Views",
                                  label: "Views",
                                ),
                                DropdownMenuEntry(
                                  value: "Likes",
                                  label: "Likes",
                                ),
                                DropdownMenuEntry(
                                  value: "Comments",
                                  label: "Comments",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ...List.generate(
                      productSummaryDummyData.length,
                      (i) => TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding),
                              child: Text(productSummaryDummyData[i].week),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.all(AppDefaults.padding),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Chip(
                                  backgroundColor: AppColors.secondaryLavender,
                                  side: BorderSide.none,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppDefaults.padding * 0.25,
                                      vertical: AppDefaults.padding * 0.25),
                                  label: Text(productSummaryDummyData[i].views),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
