import 'package:flutter/material.dart';
class DashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const DashedLine({
    this.height = 1,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (constraints.constrainWidth() / (2 * dashWidth)).floor();
        return Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
