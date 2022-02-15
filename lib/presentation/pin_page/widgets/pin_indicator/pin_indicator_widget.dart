import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_auth_pin_app/core/app_colors.dart';
import 'package:test_auth_pin_app/injection/init_get.dart';
import 'package:test_auth_pin_app/presentation/pin_page/widgets/pin_indicator/pin_indicator_cubit.dart';

class PinIndicatorWidget extends StatefulWidget {
  const PinIndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<PinIndicatorWidget> createState() => _PinIndicatorWidgetState();
}

class _PinIndicatorWidgetState extends State<PinIndicatorWidget>
    with SingleTickerProviderStateMixin {
  final double widgetHeight = 28.0;
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    animation = Tween(begin: 0.0, end: 8.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widgetHeight,
      child: BlocProvider(
        create: (context) => getIt<PinIndicatorCubit>(),
        child: BlocConsumer<PinIndicatorCubit, PinIndicatorState>(
          listener: (context, state) {
            if (state.pinLenght > 4) {
              controller.forward();
            }
          },
          builder: (context, state) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) => Padding(
                padding: EdgeInsets.only(
                    left: animation.value + 8.0, right: 8.0 - animation.value),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) => FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.pinIndicatorColor(
                            index < state.pinLenght),
                        border: Border.all(
                          width: 2,
                          color: AppColors.iconColor.withOpacity(
                            0.12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
