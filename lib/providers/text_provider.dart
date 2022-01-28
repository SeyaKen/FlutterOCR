import 'package:englishscanner/model/image_model.dart';
import 'package:englishscanner/model/text_model.dart';
import 'package:englishscanner/providers/base_model.dart';
import 'package:englishscanner/providers/image_provider.dart';
import 'package:englishscanner/repositories/text_recognize.dart';

class TextViewModel extends BaseModel {
  late ImageViewModel _imageProvider;

  List<RecognizedText>? _processedTexts;

  List<RecognizedText>? get processedTexts => _processedTexts;
  ImageViewModel get imageProvider => _imageProvider;

  set imageProvider(ImageViewModel imageProvider) {
    _imageProvider = imageProvider;
    // emptyList();
  }

  void getText() async {
    setState(CurrentState.loading);
    try {
      // text_recognize.dartからimportした、MlService()
      final _mlSerive = MlService();

      // ImageModelの中身は
      // String? imagePath;
      // ImageModel({required this.imagePath});
      final ImageModel _image = _imageProvider.image!;

      final _imagePath = _image.imagePath!;

      // _mlSeriveで処理、認識された文字が_processedTextsに代入される
      _processedTexts = await _mlSerive.getText(_imagePath);
      setState(CurrentState.loaded);
    } catch (e) {
      setState(CurrentState.error);
    }
  }

  void emptyList() {
    _processedTexts = [];
  }
}
