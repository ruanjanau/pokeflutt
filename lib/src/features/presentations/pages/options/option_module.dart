import 'package:flutter_modular/flutter_modular.dart';

import 'options.dart';

class OptionModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const OptionPage());
  }
}
