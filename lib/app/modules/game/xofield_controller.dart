// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

enum XOState {
  e,
  x,
  o,
}

extension XOStr on XOState {
  String get str =>
      switch (this) { XOState.e => '', XOState.x => 'X', XOState.o => 'O' };
}

class XOFieldController extends GetxController {
  final int num;
  final _item = XOState.e.obs;
  XOFieldController({
    required this.num,
  });

  XOState get item => _item.value;
  void changeItem(XOState type) {
    if (_item.value == XOState.e) {
      _item.value = type;
    }
  }
}