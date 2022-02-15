import 'dart:async';
import 'dart:developer' as dev;
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:test_auth_pin_app/domain/entities/pin/password_entity.dart';
import 'package:test_auth_pin_app/domain/interactors/pin/pin_interactor.dart';
import 'package:test_auth_pin_app/domain/interactors/pin/pin_stream_evets.dart';

part 'pin_indicator_cubit.freezed.dart';

@injectable
class PinIndicatorCubit extends Cubit<PinIndicatorState> {
  Random random = Random();
  PasswordEntity password = PasswordEntity();
  StreamSubscription<PinStreamEvent>? _subscription;
  final PinInteractor _pinInteractor;
  PinIndicatorCubit(this._pinInteractor)
      : super(const PinIndicatorState.pin(0)) {
    _subscription = _pinInteractor.pinStream.stream.listen((event) {
      event.when(newSymbol: (lastSymbol) {
        if (password.length() < 4) {
          password.addPasswordSymbol(lastSymbol);
          emit(PinIndicatorState.pin(password.length()));
          dev.log(password.toString());
          //TODO:: to ATUH
        } else {
          emit(PinIndicatorState.pin(5 + random.nextInt(5)));
          dev.log(password.toString());
          // TODO:: ERROR
        }
      }, delete: () {
        password.removePasswordLastSymbol();
        emit(PinIndicatorState.pin(password.length()));
      });
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

@freezed
class PinIndicatorState with _$PinIndicatorState {
  const factory PinIndicatorState.pin(int pinLenght) = _Pin;
}
