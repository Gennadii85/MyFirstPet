import 'package:flutter/material.dart';
// import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pet/drawerappbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Water extends StatefulWidget {
  const Water({
    Key? key,
  }) : super(key: key);

  @override
  State<Water> createState() => WaterState();
}

class WaterState extends State<Water> {
  double water = 0;
  final String mll = 'mll';
  final String L = 'L';
  bool status = true;
  final int waterrateman = 3000; //mll
  final int waterratewoman = 2000; //mll
  num man = 0;
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    getWater();
  }

  getWater() {
    water = prefs.getDouble('waterkey') ?? 0;
    setState(() {});
  }

  Future setWater() async {
    await prefs.setDouble('waterkey', water);
  }

  manrate() {
    setState(() {
      if (status == true) {
        man = (100 * water) / waterrateman;
      }
      if (status == false) {
        man = ((100 * water) / waterrateman) * 1000;
      }
    });
  }

  womanrate() {
    setState(() {
      if (status == true) {
        man = (100 * water) / waterratewoman;
      }
      if (status == false) {
        man = ((100 * water) / waterratewoman) * 1000;
      }
    });
  }

  coolback(volume) {
    //from Row buttons
    setState(() {
      if (status == true) {
        water = volume + water;
      }
      if (status == false) {
        water = (volume / 1000) + water;
      }
    });
    setWater();
  }

  mlltoL() {
    //true - mll : false - L
    if (status == true) {
      water = water * 1000;
    }
    if (status == false) {
      water = (water / 1000);
    }
    return water;
  }

  @override
  Widget build(BuildContext context) {
    double percent = status
        ? ((water * 100 / waterrateman) / 100).toDouble()
        : ((water * 100 / (waterrateman / 1000)) / 100).toDouble();
    if (percent < 1.0) {
      percent;
    } else {
      percent = 1.0;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const DrawerAppBar(),
        appBar: AppBar(title: const Text('Water')),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Image.asset('assets/water.jpg').image,
                  fit: BoxFit.fill)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    manrate();
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        children: [
                          Center(
                              child: Text(
                                  'это ${man.round()} % нормы воды для мужчин')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Closed'))
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: const Color.fromARGB(255, 154, 230, 32)),
                  child: const Icon(
                    Icons.man,
                    color: Colors.red,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    womanrate();
                    showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        children: [
                          Center(
                              child: Text(
                                  'это ${man.round()} % нормы воды для женщин')),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Closed'))
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      elevation: 3,
                      backgroundColor: const Color.fromARGB(255, 154, 230, 32)),
                  child: const Icon(
                    Icons.woman,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              'Вы выпили ${status ? water.round() : water.toStringAsFixed(2)} ${status ? mll : L} воды',
              style: const TextStyle(
                  fontSize: 25,
                  fontFamily: 'Comfortaa-Regular',
                  color: Color.fromARGB(255, 107, 17, 11)),
            ),
            const Spacer(),
            CircularPercentIndicator(
              percent: percent,
              animateFromLastPercent: true,
              radius: 100,
              lineWidth: 20,
              animation: true,
              animationDuration: 500,
              progressColor: const Color.fromARGB(255, 34, 221, 105),
              center: Text(
                '${(percent * 100).round()} %',
                style: const TextStyle(
                    fontSize: 40, color: Color.fromARGB(255, 238, 21, 21)),
              ),
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CupButton(volume: 75, coolbackFun: coolback),
              CupButton(volume: 100, coolbackFun: coolback),
              CupButton(volume: 125, coolbackFun: coolback),
            ]),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupButton(volume: 150, coolbackFun: coolback),
                CupButton(volume: 175, coolbackFun: coolback),
                CupButton(volume: 200, coolbackFun: coolback),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 82, 143, 201)),
                  onPressed: () {
                    setState(() {
                      water = 0;
                      prefs.clear();
                    });
                  },
                  child: const Text('Reset'),
                ),
                // LiteRollingSwitch(
                //   onChanged: (bool value) {
                //     setState(() {
                //       status = value;
                //     });
                //     mlltoL();
                //   },
                //   value: status,
                //   textSize: 20,
                //   colorOff: Colors.blueAccent,
                //   colorOn: Colors.blueGrey,
                //   iconOff: Icons.check,
                //   textOff: L,
                //   textOn: mll,
                //   onDoubleTap: () {},
                //   onSwipe: () {},
                //   onTap: () {},
                // ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class CupButton extends StatelessWidget {
  final int volume;
  final Function coolbackFun;

  const CupButton({
    Key? key,
    required this.volume,
    required this.coolbackFun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        coolbackFun(volume);
      },
      style: ElevatedButton.styleFrom(
          elevation: 5,
          backgroundColor: const Color.fromARGB(255, 15, 235, 81)),
      child: Column(
        children: [
          const Icon(Icons.local_drink),
          Text(volume.toString()),
        ],
      ),
    );
  }
}
