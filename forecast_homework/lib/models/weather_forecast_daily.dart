import 'package:forecast_homework/constants.dart';

class WeatherForecastDaily {
  final City? city;
  final String? cod;
  final double? message;
  final int? cnt;
  final List<WetherForecastDailyListElement>? list;

  WeatherForecastDaily({
    this.city,
    this.cod,
    this.message,
    this.cnt,
    this.list,
  });

  factory WeatherForecastDaily.fromJson(Map<String, dynamic> json) =>
      WeatherForecastDaily(
        city: json["city"] == null ? null : City.fromJson(json["city"]),
        cod: json["cod"],
        message: json["message"]?.toDouble(),
        cnt: json["cnt"],
        list: json["list"] == null
            ? []
            : List<WetherForecastDailyListElement>.from(json["list"]!
                .map((x) => WetherForecastDailyListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "city": city?.toJson(),
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class City {
  final int? id;
  final String? name;
  final Coord? coord;
  final String? country;
  final int? population;
  final int? timezone;

  City({
    this.id,
    this.name,
    this.coord,
    this.country,
    this.population,
    this.timezone,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: json["coord"] == null ? null : Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord?.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
      };
}

class Coord {
  final double? lon;
  final double? lat;

  Coord({
    this.lon,
    this.lat,
  });

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json["lon"]?.toDouble(),
        lat: json["lat"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lon": lon,
        "lat": lat,
      };
}

class WetherForecastDailyListElement {
  final int? dt;
  final int? sunrise;
  final int? sunset;
  final Temp? temp;
  final FeelsLike? feelsLike;
  final int? pressure;
  final int? humidity;
  final List<Weather>? weather;
  final double? speed;
  final int? deg;
  final double? gust;
  final int? clouds;
  final double? pop;
  final double? rain;

  WetherForecastDailyListElement({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
    this.weather,
    this.speed,
    this.deg,
    this.gust,
    this.clouds,
    this.pop,
    this.rain,
  });

  factory WetherForecastDailyListElement.fromJson(Map<String, dynamic> json) =>
      WetherForecastDailyListElement(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"] == null ? null : Temp.fromJson(json["temp"]),
        feelsLike: json["feels_like"] == null
            ? null
            : FeelsLike.fromJson(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        weather: json["weather"] == null
            ? []
            : List<Weather>.from(
                json["weather"]!.map((x) => Weather.fromJson(x))),
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
        clouds: json["clouds"],
        pop: json["pop"]?.toDouble(),
        rain: json["rain"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp?.toJson(),
        "feels_like": feelsLike?.toJson(),
        "pressure": pressure,
        "humidity": humidity,
        "weather": weather == null
            ? []
            : List<dynamic>.from(weather!.map((x) => x.toJson())),
        "speed": speed,
        "deg": deg,
        "gust": gust,
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
      };
}

class FeelsLike {
  final double? day;
  final double? night;
  final double? eve;
  final double? morn;

  FeelsLike({
    this.day,
    this.night,
    this.eve,
    this.morn,
  });

  factory FeelsLike.fromJson(Map<String, dynamic> json) => FeelsLike(
        day: json["day"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

extension ImageUrlFormater on WetherForecastDailyListElement {
  String? getIconUrl() {
    final iconUri = weather?.firstOrNull?.icon;
    if (iconUri == null) {
      return null;
    }
    return '${Constants.WEATHER_IMAGES_URL}/$iconUri.png';
  }
}

class Temp {
  final double? day;
  final double? min;
  final double? max;
  final double? night;
  final double? eve;
  final double? morn;

  Temp({
    this.day,
    this.min,
    this.max,
    this.night,
    this.eve,
    this.morn,
  });

  factory Temp.fromJson(Map<String, dynamic> json) => Temp(
        day: json["day"]?.toDouble(),
        min: json["min"]?.toDouble(),
        max: json["max"]?.toDouble(),
        night: json["night"]?.toDouble(),
        eve: json["eve"]?.toDouble(),
        morn: json["morn"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}
