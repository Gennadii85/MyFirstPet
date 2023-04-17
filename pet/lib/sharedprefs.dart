import 'package:pet/water.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  // SharedPreferences preferences;

  // UserSharedPreferences({required this.preferences});

  // Future init() async {
  //   preferences = await SharedPreferences.getInstance();
  // }

  final waterkey = 'allwater';
  // final int water = WaterState().water.toInt();

  Future setWater(waterSH) async {
    var preferences = await SharedPreferences.getInstance();
    WaterState().water = waterSH;
    preferences.setInt(waterkey, waterSH);
  }

  Future getWater(water) async {
    var preferences = await SharedPreferences.getInstance();
    preferences.getInt(waterkey);
  }

  // int getWater() => preferences.getInt(waterkey)?.toInt() ?? 0;
}








// class Shared extends StatefulWidget {
//   const Shared({super.key});

//   @override
//   State<Shared> createState() => _SharedState();
// }

// class _SharedState extends State<Shared> {
//   final textcontr = TextEditingController();
//   String txt = '';
//   @override
//   void initState() {
//     super.initState();
//     // String txt = ;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//       appBar: AppBar(),
//       body: Center(
//         child: Column(children: [
//           TextField(
//             controller: textcontr,
//             onSubmitted: (textcontr) => txt = textcontr,
//           ),
//           TextButton(
//             onPressed: () {
//               txt = textcontr.text;
//             },
//             child: const Text('save'),
//           ),
//           TextButton(
//             onPressed: () {
//               setState(() {
//               });
//             },
//             child: const Text('get'),
//           ),
//           Text(txt),
//         ]),
//       ),
//     ));
//   }
// }
