import 'package:englishscanner/model/image_model.dart';
import 'package:englishscanner/providers/base_model.dart';
import 'package:englishscanner/repositories/exceptions.dart';
import 'package:englishscanner/service/image_service.dart';

// home_page.dartのBaseModelを継承している
class ImageViewModel extends BaseModel {
  ImageModel? _image;

  // ゲッター
  get image => _image;

  // int sum(int x, int y) {
  // return x + y;
  // }
  // 上と下は同じ
  // int sum(int x, int y) => x + y;

  void getImage() async {
    print('getImageが実行されました。');
    //Clears previous picture from memory
    if (_image != null) {
      _image = null;
    }
    // base_model.dartのCurrentState
    setState(CurrentState.loading);
    try {
      final _mediaService = MediaService();
      _image = await _mediaService.pickImageFromGallery();
      print('ここで代入されます。');
      print(_image!.imagePath);
      setState(CurrentState.loaded);

      //exception.dartからimportしたやつ
    } on ImageNotSelectedException {
      setState(CurrentState.error);
    } catch (e) {
      setState(CurrentState.error);
    }
  }
}
