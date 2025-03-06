import 'package:code_generator_app/ui/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MiddleBarWidget extends StatelessWidget {
  const MiddleBarWidget({
    super.key,
    required this.onSaveCheckTap,
    required this.onGuideTap,
    required this.doSave,
  });

  final ValueNotifier<bool> doSave;
  final VoidCallback onSaveCheckTap;
  final VoidCallback onGuideTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => onSaveCheckTap(),
          child: Row(
            children: [
              //TODO Заменить чекер на свой виджет, сделать все элегантнее
              ValueListenableBuilder(
                valueListenable: doSave,
                builder: (_, doSave, __) => SizedBox.square(
                  dimension: 24,
                  child: Checkbox(
                    value: doSave,
                    onChanged: (_) => onSaveCheckTap(),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ValueListenableBuilder(
                valueListenable: doSave,
                builder: (_, doSave, __) => Text(
                  'Сохранять',
                  style: TextStyle(
                    color: doSave ? AppColors.white : AppColors.grayColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () => onGuideTap(),
          child: const Text(
            'Как это работает?',
          ),
        ),
      ],
    );
  }
}
