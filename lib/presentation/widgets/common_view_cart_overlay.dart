import 'package:flutter/material.dart';

import '../res/app_colors.dart';
import '../res/string_constants.dart';

class CommonViewCartOverlayArgs {
  String title;
  bool isCartEmpty;
  VoidCallback? onCartTap;

  CommonViewCartOverlayArgs(
      {required this.title, required this.isCartEmpty, this.onCartTap});
}

class CommonViewCartOverlay extends StatelessWidget {
  const CommonViewCartOverlay({Key? key, required this.args}) : super(key: key);

  final CommonViewCartOverlayArgs args;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: const Duration(microseconds: 3000),
      firstChild: Container(
        height: 50,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              args.title,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: args.onCartTap,
              child: Row(
                children: <Widget>[
                  Icon(Icons.shopping_cart, color: AppColors.white),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    StringsConstants.viewCart,
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      secondChild: const SizedBox(),
      crossFadeState: args.isCartEmpty
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
    );
  }
}
