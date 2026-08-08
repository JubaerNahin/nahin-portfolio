import 'package:flutter/material.dart';

class ToggleSelectionIcon extends StatelessWidget {
  final bool isSelected;
  final double size;
  final Color selectedColor;
  final Color unselectedBorderColor;

  const ToggleSelectionIcon({
    super.key,
    required this.isSelected,
    this.size = 24.0,
    this.selectedColor = const Color(0xFF4CAF50), // green
    this.unselectedBorderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? selectedColor : unselectedBorderColor,
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
        child: Container(
          width: size * 0.5,
          height: size * 0.5,
          decoration: BoxDecoration(
            color: selectedColor,
            shape: BoxShape.circle,
          ),
        ),
      )
          : null,
    );
  }
}