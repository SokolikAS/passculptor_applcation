import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required this.result,
    required this.onTap,
  });

  final ValueNotifier<String> result;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: result,
      builder: (_, result, __) => GestureDetector(
        onTap: () => onTap(),
        child: Container(
          width: double.maxFinite,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1000),
            color: AppColors.primaryColor,
          ),
          child: Text(
            result,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
