part of 'app_init_bloc.dart';

sealed class AppInitBlocState extends Equatable {
  const AppInitBlocState();

  bool get isInitialized => this is AppInitFinished;

  @override
  List<Object> get props => [];
}

final class AppInitInitial extends AppInitBlocState {}

final class AppInitInProgress extends AppInitBlocState {
  const AppInitInProgress(this.stage);

  final String stage;
}

final class AppInitFailure extends AppInitBlocState {
  const AppInitFailure(this.error);

  final String error;
}

final class AppInitFinished extends AppInitBlocState {}
