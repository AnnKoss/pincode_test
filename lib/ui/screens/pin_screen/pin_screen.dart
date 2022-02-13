import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pincode_test/ui/screens/pin_screen/pin_conroller.dart';
import 'package:pincode_test/ui/screens/pin_screen/widgets/keyboard.dart';
import 'package:pincode_test/ui/screens/pin_screen/widgets/pin_symbol.dart';
import 'package:pincode_test/ui/theme/app_text_theme.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({Key? key}) : super(key: key);

  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  PinState pinState = PinState(
    '',
    [
      false,
      false,
      false,
      false,
    ],
  );

  void Function()? onKeyboardClick(PinState currentState, String value) {
    setState(() {
      pinState = PinState.addSymbol(currentState, value);
    });
  }

  void Function()? onKeyboardBackspace(PinState currentState) {
    setState(() {
      pinState = PinState.removeSymbol(currentState);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                //ToDo: find out what should happen when pressed and add onPressed function
                icon: SvgPicture.asset('assets/icons/help_icon.svg'),
                padding: const EdgeInsets.all(18),
              ),
            ),
            const SizedBox(height: 66),
            const Text(
              'Please enter PIN code',
              style: AppTextTheme.roboto_black_24_400,
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: PinSymbol(pinState.symbols[index]),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Keyboard(pinState, onKeyboardClick, onKeyboardBackspace),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
