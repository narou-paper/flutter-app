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
                    return NovelListTile(novelList[itemIndex]);
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

class NovelListTile extends StatelessWidget {
  final Novel novel;

  NovelListTile(this.novel);

  @override
  Widget build(BuildContext context) {
    final serialText = novel.isSerial
        ? '連載中: ${novel.readEpisodeCount}/${novel.maxEpisodeNum}'
        : '短編';
    final subtitle = '作者: ${novel.writerNickname}, $serialText';

    return ListTile(
      title: Text(novel.title),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.more_vert),
      onTap: () {},
    );
  }
}
