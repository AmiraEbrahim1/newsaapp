import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_aapp/components/article_builder.dart';
import 'package:news_aapp/components/components.dart';
import 'package:news_aapp/cubit/cubit.dart';
import 'package:news_aapp/cubit/states.dart';
import 'package:webview_flutter/webview_flutter.dart';
class SearchScreen extends StatelessWidget {

 const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
    return BlocConsumer<NewsCubit,NewsStates>(
      listener:(context,state){} ,
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Container(
                  child: TextFormField(
                    controller:searchController ,
                    onChanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validator: (value){
                      if(value!.isEmpty){
                       return 'SEARCH must not be empty';
                      }
                    },
                    decoration: const InputDecoration(
                        label: Text('Search') ,
                        prefixIcon: Icon(Icons.search)
                    ),
                  ),
                ),
                Expanded(
                  child: ArticleBuilder(
                      NewsCubit.get(context).search,context,isSearch: true,),
                )
              ],
            ),
          ),
        );
      },

    );
  }
}
