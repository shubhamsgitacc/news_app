import 'dart:ui';
import '../colors/colors.dart';
import 'app_theme.dart';

class LightColors implements AppColors {
  @override
  Color bgDarkColor() => Color(0xffFFFFFF);

  @override
  Color primaryColor() => Color(0xffC44534);

  @override
  Color secondaryColor() => Color(0xffF1CE9D);

  @override
  Color textColor() => Color(0xff1E1F1B);
}

class LightTheme extends AppTheme {
  LightColors lightColors = LightColors();
  @override
  Color backgroundColor() => lightColors.bgDarkColor();
  @override
  Color primaryColor() => lightColors.primaryColor();
  @override
  Color secondaryColor() => lightColors.secondaryColor();
  @override
  Color textColor() => lightColors.textColor();
}
