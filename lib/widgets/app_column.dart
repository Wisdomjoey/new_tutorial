import 'package:flutter/material.dart';
import 'package:new_tutproj/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_text.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        bigText(text: text, size: Dimensions.font26,),
        SizedBox(
          height: Dimensions.sizedBoxHeight10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: AppColors.mainColor,
                        size: 15,
                      )),
            ),
            SizedBox(
              width: Dimensions.sizedBoxWidth10,
            ),
            smallText(text: '4.5'),
            SizedBox(
              width: Dimensions.sizedBoxWidth10,
            ),
            smallText(text: '1287'),
            SizedBox(
              width: Dimensions.sizedBoxWidth10,
            ),
            smallText(text: 'comments')
          ],
        ),
        SizedBox(
          height: Dimensions.sizedBoxHeight20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconText(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: AppColors.iconColor1),
            IconText(
                icon: Icons.location_on,
                text: '1.7km',
                iconColor: AppColors.mainColor),
            IconText(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
