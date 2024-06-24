import 'package:flutter/foundation.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/five_days_data.dart';

import '/api/api_repository.dart';

class WeatherService {
  final String city;

  String baseUrl = 'https://api.openweathermap.org/data/2.5';
  String apiKey = 'appid=f9ee8edcc546b46b013b32dd5382c974';


  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(CurrentWeatherData currentWeatherData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/weather?q=$city&lang=en&$apiKey';
    if(kDebugMode){
      print(url);
    }
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: () => {
          if (beforeSend != null)
            {
              beforeSend(),
            },
        },
        onSuccess: (data) => {
          onSuccess!(CurrentWeatherData.fromJson(data)),
        },
        onError: (error) => {
          if (onError != null)
            {
              print(error),
              onError(error),
            }
        });
  }

  void getFiveDaysThreeHoursForecastData({
    Function()? beforSend,
    Function(List<FiveDayData> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    if(kDebugMode){
      print(url);
    }
    ApiRepository(
      url: '$url',
    ).get(
        beforeSend: () => {},
        onSuccess: (data) => {
          onSuccess!((data['list'] as List)
              .map((t) => FiveDayData.fromJson(t))
              .toList())
        },
        onError: (error) => {
          print(error),
          onError!(error),
        });
  }
}
