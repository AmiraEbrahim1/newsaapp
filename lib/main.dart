import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_aapp/cubit/cubit.dart';
import 'package:news_aapp/mode/states.dart';
import 'package:news_aapp/modules/business.dart';
import 'package:news_aapp/news_layout/layout.dart';
import 'package:news_aapp/shared/local/cachehelper.dart';
import 'package:news_aapp/shared/remote/dio.dart';

import 'mode/cubit.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
bool ? light=CacheHelper.getval(key: 'light');
  runApp( MyApp(light));
}

class MyApp extends StatelessWidget {
  final bool ? light ;//???
  const MyApp(this.light);//???
 // const MyApp(light, {Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(BuildContext context)=>NewsCubit()..getBusiness()..getSports()..getScience(), ),
        BlocProvider(create:(BuildContext context)=>ModeCubit()..changeMode(fromShared: light), ),
      ],
      child: BlocConsumer<ModeCubit,ModeStates>(
        listener: (context,state){},
          builder: (context,state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                appBarTheme: const AppBarTheme(
                  actionsIconTheme: IconThemeData(
                      color: Colors.black,
                      size: 30
                  ),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 25
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,

                  ),
                  elevation: 0.0,
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,

                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 30.0,
                    selectedIconTheme: IconThemeData(
                        color: Colors.deepOrange
                    ),
                    selectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey,
                    unselectedLabelStyle: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    showUnselectedLabels: true
                ),
                  textTheme:const TextTheme(
                      bodyText1: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.black,
                      )
                  )
              ),
              darkTheme: ThemeData(
                  primarySwatch: Colors.deepOrange,
                  scaffoldBackgroundColor:  HexColor('333739'),
                  appBarTheme: AppBarTheme(
                    actionsIconTheme: const IconThemeData(
                        color: Colors.white,
                        size: 30
                    ),
                    titleTextStyle:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,

                    ),
                    elevation: 0.0,
                    backwardsCompatibility: false,
                    backgroundColor: HexColor('333739'),

                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor:HexColor('333739'),
                      type: BottomNavigationBarType.fixed,
                      elevation: 30.0,
                      selectedIconTheme:const IconThemeData(
                          color: Colors.deepOrange
                      ),
                      selectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      selectedItemColor: Colors.white,
                      unselectedItemColor: Colors.grey,
                      unselectedLabelStyle:const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      showUnselectedLabels: true
                  ),
                  textTheme:const TextTheme(
                      bodyText1: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                        color: Colors.white,
                      )
                  )
              ),
              themeMode: ModeCubit.get(context).light?ThemeMode.light:ThemeMode.dark,
              home: NewsLayout(),

            );
          }
      ),
    );
  }
}

