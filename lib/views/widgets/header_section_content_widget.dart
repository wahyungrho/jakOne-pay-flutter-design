import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';

class HeaderSectionContenWidget extends StatelessWidget {
  final String? imageLeading;
  final String? title;
  final String? subtitle;
  final Function? onPressedViewAll;
  const HeaderSectionContenWidget(
      {super.key,
      this.imageLeading,
      this.title,
      this.subtitle,
      this.onPressedViewAll});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultMargin),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(50)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [kTertiaryColor, kSecondaryColor])),
            child: Center(
                child: Image.asset(
                    imageLeading ?? 'assets/images/ic_landmark.png',
                    width: 20)),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w700),
                ),
                Text(subtitle ?? ''),
                Container(
                  width: 37,
                  margin: const EdgeInsets.only(top: 4),
                  height: 2,
                  color: kSecondaryColor,
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              if (onPressedViewAll != null) onPressedViewAll!();
            },
            style: TextButton.styleFrom(foregroundColor: kBlackColor),
            child: const Text(
              'View all',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
    );
  }
}
