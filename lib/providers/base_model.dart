import 'package:flutter/material.dart';

enum CurrentState { idle, loading, loaded, error }

// ChangeNotifierをつけることで、notifyListnerを使うことができる。
class BaseModel extends ChangeNotifier {
  CurrentState _state = CurrentState.idle;
  // _stateがprivateだから外からアクセスできるようにここで
  // CurrentState get state => _state;が書かれている
  // ゲッター
  CurrentState get state => _state;

  // セッター
  void setState(CurrentState state) {
    _state = state;
    // notifyListeners()により、home_page.dartのConsumer<ImageViewModel>が発火
    notifyListeners();
  }
}
