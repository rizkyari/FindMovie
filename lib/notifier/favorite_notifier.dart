import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:my_movies/model/favorite_model.dart';

class FavoriteNotifier with ChangeNotifier {
  List<Favorite> _favoriteList = [];

  UnmodifiableListView<Favorite> get favoriteList =>
      UnmodifiableListView(_favoriteList);

  void addFavorite(Favorite favorite){
    _favoriteList.add(favorite);
    notifyListeners();
  }    

  void removeFavorite(String text){
    _favoriteList.removeWhere((item) => item.imdbId == text);
    notifyListeners();
  }
}
