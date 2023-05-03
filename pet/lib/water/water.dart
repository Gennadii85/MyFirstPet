import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pet/drawerappbar.dart';
import 'package:pet/water/cubit/water_cubit_cubit.dart';

class Water2 extends StatelessWidget {
  const Water2({super.key});
  @override
  Widget build(BuildContext context) {
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
                  fit: BoxFit.cover)),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<WaterCubit>().manrate();
                    showDialogRate(context);
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
                    context.read<WaterCubit>().womanrate();
                    showDialogRate(context);
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
            BlocBuilder<WaterCubit, WaterInitState>(
              builder: (context, state) {
                return Text(
                  'Вы выпили ${state.water.round().toString()} mll воды',
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: 'Comfortaa-Regular',
                      color: Color.fromARGB(255, 107, 17, 11)),
                );
              },
            ),
            const Spacer(),
            BlocBuilder<WaterCubit, WaterInitState>(
              builder: (context, state) {
                return CircularPercentIndicator(
                  percent: state.percent < 1 ? state.percent : 1,
                  animateFromLastPercent: true,
                  radius: 100,
                  lineWidth: 20,
                  animation: true,
                  animationDuration: 500,
                  progressColor: const Color.fromARGB(255, 241, 10, 41),
                  center: Text(
                    '${(state.percent * 100).round()} %',
                    style: const TextStyle(
                        fontSize: 40, color: Color.fromARGB(255, 238, 21, 21)),
                  ),
                );
              },
            ),
            const Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CupButton(
                  volume: 75, coolbackFun: context.read<WaterCubit>().coolback),
              CupButton(
                  volume: 100,
                  coolbackFun: context.read<WaterCubit>().coolback),
              CupButton(
                  volume: 125,
                  coolbackFun: context.read<WaterCubit>().coolback),
            ]),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupButton(
                    volume: 150,
                    coolbackFun: context.read<WaterCubit>().coolback),
                CupButton(
                    volume: 175,
                    coolbackFun: context.read<WaterCubit>().coolback),
                CupButton(
                    volume: 200,
                    coolbackFun: context.read<WaterCubit>().coolback),
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
                    context.read<WaterCubit>().clearWater();
                  },
                  child: const Text('Reset'),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<dynamic> showDialogRate(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          Center(
            child: BlocBuilder<WaterCubit, WaterInitState>(
              builder: (context, state) {
                return Text(
                    'это ${state.rate.round()} % нормы воды для мужчин');
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Closed'))
        ],
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
