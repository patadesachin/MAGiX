// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import './pages/FirstPage.dart';
import 'pages/TestData.dart';

void main() {
 FirstPage firstPage ;
  group('Test sample App', () {
  FlutterDriver _driver;

    setUpAll(() async {
      _driver = await FlutterDriver.connect();
       firstPage = new FirstPage(_driver);

    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (_driver != null) {
        _driver.close();
      }
    });

    test('Verify dropdown', () async {
      // First, tap on the button
      firstPage.selectDropdown('Hyderabad');
      expect(await _driver.getText(find.text('Hyderabad')), isNotNull);
    });
 
  test('Verify radio button', () async  {
      firstPage.selectRadioButton('Female');
      expect(await _driver.getText(find.text('Female')), isNotNull);
  });

   test('Verify checkbox', () async  {
      firstPage.selectCheckbox();
        }, timeout: Timeout(Duration(minutes: 1)), onPlatform: {
    'safari': Skip('Safari is currently broken (see #1234)')
  });
  }, timeout: Timeout(Duration(minutes: 1)),tags: ['sanity', 'functional']);
}
