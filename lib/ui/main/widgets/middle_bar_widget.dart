import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MiddleBarWidget extends StatelessWidget {
  const MiddleBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => {},
          child: const Row(
            children: [
              Icon(Icons.check_box_outline_blank_rounded),
              SizedBox(width: 8),
              Text(
                'Сохранять',
                style: TextStyle(
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => {},
          child: const Text(
            'Как это работает?',
          ),
        ),
      ],
    );
  }
}
