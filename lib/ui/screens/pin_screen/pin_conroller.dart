class PinState {
  PinState(
    this.pin,
    this.symbols,
  );

  String pin;
  List<bool> symbols;

  static PinState addSymbol(PinState currentState, String value) {
    PinState newState = PinState(
      '',
      [
        false,
        false,
        false,
        false,
      ],
    );
    if (currentState.pin.length < 4) {
      newState.pin = currentState.pin + value;
      for (int i = 0; i < newState.pin.length; i++) {
        newState.symbols[i] = true;
      }
    } else if (currentState.pin.length == 4) {
      newState.pin = currentState.pin;
      newState.symbols = currentState.symbols;
    }
    return newState;
  }

  static PinState removeSymbol(PinState currentState) {
    PinState newState = PinState(
      '',
      [
        false,
        false,
        false,
        false,
      ],
    );
    if (currentState.pin.isNotEmpty) {
      newState.pin = currentState.pin.substring(0, currentState.pin.length - 1);
      for (int i = 0; i < newState.pin.length; i++) {
        newState.symbols[i] = true;
      }
    }
    return newState;
  }
}
