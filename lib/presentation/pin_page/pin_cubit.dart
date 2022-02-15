import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:test_auth_pin_app/domain/entities/pin/pin_entity.dart';
import 'package:test_auth_pin_app/domain/interactors/pin/pin_interactor.dart';
import 'package:test_auth_pin_app/domain/interactors/pin/pin_stream_evets.dart';

part 'pin_cubit.freezed.dart';

@injectable
class PinCubit extends Cubit<PinState> {
  PinCubit(this._pinInteractor) : super(const PinState.initial()) {
    emit(PinState.pinButtons(pins));
  }

  final PinInteractor _pinInteractor;

  List<PinEntity> pins = const [
    PinEntityData(value: "1"),
    PinEntityData(value: "2"),
    PinEntityData(value: "3"),
    PinEntityData(value: "4"),
    PinEntityData(value: "5"),
    PinEntityData(value: "6"),
    PinEntityData(value: "7"),
    PinEntityData(value: "8"),
    PinEntityData(value: "9"),
    PinEntityBiometric(),
    PinEntityData(value: "0"),
    PinEntityDelete(),
  ];

  onPressedData(String value) =>
      _pinInteractor.pinStream.add(PinStreamEvent.newSymbol(value));

  onPressedDelete() =>
      _pinInteractor.pinStream.add(const PinStreamEvent.delete());

  onPressedBiometric() => log("tapped BIOMETRIC");
}

@freezed
class PinState with _$PinState {
  const factory PinState.initial() = _Initial;
  const factory PinState.pinButtons(List<PinEntity> data) = _PinButtons;
}
