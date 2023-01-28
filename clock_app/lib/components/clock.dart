import 'dart:async';
import 'dart:math';

import 'package:clock_app/models/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../size_config.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  const Clock({super.key});

  @override
  State<Clock> createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: AspectRatio(
            aspectRatio: 1.3,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 10),
                    blurRadius: 5,
                    color: kShadowColor.withOpacity(0.15),
                  ),
                  BoxShadow(
                    offset: const Offset(0, 25),
                    blurRadius: 10,
                    color: kShadowColor.withOpacity(0.45),
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPaint(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Consumer<ThemeModel>(
              builder: (context, theme, child) => GestureDetector(
                onTap: () => theme.ChangeTheme(),
                child: SvgPicture.asset(
                  theme.isLight
                      ? 'assets/icons/Sun.svg'
                      : 'assets/icons/Moon.svg',
                  height: 24,
                  width: 24,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )),
      ],
    );
  }
}
