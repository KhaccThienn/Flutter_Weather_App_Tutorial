import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/constants/images.dart';
import 'package:weather_app/controllers/HomeController.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: GetBuilder<HomeController>(
      builder: (controller) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black38, BlendMode.darken),
                    image: AssetImage(
                      'assets/images/cloud-in-blue-sky.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: IconButton(
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                      child: TextField(
                        onChanged: (value) => controller.city = value,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        textInputAction: TextInputAction.search,
                        onSubmitted: (value) => controller.updateWeather(),
                        decoration: InputDecoration(
                          suffix: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: 'Search'.toUpperCase(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: const Alignment(0.0, 1.0),
                      child: SizedBox(
                        height: 10,
                        width: 10,
                        child: OverflowBox(
                          minWidth: 0.0,
                          maxWidth: MediaQuery.of(context).size.width,
                          minHeight: 0.0,
                          maxHeight: (MediaQuery.of(context).size.height / 4),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                width: double.infinity,
                                height: double.infinity,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //TODO
                                      Container(
                                        padding: const EdgeInsets.only(
                                            top: 15, left: 20, right: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Center(
                                              child: Text(
                                                '${controller.currentWeatherData.name}'
                                                    .toUpperCase(),
                                                style: const TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: Text(
                                                DateFormat()
                                                    .add_MMMMEEEEd()
                                                    .format(DateTime.now()),
                                                style: const TextStyle(
                                                  color: Colors.black45,
                                                  fontSize: 16,
                                                  fontFamily: 'flutterfonts',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: const EdgeInsets.only(left: 50),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  '${controller.currentWeatherData.weather![0].description}',
                                                  style: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 22,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  '${(controller.currentWeatherData.main!.temp! - 273.15).round().toString()}\u2103 (Feel Like ${(controller.currentWeatherData.main!.feelsLike! - 273.15).round().toString()}\u2103)',
                                                  style: const TextStyle(
                                                      color: Colors.black45,
                                                      fontFamily:
                                                          'flutterfonts'),
                                                ),
                                                Text(
                                                  'Min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round().toString()}\u2103 / Max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round().toString()}\u2103',
                                                  style: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'flutterfonts',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                SizedBox(
                                                  width: 120,
                                                  height: 120,
                                                  child: LottieBuilder.asset(
                                                      Images.cloudyAnim),
                                                ),
                                                Text(
                                                  'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                                  style: const TextStyle(
                                                    color: Colors.black45,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontFamily:
                                                        'flutterfonts',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),


          ],
        );
      },
    ));
  }
}
