import 'dart:html';

import 'package:flutter/material.dart';

import '../web/web.dart';
import 'components.dart';
class BuildItem extends StatelessWidget {
  final  article;
  final BuildContext context;
  // BuildItem({Key? key}) : super(key: key);
   BuildItem(this.article,this.context);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        navigateTo(context, Web(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: '${article['urlToImage']}',
                imageErrorBuilder: (context,error,stackTrace)=>Image.asset('assets/images/download.jpg',fit: BoxFit.fill,),
              ),),
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Text('${article['title']}',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                      ),

                      ),

                      Text('${article['publishedAt']}', style: const TextStyle(
                          color: Colors.grey
                      ),)
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}
