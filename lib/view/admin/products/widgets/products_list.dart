import 'package:core_dashboard/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
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

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

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
                color: AppColors.secondaryLavender,
              ),
              if (!Responsive.isMobile(context)) gapW16,
              if (!Responsive.isMobile(context))
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          // style: Theme.of(context).textTheme.labelLarge,
                          decoration: InputDecoration(
                            hintText: "Search...",
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(
                                  left: AppDefaults.padding,
                                  right: AppDefaults.padding / 2),
                              child: SvgPicture.asset(
                                  "assets/icons/search_light.svg"),
                            ),
                            filled: true,
                            fillColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            border: AppDefaults.outlineInputBorder,
                            focusedBorder:
                                AppDefaults.focusedOutlineInputBorder,
                          ),
                        ),
                      ),
                      gapW16,
                      const Expanded(child: SizedBox.shrink()),
                    ],
                  ),
                ),
              if (!Responsive.isMobile(context)) ...[
                gapW8,
                Chip(
                  label: const Text('Market'),
                  backgroundColor: AppColors.textGrey.withOpacity(0.5),
                  side: BorderSide.none,
                ),
                gapW8,
                const Chip(
                  label: Text('Traffic sources'),
                  backgroundColor: AppColors.bgLight,
                  side: BorderSide.none,
                ),
                gapW8,
                const Chip(
                  label: Text('Viewers'),
                  backgroundColor: AppColors.bgLight,
                  side: BorderSide.none,
                ),
              ],
            ],
          ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            TextFormField(
              // style: Theme.of(context).textTheme.labelLarge,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                      left: AppDefaults.padding,
                      right: AppDefaults.padding / 2),
                  child: SvgPicture.asset("assets/icons/search_light.svg"),
                ),
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                border: AppDefaults.outlineInputBorder,
                focusedBorder: AppDefaults.focusedOutlineInputBorder,
              ),
            ),
          if (Responsive.isMobile(context)) gapH8,
          if (Responsive.isMobile(context))
            DropdownMenu(
              controller: TextEditingController(text: "Market"),
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "Market", label: "Market"),
                DropdownMenuEntry(
                    value: "Traffic sources", label: "Traffic sources"),
                DropdownMenuEntry(value: "Viewers", label: "Viewers"),
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
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(AppDefaults.inputFieldRadius),
                  child: Image.asset(
                    "assets/images/illustration/dummy-product.png",
                    width: 85,
                    height: 85,
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
                          Chip(
                            side: BorderSide.none,
                            backgroundColor:
                                AppColors.textGrey.withOpacity(0.3),
                            padding: EdgeInsets.zero,
                            label: Text(
                              product.price,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                          gapW8,
                          Text(
                            product.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppColors.textGrey,
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
                    'Status',
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
                          ? AppColors.success.withOpacity(0.3)
                          : AppColors.error.withOpacity(0.3),
                      label: Text(
                        product.status ? 'Active' : 'Inactive',
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
                    'Views',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Chip(
                      side: BorderSide.none,
                      backgroundColor: AppColors.textGrey.withOpacity(0.2),
                      label: Text(product.views),
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
                    'Sales',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      Chip(
                        side: BorderSide.none,
                        backgroundColor: AppColors.textGrey.withOpacity(0.2),
                        label: Text(product.sales),
                        padding: EdgeInsets.zero,
                      ),
                      gapW8,
                      const Icon(
                        Icons.arrow_upward,
                        size: 18,
                        color: AppColors.success,
                      ),
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
        0: FlexColumnWidth(1),
        1: FlexColumnWidth(6),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(3),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
      },
      children: [
        TableRow(
          children: [
            TableCell(
              child: Checkbox(value: false, onChanged: (v) {}),
            ),
            TableCell(
              child: Text(
                'Product',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Status',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Price',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            TableCell(
              child: Text(
                'Sales',
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
                'Likes',
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        for (var product in productDummyData)
          TableRow(
            children: [
              TableCell(child: Checkbox(value: false, onChanged: (v) {})),
              TableCell(
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(AppDefaults.inputFieldRadius),
                      child: Image.asset(
                        "assets/images/illustration/dummy-product.png",
                        width: 85,
                        height: 85,
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
                          Text(
                            product.subtitle,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppColors.textGrey,
                                ),
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
                        ? AppColors.success.withOpacity(0.3)
                        : AppColors.error.withOpacity(0.3),
                    label: Text(
                      product.status ? 'Active' : 'Inactive',
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
                child: Text(
                  product.price,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              TableCell(
                child: Row(
                  children: [
                    Chip(
                      side: BorderSide.none,
                      backgroundColor: AppColors.textGrey.withOpacity(0.3),
                      label: Text(
                        product.sales,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ),
                    gapW8,
                    const Icon(
                      Icons.arrow_upward,
                      size: 18,
                      color: AppColors.success,
                    ),
                    Text(
                      product.salesSummary,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Text(
                  product.views,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              TableCell(
                child: Text(
                  product.likes,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
      ],
    );
  }
}
