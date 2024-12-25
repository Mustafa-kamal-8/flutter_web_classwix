import 'package:core_dashboard/shared/constants/defaults.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../responsive.dart';
import '../../../theme/app_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.drawerKey});

  final GlobalKey<ScaffoldState> drawerKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDefaults.padding,
        vertical: 24.5,
        // vertical: AppDefaults.padding,
      ),
      color: AppColors.bgSecondayLight,
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            if (Responsive.isMobile(context))
              IconButton(
                onPressed: () {
                  drawerKey.currentState!.openDrawer();
                },
                icon: Badge(
                  isLabelVisible: false,
                  child: SvgPicture.asset(
                    "assets/icons/menu_light.svg",
                  ),
                ),
              ),
            if (Responsive.isMobile(context))
              IconButton(
                onPressed: () {},
                icon: Badge(
                  isLabelVisible: false,
                  child: SvgPicture.asset("assets/icons/search_filled.svg"),
                ),
              ),
            // if (!Responsive.isMobile(context))
            // Expanded(
            //   flex: 1,
            //   child: TextFormField(
            //     // style: Theme.of(context).textTheme.labelLarge,
            //     decoration: InputDecoration(
            //       hintText: "Search...",
            //       prefixIcon: Padding(
            //         padding: const EdgeInsets.only(
            //             left: AppDefaults.padding,
            //             right: AppDefaults.padding / 2),
            //         child: SvgPicture.asset("assets/icons/search_light.svg"),
            //       ),
            //       filled: true,
            //       fillColor: Theme.of(context).scaffoldBackgroundColor,
            //       border: AppDefaults.outlineInputBorder,
            //       focusedBorder: AppDefaults.focusedOutlineInputBorder,
            //     ),
            //   ),
            // ),
            // Expanded(
            //   flex: 2,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.end,
            //     children: [
            //       if (!Responsive.isMobile(context))
            //         // IconButton(
            //         //   onPressed: () {},
            //         //   icon: Badge(
            //         //     isLabelVisible: true,
            //         //     child:
            //         //         SvgPicture.asset("assets/icons/message_light.svg"),
            //         //   ),
            //         // ),
            //         PopupMenuButton(
            //           color: Theme.of(context).scaffoldBackgroundColor,
            //           icon: Badge(
            //             child: SvgPicture.asset(
            //               "assets/icons/message_light.svg",
            //             ),
            //           ),
            //           position: PopupMenuPosition.under,
            //           offset: const Offset(0, AppDefaults.padding),
            //           itemBuilder: (context) {
            //             return [
            //               ...List.generate(
            //                 5,
            //                 (index) => PopupMenuItem(
            //                   child: ListTile(
            //                     leading: const CircleAvatar(
            //                       backgroundImage: NetworkImage(
            //                         "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression",
            //                       ),
            //                     ),
            //                     title: const Text("Notification 1"),
            //                     subtitle: const Text(
            //                       "Notification 1 description",
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                     trailing: Row(
            //                       mainAxisSize: MainAxisSize.min,
            //                       children: [
            //                         Text(
            //                           "1h",
            //                           style: Theme.of(context)
            //                               .textTheme
            //                               .bodyMedium!
            //                               .copyWith(
            //                                 color: AppColors.textGrey,
            //                               ),
            //                         ),
            //                         gapW8,
            //                         Container(
            //                           height: 8,
            //                           width: 8,
            //                           decoration: const BoxDecoration(
            //                             color: AppColors.primary,
            //                             shape: BoxShape.circle,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               PopupMenuItem(
            //                 child: Container(
            //                   height: 40,
            //                   decoration: BoxDecoration(
            //                     color: AppColors.primary,
            //                     borderRadius: BorderRadius.circular(
            //                       AppDefaults.borderRadius,
            //                     ),
            //                     border: Border.all(color: AppColors.primary),
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       "See all notifications",
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .bodyMedium!
            //                           .copyWith(color: Colors.white),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ];
            //           },
            //         ),
            //       if (!Responsive.isMobile(context)) gapW16,
            //       if (!Responsive.isMobile(context))
            //         PopupMenuButton(
            //           color: Theme.of(context).scaffoldBackgroundColor,
            //           icon: SvgPicture.asset(
            //             "assets/icons/notification_light.svg",
            //           ),
            //           position: PopupMenuPosition.under,
            //           offset: const Offset(0, AppDefaults.padding),
            //           itemBuilder: (context) {
            //             return [
            //               ...List.generate(
            //                 5,
            //                 (index) => PopupMenuItem(
            //                   child: ListTile(
            //                     leading: const CircleAvatar(
            //                       backgroundImage: NetworkImage(
            //                         "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression",
            //                       ),
            //                     ),
            //                     title: const Text("Notification 1"),
            //                     subtitle: const Text(
            //                       "Notification 1 description",
            //                       maxLines: 1,
            //                       overflow: TextOverflow.ellipsis,
            //                     ),
            //                     trailing: Row(
            //                       mainAxisSize: MainAxisSize.min,
            //                       children: [
            //                         Text(
            //                           "1h",
            //                           style: Theme.of(context)
            //                               .textTheme
            //                               .bodyMedium!
            //                               .copyWith(
            //                                 color: AppColors.textGrey,
            //                               ),
            //                         ),
            //                         gapW8,
            //                         Container(
            //                           height: 8,
            //                           width: 8,
            //                           decoration: const BoxDecoration(
            //                             color: AppColors.primary,
            //                             shape: BoxShape.circle,
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               PopupMenuItem(
            //                 child: Container(
            //                   height: 40,
            //                   decoration: BoxDecoration(
            //                     color: AppColors.primary,
            //                     borderRadius: BorderRadius.circular(
            //                       AppDefaults.borderRadius,
            //                     ),
            //                     border: Border.all(color: AppColors.primary),
            //                   ),
            //                   child: Center(
            //                     child: Text(
            //                       "See all notifications",
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .bodyMedium!
            //                           .copyWith(color: Colors.white),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //             ];
            //           },
            //         ),
            //       if (!Responsive.isMobile(context)) gapW16,
            //       if (!Responsive.isMobile(context))
            //         AppPopupMenu(
            //           child: CircleAvatar(
            //             key: GlobalKey(debugLabel: 'ProfileAvatar'),
            //             backgroundImage: const NetworkImage(
            //               "https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression",
            //             ),
            //           ),
            //           popUpBuilder: (context, position, size) {
            //             return ProfileActionsPopup(
            //               position: position,
            //               size: size,
            //             );
            //           },
            //         ),
            const Spacer(),
            // TextButton(
            //   onPressed: () => context.go('/sign-in'),
            //   style: TextButton.styleFrom(
            //     foregroundColor: Theme.of(context).textTheme.titleLarge!.color,
            //     minimumSize: const Size(80, 56),
            //     shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.all(
            //         Radius.circular(AppDefaults.borderRadius),
            //       ),
            //     ),
            //     textStyle: const TextStyle(
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            //   child: const Text("Sign In"),
            // ),
            const SizedBox(height: 55),
            // gapW16,
            // ElevatedButton(
            //   onPressed: () => context.go('/register'),
            //   child: const Text("Sign Up"),
            // ),
            // ],
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
