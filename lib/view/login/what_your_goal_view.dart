import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../common/colo_extension.dart';
import '../../common_widget/round_button.dart';
import 'package:fitness/view/login/welcome_view.dart';

class WhatYourGoalView extends StatefulWidget {
  const WhatYourGoalView({super.key});

  @override
  State<WhatYourGoalView> createState() => _WhatYourGoalViewState();
}

class _WhatYourGoalViewState extends State<WhatYourGoalView> {
  final CarouselController buttonCarouselController = CarouselController();

  final List<Map<String, String>> goalArr = [
    {
      "image": "assets/img/goal_1.png",
      "title": "Improve Shape",
      "subtitle": "I have a low amount of body fat\nand want to build more muscle."
    },
    {
      "image": "assets/img/goal_2.png",
      "title": "Lean & Tone",
      "subtitle": "I’m 'skinny fat'—I look thin but have no shape. I want to gain lean muscle."
    },
    {
      "image": "assets/img/goal_3.png",
      "title": "Lose Fat",
      "subtitle": "I have over 20 lbs to lose. I want to drop fat and gain muscle mass."
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: TColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items: goalArr
                    .map(
                      (gObj) => Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: TColor.primaryG,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: media.width * 0.1, horizontal: 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          gObj["image"]!,
                          width: media.width * 0.5,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: media.width * 0.08),
                        Text(
                          gObj["title"]!,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 50,
                          height: 2,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          gObj["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                )
                    .toList(),
                carouselController: CarouselSliderController(),
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.75,
                  aspectRatio: 0.75,
                  initialPage: 0,
                ),
              ),
            ),
            Positioned(
              top: media.width * 0.05,
              left: 25,
              right: 25,
              child: Column(
                children: [
                  const Text(
                    "What is your goal?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "It will help us choose the best\nprogram for you.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: media.width * 0.1,
              left: 25,
              right: 25,
              child: RoundButton(
                title: "Confirm",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WelcomeView()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
