import 'package:first_app/utils/simple_bloc.dart';

import 'loremIpsum_api.dart';

class LoremBloc extends SimpleBloc<String> {
  static String lorim;
  loadData() async {
    try {
      String text = lorim ?? await LoremIpsumApi.getLorem();

      lorim = text;
      add(text);
    } catch (e) {
      addError(e);
    }
  }
}
