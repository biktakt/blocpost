import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_init_event.dart';
part 'app_init_state.dart';

class AppInitBloc extends Bloc<AppInitBlocEvent, AppInitBlocState> {
  AppInitBloc() : super(AppInitInitial()) {
    on<AppInitStarted>(_init);
  }

  Future<void> _init(
    AppInitBlocEvent event,
    Emitter<AppInitBlocState> emit,
  ) async {
    emit(const AppInitInProgress('Fake init...'));
    // await Future.delayed(const Duration(seconds: 1));
    emit(AppInitFinished());
  }
}
