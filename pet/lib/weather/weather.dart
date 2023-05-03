import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet/drawerappbar.dart';
import 'package:pet/generated/locale_keys.g.dart';
import 'package:pet/weather/weather_json.dart';

DateTime dateTime = DateTime.now();
var date = dateTime;
String uriRU =
    'https://api.openweathermap.org/data/2.5/forecast?q=Odesa&appid=eb2ad68438537913ba1f7fa6b92ae088&units=metric&lang=ru';
String uriEN =
    'https://api.openweathermap.org/data/2.5/forecast?q=Odesa&appid=eb2ad68438537913ba1f7fa6b92ae088&units=metric&lang=en';
String uri = '';

Future<AutoGenerate> fetchAlbum() async {
  final response = await http.get(Uri.parse(uri));
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return AutoGenerate.fromJson(json);
  } else {
    throw Exception(const Text(LocaleKeys.failed_to_load_album).tr());
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherState();
}

class _WeatherState extends State<WeatherScreen> {
  getLocale() {
    if (context.locale == const Locale('ru')) {
      uri = uriRU;
      fetchAlbum();
    } else {
      if (context.locale == const Locale('en')) {
        uri = uriEN;
        fetchAlbum();
      }
    }
  }

  @override
  void didChangeDependencies() {
    getLocale();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        drawer: const DrawerAppBar(),
        appBar: AppBar(title: const Text(LocaleKeys.weather).tr()),
        body: FutureBuilder(
          future: fetchAlbum(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final String iconnov =
                  snapshot.data!.list.first.weather.first.icon;
              final String description =
                  snapshot.data!.list.first.weather.first.description;
              final num speed = snapshot.data!.list.first.wind.speed;
              final num pressure = snapshot.data!.list.first.main.pressure;
              final num humidity = snapshot.data!.list.first.main.humidity;

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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    '${snapshot.data!.list.first.main.temp.round()}', //today's temp
                                    style: const TextStyle(fontSize: 50)),
                                Container(
                                  width: 20,
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 20, 20),
                                  child: const Icon(Icons.exposure_zero),
                                ),
                                Image.network(
                                    'https://openweathermap.org/img/wn/$iconnov@2x.png'), //icons weather from web
                                Text(
                                  description,
                                  style: const TextStyle(
                                      fontSize: 15,
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
                                        '$speed m/c',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const Text(LocaleKeys.wind).tr(),
                                    ]),
                                    Column(
                                      children: [
                                        Text(
                                          '$pressure hPa',
                                          style: const TextStyle(fontSize: 25),
                                        ),
                                        const Text(LocaleKeys.pressure).tr(),
                                      ],
                                    ),
                                    Column(children: [
                                      Text(
                                        '$humidity %',
                                        style: const TextStyle(fontSize: 25),
                                      ),
                                      const Text(LocaleKeys.humidity).tr(),
                                    ])
                                  ])),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child:
                                  Divider(height: 10.0, color: Colors.black)),
                        ]),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: weatherHour(),
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

Widget? weatherHour() => FutureBuilder(
      future: fetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List time = snapshot.data!.list.map((e) => e.dtTxt).toList();
          final List newtime =
              time.map((e) => e!.substring(10, 13).toString()).toList();
          final List temp =
              snapshot.data!.list.map((e) => e.main.temp.round()).toList();
          final List windspeed =
              snapshot.data!.list.map((e) => e.wind.speed).toList();
          final List humidity =
              snapshot.data!.list.map((e) => e.main.humidity).toList();
          final List icon = snapshot.data!.list
              .map((e) => e.weather.map((e) => e.icon.toString()))
              .toList();
          final List newicon = [];
          for (var e in icon) {
            var aaa = e.toString().substring(1, 4);
            newicon.add('https://openweathermap.org/img/wn/$aaa@2x.png');
          }
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
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
