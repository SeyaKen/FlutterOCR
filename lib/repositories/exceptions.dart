// Exceptionはもともと用意されているクラス
class BaseException implements Exception {
  String? message;
  BaseException({this.message});
}

// image_provider.dartで使う
// 上で作ったBaseExceptionを継承している
class ImageNotFoundException extends BaseException {
  ImageNotFoundException(String message) : super(message: message);
}

// 上で作ったBaseExceptionを継承している
class ImageNotSelectedException extends BaseException {
  ImageNotSelectedException(String message) : super(message: message);
}
