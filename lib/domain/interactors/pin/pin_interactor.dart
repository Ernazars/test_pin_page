import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:test_auth_pin_app/domain/interactors/pin/pin_stream_evets.dart';

@lazySingleton
class PinInteractor {
  StreamController<PinStreamEvent> pinStream = StreamController<PinStreamEvent>();
}
