import 'package:flutter/material.dart';
import 'package:travel/widgets/app_buttons.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/app_texts.dart';
import 'package:travel/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("Paris.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 320,
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                width: MediaQuery.of(context).size.width,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(
                          text: "Paris",
                          color: Colors.black.withOpacity(0.7),
                        ),
                        AppLargeText(
                          text: "\$250",
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        AppText(
                          text: "France, Paris",
                          color: Colors.black54,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(
                                5,
                                (index) {
                                  return Icon(
                                    Icons.star,
                                    color: index < gottenStars
                                        ? Color.fromARGB(255, 197, 229, 18)
                                        : Colors.grey,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              text: "(4.0)",
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AppLargeText(
                      text: "People",
                      color: Colors.black.withOpacity(0.7),
                      size: 20,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    AppText(
                      text: "Number of people in your group",
                      color: Colors.black.withOpacity(0.7),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                size: 50,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: selectedIndex == index
                                    ? Colors.black
                                    : Color.fromARGB(255, 212, 203, 203),
                                borderColor: selectedIndex == index
                                    ? Colors.black
                                    : Color.fromARGB(255, 212, 203, 203),
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppLargeText(
                      text: "Description",
                      color: Colors.black.withOpacity(0.7),
                      size: 20,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AppText(
                      text:
                          "You must go for a travel. Travaling helps get rid of pressure. Go to the Paris to see other culture.",
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Row(
                children: [
                  AppButtons(
                    size: 60,
                    color: Colors.black.withOpacity(0.7),
                    backgroundColor: Colors.white,
                    borderColor: Colors.black.withOpacity(0.7),
                    isIcon: true,
                    icon: Icons.favorite_border,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ResponsiveButton(
                    isResponsive: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
