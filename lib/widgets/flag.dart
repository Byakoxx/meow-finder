import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart';

class Flag extends StatelessWidget {
  final String countryCode;

  const Flag({super.key, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    Widget flagSvg = CountryIcons.getSvgFlag(countryCode);
    return SizedBox(
      width: 30,
      height: 30,
      child: flagSvg,
    );
  }
}
