import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/core/bloc/app_init_bloc/app_init_bloc.dart';
import 'package:blocpost/core/bloc/simple_bloc_observer.dart';
import 'package:blocpost/core/di/injection.dart' as di;
import 'package:blocpost/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();

  Bloc.observer = SimpleBlocObserver();

  runApp(const AppRoot());
}

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppInitBloc()..add(AppInitStarted()),
      child: BlocBuilder<AppInitBloc, AppInitBlocState>(
        builder: (context, state) {
          return state.isInitialized
              ? App()
              : const MaterialApp(
                home: Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                ),
              );
        },
      ),
    );
  }
}

class App extends StatelessWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
      ),

      routerConfig: _appRouter.config(),
    );
  }
}
