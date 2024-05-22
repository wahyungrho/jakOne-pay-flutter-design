import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';

class ButtonPrimaryWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  const ButtonPrimaryWidget(
      {super.key,
      required this.onPressed,
      this.width,
      this.height,
      this.radius,
      required this.text,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 280,
      height: height ?? 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 50),
          gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kTertiaryColor, kSecondaryColor])),
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 50),
                side: const BorderSide(color: kYellowColor, width: 2))),
        child: Text(
          text,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: fontSize ?? 24,
          ),
        ),
      ),
    );
  }
}
