import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:seventh_word/config/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Palette.pebbleBlack),
      elevation: 0,
      centerTitle: true,
      title: SvgPicture.asset(
        'lib/config/images/AppBarLogo.svg',
        width: 50,
      ),
      shape: Border(bottom: BorderSide(color: Palette.cloudGray, width: 0.75)),
    );
  }
}
