import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegifood/DataServices/managedata.dart';

class Calculations with ChangeNotifier {
  int cheeseValue = 0, beaconValue = 0, onionValue = 0, cartData = 0;
  late String size;
  bool isSelected = false;
  bool smallTapped = false;
  bool mediumTapped = false;
  bool largeTapped = false;
  bool selected = false;

  int get getcheeseValue => cheeseValue;
  int get getbeconValue => beaconValue;
  int get getonionValue => onionValue;
  int get getcartData => cartData;
  String get getSize => size;

  bool get getSelected => selected;

  //Increasing Value
  addCheese() {
    cheeseValue++;
    notifyListeners();
  }

  addBeacon() {
    beaconValue++;
    notifyListeners();
  }

  addOnion() {
    onionValue++;
    notifyListeners();
  }

  //Miuns Valise
  minusCheese() {
    cheeseValue--;
    notifyListeners();
  }

  minusBeacon() {
    beaconValue--;
    notifyListeners();
  }

  minusOnion() {
    onionValue--;
    notifyListeners();
  }

  //Change bool Value
  selectedSmallSize() {
    smallTapped == true;
    size = 'S';
    notifyListeners();
  }

  selectedLargeSize() {
    largeTapped == true;
    size = 'L';
    notifyListeners();
  }

  selectedMediumSize() {
    mediumTapped == true;
    size = 'M';
    notifyListeners();
  }

  removeAllData() {
    cheeseValue = 0;
    beaconValue = 0;
    onionValue = 0;

    mediumTapped = false;
    smallTapped = false;
    largeTapped = false;
    notifyListeners();
  }

  addToCart(BuildContext context, dynamic data) async {
    if (smallTapped != false || mediumTapped != false || largeTapped != false) {
      cartData++;
      await Provider.of<ManageData>(context, listen: false)
          .addData(context, data);
      notifyListeners();
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 50,
              color: Colors.black54,
              child: Center(
                child: Text(
                  'Selected Size!',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          });
    }
  }
}
