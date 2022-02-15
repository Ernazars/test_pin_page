import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_auth_pin_app/core/app_text_styles.dart';
import 'package:test_auth_pin_app/domain/entities/pin/pin_entity.dart';
import 'package:test_auth_pin_app/presentation/pin_page/pin_cubit.dart';

class PinButtonWidget extends StatelessWidget {
  final PinEntity data;
  const PinButtonWidget({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return data.when(
      data: (value) => FittedBox(
        fit: BoxFit.scaleDown,
        child: Material(
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () => context.read<PinCubit>().onPressedData(value),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                value,
                style: AppTextStyles.style32w300,
              ),
              width: 56,
              height: 56,
            ),
          ),
        ),
      ),
      delete: () => IconButton(
        onPressed: () => context.read<PinCubit>().onPressedDelete(),
        icon: const Icon(
          Icons.backspace_outlined,
        ),
      ),
      biometric: () => IconButton(
        onPressed: () => context.read<PinCubit>().onPressedBiometric(),
        icon: const Icon(
          Icons.fingerprint_rounded,
        ),
      ),
    );
  }
}
