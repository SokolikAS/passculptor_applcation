import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DirectoryButton extends StatelessWidget {
  const DirectoryButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => onPressed(),
      backgroundColor: AppColors.backgroundColor,
      elevation: 0,
      mini: true,
      child: const Icon(
        Icons.menu_rounded,
        size: 30,
      ),
    );
  }
}
