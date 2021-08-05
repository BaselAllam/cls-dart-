import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:scoped_model/scoped_model.dart';



mixin MapController on Model{

  bool _isGetCurrentPositionLoading = false;
  bool get isGetCurrentPositionLoading => _isGetCurrentPositionLoading;

  bool _isSearchLocationLoading = false;
  bool get isSearchLocationLoading => _isSearchLocationLoading;

  List<Marker> markers = [];

  var position;

  Future<bool> locationServiceEnabled() async {

    bool _isEnabled = await Geolocator.isLocationServiceEnabled();

    if(_isEnabled == true) {
      return true;
    }else{
      return false;
    }
  }

  Future<bool> hasAPermission() async {

    LocationPermission _isHas = await Geolocator.checkPermission();

    if(_isHas == LocationPermission.denied) {
      Geolocator.requestPermission();
      return false;
    }else{
      return true;
    }
  }

 Future<int> checkServicePermission() async {

    try{
      bool _isHas = await hasAPermission();

      bool _isEnabled = await locationServiceEnabled();

      if(_isHas == false){
        return 0;
      }else if(_isEnabled == false){
        return 1;
      }else{
        return 3;
      }
    }catch(e) {
      return 2;
    }
  }


 getCurrentPosition() async {

    _isGetCurrentPositionLoading = true;
    notifyListeners();

    int _check = await checkServicePermission();

    if(_check == 0) {
      position = 0;
      _isGetCurrentPositionLoading = false;
      notifyListeners();
    }else if(_check == 1) {
      position = 1;
      _isGetCurrentPositionLoading = false;
      notifyListeners();
    }else if(_check == 2) {
      position = 2;
      _isGetCurrentPositionLoading = false;
      notifyListeners();
    }else{
      Position _currentPosition = await Geolocator.getCurrentPosition();
      position = _currentPosition;
      _isGetCurrentPositionLoading = false;
      notifyListeners();
    }
  }


 searchLocation(String location) async {

    _isSearchLocationLoading = true;
    notifyListeners();

    int _check = await checkServicePermission();

    if(_check == 0) {
      _isGetCurrentPositionLoading = false;
      notifyListeners();
      position = 0;
    }else if(_check == 1) {
      _isGetCurrentPositionLoading = false;
      notifyListeners();
      position = 1;
    }else if(_check == 2) {
      _isGetCurrentPositionLoading = false;
      notifyListeners();
      position = 2;
    }else{
      try{
        List<Location> _locations = await locationFromAddress(location);
        Marker _newMarker = Marker(position: LatLng(_locations[0].latitude, _locations[0].longitude), markerId: MarkerId(''));
        markers.add(_newMarker);
        position = _locations[0];
      }catch(e) {
        position = 2;
      }
    }

  }
}