import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seventh_word/config/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.anchorGray,
      centerTitle: true,
      title: SvgPicture.asset(
        'lib/config/images/AppIcon.svg',
        width: 70,
      ),
    );
  }
}
