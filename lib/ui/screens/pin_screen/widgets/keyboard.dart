import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pincode_test/ui/screens/pin_screen/pin_conroller.dart';
// import 'package:pincode_test/generated/assets.gen.dart';
import 'package:pincode_test/ui/theme/app_text_theme.dart';

class Keyboard extends StatelessWidget {
  const Keyboard(this.pinState, this.onKeyboardClick, this.onKeyboardBackspace,
      {Key? key})
      : super(key: key);
  final PinState pinState;
  final Function onKeyboardClick;
  final Function onKeyboardBackspace;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 3 / 2,
      children: [
        _numButton('1'),
        _numButton('2'),
        _numButton('3'),
        _numButton('4'),
        _numButton('5'),
        _numButton('6'),
        _numButton('7'),
        _numButton('8'),
        _numButton('9'),
        _actionButton(
          () {},
          //ToDo: add fingerprint recognition logic
          'assets/icons/fingerprint_icon.svg',
        ),
        _numButton('0'),
        _actionButton(
          () => onKeyboardBackspace(pinState),
          'assets/icons/backspace_icon.svg',
        )
      ],
    );
  }

  Widget _numButton(
    String number,
  ) {
    return InkWell(
      onTap: () => onKeyboardClick(pinState, number),
      customBorder: const CircleBorder(),
      borderRadius: BorderRadius.circular(40),
      child: Center(
        child: Text(
          number.toString(),
          style: AppTextTheme.roboto_black_34_300,
        ),
      ),
    );
  }

  Widget _actionButton(
    void Function()? onPressed,
    String iconPath,
  ) {
    return InkWell(
      onTap: onPressed,
      customBorder: const CircleBorder(),
      borderRadius: BorderRadius.circular(40),
      child: Center(
        child: SvgPicture.asset(iconPath),
      ),
    );
  }
}
