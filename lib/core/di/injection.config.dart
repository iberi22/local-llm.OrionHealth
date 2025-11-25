// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i6;
import 'package:isar_agent_memory/isar_agent_memory.dart' as _i3;

import '../../features/health_record/application/bloc/health_record_cubit.dart'
    as _i17;
import '../../features/health_record/domain/repositories/health_record_repository.dart'
    as _i12;
import '../../features/health_record/infrastructure/repositories/health_record_repository_impl.dart'
    as _i13;
import '../../features/health_record/infrastructure/services/file_picker_service.dart'
    as _i4;
import '../../features/health_record/infrastructure/services/image_picker_service.dart'
    as _i5;
import '../../features/health_record/infrastructure/services/ocr_service.dart'
    as _i7;
import '../../features/local_agent/domain/services/vector_store_service.dart'
    as _i10;
import '../../features/local_agent/infrastructure/llm_service.dart' as _i14;
import '../../features/local_agent/infrastructure/rag_llm_service.dart' as _i15;
import '../../features/local_agent/infrastructure/services/isar_vector_store_service.dart'
    as _i11;
import '../../features/user_profile/application/bloc/user_profile_cubit.dart'
    as _i16;
import '../../features/user_profile/domain/repositories/user_profile_repository.dart'
    as _i8;
import '../../features/user_profile/infrastructure/repositories/user_profile_repository_impl.dart'
    as _i9;
import 'database_module.dart' as _i19;
import 'memory_module.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final memoryModule = _$MemoryModule();
    final databaseModule = _$DatabaseModule();
    gh.lazySingleton<_i3.EmbeddingsAdapter>(
        () => memoryModule.embeddingsAdapter);
    gh.lazySingleton<_i4.FilePickerService>(() => _i4.FilePickerServiceImpl());
    gh.lazySingleton<_i5.ImagePickerService>(
        () => _i5.ImagePickerServiceImpl());
    await gh.factoryAsync<_i6.Isar>(
      () => databaseModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i3.MemoryGraph>(() => memoryModule.memoryGraph(
          gh<_i6.Isar>(),
          gh<_i3.EmbeddingsAdapter>(),
        ));
    gh.lazySingleton<_i7.OcrService>(() => _i7.OcrServiceStub());
    gh.lazySingleton<_i8.UserProfileRepository>(
        () => _i9.UserProfileRepositoryImpl(gh<_i6.Isar>()));
    gh.lazySingleton<_i10.VectorStoreService>(
        () => _i11.IsarVectorStoreService(gh<_i3.MemoryGraph>()));
    gh.lazySingleton<_i12.HealthRecordRepository>(
        () => _i13.HealthRecordRepositoryImpl(gh<_i6.Isar>()));
    gh.lazySingleton<_i14.LlmService>(
        () => _i15.RagLlmService(gh<_i10.VectorStoreService>()));
    gh.factory<_i16.UserProfileCubit>(
        () => _i16.UserProfileCubit(gh<_i8.UserProfileRepository>()));
    gh.factory<_i17.HealthRecordCubit>(() => _i17.HealthRecordCubit(
          gh<_i12.HealthRecordRepository>(),
          gh<_i4.FilePickerService>(),
          gh<_i5.ImagePickerService>(),
          gh<_i7.OcrService>(),
          gh<_i10.VectorStoreService>(),
        ));
    return this;
  }
}

class _$MemoryModule extends _i18.MemoryModule {}

class _$DatabaseModule extends _i19.DatabaseModule {}
