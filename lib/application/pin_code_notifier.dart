import 'package:flutter/material.dart';

class PinCodeNotifier extends ChangeNotifier {
  TextEditingController pinCodeController = TextEditingController();
  int _pinCode = 0;
  bool _showSuccessMessage = false;
  bool _showInvalidMessage = false;
  bool _showDeliverMethods = false;
  bool _showEnterPinMessage = false;
  late FocusNode _focusNode;

  int get pinCode => _pinCode;
  bool get showSuccessMessage => _showSuccessMessage;
  bool get showInvalidMessage => _showInvalidMessage;
  bool get showDeliverMethods => _showDeliverMethods;
  bool get showEnterPinMessage => _showEnterPinMessage;
  FocusNode get focusNode => _focusNode;

  PinCodeNotifier() {
    _focusNode = FocusNode();
  }

  set pinCode(int value) {
    _pinCode = value;
    notifyListeners();
  }

  set showSuccessMessage(bool value) {
    _showSuccessMessage = value;
    notifyListeners();
  }

  set showInvalidMessage(bool value) {
    _showInvalidMessage = value;
    notifyListeners();
  }

  set showDeliverMethods(bool value) {
    _showDeliverMethods = value;
    notifyListeners();
  }

  set showEnterPinMessage(bool value) {
    _showEnterPinMessage = value;
    notifyListeners();
  }

  void onPinCodeCheck() {
    if (pinCodeController.text.isEmpty) {
      showEnterPinMessage = true;
      showSuccessMessage = false;
      showInvalidMessage = false;
      showDeliverMethods = false;
      return;
    }

    pinCode = int.tryParse(pinCodeController.text) ?? 0;
    if (pinCode < 90000) {
      showInvalidMessage = true;
      showSuccessMessage = false;
      showDeliverMethods = false;
    } else {
      showSuccessMessage = true;
      showInvalidMessage = false;
      showDeliverMethods = false;
    }
  }

  void onUserTyping(String value) {
    if (value.isEmpty) {
      showDeliverMethods = false;
      showSuccessMessage = false;
      showInvalidMessage = false;
      showEnterPinMessage = false;
      return;
    }
    showDeliverMethods = true;
    showSuccessMessage = false;
    showInvalidMessage = false;
    showEnterPinMessage = false;
  }

  clearAll() {
    pinCodeController.clear();
    pinCode = 0;
    showSuccessMessage = false;
    showInvalidMessage = false;
    showEnterPinMessage = false;
    showDeliverMethods = false;
  }
}
