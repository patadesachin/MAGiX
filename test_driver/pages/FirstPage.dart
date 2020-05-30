import 'package:flutter_driver/flutter_driver.dart';
import './BasePage.dart';
import './TestData.dart';

// author : patadsachin
// Flutter App Mobile Home Creen for andrios and ios 
 class FirstPage {
  final radioFinder = find.byValueKey('FemaleOption');
  final checkboxFinder = find.byValueKey('First Checkbox');
  final dropdownFinder = find.byValueKey('dropdown');

  FlutterDriver _driver;

  FirstPage(FlutterDriver driver) {
    this._driver = driver;
  }
// Selecting dropdown in login Page 
Future<void> selectDropdown(String dropdownvalue) async{
    await _driver.tap(dropdownFinder);
     return await _driver.tap(find.text(dropdownvalue));
  }

  
  Future<void> selectRadioButton(String radioButtonvalue ) async{
    await _driver.tap(radioFinder);
    return await _driver.tap(find.text(radioButtonvalue));
  }

  Future<void> selectCheckbox() async{
    await _driver.tap(checkboxFinder);
  }
}
