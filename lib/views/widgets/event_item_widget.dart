import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/models/event_model.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/button_primary_widget.dart';

class EventItemWidget extends StatelessWidget {
  final EventModel eventModel;
  final Function? onTap;
  const EventItemWidget({super.key, required this.eventModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 140,
          width: 200,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [kTertiaryColor, kSecondaryColor, kWhiteColor])),
          child: Image.asset(eventModel.image!, fit: BoxFit.cover),
        ),
        ButtonPrimaryWidget(
          onPressed: () {
            if (onTap != null) onTap!();
          },
          text: "More information",
          width: 100,
          height: 18,
          fontSize: 10,
        ),
      ],
    );
  }
}
