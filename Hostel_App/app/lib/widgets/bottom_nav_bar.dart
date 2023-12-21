import 'package:app/utilities/nav_bar_item.dart';
import 'package:app/utilities/palette.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  const CustomNavBar({super.key, required this.tabController});
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 0,
      left: 0,
      child: SizedBox(
        width: size.width,
        height: 80,
        child: Stack(
          children: [
            const ClippedBar(),
            NavButtons(tabController: tabController),
            const CustomFloatingActionButton(),
          ],
        ),
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: Container(
        height: 48,
        width: 48,
        decoration: const BoxDecoration(shape: BoxShape.circle),
        child: FittedBox(
            child: FloatingActionButton(
          onPressed: () {},
          shape: const CircleBorder(),
          backgroundColor: kPrimaryButtonColor,
          child: Transform.scale(
              scale: 1.5,
              child: const Icon(Icons.add, color: Colors.white, grade: 5)),
        )),
      ),
    );
  }
}

class NavButtons extends StatefulWidget {
  const NavButtons({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<NavButtons> createState() => _NavButtonsState();
}

class _NavButtonsState extends State<NavButtons> {
  late final TabController _tabController = widget.tabController;
  int _selectedTabIndex = 0;

  void onTabBarTap(int index) {
    if (index != 2) return setState(() => _selectedTabIndex = index);
    return setState(() => _tabController.index = _tabController.previousIndex);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(12),
      height: 80,
      width: size.width,
      child: TabBar(
          controller: _tabController,
          dividerHeight: 0,
          onTap: onTabBarTap,
          tabs: [
            NavBarItem(
                selected: _selectedTabIndex == 0,
                svgPath: "assets/svg/nav/Home.svg"),
            NavBarItem(
                selected: _selectedTabIndex == 1,
                svgPath: "",
                icon: Icons.search_sharp),
            AbsorbPointer(child: SizedBox(width: size.width * 0.1, height: 80)),
            NavBarItem(
                selected: _selectedTabIndex == 3,
                svgPath: "assets/svg/nav/Calendar.svg"),
            NavBarItem(
                selected: _selectedTabIndex == 4,
                svgPath: "assets/svg/nav/Cards.svg"),
          ]),
    );
  }
}

class ClippedBar extends StatelessWidget {
  const ClippedBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Clipper(diameter: 60),
      child: Container(
        margin: const EdgeInsets.all(12),
        height: 80,
        decoration: BoxDecoration(
          color: kNavBarColor,
          borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(15), right: Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(width: 10, height: 80),
            const SizedBox(width: 10, height: 80),
            ShaderMask(
              shaderCallback: (Rect rect) {
                return RadialGradient(
                  colors: [
                    const Color(0xffFF7F37).withOpacity(0.5),
                    kPrimaryButtonColor.withOpacity(0.3),
                    Colors.transparent,
                  ],
                ).createShader(rect);
              },
              blendMode: BlendMode.color,
              child: Container(
                width: 80,
                height: 80,
                foregroundDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    radius: 0.9,
                    // radius: 0.4,
                    // center: Alignment.center,
                    // focal: Alignment.bottomCenter,
                    tileMode: TileMode.clamp,
                    stops: const [0, 0, 0.9],
                    colors: [
                      const Color(0xffFF7F37).withOpacity(0.5),
                      kPrimaryButtonColor.withOpacity(0.5),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10, height: 80),
            const SizedBox(width: 10, height: 80),
          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  final double diameter;
  Clipper({required this.diameter});

  @override
  Path getClip(Size size) {
    final path = Path();
    final halfWidth = size.width / 2;
    final radius = diameter / 2;

    final double x1 = halfWidth - radius - 20 - 40;
    final double x2 = halfWidth - radius;
    final double x3 = halfWidth + radius;
    final double x4 = halfWidth + radius + 20 + 40;

    path.moveTo(0, 0);
    path.lineTo(x1, 0);

    path.quadraticBezierTo(x2, 0, x2, 25);
    path.arcToPoint(Offset(x3, 25),
        radius: Radius.circular(radius), clockwise: false);
    path.quadraticBezierTo(x3, 0, x4 + 20, 0);

    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
