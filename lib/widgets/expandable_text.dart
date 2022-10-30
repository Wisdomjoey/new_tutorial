import 'package:flutter/material.dart';
import 'package:new_tutproj/widgets/small_text.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class ExpandableText extends StatefulWidget {
  final String text;

  const ExpandableText({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 5.93;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? smallText(text: firstHalf, size: Dimensions.font16, color: AppColors.paraColor, height: 1.6,)
          : Column(
              children: [
                smallText(
                    text: hiddenText
                        ? ('$firstHalf...')
                        : (firstHalf + secondHalf), size: Dimensions.font16, color: AppColors.paraColor, height: 1.6,),
                InkWell(
                  onTap: (() {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  }),
                  child: Row(
                    children: [
                      smallText(
                        text: hiddenText ? 'Show more' : 'Show less',
                        color: AppColors.mainColor,
                      ),
                      Icon(
                        hiddenText ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: AppColors.mainColor,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
