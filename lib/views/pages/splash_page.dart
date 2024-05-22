import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';
import 'package:jakone_pay_flutter_ui/views/pages/guest_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget mainContentSplash() => Container(
        height: kFullHeight,
        width: kFullWidth,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [kPrimaryColor, kSecondaryColor],
                end: Alignment.topRight,
                begin: Alignment.bottomLeft)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child:
                    Image.asset('assets/images/logo_jakarta.png', width: 280)),
            Container(
              margin: const EdgeInsets.only(bottom: kDefaultMargin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo_ojk.png', width: 50),
                  const SizedBox(width: kDefaultPadding),
                  Image.asset('assets/images/logo_lps.png', width: 50),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: kDefaultMargin),
              child: const Text(
                'powered by Bank DKI\n2023',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 12,
                    height: 1.5,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ));

    return Scaffold(
        body: FutureBuilder(
      future: Future.delayed(const Duration(seconds: 3)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const GuestPage();
        }
        return Stack(children: [
          mainContentSplash(),
          Positioned(
              left: 50,
              child: Image.asset('assets/images/pattern_splash_top_1.png',
                  width: 150)),
          Positioned(
              child: Image.asset('assets/images/pattern_splash_top_2.png',
                  width: 170)),
          Positioned(
              bottom: 70,
              right: 0,
              child: Image.asset('assets/images/pattern_splash_bottom_1.png',
                  width: 150)),
          Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/pattern_splash_bottom_2.png',
                  width: 92))
        ]);
      },
    ));
  }
}
