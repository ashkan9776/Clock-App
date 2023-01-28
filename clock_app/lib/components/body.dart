import 'package:flutter/material.dart';

import 'clock.dart';
import 'country_card.dart';
import 'time_hour_minites.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Yazd/Iran",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const TimeHourAndMinites(),
            const Spacer(),
            const Clock(),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    CountryClock(
                      country: "Toronto, Canada",
                      timeZone: "+ 3h | EST",
                      iconSrc: "assets/icons/Liberty.svg",
                      time: "9:20",
                      period: "P.M",
                    ),
                    CountryClock(
                      country: "Boston, Usa",
                      timeZone: "+ 3:45h | EST",
                      iconSrc: "assets/icons/Liberty.svg",
                      time: "9:20",
                      period: "P.M",
                    ),
                    CountryClock(
                      country: "Dubai, Qatar",
                      timeZone: "+ 5:30h | EST",
                      iconSrc: "assets/icons/Liberty.svg",
                      time: "11:50",
                      period: "P.M",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
