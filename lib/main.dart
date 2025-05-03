import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocpost/core/bloc/app_init_bloc/app_init_bloc.dart';
import 'package:blocpost/core/bloc/root_bloc_observer.dart';
import 'package:blocpost/core/di/injection.dart' as di;
import 'package:blocpost/core/router/app_router.dart';
import 'package:blocpost/core/styles/theme_mode.dart';
import 'package:blocpost/core/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initDependencies();

  Bloc.observer = RootBlocObserver();

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
              ? const AppThemeMode(child: App())
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

final _appRouter = AppRouter();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Demo App',
      theme: AppThemeScheme.lightTheme,
      darkTheme: AppThemeScheme.darkTheme,
      themeMode: AppThemeMode.of(context),
      routerConfig: _appRouter.config(),
    );
  }
}
