import 'package:app_series_flutter/tv_show_data.dart';
import 'package:flutter/material.dart';

class TvShow {
  String title;
  String stream;
  int rating;
  String summary;

  TvShow({
    required this.title,
    required this.stream,
    required this.rating,
    required this.summary,
  });
}

class TvShowModel  extends ChangeNotifier{
  final List<TvShow> _tvShows = favTvShowList;
  List<TvShow> get tvShows => _tvShows;

  void addTvShow(TvShow tvShow, BuildContext context) {
    tvShows.add(tvShow);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${tvShow.title} add!',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
      )
    );
    notifyListeners();
  }

  void removeTvShow(TvShow tvShow, BuildContext context) {
    final index = tvShows.indexOf(tvShow);

    tvShows.remove(tvShow);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${tvShow.title} delete!',
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Cancel',
          onPressed: (){
            tvShows.insert(index, tvShow);
            notifyListeners();
          }
        ),
      )
    );
    notifyListeners();
  }
}