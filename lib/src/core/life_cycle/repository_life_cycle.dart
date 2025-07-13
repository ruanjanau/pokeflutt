import 'package:flutter_modular/flutter_modular.dart';

import '../adapters/adapters.dart';

abstract class RepositoryLifeCycle<H extends HttpAdapter> {
  final httpAdapter = Modular.get<H>();
}
