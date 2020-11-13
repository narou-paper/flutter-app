import 'package:narou_paper/model/db.dart';

class EpisodesRepository {
  static Stream<List<Episode>> episodeListStream(String ncode) =>
      NarouDatabase().episodeListStream(ncode);
}
