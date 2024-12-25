import 'package:flutter/material.dart';

import '../../../../responsive.dart';
import '../../../../shared/constants/defaults.dart';
import '../../../../shared/constants/ghaps.dart';
import '../../../../shared/widgets/sidemenu/customer_info.dart';
import '../../../../shared/widgets/sidemenu/menu_tile.dart';

class ProfileActionsPopup extends StatefulWidget {
  const ProfileActionsPopup({
    super.key,
    required this.position,
    required this.size,
  });

  final Offset position;
  final Size size;

  @override
  State<ProfileActionsPopup> createState() => _ProfileActionsPopupState();
}

class _ProfileActionsPopupState extends State<ProfileActionsPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool canPop = true;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInCubic),
    );
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animationController.forward();
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
        onTap: () {
          onClosePopup();
        },
        child: Stack(
          children: [
            Positioned(
              right: (Responsive.isMobile(context))
                  ? null
                  : (MediaQuery.of(context).size.width - widget.position.dx) -
                      (widget.size.width + 30),
              top: (Responsive.isMobile(context))
                  ? null
                  : widget.size.height + widget.position.dy,
              bottom: (Responsive.isMobile(context))
                  ? (MediaQuery.of(context).size.height -
                      ((widget.size.height * 3) + widget.position.dy))
                  : null,
              child: AnimatedBuilder(
                animation: _animationController.view,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _animation.value,
                    alignment: (Responsive.isMobile(context))
                        ? Alignment.bottomCenter
                        : Alignment.topRight,
                    child: child,
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    width: 280,
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                      vertical: AppDefaults.padding,
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: AppDefaults.padding,
                      vertical: AppDefaults.padding * 0.8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        AppDefaults.borderRadius * 2,
                      ),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MenuTile(
                          title: "Profile",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        MenuTile(
                          title: "Edit Profile",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        gapH4,
                        const Divider(),
                        gapH4,
                        MenuTile(
                          title: "Analytics",
                          activeIconSrc: "assets/icons/bar_chart_filled.svg",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        MenuTile(
                          title: "Affiliate center",
                          activeIconSrc: "assets/icons/ticket_light.svg",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        MenuTile(
                          title: "Explore authors",
                          activeIconSrc: "assets/icons/grid_light.svg",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        gapH4,
                        const Divider(),
                        gapH4,
                        MenuTile(
                          isSpecial: true,
                          title: "Upgrade to Pro",
                          activeIconSrc: "assets/icons/leaderboard_filled.svg",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        gapH4,
                        const Divider(),
                        gapH4,
                        MenuTile(
                          title: "Account settings",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        MenuTile(
                          title: "Log out",
                          onPressed: () {
                            onClosePopup();
                          },
                        ),
                        if (Responsive.isMobile(context))
                          Column(
                            children: [
                              gapH4,
                              const Divider(),
                              gapH4,
                              CustomerInfo(
                                showCancel: true,
                                name: 'Tran Mau Tri Tam',
                                designation: 'Visual Designer',
                                imageSrc:
                                    'https://cdn.create.vista.com/api/media/small/339818716/stock-photo-doubtful-hispanic-man-looking-with-disbelief-expression',
                                onCancelPressed: () {
                                  onClosePopup();
                                },
                              ),
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onClosePopup() {
    _animationController.reverse().whenComplete(() {
      Navigator.pop(context);
    });
  }
}
