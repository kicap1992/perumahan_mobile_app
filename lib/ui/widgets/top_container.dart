import 'package:flutter/material.dart';

import '../../app/themes/app_colors.dart';
import '../../app/themes/app_text.dart';

class MyTopWidget extends StatelessWidget {
  const MyTopWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    // required this.lastUpdate,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String subtitle;
  // final String lastUpdate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 5,
            blurRadius: 7,
            // offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: mainColor.withAlpha(100),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  // spreadRadius: 5,
                  // blurRadius: 7,
                  // offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Icon(
              icon,
              color: backgroundColor,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: boldTextStyle.copyWith(
              fontSize: 16,
              color: backgroundColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            style: boldTextStyle.copyWith(
              fontSize: 13,
              color: backgroundColor,
            ),
          ),
          const SizedBox(height: 5),
          // Text(
          //   lastUpdate,
          //   style: regularTextStyle.copyWith(
          //     fontSize: 11,
          //     color: backgroundColor,
          //   ),
          // ),
        ],
      ),
    );
  }
}
