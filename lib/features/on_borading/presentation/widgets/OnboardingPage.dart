import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:project_test/core/database/cashe_helper.dart';
import 'package:project_test/core/service/service_locter.dart';
import 'package:project_test/features/on_borading/presentation/widgets/card_data.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  final data = [
    CardData(
      title: "Choose The Best Products",
      image: LottieBuilder.asset("assets/animation/solar.json"),
      backgroundColor: Colors.white,
      titleColor: Color(0xFF07A66FF),
      background: LottieBuilder.asset("assets/animation/bg-1.json"),
    ),
    CardData(
      title: "Add favourite Product to Cart",
      image: LottieBuilder.asset("assets/animation/5.json"),
      backgroundColor: Color(0xFF07A66FF),
      titleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-2.json"),
    ),
    CardData(
      title: "Choose Your Payment Option",
      image: LottieBuilder.asset("assets/animation/6.json"),
      backgroundColor: Colors.white,
      titleColor: Color(0xFF07A66FF),
      background: LottieBuilder.asset("assets/animation/bg-3.json"),
    ),
    CardData(
      title: "Choose The Best Shipping",
      image: LottieBuilder.asset("assets/animation/4.json"),
      backgroundColor: Color(0xFF07A66FF),
      titleColor: Colors.white,
      background: LottieBuilder.asset("assets/animation/bg-3.json"),
    ),
  ];

  // #7A66FF

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3,bottom: 35),
          child: Icon(
            Icons.navigate_next,
            
          ),
        ),
        itemCount: data.length,
        itemBuilder: (int index) {
          return CardPlanet(
              data: data[index]
          );
        },
        onChange: (index){
          print(index);
        },
        onFinish: () {
          getIt<CacheHelper>().saveData(
            key: "isonBoardingVisited",
            value: true,
          );
          GoRouter.of(context).pushReplacement("/login");
        },
      ),
    );
  }
}
