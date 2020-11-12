import 'package:narou_paper/model/db.dart';

class EpisodesRepository {
  static Stream<List<Episode>> get episodeListStream =>
      NarouDatabase().episodeListStream;
}
