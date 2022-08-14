import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_aapp/components/components.dart';
import 'package:news_aapp/cubit/cubit.dart';
import 'package:news_aapp/cubit/states.dart';
import 'package:news_aapp/mode/cubit.dart';
import 'package:news_aapp/modules/search.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            title: const Text('NewsApp'),
            actions: [
              IconButton(
                  onPressed:(){
                    navigateTo(context, SearchScreen());
                  },
                  icon:const Icon(Icons.search)),
              IconButton(
                  onPressed:(){
                    ModeCubit.get(context).changeMode();
                  },
                  icon:Icon(Icons.brightness_4_outlined)
                  )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:NewsCubit.get(context).items,
            currentIndex:NewsCubit.get(context).current_index,
            onTap: (index){
              NewsCubit.get(context).changeNav(index);
            },
          ),
          body: NewsCubit.get(context).Screen[NewsCubit.get(context).current_index],
        );
      },
    );
  }
}
