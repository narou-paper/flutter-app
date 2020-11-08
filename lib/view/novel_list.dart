import 'package:flutter/material.dart';
import 'package:narou_paper/repository/novel.dart';
import 'package:provider/provider.dart';
import 'package:narou_paper/model/db.dart';

class NovelList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamProvider<List<Novel>>.value(
        value: NovelsRepository.novelListStream,
        child: Builder(
          builder: (BuildContext context) {
            final novelList = context.watch<List<Novel>>();
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final itemIndex = index ~/ 2;
                  if (index.isEven)
                    return ListTile(
                      title: Text(novelList[itemIndex].title),
                      onTap: () {},
                    );
                  else
                    return Divider(
                      height: 0,
                      thickness: 1,
                    );
                },
                semanticIndexCallback: (_, int localIndex) {
                  if (localIndex.isEven) return localIndex ~/ 2;
                  return null;
                },
                childCount: novelList == null ? 0 : novelList.length * 2,
              ),
            );
          },
        ),
      );
}
