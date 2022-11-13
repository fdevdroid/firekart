import 'package:flutter/material.dart';

import '../res/app_colors.dart';

class LineDashDivider extends StatelessWidget {
  const LineDashDivider({Key? key, this.height = 1, this.color})
      : super(key: key);

  final double height;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2.7 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color ?? AppColors.white),
              ),
            );
          }),
        );
      },
    );
  }
}
