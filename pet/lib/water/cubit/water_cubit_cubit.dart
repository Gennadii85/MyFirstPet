import 'package:bloc/bloc.dart';

part 'water_cubit_state.dart';

class WaterCubit extends Cubit<WaterInitState> {
  WaterCubit() : super(WaterInitState(water: 0, rate: 0, percent: 0));

  clearWater() => emit(WaterInitState(water: 0, rate: 0, percent: 0));
  coolback(volume) {
    emit(WaterInitState(
        water: state.water + volume, rate: state.rate, percent: state.percent));
    persent();
  }

  manrate() => emit(WaterInitState(
      rate: state.rate = (100 * state.water) / 3000,
      water: state.water,
      percent: state.percent));
  womanrate() => emit(WaterInitState(
      rate: state.rate = (100 * state.water) / 2000,
      water: state.water,
      percent: state.percent));
  persent() => emit(WaterInitState(
      percent: state.percent = ((state.water * 100 / 3000) / 100).toDouble(),
      rate: state.rate,
      water: state.water));
}
