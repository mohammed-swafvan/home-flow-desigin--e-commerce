import 'dart:async';

import 'package:flutter/material.dart';

// -- Import app constant colors
import 'package:home_screen_flow/core/colors.dart';

// -- Import app constants
import 'package:home_screen_flow/core/constants.dart';

class TimeDurationWidget extends StatefulWidget {
  const TimeDurationWidget({super.key});

  @override
  State<TimeDurationWidget> createState() => _TimeDurationWidgetState();
}

class _TimeDurationWidgetState extends State<TimeDurationWidget> {
  late Timer timer;
  late Duration remainingTime;

  @override
  void initState() {
    // -- Calculate remaining time
    remainingTime = const Duration(days: 1);
    // -- Start timer
    startTimer();

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime <= Duration.zero) {
          remainingTime = const Duration(days: 1);
        } else {
          remainingTime = remainingTime - const Duration(seconds: 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int hours = remainingTime.inHours.remainder(24);
    int minutes = remainingTime.inMinutes.remainder(60);
    int seconds = remainingTime.inSeconds.remainder(60);
    return Container(
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: kNotificationColor,
        borderRadius: kBorderRadius4,
      ),
      child: Wrap(
        direction: Axis.horizontal,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 20,
        children: [
          buildTimeShower(time: hours.toString().padLeft(2, '0'), type: "HRS"),
          buildTimeShower(time: minutes.toString().padLeft(2, '0'), type: "MIN"),
          buildTimeShower(time: seconds.toString().padLeft(2, '0'), type: "SEC"),
        ],
      ),
    );
  }

  Wrap buildTimeShower({required String time, required String type}) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        Text(
          time,
          style: const TextStyle(
            color: kAppBarColor,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          type,
          style: const TextStyle(
            color: kAppBarColor,
            fontSize: 8,
          ),
        )
      ],
    );
  }
}
