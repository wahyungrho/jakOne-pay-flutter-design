import 'package:flutter/material.dart';
import 'package:jakone_pay_flutter_ui/models/destination_model.dart';
import 'package:jakone_pay_flutter_ui/shared/themes.dart';
import 'package:jakone_pay_flutter_ui/views/widgets/button_primary_widget.dart';

class DestinationItemWidget extends StatelessWidget {
  final DestinationModel destinationModel;
  final Function? onTap;
  const DestinationItemWidget(
      {super.key, required this.destinationModel, this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 180,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Image.asset(destinationModel.image!, width: kFullWidth)),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Text(
                    destinationModel.name!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Expanded(child: SizedBox()),
                      ButtonPrimaryWidget(
                        onPressed: () {
                          if (onTap != null) onTap!();
                        },
                        text: "Detail",
                        width: 55,
                        height: 18,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
