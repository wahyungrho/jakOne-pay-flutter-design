import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';
import 'package:jakone_pay_flutter_ui/views/pages/home_page.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/button_primary_widget.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/general_page_widget.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({super.key});

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  PageController pageController = PageController(initialPage: 1);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // linear top to bottom gradient
    final Shader linearGradient = const LinearGradient(
      colors: <Color>[kTertiaryColor, kSecondaryColor],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));

    Widget headerLanguageAndJakCardWidget() => Container(
          margin: const EdgeInsets.only(top: 30),
          child: Row(children: [
            Row(children: [
              Image.asset('assets/images/ic_indonesian.png', width: 35),
              Image.asset('assets/images/ic_english.png', width: 35),
            ]),
            const Expanded(child: SizedBox()),
            Image.asset('assets/images/ic_jakcard.png', width: 80)
          ]),
        );

    Widget carouselMonasWidget() => Container(
          margin: const EdgeInsets.only(bottom: 35),
          child: SizedBox(
            height: 460,
            child: PageView(
              controller: pageController,
              physics: const BouncingScrollPhysics(),
              onPageChanged: (value) {
                setState(() {
                  pageController = PageController(initialPage: value);
                });
              },
              children: [
                for (int i = 0; i < 3; i++)
                  Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(
                              top: 90, bottom: kDefaultMargin),
                          child: Image.asset('assets/images/img_monas.png',
                              width: 280, height: 290, fit: BoxFit.cover)),
                      Text(
                        'Explore Jakarta with Jakarta Tourist Pass',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            foreground: Paint()..shader = linearGradient),
                      ),
                      const SizedBox(height: kDefaultMargin),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int j = 0; j < 3; j++)
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: j == i
                                        ? kSecondaryColor.withOpacity(0.7)
                                        : kSecondaryColor.withOpacity(0.3)),
                              )
                          ]),
                    ],
                  ),
              ],
            ),
          ),
        );

    Widget primaryButtonAction() => ButtonPrimaryWidget(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const HomePage()));
        },
        text: "Continue as a Guest");

    Widget secondaryButtonAction() => Container(
          width: 280,
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: const GradientBoxBorder(
                  width: 2,
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kSecondaryColor, kTertiaryColor]))),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const HomePage()));
            },
            style: TextButton.styleFrom(
                foregroundColor: kTertiaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: const Text(
              "Continue as a Guest",
              style: TextStyle(fontSize: 24),
            ),
          ),
        );

    return GeneralPageWidget(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(children: [
              headerLanguageAndJakCardWidget(),
              carouselMonasWidget(),
              primaryButtonAction(),
              const SizedBox(height: kDefaultMargin),
              secondaryButtonAction()
            ]),
          ),
        ],
      ),
    ));
  }
}
