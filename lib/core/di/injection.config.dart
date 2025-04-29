// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:blocpost/core/di/di_module.dart' as _i145;
import 'package:blocpost/features/post/data/datasources/post_remote_data_source.dart'
    as _i251;
import 'package:blocpost/features/post/data/repositories/post_repository_impl.dart'
    as _i238;
import 'package:blocpost/features/post/domain/repositories/post_repository.dart'
    as _i302;
import 'package:blocpost/features/post/domain/usecases/get_post_by_id.dart'
    as _i202;
import 'package:blocpost/features/post/domain/usecases/get_posts.dart' as _i194;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio());
    gh.lazySingleton<_i251.PostRemoteDataSource>(
      () => _i251.PostRemoteDataSourceImpl(dio: gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i302.PostRepository>(
      () => _i238.PostRepositoryImpl(
        postRemoteDataSource: gh<_i251.PostRemoteDataSource>(),
      ),
    );
    gh.factory<_i202.GetPostById>(
      () => _i202.GetPostById(gh<_i302.PostRepository>()),
    );
    gh.factory<_i194.GetPosts>(
      () => _i194.GetPosts(gh<_i302.PostRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i145.RegisterModule {}
