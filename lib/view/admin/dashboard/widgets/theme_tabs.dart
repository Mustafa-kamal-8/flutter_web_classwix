import 'package:flutter/material.dart';

import '../../../../shared/constants/defaults.dart';
import '../../../../shared/widgets/tabs/tab_with_icon.dart';
import '../../../../theme/app_colors.dart';

class ThemeTabs extends StatefulWidget {
  const ThemeTabs({super.key});

  @override
  State<ThemeTabs> createState() => _ThemeTabsState();
}

class _ThemeTabsState extends State<ThemeTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgLight,
        borderRadius: BorderRadius.circular(AppDefaults.borderRadius * 5),
      ),
      child: TabBar(
        controller: _tabController,
        dividerHeight: 0,
        splashBorderRadius: BorderRadius.circular(AppDefaults.borderRadius * 5),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDefaults.padding * 0.5,
          vertical: AppDefaults.padding * 0.5,
        ),
        indicator: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(AppDefaults.borderRadius * 5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 2,
            )
          ],
          color: AppColors.bgSecondayLight,
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          TabWithIcon(
            isSelected: _selectedIndex == 0,
            title: 'Light',
            iconSrc: 'assets/icons/sun_filled.svg',
          ),
          TabWithIcon(
            isSelected: _selectedIndex == 1,
            title: 'Dark',
            iconSrc: 'assets/icons/moon_light.svg',
          ),
        ],
      ),
    );
  }
}
