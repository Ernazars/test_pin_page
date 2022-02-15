import 'package:freezed_annotation/freezed_annotation.dart';

part 'pin_entity.freezed.dart';

@freezed
class PinEntity with _$PinEntity {
  const PinEntity._();

  const factory PinEntity.data({
    required String value,
  }) = PinEntityData;

  const factory PinEntity.delete() = PinEntityDelete;

  const factory PinEntity.biometric() = PinEntityBiometric;
}
