import 'package:flutter_test/flutter_test.dart';

import 'package:pincode_test/ui/screens/pin_screen/pin_conroller.dart';

void main() {
  group('Pin_screen PinState tests', () {
    //test addSymbol
    test('Tap num button adds character to pin if pin is not filled', () {
      // arrange
      var pinState = PinState('', [false, false, false, false]);

      // act
      pinState = PinState.addSymbol(pinState, '1');

      // assert
      expect(pinState.pin, '1');
    });

    test('Tap num button adds symbol to pass code bar if pin is not filled',
        () {
      // arrange
      var pinState = PinState('', [false, false, false, false]);

      // act
      pinState = PinState.addSymbol(pinState, '1');

      // assert
      expect(pinState.symbols, [true, false, false, false]);
    });

    test('Tap num button does not add character to pin if pin is filled', () {
      // arrange
      var pinState = PinState('1234', [true, true, true, true]);

      // act
      pinState = PinState.addSymbol(pinState, '5');

      // assert
      expect(pinState.pin, '1234');
    });

    test('Tap num button does not add symbol to pass code bar if pin is filled',
        () {
      // arrange
      var pinState = PinState('1234', [true, true, true, true]);

      // act
      pinState = PinState.addSymbol(pinState, '5');

      // assert
      expect(pinState.symbols, [true, true, true, true]);
    });

    //test removeSymbol
    test('Tap backspace button removes character from pin if pin is not empty',
        () {
      // arrange
      var pinState = PinState('1234', [true, true, true, true]);

      // act
      pinState = PinState.removeSymbol(pinState);

      // assert
      expect(pinState.pin, '123');
    });

    test(
        'Tap backspace button removes symbol fom pass code bar if pin is not empty',
        () {
      // arrange
      var pinState = PinState('1234', [true, true, true, true]);

      // act
      pinState = PinState.removeSymbol(pinState);

      // assert
      expect(pinState.symbols, [true, true, true, false]);
    });

    test('Tap backspace button does not change pin if pin is empty', () {
      // arrange
      var pinState = PinState('', [false, false, false, false]);

      // act
      pinState = PinState.removeSymbol(pinState);

      // assert
      expect(pinState.pin, '');
    });

    test(
        'Tap backspace button does not change pass code bar symbols if pin is empty',
        () {
      // arrange
      var pinState = PinState('', [false, false, false, false]);

      // act
      pinState = PinState.removeSymbol(pinState);

      // assert
      expect(pinState.symbols, [false, false, false, false]);
    });
  });
}
