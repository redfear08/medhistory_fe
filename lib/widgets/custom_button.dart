import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.lightShadow,
              offset: Offset(-5, -5),
              blurRadius: 10,
            ),
            BoxShadow(
              color: AppColors.darkShadow,
              offset: Offset(5, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
