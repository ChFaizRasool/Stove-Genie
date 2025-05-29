import 'package:get_it/get_it.dart';
import 'package:stove_genie/bloc/cubit/auth_cubit.dart';

class Di {
  final sl = GetIt.I;

  Future<void> init() async {
    sl.registerLazySingleton<AuthCubit>(() => AuthCubit());
  }
}
