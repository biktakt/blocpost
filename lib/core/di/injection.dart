import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:blocpost/core/di/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
Future<void> initDependencies() async {
  sl.init();
}
