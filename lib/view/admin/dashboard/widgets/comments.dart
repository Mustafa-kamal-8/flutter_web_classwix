import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/section_title.dart';
import '../../../../theme/app_colors.dart';
import 'comment_item.dart';

final List<CommentItem> commentsDummyData = [
  const CommentItem(
    name: 'Ethel',
    username: 'ethel',
    time: '1h',
    product: 'Smiles – 3D icons',
    comment: 'Great work 😊',
    imageSrc:
        'https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg',
  ),
  const CommentItem(
    name: 'Jazmyn',
    username: 'jaz.designer',
    time: '8h',
    product: 'Fleet - Travel shopping',
    comment: 'I need react version asap!',
    imageSrc:
        'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?rs=1&pid=ImgDetMain',
  ),
  const CommentItem(
    name: 'Jack',
    username: 'jack.developer',
    time: '3h',
    product: 'Excellent material 3D chair',
    comment: 'How can I buy only the design?',
    imageSrc:
        'https://th.bing.com/th/id/OIP.IGNf7GuQaCqz_RPq5wCkPgAAAA?rs=1&pid=ImgDetMain',
  ),
];

class Comments extends StatelessWidget {
  const Comments({super.key});

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
              title: "Comments",
              color: AppColors.secondaryPaleYellow,
            ),
          ),
          gapH16,
          ListView.builder(
            itemCount: commentsDummyData.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return CommentItem(
                name: commentsDummyData[index].name,
                username: commentsDummyData[index].username,
                time: commentsDummyData[index].time,
                product: commentsDummyData[index].product,
                comment: commentsDummyData[index].comment,
                imageSrc: commentsDummyData[index].imageSrc,
                onProfilePressed: () {},
                onProductPressed: () {},
              );
            },
          ),
          gapH8,
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDefaults.padding * 0.5,
            ),
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                "View all",
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
