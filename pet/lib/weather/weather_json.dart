// ignore_for_file: no_leading_underscores_for_local_identifiers

class AutoGenerate {
  AutoGenerate({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
    required this.city,
  });
  late final String cod;
  late final int message;
  late final int cnt;
  late final List<ListTemp> list;
  late final City city;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    cnt = json['cnt'];
    list = List.from(json['list']).map((e) => ListTemp.fromJson(e)).toList();
    city = City.fromJson(json['city']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cod'] = cod;
    _data['message'] = message;
    _data['cnt'] = cnt;
    _data['list'] = list.map((e) => e.toJson()).toList();
    _data['city'] = city.toJson();
    return _data;
  }
}

class ListTemp {
  ListTemp({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dtTxt,
  });
  late final int? dt;
  late final Main main;
  late final List<Weather> weather;
  late final Clouds clouds;
  late final Wind wind;
  late final int visibility;
  late final num? pop;
  late final Sys sys;
  late final String? dtTxt;

  ListTemp.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    main = Main.fromJson(json['main']);
    weather =
        List.from(json['weather']).map((e) => Weather.fromJson(e)).toList();
    clouds = Clouds.fromJson(json['clouds']);
    wind = Wind.fromJson(json['wind']);
    visibility = json['visibility'];
    pop = json['pop'];
    sys = Sys.fromJson(json['sys']);
    dtTxt = json['dt_txt'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['dt'] = dt;
    _data['main'] = main.toJson();
    _data['weather'] = weather.map((e) => e.toJson()).toList();
    _data['clouds'] = clouds.toJson();
    _data['wind'] = wind.toJson();
    _data['visibility'] = visibility;
    _data['pop'] = pop;
    _data['sys'] = sys.toJson();
    _data['dt_txt'] = dtTxt;
    return _data;
  }
}

class Main {
  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.seaLevel,
    required this.grndLevel,
    required this.humidity,
    required this.tempKf,
  });
  late final num temp;
  late final num feelsLike;
  late final num tempMin;
  late final num tempMax;
  late final int pressure;
  late final int seaLevel;
  late final int grndLevel;
  late final int humidity;
  late final num? tempKf;

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
    pressure = json['pressure'];
    seaLevel = json['sea_level'];
    grndLevel = json['grnd_level'];
    humidity = json['humidity'];
    tempKf = json['temp_kf'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['temp'] = temp;
    _data['feels_like'] = feelsLike;
    _data['temp_min'] = tempMin;
    _data['temp_max'] = tempMax;
    _data['pressure'] = pressure;
    _data['sea_level'] = seaLevel;
    _data['grnd_level'] = grndLevel;
    _data['humidity'] = humidity;
    _data['temp_kf'] = tempKf;
    return _data;
  }
}

class Weather {
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
  late final int id;
  late final String main;
  late final String description;
  late final String icon;

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['main'] = main;
    _data['description'] = description;
    _data['icon'] = icon;
    return _data;
  }
}

class Clouds {
  Clouds({
    required this.all,
  });
  late final int all;

  Clouds.fromJson(Map<String, dynamic> json) {
    all = json['all'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['all'] = all;
    return _data;
  }
}

class Wind {
  Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });
  late final num speed;
  late final int deg;
  late final num gust;

  Wind.fromJson(Map<String, dynamic> json) {
    speed = json['speed'];
    deg = json['deg'];
    gust = json['gust'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['speed'] = speed;
    _data['deg'] = deg;
    _data['gust'] = gust;
    return _data;
  }
}

class Sys {
  Sys({
    required this.pod,
  });
  late final String? pod;

  Sys.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pod'] = pod;
    return _data;
  }
}

class DtTxt {
  DtTxt({
    required this.pod,
  });
  late final String pod;

  DtTxt.fromJson(Map<String, dynamic> json) {
    pod = json['pod'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['pod'] = pod;
    return _data;
  }
}

class City {
  City({
    required this.id,
    required this.name,
    required this.coord,
    required this.country,
    required this.population,
    required this.timezone,
    required this.sunrise,
    required this.sunset,
  });
  late final int id;
  late final String name;
  late final Coord coord;
  late final String country;
  late final int population;
  late final int timezone;
  late final int sunrise;
  late final int sunset;

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    coord = Coord.fromJson(json['coord']);
    country = json['country'];
    population = json['population'];
    timezone = json['timezone'];
    sunrise = json['sunrise'];
    sunset = json['sunset'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['coord'] = coord.toJson();
    _data['country'] = country;
    _data['population'] = population;
    _data['timezone'] = timezone;
    _data['sunrise'] = sunrise;
    _data['sunset'] = sunset;
    return _data;
  }
}

class Coord {
  Coord({
    required this.lat,
    required this.lon,
  });
  late final double lat;
  late final double lon;

  Coord.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    return _data;
  }
}

//  "var json" created for convenience. can be deleted.
var json = {
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1680620400,
      "main": {
        "temp": 10.61,
        "feels_like": 9.61,
        "temp_min": 10.61,
        "temp_max": 10.96,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1002,
        "humidity": 72,
        "temp_kf": -0.35
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.18, "deg": 58, "gust": 12.69},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-04 15:00:00"
    },
    {
      "dt": 1680631200,
      "main": {
        "temp": 10.25,
        "feels_like": 9.37,
        "temp_min": 10.16,
        "temp_max": 10.25,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1001,
        "humidity": 78,
        "temp_kf": 0.09
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.03, "deg": 52, "gust": 13.26},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-04 18:00:00"
    },
    {
      "dt": 1680642000,
      "main": {
        "temp": 9.06,
        "feels_like": 6.12,
        "temp_min": 9.06,
        "temp_max": 9.06,
        "pressure": 1006,
        "sea_level": 1006,
        "grnd_level": 1000,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 5.78, "deg": 68, "gust": 11.2},
      "visibility": 10000,
      "pop": 0.09,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-04 21:00:00"
    },
    {
      "dt": 1680652800,
      "main": {
        "temp": 8.34,
        "feels_like": 5.84,
        "temp_min": 8.34,
        "temp_max": 8.34,
        "pressure": 1005,
        "sea_level": 1005,
        "grnd_level": 999,
        "humidity": 90,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 4.25, "deg": 54, "gust": 7.9},
      "visibility": 10000,
      "pop": 0.05,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-05 00:00:00"
    },
    {
      "dt": 1680663600,
      "main": {
        "temp": 8.02,
        "feels_like": 5.79,
        "temp_min": 8.02,
        "temp_max": 8.02,
        "pressure": 1004,
        "sea_level": 1004,
        "grnd_level": 997,
        "humidity": 92,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.58, "deg": 8, "gust": 5.06},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-05 03:00:00"
    },
    {
      "dt": 1680674400,
      "main": {
        "temp": 8.63,
        "feels_like": 6.7,
        "temp_min": 8.63,
        "temp_max": 8.63,
        "pressure": 1003,
        "sea_level": 1003,
        "grnd_level": 997,
        "humidity": 91,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "небольшой дождь",
          "icon": "10d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.27, "deg": 4, "gust": 4.1},
      "visibility": 10000,
      "pop": 0.28,
      "rain": {"3h": 0.31},
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-05 06:00:00"
    },
    {
      "dt": 1680685200,
      "main": {
        "temp": 11.33,
        "feels_like": 10.53,
        "temp_min": 11.33,
        "temp_max": 11.33,
        "pressure": 1003,
        "sea_level": 1003,
        "grnd_level": 996,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "небольшой дождь",
          "icon": "10d"
        }
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 1.09, "deg": 319, "gust": 1.87},
      "visibility": 10000,
      "pop": 0.49,
      "rain": {"3h": 0.12},
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-05 09:00:00"
    },
    {
      "dt": 1680696000,
      "main": {
        "temp": 9,
        "feels_like": 6.07,
        "temp_min": 9,
        "temp_max": 9,
        "pressure": 1003,
        "sea_level": 1003,
        "grnd_level": 996,
        "humidity": 89,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "небольшой дождь",
          "icon": "10d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 5.72, "deg": 285, "gust": 8.42},
      "visibility": 10000,
      "pop": 0.96,
      "rain": {"3h": 1.25},
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-05 12:00:00"
    },
    {
      "dt": 1680706800,
      "main": {
        "temp": 6.01,
        "feels_like": 1.5,
        "temp_min": 6.01,
        "temp_max": 6.01,
        "pressure": 1003,
        "sea_level": 1003,
        "grnd_level": 997,
        "humidity": 87,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "небольшой дождь",
          "icon": "10d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.97, "deg": 280, "gust": 10.26},
      "visibility": 10000,
      "pop": 0.89,
      "rain": {"3h": 0.4},
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-05 15:00:00"
    },
    {
      "dt": 1680717600,
      "main": {
        "temp": 4.7,
        "feels_like": -0.02,
        "temp_min": 4.7,
        "temp_max": 4.7,
        "pressure": 1005,
        "sea_level": 1005,
        "grnd_level": 998,
        "humidity": 86,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.42, "deg": 276, "gust": 9},
      "visibility": 10000,
      "pop": 0.65,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-05 18:00:00"
    },
    {
      "dt": 1680728400,
      "main": {
        "temp": 4.07,
        "feels_like": -0.8,
        "temp_min": 4.07,
        "temp_max": 4.07,
        "pressure": 1006,
        "sea_level": 1006,
        "grnd_level": 999,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.31, "deg": 274, "gust": 9.01},
      "visibility": 10000,
      "pop": 0.12,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-05 21:00:00"
    },
    {
      "dt": 1680739200,
      "main": {
        "temp": 3.18,
        "feels_like": -1.78,
        "temp_min": 3.18,
        "temp_max": 3.18,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1000,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 6.89, "deg": 268, "gust": 9.08},
      "visibility": 10000,
      "pop": 0.16,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-06 00:00:00"
    },
    {
      "dt": 1680750000,
      "main": {
        "temp": 2.89,
        "feels_like": -2.33,
        "temp_min": 2.89,
        "temp_max": 2.89,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1001,
        "humidity": 81,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.35, "deg": 260, "gust": 9.67},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-06 03:00:00"
    },
    {
      "dt": 1680760800,
      "main": {
        "temp": 3.77,
        "feels_like": -1.43,
        "temp_min": 3.77,
        "temp_max": 3.77,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1003,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 8.02, "deg": 268, "gust": 10.74},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-06 06:00:00"
    },
    {
      "dt": 1680771600,
      "main": {
        "temp": 5.92,
        "feels_like": 1.92,
        "temp_min": 5.92,
        "temp_max": 5.92,
        "pressure": 1011,
        "sea_level": 1011,
        "grnd_level": 1004,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 6.37, "deg": 233, "gust": 7.91},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-06 09:00:00"
    },
    {
      "dt": 1680782400,
      "main": {
        "temp": 6.68,
        "feels_like": 3.42,
        "temp_min": 6.68,
        "temp_max": 6.68,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1005,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 96},
      "wind": {"speed": 5.04, "deg": 173, "gust": 5.58},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-06 12:00:00"
    },
    {
      "dt": 1680793200,
      "main": {
        "temp": 6.91,
        "feels_like": 4.24,
        "temp_min": 6.91,
        "temp_max": 6.91,
        "pressure": 1012,
        "sea_level": 1012,
        "grnd_level": 1005,
        "humidity": 80,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.93, "deg": 167, "gust": 4.47},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-06 15:00:00"
    },
    {
      "dt": 1680804000,
      "main": {
        "temp": 6.53,
        "feels_like": 3.79,
        "temp_min": 6.53,
        "temp_max": 6.53,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1007,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.91, "deg": 162, "gust": 4.86},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-06 18:00:00"
    },
    {
      "dt": 1680814800,
      "main": {
        "temp": 6.42,
        "feels_like": 4.41,
        "temp_min": 6.42,
        "temp_max": 6.42,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1007,
        "humidity": 86,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.72, "deg": 156, "gust": 3.61},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-06 21:00:00"
    },
    {
      "dt": 1680825600,
      "main": {
        "temp": 6.29,
        "feels_like": 4.49,
        "temp_min": 6.29,
        "temp_max": 6.29,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1007,
        "humidity": 88,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.42, "deg": 116, "gust": 3.12},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-07 00:00:00"
    },
    {
      "dt": 1680836400,
      "main": {
        "temp": 6.23,
        "feels_like": 4.33,
        "temp_min": 6.23,
        "temp_max": 6.23,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1007,
        "humidity": 88,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.53, "deg": 61, "gust": 3.22},
      "visibility": 10000,
      "pop": 0.01,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-07 03:00:00"
    },
    {
      "dt": 1680847200,
      "main": {
        "temp": 6.66,
        "feels_like": 5.84,
        "temp_min": 6.66,
        "temp_max": 6.66,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1008,
        "humidity": 86,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "небольшой дождь",
          "icon": "10d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.5, "deg": 99, "gust": 1.83},
      "visibility": 10000,
      "pop": 0.21,
      "rain": {"3h": 0.12},
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-07 06:00:00"
    },
    {
      "dt": 1680858000,
      "main": {
        "temp": 7.38,
        "feels_like": 5.66,
        "temp_min": 7.38,
        "temp_max": 7.38,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1009,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.58, "deg": 127, "gust": 2.5},
      "visibility": 10000,
      "pop": 0.05,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-07 09:00:00"
    },
    {
      "dt": 1680868800,
      "main": {
        "temp": 8.72,
        "feels_like": 6.7,
        "temp_min": 8.72,
        "temp_max": 8.72,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1008,
        "humidity": 67,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "облачно с прояснениями",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 84},
      "wind": {"speed": 3.47, "deg": 139, "gust": 2.93},
      "visibility": 10000,
      "pop": 0.01,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-07 12:00:00"
    },
    {
      "dt": 1680879600,
      "main": {
        "temp": 8.53,
        "feels_like": 6.64,
        "temp_min": 8.53,
        "temp_max": 8.53,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1009,
        "humidity": 67,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "переменная облачность",
          "icon": "03d"
        }
      ],
      "clouds": {"all": 39},
      "wind": {"speed": 3.18, "deg": 163, "gust": 3.24},
      "visibility": 10000,
      "pop": 0.05,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-07 15:00:00"
    },
    {
      "dt": 1680890400,
      "main": {
        "temp": 7.4,
        "feels_like": 5.27,
        "temp_min": 7.4,
        "temp_max": 7.4,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1010,
        "humidity": 81,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "переменная облачность",
          "icon": "03n"
        }
      ],
      "clouds": {"all": 37},
      "wind": {"speed": 3.19, "deg": 163, "gust": 4.17},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-07 18:00:00"
    },
    {
      "dt": 1680901200,
      "main": {
        "temp": 6.47,
        "feels_like": 4.36,
        "temp_min": 6.47,
        "temp_max": 6.47,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1011,
        "humidity": 86,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "облачно с прояснениями",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 69},
      "wind": {"speed": 2.87, "deg": 182, "gust": 4.15},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-07 21:00:00"
    },
    {
      "dt": 1680912000,
      "main": {
        "temp": 6.1,
        "feels_like": 4.21,
        "temp_min": 6.1,
        "temp_max": 6.1,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1011,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "облачно с прояснениями",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 80},
      "wind": {"speed": 2.49, "deg": 171, "gust": 3.42},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-08 00:00:00"
    },
    {
      "dt": 1680922800,
      "main": {
        "temp": 5.89,
        "feels_like": 4.54,
        "temp_min": 5.89,
        "temp_max": 5.89,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1011,
        "humidity": 88,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 94},
      "wind": {"speed": 1.87, "deg": 148, "gust": 2.05},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-08 03:00:00"
    },
    {
      "dt": 1680933600,
      "main": {
        "temp": 7.39,
        "feels_like": 6.14,
        "temp_min": 7.39,
        "temp_max": 7.39,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1012,
        "humidity": 83,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 85},
      "wind": {"speed": 2.01, "deg": 136, "gust": 2.41},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-08 06:00:00"
    },
    {
      "dt": 1680944400,
      "main": {
        "temp": 8.59,
        "feels_like": 6.09,
        "temp_min": 8.59,
        "temp_max": 8.59,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1013,
        "humidity": 71,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 97},
      "wind": {"speed": 4.39, "deg": 166, "gust": 4.35},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-08 09:00:00"
    },
    {
      "dt": 1680955200,
      "main": {
        "temp": 9.43,
        "feels_like": 7.22,
        "temp_min": 9.43,
        "temp_max": 9.43,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1012,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 4.17, "deg": 169, "gust": 4.09},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-08 12:00:00"
    },
    {
      "dt": 1680966000,
      "main": {
        "temp": 8.98,
        "feels_like": 6.61,
        "temp_min": 8.98,
        "temp_max": 8.98,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 1013,
        "humidity": 68,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 4.3, "deg": 170, "gust": 4.02},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-08 15:00:00"
    },
    {
      "dt": 1680976800,
      "main": {
        "temp": 8.01,
        "feels_like": 5.93,
        "temp_min": 8.01,
        "temp_max": 8.01,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1014,
        "humidity": 74,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.31, "deg": 202, "gust": 4.23},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-08 18:00:00"
    },
    {
      "dt": 1680987600,
      "main": {
        "temp": 7.5,
        "feels_like": 5.48,
        "temp_min": 7.5,
        "temp_max": 7.5,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1013,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 3.04, "deg": 263, "gust": 3.97},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-08 21:00:00"
    },
    {
      "dt": 1680998400,
      "main": {
        "temp": 7.1,
        "feels_like": 5.19,
        "temp_min": 7.1,
        "temp_max": 7.1,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1013,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 2.77, "deg": 316, "gust": 3.74},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-09 00:00:00"
    },
    {
      "dt": 1681009200,
      "main": {
        "temp": 6.57,
        "feels_like": 4.13,
        "temp_min": 6.57,
        "temp_max": 6.57,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1014,
        "humidity": 78,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.4, "deg": 354, "gust": 5.08},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-04-09 03:00:00"
    },
    {
      "dt": 1681020000,
      "main": {
        "temp": 8.08,
        "feels_like": 5.89,
        "temp_min": 8.08,
        "temp_max": 8.08,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1014,
        "humidity": 72,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.54, "deg": 13, "gust": 4.76},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-09 06:00:00"
    },
    {
      "dt": 1681030800,
      "main": {
        "temp": 10.53,
        "feels_like": 9.23,
        "temp_min": 10.53,
        "temp_max": 10.53,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1014,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {"id": 804, "main": "Clouds", "description": "пасмурно", "icon": "04d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.16, "deg": 38, "gust": 4.02},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-09 09:00:00"
    },
    {
      "dt": 1681041600,
      "main": {
        "temp": 10.06,
        "feels_like": 8.74,
        "temp_min": 10.06,
        "temp_max": 10.06,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 1014,
        "humidity": 62,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "небольшой дождь",
          "icon": "10d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.61, "deg": 110, "gust": 2.67},
      "visibility": 10000,
      "pop": 0.2,
      "rain": {"3h": 0.12},
      "sys": {"pod": "d"},
      "dt_txt": "2023-04-09 12:00:00"
    }
  ],
  "city": {
    "id": 698740,
    "name": "Одесса",
    "coord": {"lat": 46.4775, "lon": 30.7326},
    "country": "UA",
    "population": 1001558,
    "timezone": 10800,
    "sunrise": 1680579101,
    "sunset": 1680625701
  }
};
