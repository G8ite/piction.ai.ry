import 'package:flutter/material.dart';
import 'package:piction_ai_ry/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.elevation = 4.0,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.darkBlue,
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.darkBlue),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      elevation: elevation,
      backgroundColor: AppColors.lightYellow,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
