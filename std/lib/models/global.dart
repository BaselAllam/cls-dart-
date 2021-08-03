import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';




class Global{

  String _domain = 'https://stds-dfc01-default-rtdb.firebaseio.com';

  String get domain => _domain;


saveDataLocal(String key, String value) async {

  SharedPreferences _save = await SharedPreferences.getInstance();
  _save.setString(key, value);
}



Future<bool> getLocalData(String key) async {

  SharedPreferences _get = await SharedPreferences.getInstance();
  String? data = _get.getString(key);

  if(data == null) {
    return false;
  }else{
    return true;
  }
}


clearData() async {

  SharedPreferences _clear = await SharedPreferences.getInstance();
  _clear.clear();
}


pickImage(ImageSource source) async {

  ImagePicker _imagePicker = ImagePicker();

  var _pickedImage = await _imagePicker.pickImage(source: source);

  return _pickedImage!.path;
}
}