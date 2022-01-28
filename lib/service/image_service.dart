import 'package:englishscanner/model/image_model.dart';
import 'package:image_picker/image_picker.dart';

class MediaService {
  final ImagePicker _imagePicker = ImagePicker();
  ImageModel? image;

  Future<ImageModel> pickImageFromGallery() async {
    final _image = await _imagePicker.pickImage(source: ImageSource.gallery);
    final image = ImageModel(imagePath: _image!.path);
    return image;
  }
}
