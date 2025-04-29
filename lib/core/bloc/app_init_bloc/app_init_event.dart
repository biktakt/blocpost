part of 'app_init_bloc.dart';

sealed class AppInitBlocEvent extends Equatable {
  const AppInitBlocEvent();

  @override
  List<Object> get props => [];
}

final class AppInitStarted extends AppInitBlocEvent {}
