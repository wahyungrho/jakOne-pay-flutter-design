import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';

class GeneralPageWidget extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  const GeneralPageWidget(
      {super.key,
      required this.child,
      this.appBar,
      this.bottomNavigationBar,
      this.floatingActionButton,
      this.floatingActionButtonLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: appBar,
      body: SizedBox(
        height: kFullHeight,
        width: kFullWidth,
        child: Stack(children: [
          child,
          Positioned(
              bottom: 55,
              right: 0,
              child: GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Help'),
                            content: const Text('Feature is under development'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'))
                            ],
                          );
                        });
                  },
                  child: Image.asset('assets/images/ic_jakcard_help.png',
                      width: 90))),
        ]),
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );
  }
}
