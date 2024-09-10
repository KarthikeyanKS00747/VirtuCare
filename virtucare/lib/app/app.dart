import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:virtucare/blocs/seaches_bloc/recent_searches_bloc.dart';
import 'package:virtucare/router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VirtuCare extends StatelessWidget {
  const VirtuCare({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: BlocProvider(
        create: (context) => RecentSearchesBloc(),
        child: MaterialApp.router(
          debugShowMaterialGrid: false,
          title: 'VirtuCare',
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      ),
    );
  }
}
