import 'package:flutter/material.dart';
import 'package:narou_paper/repository/episode.dart';
import 'package:provider/provider.dart';
import 'package:narou_paper/model/db.dart';

class EpisodeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Episodes'),
              ),
              stretch: false,
              floating: true,
              pinned: false,
              snap: false,
            ),
            _EpisodeList(),
          ],
        ),
      );
}

class _EpisodeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => StreamProvider<List<Episode>>.value(
        value: EpisodesRepository.episodeListStream,
        child: Builder(
          builder: (BuildContext context) {
            final episodeList = context.watch<List<Episode>>();
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final itemIndex = index ~/ 2;
                  if (index.isEven)
                    return EpisodeListTile(episodeList[itemIndex]);
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
                childCount: episodeList == null ? 0 : episodeList.length * 2,
              ),
            );
          },
        ),
      );
}

class EpisodeListTile extends StatelessWidget {
  final Episode episode;

  EpisodeListTile(this.episode);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(episode.title),
      subtitle: Text(episode.postedAt?.toString()),
      trailing: Icon(Icons.more_vert),
      onTap: () {},
    );
  }
}
