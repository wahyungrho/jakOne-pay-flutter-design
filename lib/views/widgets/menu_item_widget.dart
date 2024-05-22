import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';

class MenuItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final Function? onTap;
  const MenuItemWidget(
      {super.key, required this.image, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (onTap != null) onTap!();
          },
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: const LinearGradient(
                    colors: [kYellowColorLight, kWhiteColor],
                    end: Alignment.bottomCenter,
                    begin: Alignment.topCenter),
                border: const GradientBoxBorder(
                    gradient: LinearGradient(
                        colors: [kYellowColor, kSecondaryColor],
                        end: Alignment.bottomCenter,
                        begin: Alignment.topCenter))),
            height: 62,
            width: 62,
            child: Image.asset(image),
          ),
        ),
        Container(
          width: 62,
          margin: const EdgeInsets.only(top: 4),
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 10),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
