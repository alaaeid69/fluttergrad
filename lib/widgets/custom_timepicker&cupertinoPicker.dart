import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradproj/widgets/text.dart';

import '../theme/constants.dart';
import 'cards.dart';


class CustomTimePicker extends StatefulWidget {
  String cancle_text;

   CustomTimePicker({Key? myKey, required this.cancle_text}): super(key: myKey);

  @override
  _CustomTimePickerState createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  TimeOfDay _timeOfDay = TimeOfDay(hour: 12, minute: 00);

  void _showTimePicker() {
    showTimePicker(
      cancelText: widget.cancle_text,
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context , child) => Theme(
        data: ThemeData().copyWith(
            colorScheme: ColorScheme.light(
                primary: kButtonColor,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: kButtonColor,
                onBackground: Colors.white,
                onSecondary: Colors.white,
                secondary: kButtonColor,

            ),
            dialogBackgroundColor: Colors.white
        ),
        child: child as Widget,
      ),
    ).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
           CustomCard(
             card_action: (){},
             card_height: 50,
            card_content: OutlinedButton(
              onPressed: _showTimePicker,
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                side: BorderSide(width: 1.0, color: Colors.white),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(0.0),
                child: SubTitle(
                    text: _timeOfDay.format(context).toString(),
                    textcolor: Colors.black, weight: FontWeight.bold,

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

