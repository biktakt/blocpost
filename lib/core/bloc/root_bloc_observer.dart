import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class RootBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    log('Created $bloc');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event in $bloc: $event');
  }

  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   super.onChange(bloc, change);
  //   log(
  //     'Changed state in $bloc from ${change.currentState.runtimeType} to ${change.nextState.runtimeType}',
  //   );
  // }

  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  //   log(
  //     'Transition in $bloc : ${transition.currentState.runtimeType} -> ${transition.nextState.runtimeType}',
  //   );
  // }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    log('Closed $bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log('Error in $bloc: $error\nStacktrace: $stackTrace');
  }
}
