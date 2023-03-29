import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet/todolist.dart';
import 'package:pet/weather/weather_json.dart';

DateTime dateTime = DateTime.now();
var date = dateTime;

Future<AutoGenerate> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?q=Odesa&appid=eb2ad68438537913ba1f7fa6b92ae088&units=metric'));
  if (response.statusCode == 200) {
    // AutoGenerate datehour = AutoGenerate.fromJson(jsonDecode(response.body));

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
    return MaterialApp(
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
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(snapshot.data!.city.name, //city name
                              style: const TextStyle(
                                  fontSize: 32, color: Colors.black54)),
                          Text(
                              '${date.day} . ${date.month} . ${date.year}', //today's date
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(136, 92, 20, 139)))
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                '${snapshot.data!.list.first.main.temp} иконка с сайта', //today's temp
                                style: const TextStyle(fontSize: 25))
                            //иконка градус по цельсию
                            //иконка погоды с сайта
                          ]),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(height: 10.0, color: Colors.black)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(children: [
                              Text(
                                  '${snapshot.data!.list.first.wind.speed} m/c'),
                              const Text('ветер'),
                            ]),
                            Column(
                              children: [
                                Text(
                                    '${snapshot.data!.list.first.main.pressure} hPa'),
                                const Text('давление'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                    '${snapshot.data!.list.first.main.humidity} %'),
                                const Text('влажность'),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Divider(height: 10.0, color: Colors.black)),
                    ]),
                  ),
                  const Expanded(
                    child: WeatherHour(),
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
  List time = AutoGenerate.fromJson(json).list.map((e) => e.dt).toList();
  List temp = AutoGenerate.fromJson(json).list.map((e) => e.main.temp).toList();
  List windspeed =
      AutoGenerate.fromJson(json).list.map((e) => e.wind.speed).toList();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchAlbum(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return ListView.separated(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 20),
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Text('${time[index]}'), //time
                Text('${temp[index]}'), //icon
                Text('bbb'), //temp
                Text('${windspeed[index]}'), //wind
              ],
            );
          },
        );
      },
    );
  }
}
