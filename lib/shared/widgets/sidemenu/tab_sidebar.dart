import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants/config.dart';
import '../../constants/defaults.dart';
import '../../constants/ghaps.dart';
import 'icon_tile.dart';
import 'theme_icon_tile.dart';

class TabSidebar extends StatelessWidget {
  const TabSidebar({
    super.key,
    required this.selectedIndex,
    required this.onChanged,
  });

  final int selectedIndex;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    // selectedIndex: 0 => Home
    // selectedIndex: 1, 2, 3 => Products
    // selectedIndex: 4, 5 => Customers
    // selectedIndex: 6 => Shop
    // selectedIndex: 7, 8, 9, 10 => Income
    // selecedIndex: 11 => Promote
    final idx = selectedIndex == 0
        ? 0
        : selectedIndex >= 1 && selectedIndex <= 3
            ? 1
            : selectedIndex >= 4 && selectedIndex <= 5
                ? 2
                : selectedIndex == 6
                    ? 3
                    : selectedIndex >= 7 && selectedIndex <= 10
                        ? 4
                        : selectedIndex == 11
                            ? 5
                            : 0;
    return Container(
      width: 96,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDefaults.padding,
                vertical: AppDefaults.padding * 1.5),
            child: SvgPicture.asset(AppConfig.logo),
          ),
          gapH16,
          Expanded(
            child: SizedBox(
              width: 48,
              child: ListView(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconTile(
                    isActive: idx == 0,
                    activeIconSrc: "assets/icons/home_filled.svg",
                    inactiveIconSrc: "assets/icons/home_light.svg",
                    onPressed: () {
                      onChanged(0);
                    },
                  ),
                  gapH4,
                  IconTile(
                    isActive: idx == 1,
                    activeIconSrc: "assets/icons/diamond_filled.svg",
                    inactiveIconSrc: "assets/icons/diamond_light.svg",
                    onPressed: () {
                      onChanged(1);
                    },
                  ),
                  gapH4,
                  IconTile(
                    isActive: idx == 2,
                    activeIconSrc: "assets/icons/profile_circled_filled.svg",
                    inactiveIconSrc: "assets/icons/profile_circled_light.svg",
                    onPressed: () {
                      onChanged(4);
                    },
                  ),
                  gapH4,
                  IconTile(
                    isActive: idx == 3,
                    activeIconSrc: "assets/icons/store_light.svg",
                    inactiveIconSrc: "assets/icons/store_filled.svg",
                    onPressed: () {
                      onChanged(6);
                    },
                  ),
                  gapH4,
                  IconTile(
                    isActive: idx == 4,
                    activeIconSrc: "assets/icons/pie_chart_filled.svg",
                    inactiveIconSrc: "assets/icons/pie_chart_light.svg",
                    onPressed: () {
                      onChanged(7);
                    },
                  ),
                  gapH4,
                  IconTile(
                    isActive: idx == 5,
                    activeIconSrc: "assets/icons/promotion_filled.svg",
                    inactiveIconSrc: "assets/icons/promotion_light.svg",
                    onPressed: () {
                      onChanged(11);
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              IconTile(
                isActive: false,
                activeIconSrc: "assets/icons/arrow_forward_light.svg",
                onPressed: () {},
              ),
              const SizedBox(
                width: 48,
                child: Divider(thickness: 2),
              ),
              gapH4,
              IconTile(
                isActive: false,
                activeIconSrc: "assets/icons/help_light.svg",
                onPressed: () {},
              ),
              gapH4,
              ThemeIconTile(
                isDark: false,
                onPressed: () {},
              ),
              gapH16,
            ],
          )
        ],
      ),
    );
  }
}
