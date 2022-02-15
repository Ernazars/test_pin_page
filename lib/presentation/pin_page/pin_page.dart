import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_auth_pin_app/core/app_colors.dart';
import 'package:test_auth_pin_app/core/app_assets.dart';
import 'package:test_auth_pin_app/core/app_text_styles.dart';
import 'package:test_auth_pin_app/injection/init_get.dart';
import 'package:test_auth_pin_app/presentation/pin_page/pin_cubit.dart';
import 'package:test_auth_pin_app/presentation/pin_page/widgets/pin_button_widget.dart';

import 'widgets/pin_indicator/pin_indicator_widget.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final String enterPinText = "Please enter PIN code";
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    AppAssets.helpIcon,
                    color: AppColors.iconColor,
                  )
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  enterPinText,
                  style: AppTextStyles.style24w400,
                ),
              ),
            ),
            const Expanded(child: Center(child: PinIndicatorWidget())),
            BlocProvider(
              create: (context) => getIt<PinCubit>(),
              child: BlocBuilder<PinCubit, PinState>(
                builder: (context, state) => state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  pinButtons: (data) => GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                      crossAxisSpacing: 36.0,
                      mainAxisSpacing: 24.0,
                    ),
                    itemBuilder: (context, index) =>
                        PinButtonWidget(data: data[index]),
                    itemCount: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
