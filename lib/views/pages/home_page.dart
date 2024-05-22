import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/models/data/destinations.dart';
import 'package:jakone_pay_flutter_ui/models/data/events.dart';
import 'package:jakone_pay_flutter_ui/models/data/menus.dart';
import 'package:jakone_pay_flutter_ui/models/menu_model.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/button_primary_widget.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/destination_item_widget.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/event_item_widget.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/general_page_widget.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/header_section_content_widget.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/menu_item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget stackHeaderWidget() => Container(
          height: 200,
          width: kFullWidth,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
              gradient: LinearGradient(
                  colors: [kPrimaryColor, kSecondaryColor],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter)),
        );

    Widget headerNoitificationHistory() => Container(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          margin: const EdgeInsets.only(top: 40),
          child: Row(children: [
            Image.asset('assets/images/logo_jakarta.png', width: 150),
            const Expanded(child: SizedBox()),
            Row(children: [
              Image.asset('assets/images/ic_history.png', width: 40),
              Image.asset('assets/images/ic_notification.png', width: 40),
            ]),
          ]),
        );

    Widget contentList() {
      Widget userWidget() => Container(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            margin: const EdgeInsets.only(top: 10),
            child: Row(children: [
              Image.asset('assets/images/ic_user.png', width: 40),
              const SizedBox(
                width: kDefaultMargin,
              ),
              const Expanded(
                  child: Text(
                'Good morning,\nGuest',
                style: TextStyle(
                    fontSize: 18,
                    color: kWhiteColor,
                    height: 1.3,
                    fontWeight: FontWeight.w700),
              )),
            ]),
          );

      Widget userBalance() => Container(
            margin: const EdgeInsets.only(
                top: 20, left: kDefaultPadding * 2, right: kDefaultPadding * 2),
            height: 85,
            decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(kDefaultMargin),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5))
                ]),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                width: 11.0,
                margin: const EdgeInsets.only(right: kDefaultMargin),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultMargin),
                      bottomLeft: Radius.circular(kDefaultMargin)),
                  gradient: LinearGradient(
                      colors: [kTertiaryColor, kSecondaryColor],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Balance Account',
                      style: TextStyle(fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Rp 0',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '-',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              ButtonPrimaryWidget(
                onPressed: () {},
                text: "Top Up",
                width: 70,
                radius: 4,
                height: 40,
                fontSize: 14,
              ),
              const SizedBox(width: 8)
            ]),
          );

      Widget menuItem() => Container(
          margin: const EdgeInsets.only(top: kDefaultMargin),
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (MenuModel item in menus)
                MenuItemWidget(
                    image: item.image ?? '',
                    title: item.name ?? '',
                    onTap: () {})
            ],
          ));

      Widget carouselItem() => Container(
            margin: const EdgeInsets.only(top: 20, bottom: 10),
            height: 95,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (int i = 0; i < 2; i++)
                    Padding(
                        padding: EdgeInsets.only(
                            left: i == 0 ? kDefaultPadding * 2 : 0,
                            right: i == 1 ? kDefaultPadding * 2 : 0),
                        child: Image.asset('assets/images/img_carousel.png',
                            width: 298)),
                ],
              ),
            ),
          );

      Widget destinationWidget() => Column(
            children: [
              HeaderSectionContenWidget(
                imageLeading: 'assets/images/ic_landmark.png',
                title: "Let's Go with Jakarta Tourist Pass",
                subtitle: "a place not to be missed",
                onPressedViewAll: () {},
              ),
              SizedBox(
                height: 180,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: kDefaultPadding * 2),
                      margin: const EdgeInsets.only(right: kDefaultMargin),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Did You\nKnow ?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                              textScaler: TextScaler.linear(1.2),
                            ),
                            Image.asset('assets/images/img_map.png', width: 60)
                          ]),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (int i = 0; i < destinations.length; i++)
                              Container(
                                margin: EdgeInsets.only(
                                    right: i != destinations.length - 1
                                        ? 0
                                        : kDefaultMargin * 2),
                                child: DestinationItemWidget(
                                    destinationModel: destinations[i]),
                              )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );

      Widget eventsWidget() => Container(
            margin: const EdgeInsets.only(bottom: 90),
            child: Column(
              children: [
                HeaderSectionContenWidget(
                  imageLeading: 'assets/images/ic_calender.png',
                  title: "Events in Jakarta",
                  subtitle: "don't miss the current events",
                  onPressedViewAll: () {},
                ),
                SizedBox(
                  height: 170,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        for (int i = 0; i < events.length; i++)
                          Container(
                              padding: EdgeInsets.only(
                                  left: i == 0 ? kDefaultPadding * 2 : 0,
                                  right: i == events.length - 1
                                      ? kDefaultPadding * 2
                                      : 0),
                              margin: EdgeInsets.only(
                                  right: i == events.length - 1
                                      ? 0
                                      : kDefaultMargin),
                              child: EventItemWidget(eventModel: events[i]))
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );

      return Container(
        margin: const EdgeInsets.only(top: 95),
        child: SingleChildScrollView(
            child: Stack(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              userWidget(),
              userBalance(),
              menuItem(),
              carouselItem(),
              destinationWidget(),
              eventsWidget(),
            ]),
          ],
        )),
      );
    }

    return GeneralPageWidget(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 55,
        color: kWhiteColor,
        notchMargin: 3,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/images/ic_home.png', width: 26),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/images/ic_profile.png', width: 26),
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(50),
        child: Card(
          shape: const CircleBorder(),
          elevation: 5,
          child: Container(
            height: 65.0,
            width: 65.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                  colors: [kTertiaryColor, kSecondaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              border: Border.all(color: kWhiteColor, width: 2.0),
            ),
            child: Center(
                child: Image.asset('assets/images/logo_qris.png', width: 45)),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      child: Stack(children: [
        stackHeaderWidget(),
        contentList(),
        headerNoitificationHistory(),
      ]),
    );
  }
}
