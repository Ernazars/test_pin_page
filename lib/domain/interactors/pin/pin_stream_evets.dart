import 'package:freezed_annotation/freezed_annotation.dart';

part "pin_stream_evets.freezed.dart";

@freezed
class PinStreamEvent with _$PinStreamEvent {
  const factory PinStreamEvent.newSymbol(String symbol) = NewSymbol;
  const factory PinStreamEvent.delete() = DeleteSymbol;
}
