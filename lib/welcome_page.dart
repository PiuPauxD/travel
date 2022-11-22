import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel/cubit/app_cubits.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_texts.dart';
import 'package:travel/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.jpg",
    "welcome-two.jpg",
    "welcome-three.jpg",
  ];
  List LargeText = [
    "Travel",
    "Attractions",
    "Inspectation",
  ];

  List SmallerText = [
    "Countries",
    "Beautiful places",
    "Unimaginable views",
  ];

  List LittleInform = [
    "New Countries give you new emotions different than you have",
    "The most popular places of the world",
    "Places where you will get new ideas anp power of life",
  ];

  var index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: images.length,
            onPageChanged: (value) => setState(
              () {
                index = value;
              },
            ),
            itemBuilder: (_, index) {
              return Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: AssetImage(
                      "img/" + images[index],
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppLargeText(
                            text: LargeText[index],
                          ),
                          AppText(
                            text: SmallerText[index],
                            size: 30,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 250,
                            child: AppText(
                              text: LittleInform[index],
                              size: 14,
                            ),
                          ),
                          SizedBox(height: 40),
                          GestureDetector(
                            onTap: () async {
                              BlocProvider.of<AppCubits>(context).getData();
                            },
                            child: Container(
                                width: 200,
                                child: Row(
                                    children: [ResponsiveButton(width: 120)])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            right: 30,
            top: 100,
            child: Column(
              children: List.generate(
                3,
                (indexDots) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    width: 8,
                    height: index == indexDots ? 25 : 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: index == indexDots
                          ? Color.fromARGB(255, 20, 7, 204)
                          : Color.fromARGB(255, 20, 7, 204).withOpacity(0.7),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
