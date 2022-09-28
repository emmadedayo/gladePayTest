import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:weather/core/themes/app_theme.dart';
import 'package:weather/logic/cubit/appCubit.dart';
import 'package:weather/logic/cubit/mapCubit.dart';
import 'package:weather/logic/debug/app_bloc_observer.dart';
import 'package:weather/logic/state/app_state.dart';
import 'package:weather/logic/state/mapState.dart';
import 'package:weather/presentation/router/app_router.dart';
import 'package:weather/presentation/screens/home/home_page_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final GoogleMapsFlutterPlatform mapsImplementation = GoogleMapsFlutterPlatform.instance;
  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = true;
  }
  Bloc.observer = AppBlocObserver();
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  const MyApp({Key? key,required this.appRouter}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<AppCubit>(
                create: (context) => AppCubit(AppState())
            ),

            BlocProvider<MapCubit>(
                create: (context) => MapCubit(MapState())
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather',
            theme: AppTheme.lightTheme,
            home: const HomeScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}

