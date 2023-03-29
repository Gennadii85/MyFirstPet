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
  late final int dt;
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

var json = {
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1679594400,
      "main": {
        "temp": 9.95,
        "feels_like": 8.8,
        "temp_min": 9.46,
        "temp_max": 9.95,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1011,
        "humidity": 68,
        "temp_kf": 0.49
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 5},
      "wind": {"speed": 2.44, "deg": 213, "gust": 2.69},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-23 18:00:00"
    },
    {
      "dt": 1679605200,
      "main": {
        "temp": 9.3,
        "feels_like": 7.78,
        "temp_min": 8.85,
        "temp_max": 9.3,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1011,
        "humidity": 71,
        "temp_kf": 0.45
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 7},
      "wind": {"speed": 2.83, "deg": 239, "gust": 3.11},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-23 21:00:00"
    },
    {
      "dt": 1679616000,
      "main": {
        "temp": 8.07,
        "feels_like": 6.09,
        "temp_min": 8.07,
        "temp_max": 8.07,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1010,
        "humidity": 78,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 6},
      "wind": {"speed": 3.17, "deg": 251, "gust": 3.73},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-24 00:00:00"
    },
    {
      "dt": 1679626800,
      "main": {
        "temp": 7.59,
        "feels_like": 6.07,
        "temp_min": 7.59,
        "temp_max": 7.59,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1010,
        "humidity": 80,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {"all": 24},
      "wind": {"speed": 2.37, "deg": 257, "gust": 2.44},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-24 03:00:00"
    },
    {
      "dt": 1679637600,
      "main": {
        "temp": 8.99,
        "feels_like": 7.79,
        "temp_min": 8.99,
        "temp_max": 8.99,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 1011,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 62},
      "wind": {"speed": 2.28, "deg": 212, "gust": 2.81},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-24 06:00:00"
    },
    {
      "dt": 1679648400,
      "main": {
        "temp": 11.64,
        "feels_like": 10.48,
        "temp_min": 11.64,
        "temp_max": 11.64,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 1011,
        "humidity": 62,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 92},
      "wind": {"speed": 3.49, "deg": 194, "gust": 4.08},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-24 09:00:00"
    },
    {
      "dt": 1679659200,
      "main": {
        "temp": 12.48,
        "feels_like": 11.27,
        "temp_min": 12.48,
        "temp_max": 12.48,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1010,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 68},
      "wind": {"speed": 5.05, "deg": 189, "gust": 5.19},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-24 12:00:00"
    },
    {
      "dt": 1679670000,
      "main": {
        "temp": 11.27,
        "feels_like": 10.05,
        "temp_min": 11.27,
        "temp_max": 11.27,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1009,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 10},
      "wind": {"speed": 5.47, "deg": 184, "gust": 6.69},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-24 15:00:00"
    },
    {
      "dt": 1679680800,
      "main": {
        "temp": 8.99,
        "feels_like": 6.49,
        "temp_min": 8.99,
        "temp_max": 8.99,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 1010,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {"all": 23},
      "wind": {"speed": 4.59, "deg": 191, "gust": 8.23},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-24 18:00:00"
    },
    {
      "dt": 1679691600,
      "main": {
        "temp": 8.19,
        "feels_like": 5.45,
        "temp_min": 8.19,
        "temp_max": 8.19,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1009,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {"all": 48},
      "wind": {"speed": 4.7, "deg": 198, "gust": 8.99},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-24 21:00:00"
    },
    {
      "dt": 1679702400,
      "main": {
        "temp": 7.83,
        "feels_like": 5.09,
        "temp_min": 7.83,
        "temp_max": 7.83,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 1008,
        "humidity": 79,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {"all": 46},
      "wind": {"speed": 4.51, "deg": 204, "gust": 9.4},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-25 00:00:00"
    },
    {
      "dt": 1679713200,
      "main": {
        "temp": 7.06,
        "feels_like": 4.31,
        "temp_min": 7.06,
        "temp_max": 7.06,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 1007,
        "humidity": 84,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {"all": 25},
      "wind": {"speed": 4.16, "deg": 199, "gust": 8.44},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-25 03:00:00"
    },
    {
      "dt": 1679724000,
      "main": {
        "temp": 8.4,
        "feels_like": 5.5,
        "temp_min": 8.4,
        "temp_max": 8.4,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1007,
        "humidity": 78,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 62},
      "wind": {"speed": 5.23, "deg": 192, "gust": 9.42},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-25 06:00:00"
    },
    {
      "dt": 1679734800,
      "main": {
        "temp": 10.76,
        "feels_like": 9.59,
        "temp_min": 10.76,
        "temp_max": 10.76,
        "pressure": 1013,
        "sea_level": 1013,
        "grnd_level": 1006,
        "humidity": 65,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.13, "deg": 186, "gust": 10.5},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-25 09:00:00"
    },
    {
      "dt": 1679745600,
      "main": {
        "temp": 11.16,
        "feels_like": 10.03,
        "temp_min": 11.16,
        "temp_max": 11.16,
        "pressure": 1011,
        "sea_level": 1011,
        "grnd_level": 1004,
        "humidity": 65,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 73},
      "wind": {"speed": 7.49, "deg": 183, "gust": 10.78},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-25 12:00:00"
    },
    {
      "dt": 1679756400,
      "main": {
        "temp": 9.35,
        "feels_like": 6.01,
        "temp_min": 9.35,
        "temp_max": 9.35,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1003,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 72},
      "wind": {"speed": 7.32, "deg": 181, "gust": 11.96},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-25 15:00:00"
    },
    {
      "dt": 1679767200,
      "main": {
        "temp": 8.11,
        "feels_like": 4.78,
        "temp_min": 8.11,
        "temp_max": 8.11,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1003,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 86},
      "wind": {"speed": 6.19, "deg": 184, "gust": 11.99},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-25 18:00:00"
    },
    {
      "dt": 1679778000,
      "main": {
        "temp": 7.71,
        "feels_like": 4.37,
        "temp_min": 7.71,
        "temp_max": 7.71,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 1002,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 94},
      "wind": {"speed": 5.9, "deg": 189, "gust": 12.48},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-25 21:00:00"
    },
    {
      "dt": 1679788800,
      "main": {
        "temp": 7.73,
        "feels_like": 4.86,
        "temp_min": 7.73,
        "temp_max": 7.73,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1001,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 93},
      "wind": {"speed": 4.75, "deg": 192, "gust": 9.63},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-26 00:00:00"
    },
    {
      "dt": 1679799600,
      "main": {
        "temp": 7.65,
        "feels_like": 5.46,
        "temp_min": 7.65,
        "temp_max": 7.65,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1001,
        "humidity": 87,
        "temp_kf": 0
      },
      "weather": [
        {"id": 500, "main": "Rain", "description": "light rain", "icon": "10n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.37, "deg": 231, "gust": 4.81},
      "visibility": 10000,
      "pop": 0.36,
      "rain": {"3h": 0.13},
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-26 03:00:00"
    },
    {
      "dt": 1679810400,
      "main": {
        "temp": 8.37,
        "feels_like": 6.98,
        "temp_min": 8.37,
        "temp_max": 8.37,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1001,
        "humidity": 93,
        "temp_kf": 0
      },
      "weather": [
        {"id": 500, "main": "Rain", "description": "light rain", "icon": "10d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.38, "deg": 322, "gust": 5.08},
      "visibility": 10000,
      "pop": 0.7,
      "rain": {"3h": 1.94},
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-26 06:00:00"
    },
    {
      "dt": 1679821200,
      "main": {
        "temp": 12.27,
        "feels_like": 11.28,
        "temp_min": 12.27,
        "temp_max": 12.27,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1001,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.07, "deg": 346, "gust": 5.1},
      "visibility": 10000,
      "pop": 0.18,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-26 09:00:00"
    },
    {
      "dt": 1679832000,
      "main": {
        "temp": 12.81,
        "feels_like": 11.69,
        "temp_min": 12.81,
        "temp_max": 12.81,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1001,
        "humidity": 59,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 1.25, "deg": 76, "gust": 3.44},
      "visibility": 10000,
      "pop": 0.11,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-26 12:00:00"
    },
    {
      "dt": 1679842800,
      "main": {
        "temp": 11.43,
        "feels_like": 10.4,
        "temp_min": 11.43,
        "temp_max": 11.43,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1002,
        "humidity": 68,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 2.26, "deg": 203, "gust": 4.26},
      "visibility": 10000,
      "pop": 0.15,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-26 15:00:00"
    },
    {
      "dt": 1679853600,
      "main": {
        "temp": 10.68,
        "feels_like": 9.53,
        "temp_min": 10.68,
        "temp_max": 10.68,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 1002,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 86},
      "wind": {"speed": 1.31, "deg": 304, "gust": 2.19},
      "visibility": 10000,
      "pop": 0.07,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-26 18:00:00"
    },
    {
      "dt": 1679864400,
      "main": {
        "temp": 9.62,
        "feels_like": 8.9,
        "temp_min": 9.62,
        "temp_max": 9.62,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 1003,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.83, "deg": 190, "gust": 1.86},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-26 21:00:00"
    },
    {
      "dt": 1679875200,
      "main": {
        "temp": 9.04,
        "feels_like": 7.24,
        "temp_min": 9.04,
        "temp_max": 9.04,
        "pressure": 1009,
        "sea_level": 1009,
        "grnd_level": 1003,
        "humidity": 71,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02n"
        }
      ],
      "clouds": {"all": 18},
      "wind": {"speed": 3.2, "deg": 192, "gust": 3.73},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-27 00:00:00"
    },
    {
      "dt": 1679886000,
      "main": {
        "temp": 8.41,
        "feels_like": 6.07,
        "temp_min": 8.41,
        "temp_max": 8.41,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1002,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.95, "deg": 180, "gust": 7.06},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-27 03:00:00"
    },
    {
      "dt": 1679896800,
      "main": {
        "temp": 9.12,
        "feels_like": 6.34,
        "temp_min": 9.12,
        "temp_max": 9.12,
        "pressure": 1008,
        "sea_level": 1008,
        "grnd_level": 1001,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 5.38, "deg": 178, "gust": 9.71},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-27 06:00:00"
    },
    {
      "dt": 1679907600,
      "main": {
        "temp": 10.53,
        "feels_like": 9.54,
        "temp_min": 10.53,
        "temp_max": 10.53,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1000,
        "humidity": 73,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 7.73, "deg": 169, "gust": 12.7},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-27 09:00:00"
    },
    {
      "dt": 1679918400,
      "main": {
        "temp": 9.75,
        "feels_like": 6.28,
        "temp_min": 9.75,
        "temp_max": 9.75,
        "pressure": 1005,
        "sea_level": 1005,
        "grnd_level": 998,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 8.28, "deg": 153, "gust": 14.38},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-27 12:00:00"
    },
    {
      "dt": 1679929200,
      "main": {
        "temp": 8.82,
        "feels_like": 5.02,
        "temp_min": 8.82,
        "temp_max": 8.82,
        "pressure": 1002,
        "sea_level": 1002,
        "grnd_level": 995,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 8.45, "deg": 148, "gust": 16.32},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-27 15:00:00"
    },
    {
      "dt": 1679940000,
      "main": {
        "temp": 8.07,
        "feels_like": 3.84,
        "temp_min": 8.07,
        "temp_max": 8.07,
        "pressure": 999,
        "sea_level": 999,
        "grnd_level": 993,
        "humidity": 86,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 9.21, "deg": 151, "gust": 18.66},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-27 18:00:00"
    },
    {
      "dt": 1679950800,
      "main": {
        "temp": 8.54,
        "feels_like": 3.85,
        "temp_min": 8.54,
        "temp_max": 8.54,
        "pressure": 997,
        "sea_level": 997,
        "grnd_level": 990,
        "humidity": 85,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 12.02, "deg": 168, "gust": 21.05},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-27 21:00:00"
    },
    {
      "dt": 1679961600,
      "main": {
        "temp": 8.68,
        "feels_like": 4.92,
        "temp_min": 8.68,
        "temp_max": 8.68,
        "pressure": 997,
        "sea_level": 997,
        "grnd_level": 991,
        "humidity": 87,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 8.13, "deg": 205, "gust": 13.28},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-28 00:00:00"
    },
    {
      "dt": 1679972400,
      "main": {
        "temp": 7.76,
        "feels_like": 4.62,
        "temp_min": 7.76,
        "temp_max": 7.76,
        "pressure": 999,
        "sea_level": 999,
        "grnd_level": 992,
        "humidity": 75,
        "temp_kf": 0
      },
      "weather": [
        {"id": 500, "main": "Rain", "description": "light rain", "icon": "10n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 5.42, "deg": 295, "gust": 8.52},
      "visibility": 10000,
      "pop": 0.2,
      "rain": {"3h": 0.11},
      "sys": {"pod": "n"},
      "dt_txt": "2023-03-28 03:00:00"
    },
    {
      "dt": 1679983200,
      "main": {
        "temp": 6.64,
        "feels_like": 2.14,
        "temp_min": 6.64,
        "temp_max": 6.64,
        "pressure": 1001,
        "sea_level": 1001,
        "grnd_level": 994,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 8.57, "deg": 322, "gust": 12.01},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-28 06:00:00"
    },
    {
      "dt": 1679994000,
      "main": {
        "temp": 6.82,
        "feels_like": 2.1,
        "temp_min": 6.82,
        "temp_max": 6.82,
        "pressure": 1004,
        "sea_level": 1004,
        "grnd_level": 997,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 9.61, "deg": 333, "gust": 11.84},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-28 09:00:00"
    },
    {
      "dt": 1680004800,
      "main": {
        "temp": 6.84,
        "feels_like": 1.92,
        "temp_min": 6.84,
        "temp_max": 6.84,
        "pressure": 1007,
        "sea_level": 1007,
        "grnd_level": 1000,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 10.44, "deg": 325, "gust": 12.95},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-28 12:00:00"
    },
    {
      "dt": 1680015600,
      "main": {
        "temp": 6.48,
        "feels_like": 1.98,
        "temp_min": 6.48,
        "temp_max": 6.48,
        "pressure": 1010,
        "sea_level": 1010,
        "grnd_level": 1003,
        "humidity": 38,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 8.41, "deg": 319, "gust": 11.27},
      "visibility": 10000,
      "pop": 0,
      "sys": {"pod": "d"},
      "dt_txt": "2023-03-28 15:00:00"
    }
  ],
  "city": {
    "id": 698740,
    "name": "Odesa",
    "coord": {"lat": 46.4775, "lon": 30.7326},
    "country": "UA",
    "population": 1001558,
    "timezone": 7200,
    "sunrise": 1679543716,
    "sunset": 1679587934
  }
};
