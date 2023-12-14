import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarItem extends StatelessWidget {
  const NavBarItem({super.key, required this.selected, required this.svgPath, this.icon});
  final bool selected;
  final String svgPath;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    Color color = selected ? Colors.white : Colors.white70.withOpacity(0.3);
    return Tab(
      child: SizedBox(
        width: 40,
        child: icon != null
            ? Icon(icon, size: 30, color: color, weight: 0.3)
            : Transform.scale(
                scale: 1.7,
                child: SvgPicture.asset(svgPath, colorFilter: ColorFilter.mode(color, BlendMode.srcIn)),
              ),
      ),
    );
  }
}
