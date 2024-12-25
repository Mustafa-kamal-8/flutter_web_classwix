import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/models/product_model.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';

List<ProductModel> productDummyData = [
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', true, '\$98',
      '\$3,200', '55.8%', '48k', '8'),
  ProductModel('Bento Matte 3D Illustration', 'Ui design', false, '\$48',
      '\$3,200', '37.8%', '80k', '8'),
];

class PromoteProductsList extends StatelessWidget {
  const PromoteProductsList({super.key});

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
                title: "Products",
                color: AppColors.secondaryBabyBlue,
              ),
              const Spacer(),
              if (!Responsive.isMobile(context))
                DropdownMenu(
                  controller: TextEditingController(text: "Last 7 days"),
                  dropdownMenuEntries: const [
                    DropdownMenuEntry(
                        value: "Last 7 days", label: "Last 7 days"),
                    DropdownMenuEntry(
                        value: "Last 28 days", label: "Last 28 days"),
                    DropdownMenuEntry(value: "All time", label: "All time"),
                  ],
                ),
              gapW8,
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppDefaults.borderRadius),
                child: const Chip(
                  label: Text(
                    ' New Post ',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blue,
                  side: BorderSide.none,
                ),
              ),
            ],
          ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            DropdownMenu(
              controller: TextEditingController(text: "Last 7 days"),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "Last 7 days", label: "Last 7 days"),
                DropdownMenuEntry(value: "Last 28 days", label: "Last 28 days"),
                DropdownMenuEntry(value: "All time", label: "All time"),
              ],
            ),
          gapH24,
          Responsive.isMobile(context)
              ? const _MobileTable()
              : const _DesktopTable(),
        ],
      ),
    );
  }
}

class _MobileTable extends StatelessWidget {
  const _MobileTable();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productDummyData.length,
      itemBuilder: (context, index) {
        final product = productDummyData[index];
        return Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(AppDefaults.inputFieldRadius),
                    child: Image.asset(
                      "assets/images/illustration/dummy-product.png",
                      width: 120,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                gapW16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                      gapH4,
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.bgLight,
                            child: SvgPicture.asset(
                              'assets/icons/facebook_light.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          gapW8,
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.bgLight,
                            child: SvgPicture.asset(
                              'assets/icons/twitter_light.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gapH8,
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Distribution',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      side: BorderSide.none,
                      backgroundColor: product.status
                          ? AppColors.success.withOpacity(0.2)
                          : AppColors.error.withOpacity(0.2),
                      label: Text(
                        '${product.status ? '+' : '-'}${product.salesSummary}',
                        style:
                            Theme.of(context).textTheme.labelMedium!.copyWith(
                                  color: product.status
                                      ? AppColors.success
                                      : AppColors.error,
                                ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            gapH8,
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Link clicks',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Chip(
                        padding: EdgeInsets.zero,
                        side: BorderSide.none,
                        backgroundColor: AppColors.textGrey.withOpacity(0.3),
                        label: Text(
                          product.salesSummary,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      gapW8,
                      SizedBox(
                        height: 10,
                        width: 50,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: AppColors.textGrey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(AppDefaults.borderRadius),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            product.status
                                ? AppColors.success
                                : AppColors.error,
                          ),
                        ),
                      ),
                      gapW8,
                      Icon(
                        Icons.arrow_upward,
                        size: 18,
                        color: !product.status
                            ? AppColors.success
                            : AppColors.error,
                      ),
                      gapW8,
                      Text(
                        product.salesSummary,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gapH8,
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Views',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Chip(
                        padding: EdgeInsets.zero,
                        side: BorderSide.none,
                        backgroundColor: AppColors.textGrey.withOpacity(0.3),
                        label: Text(
                          product.salesSummary,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      gapW8,
                      SizedBox(
                        height: 10,
                        width: 50,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: AppColors.textGrey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(AppDefaults.borderRadius),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            product.status
                                ? AppColors.success
                                : AppColors.error,
                          ),
                        ),
                      ),
                      gapW8,
                      Icon(
                        Icons.arrow_upward,
                        size: 18,
                        color: !product.status
                            ? AppColors.success
                            : AppColors.error,
                      ),
                      gapW8,
                      Text(
                        product.salesSummary,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gapH8,
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Engagement',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Chip(
                        padding: EdgeInsets.zero,
                        side: BorderSide.none,
                        backgroundColor: AppColors.textGrey.withOpacity(0.3),
                        label: Text(
                          product.salesSummary,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ),
                      gapW8,
                      SizedBox(
                        height: 10,
                        width: 50,
                        child: LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: AppColors.textGrey.withOpacity(0.3),
                          borderRadius:
                              BorderRadius.circular(AppDefaults.borderRadius),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            product.status
                                ? AppColors.success
                                : AppColors.error,
                          ),
                        ),
                      ),
                      gapW8,
                      Icon(
                        Icons.arrow_upward,
                        size: 18,
                        color: !product.status
                            ? AppColors.success
                            : AppColors.error,
                      ),
                      gapW8,
                      Text(
                        product.salesSummary,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            gapH8,
            const Divider(),
            gapH16,
          ],
        );
      },
    );
  }
}

class _DesktopTable extends StatelessWidget {
  const _DesktopTable();

  @override
  Widget build(BuildContext context) {
    return Table(
      border: const TableBorder(
        horizontalInside: BorderSide(
          color: AppColors.bgLight,
          width: 1,
        ),
      ),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
        4: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Text(
                'Post',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Distribution',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Link clicks',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Views',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Engagement',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        for (var product in productDummyData)
          TableRow(
            children: [
              TableCell(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.circular(AppDefaults.inputFieldRadius),
                        child: Image.asset(
                          "assets/images/illustration/dummy-product.png",
                          width: 120,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    gapW16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          gapH4,
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.bgLight,
                                child: SvgPicture.asset(
                                  'assets/icons/facebook_light.svg',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              gapW8,
                              CircleAvatar(
                                radius: 15,
                                backgroundColor: AppColors.bgLight,
                                child: SvgPicture.asset(
                                  'assets/icons/twitter_light.svg',
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Chip(
                    side: BorderSide.none,
                    backgroundColor: product.status
                        ? AppColors.success.withOpacity(0.2)
                        : AppColors.error.withOpacity(0.2),
                    label: Text(
                      '${product.status ? '+' : '-'}${product.salesSummary}',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: product.status
                                ? AppColors.success
                                : AppColors.error,
                          ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Chip(
                          padding: EdgeInsets.zero,
                          side: BorderSide.none,
                          backgroundColor: AppColors.textGrey.withOpacity(0.3),
                          label: Text(
                            product.salesSummary,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        gapW8,
                        SizedBox(
                          height: 10,
                          width: 50,
                          child: LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor:
                                AppColors.textGrey.withOpacity(0.3),
                            borderRadius:
                                BorderRadius.circular(AppDefaults.borderRadius),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              product.status
                                  ? AppColors.success
                                  : AppColors.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH8,
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          size: 18,
                          color: !product.status
                              ? AppColors.success
                              : AppColors.error,
                        ),
                        gapW8,
                        Text(
                          product.salesSummary,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Chip(
                          padding: EdgeInsets.zero,
                          side: BorderSide.none,
                          backgroundColor: AppColors.textGrey.withOpacity(0.3),
                          label: Text(
                            product.views,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        gapW8,
                        SizedBox(
                          height: 10,
                          width: 50,
                          child: LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor:
                                AppColors.textGrey.withOpacity(0.3),
                            borderRadius:
                                BorderRadius.circular(AppDefaults.borderRadius),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              product.status
                                  ? AppColors.success
                                  : AppColors.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH8,
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          size: 18,
                          color: product.status
                              ? AppColors.success
                              : AppColors.error,
                        ),
                        gapW8,
                        Text(
                          product.salesSummary,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Chip(
                          padding: EdgeInsets.zero,
                          side: BorderSide.none,
                          backgroundColor: AppColors.textGrey.withOpacity(0.3),
                          label: Text(
                            product.views,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                        gapW8,
                        SizedBox(
                          height: 10,
                          width: 50,
                          child: LinearProgressIndicator(
                            value: 0.5,
                            backgroundColor:
                                AppColors.textGrey.withOpacity(0.3),
                            borderRadius:
                                BorderRadius.circular(AppDefaults.borderRadius),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              product.status
                                  ? AppColors.success
                                  : AppColors.error,
                            ),
                          ),
                        ),
                      ],
                    ),
                    gapH8,
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_upward,
                          size: 18,
                          color: product.status
                              ? AppColors.success
                              : AppColors.error,
                        ),
                        gapW8,
                        Text(
                          product.salesSummary,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
