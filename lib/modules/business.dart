import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_aapp/components/article_builder.dart';
import 'package:news_aapp/cubit/states.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
var list=NewsCubit.get(context).business;
        return ArticleBuilder(list,context);
      },
    );
  }
}
