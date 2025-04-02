import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parking_app/home/cubit/home_cubit.dart';
import 'package:parking_app/l10n/l10n.dart';
import 'package:parking_app/parking_map/cubit/user_current_location/check_location_permission_cubit.dart';
import 'package:parking_app/parking_map/cubit/user_current_location/get_user_position_cubit.dart';
import 'package:parking_app/router/go_router.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/utils/app_dark_theme.dart';
import 'package:parking_app/shared/utils/app_light_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // get theme mode on system
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider<CheckLocationPermissionCubit>(
          create: (context) => CheckLocationPermissionCubit(),
        ),
        BlocProvider<GetUserPositionCubit>(
          create: (context) => GetUserPositionCubit(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: GlobalRouter.instance,
        theme: const AppTheme().themeData,
        darkTheme: const AppDarkTheme().themeData,
        themeMode: ThemeMode.light,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
