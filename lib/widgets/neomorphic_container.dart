import 'package:flutter/material.dart';
import '../theme/colors.dart';

class NeomorphicContainer extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final EdgeInsets padding;

  const NeomorphicContainer({
    Key? key,
    required this.child,
    this.borderRadius = 20.0,
    this.padding = const EdgeInsets.all(20.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(borderRadius),
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
      child: child,
    );
  }
}
