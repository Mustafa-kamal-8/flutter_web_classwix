import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import 'popular_product_item.dart';

final List<PopularProductItem> popularProductsDummyData = [
  const PopularProductItem(
    name: 'Crypter - NFT UI kit icon',
    price: '\$2,453.80',
    imageSrc:
        'https://cdn.dribbble.com/users/1145170/screenshots/15408955/crypter_nft_light_and_dark__2__4x.png',
    isActive: true,
  ),
  const PopularProductItem(
    name: 'Bento Matte 3D illustration 1.0',
    price: '\$105.60',
    imageSrc:
        'https://cdn.dribbble.com/userupload/13266176/file/original-d24837eab58ae1d1b9fe81b95ce66ee8.png?crop=0x310-2080x1869&resize=1600x1200',
    isActive: false,
  ),
  const PopularProductItem(
    name: 'Excellent material 3D chair',
    price: '\$648.60',
    imageSrc:
        'https://th.bing.com/th/id/OIP.KyPADxCf2qyPGZ23sPztFAHaE8?rs=1&pid=ImgDetMain',
    isActive: true,
  ),
  const PopularProductItem(
    name: 'Fleet - travel shopping kit',
    price: '\$649.40',
    imageSrc:
        'https://images.squarespace-cdn.com/content/v1/5b05a49e5417fc5d274b9f02/1538428620629-TAPU5WNHNDJ9U7YZLKEA/Kandis_Marino_Photography_Lifestyle_Lily_Jade_Mom_Blogger_Diaper_Bag_Weekender_Bag_0015.jpg',
    isActive: true,
  ),
];

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bgSecondayLight,
        borderRadius: BorderRadius.all(
          Radius.circular(AppDefaults.borderRadius),
        ),
      ),
      padding: const EdgeInsets.all(AppDefaults.padding * 0.75),
      child: Column(
        children: [
          gapH8,
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: SectionTitle(
              title: "Popular products",
              color: AppColors.secondaryLavender,
            ),
          ),
          gapH16,
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Products', style: Theme.of(context).textTheme.labelSmall),
                Text('Earning', style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
          ),
          gapH8,
          const Divider(),
          ListView.builder(
            itemCount: popularProductsDummyData.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return PopularProductItem(
                name: popularProductsDummyData[index].name,
                price: popularProductsDummyData[index].price,
                imageSrc: popularProductsDummyData[index].imageSrc,
                isActive: popularProductsDummyData[index].isActive,
                onPressed: () {},
              );
            },
          ),
          gapH16,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "All products",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          gapH8,
        ],
      ),
    );
  }
}
