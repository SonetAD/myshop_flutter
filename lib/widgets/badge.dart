import 'package:flutter/material.dart';

class CustomBadge extends StatelessWidget {
  final Widget child;
  final String label;
  final Color color;
  final double size;

  const CustomBadge({
    required this.child,
    required this.label,
    this.color = Colors.red,
    this.size = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 15),
      child: Stack(
        children: [
          child,
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
