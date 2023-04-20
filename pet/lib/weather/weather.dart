import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet/drawerappbar.dart';
import 'package:pet/weather/weather_json.dart';

DateTime dateTime = DateTime.now();
var date = dateTime;

Future<AutoGenerate> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=Odesa&appid=eb2ad68438537913ba1f7fa6b92ae088&units=metric&lang=ru'));
  if (response.statusCode == 200) {
    return AutoGenerate.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    final iconnov =
        AutoGenerate.fromJson(json).list.first.weather.first.icon.toString();
    final descriptionnov = AutoGenerate.fromJson(json)
        .list
        .first
        .weather
        .first
        .description
        .toString();
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        drawer: const DrawerAppBar(),
        appBar: AppBar(title: const Text('Weather')),
        body: FutureBuilder(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: Image.asset('assets/fon2.jpg').image)),
                child: Column(children: [
                  Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(snapshot.data!.city.name, //city name
                                    style: const TextStyle(
                                        fontSize: 45,
                                        color:
                                            Color.fromARGB(249, 240, 14, 48))),
                                Center(
                                    child: Text(
                                        '${date.day} . ${date.month} . ${date.year}', //today's date
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Color.fromARGB(
                                                136, 92, 20, 139))))
                              ]),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                    '${snapshot.data!.list.first.main.temp.round()}', //today's temp
                                    style: const TextStyle(fontSize: 50)),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                  child: const Icon(Icons.exposure_zero),
                                ),
                                Image.network(
                                    'https://openweathermap.org/img/wn/$iconnov@2x.png'), //icons weather from web
                                Text(
                                  descriptionnov,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontStyle: FontStyle.italic),
                                )
                              ]),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child:
                                  Divider(height: 10.0, color: Colors.black)),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(children: [
                                      Text(
                                        '${snapshot.data!.list.first.wind.speed} m/c',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const Text('ветер'),
                                    ]),
                                    Column(
                                      children: [
                                        Text(
                                          '${snapshot.data!.list.first.main.pressure} hPa',
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                        const Text('давление'),
                                      ],
                                    ),
                                    Column(children: [
                                      Text(
                                        '${snapshot.data!.list.first.main.humidity} %',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const Text('влажность'),
                                    ])
                                  ])),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child:
                                  Divider(height: 10.0, color: Colors.black)),
                        ]),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: WeatherHour(),
                    ),
                  ),
                ]),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class WeatherHour extends StatefulWidget {
  const WeatherHour({Key? key}) : super(key: key);

  @override
  State<WeatherHour> createState() => _WeatherHourState();
}

class _WeatherHourState extends State<WeatherHour> {
  final List time =
      AutoGenerate.fromJson(json).list.map((e) => e.dtTxt).toList();
  late List newtime = time.map((e) => e!.substring(10, 13).toString()).toList();
  final List temp =
      AutoGenerate.fromJson(json).list.map((e) => e.main.temp.round()).toList();
  final List windspeed =
      AutoGenerate.fromJson(json).list.map((e) => e.wind.speed).toList();
  final List humidity =
      AutoGenerate.fromJson(json).list.map((e) => e.main.humidity).toList();
  final List icon = AutoGenerate.fromJson(json)
      .list
      .map((e) => e.weather.map((e) => e.icon.toString()))
      .toList();
  final List newicon = [];

  @override
  Widget build(BuildContext context) {
    for (var e in icon) {
      var aaa = e.toString().substring(1, 4);
      newicon.add('https://openweathermap.org/img/wn/$aaa@2x.png');
    }

    return FutureBuilder(
      future: fetchAlbum(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.horizontal,
          itemCount: newtime.length,
          separatorBuilder: (BuildContext context, int index) =>
              const VerticalDivider(
            color: Color.fromARGB(255, 84, 154, 212),
            width: 8,
            thickness: 2,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('${newtime[index]} h', //time
                    style: const TextStyle(fontSize: 20)),
                Row(
                  children: [
                    Text('${temp[index]}', //temp
                        style: const TextStyle(fontSize: 20)),
                    Container(
                        width: 25,
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: const Icon(Icons.exposure_zero))
                  ],
                ),
                Image.network(
                  '${newicon[index]}',
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                ),
                Text('${windspeed[index]} m/c', //wind
                    style: const TextStyle(fontSize: 20)),
                Text('${humidity[index]} %', //humidity
                    style: const TextStyle(fontSize: 20)),
              ],
            );
          },
        );
      },
    );
  }
}
