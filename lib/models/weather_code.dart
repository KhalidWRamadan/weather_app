import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

enum WeatherCode {
  clearSky(0, 'Clear sky'),
  mainlyClear(1, 'Mainly clear'),
  partlyCloudy(2, 'Partly cloudy'),
  overcast(3, 'Cloudy'),
  fogAndDepositingRimeFog45(45, 'Fog'),
  fogAndDepositingRimeFog48(48, 'Fog'),
  drizzleLight(51, 'Drizzle'),
  drizzleModerate(53, 'Drizzle'),
  drizzleDense(55, 'Drizzle'),
  freezingDrizzleLight(56, 'Freezing Drizzle'),
  freezingDrizzleDense(57, 'Freezing Drizzle'),
  rainSlight(61, 'Rain'),
  rainModerate(63, 'Rain'),
  rainHeavy(65, 'Rain'),
  freezingRainLight(66, 'Freezing Rain'),
  freezingRainHeavy(67, 'Freezing Rain'),
  snowFallSlight(71, 'Snow fall'),
  snowFallModerate(73, 'Snow fall'),
  snowFallHeavy(75, 'Snow fall'),
  snowGrains(77, 'Snow grains'),
  rainShowersSlight(80, 'Rain showers'),
  rainShowersModerate(81, 'Rain showers'),
  rainShowersViolent(82, 'Rain showers'),
  snowShowersSlight(85, 'Snow showers'),
  snowShowersHeavy(86, 'Snow showers'),
  thunderstormSlightOrModerate(95, 'Thunderstorm'),
  thunderstormSlightHail(96, 'Thunderstorm'),
  thunderstormHeavyHail(99, 'Thunderstorm');

  final int code;
  final String description;

  const WeatherCode(this.code, this.description);
}

// Extension to return corresponding SVG icons
//Extension is provided by dart to add more functionality to a class or enum
//but i don't want to affect the current class or can't even add this new
//functionality to the class(similar to what happedned here because i couldn't
//use svg assests in the enum because it is not const value)
extension WeatherCodeIcon on WeatherCode {
  //a getter that return a widget
  Widget get icon {
    //(this) is a weatherCode ref
    switch (this) {
      case WeatherCode.clearSky:
        return getSvgIcon('assets/icons/clear_sky.svg');
      case WeatherCode.mainlyClear:
        return getSvgIcon('assets/icons/mainly_clear.svg');
      case WeatherCode.partlyCloudy:
        return getSvgIcon('assets/icons/partly_cloudy.svg');
      case WeatherCode.overcast:
        return getSvgIcon('assets/icons/overcast.svg');
      case WeatherCode.fogAndDepositingRimeFog45:
      case WeatherCode.fogAndDepositingRimeFog48:
        return getSvgIcon('assets/icons/fog.svg');
      case WeatherCode.drizzleLight:
      case WeatherCode.drizzleModerate:
      case WeatherCode.drizzleDense:
        return getSvgIcon('assets/icons/drizzle.svg');
      case WeatherCode.freezingDrizzleLight:
      case WeatherCode.freezingDrizzleDense:
        return getSvgIcon('assets/icons/freezing_drizzle.svg');
      case WeatherCode.rainSlight:
      case WeatherCode.rainModerate:
      case WeatherCode.rainHeavy:
        return getSvgIcon('assets/icons/rain.svg');
      case WeatherCode.freezingRainLight:
      case WeatherCode.freezingRainHeavy:
        return getSvgIcon('assets/icons/freezing_rain.svg');
      case WeatherCode.snowFallSlight:
      case WeatherCode.snowFallModerate:
      case WeatherCode.snowFallHeavy:
      case WeatherCode.snowGrains:
        return getSvgIcon('assets/icons/snow.svg');
      case WeatherCode.rainShowersSlight:
      case WeatherCode.rainShowersModerate:
      case WeatherCode.rainShowersViolent:
        return getSvgIcon('assets/icons/drizzle.svg');
      case WeatherCode.snowShowersSlight:
      case WeatherCode.snowShowersHeavy:
        return getSvgIcon('assets/icons/snow_showers.svg');
      case WeatherCode.thunderstormSlightOrModerate:
      case WeatherCode.thunderstormSlightHail:
      case WeatherCode.thunderstormHeavyHail:
        return getSvgIcon('assets/icons/thunderstorm.svg');
      default:
        return getSvgIcon('assets/icons/clear_sky.svg');
    }
  }

  Widget getSvgIcon(String imgRoute) {
    return SvgPicture.asset(
      imgRoute,
      height: 64,
      fit: BoxFit.fill,
    );
  }
}
