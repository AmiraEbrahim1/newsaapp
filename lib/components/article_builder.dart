import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_aapp/my_divider.dart';
import 'build_item.dart';
class ArticleBuilder extends StatelessWidget {
  final list;
  final BuildContext context;
   bool? isSearch=false;//no final???
  ArticleBuilder(this.list,this.context,{this.isSearch});
 // const ArticleBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        ConditionalBuilder(

          condition: list.isNotEmpty,

          builder: (context) =>
              ListView.separated(

                  physics: const BouncingScrollPhysics(),

                  itemBuilder: (context, index) =>
                      BuildItem(list[index], context),

                  separatorBuilder: (context, index) =>const MyDivider(),

                  itemCount: list.length),

          fallback: (context) =>isSearch!? Container():const Center(child: CircularProgressIndicator(),)

        );
  }
}
