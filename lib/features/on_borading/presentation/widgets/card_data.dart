import 'package:flutter/material.dart';

class CardData {
  final String title;
  final Widget image;
  final Color backgroundColor;
  final Color titleColor;
  final Color? subtitleColor;
  final Widget? background;

  CardData({
    required this.title,
    required this.image,
    required this.backgroundColor,
    required this.titleColor,
    this.subtitleColor,
    this.background,
  });
}

class CardPlanet extends StatelessWidget {
  const CardPlanet({
    required this.data,
    Key? key,
  }) : super(key: key);

  final CardData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (data.background != null) data.background!,
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              data.image,
              const Spacer(flex: 2),
              Text(
                data.title.toUpperCase(),
                style: TextStyle(
                  color: data.titleColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
                maxLines: 1,
              ),
              const Spacer(flex: 1),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ],
    );
  }
}
