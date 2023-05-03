// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'water_cubit_cubit.dart';

abstract class WaterState {}

class WaterInitState extends WaterState {
  double water;
  double rate;
  double percent;

  WaterInitState(
      {required this.water, required this.rate, required this.percent});
}
