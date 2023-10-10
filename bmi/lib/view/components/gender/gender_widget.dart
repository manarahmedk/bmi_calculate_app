import 'package:bmi/view/components/background/background_widget.dart';
import 'package:bmi/view/components/widgets/text_custom.dart';
import 'package:bmi/view_model/utils/colors.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onTap;
  final bool isSelected;

  GenderWidget({required this.icon, required this.text,this.isSelected=false,this.onTap});

  @override
  Widget build(BuildContext context) {
    return BackgroungWidget(
      onTap: onTap,
      isSelected: isSelected,
      child: Column(
        children: [
          Icon(
            icon,
            size: 60,
            color: AppColors.white,
          ),
          const SizedBox(
            height: 12,
          ),
          TextCustom(
            text: text,
            fontSize: 20,
            color: AppColors.grey,
          ),
        ],
      ),
    );
  }
}
