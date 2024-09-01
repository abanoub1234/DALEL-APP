import 'package:get_it/get_it.dart';

import '../../features/auth/presentation/auth_cubit/cubit_cubit.dart';
import '../database/cache/cache_helper.dart';


final getIt = GetIt.instance;
void setupServiceLocator()
{
  getIt.registerSingleton<CacheHelper>(CacheHelper());

}