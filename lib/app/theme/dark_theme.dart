import 'dart:ui';

import '../colors/colors.dart';
import 'app_theme.dart';

class DarkColors implements AppColors {
  @override
  Color bgDarkColor() => Color(0xff1E1F1B);

  @override
  Color primaryColor() => Color(0xffC44534);

  @override
  Color secondaryColor() => Color(0xffFFF2DF);

  @override
  Color textColor() => Color(0xffFFFFFF);
}

class DarkTheme extends AppTheme {
  DarkColors darkColors = DarkColors();
  @override
  Color backgroundColor() => darkColors.bgDarkColor();
  @override
  Color primaryColor() => darkColors.primaryColor();
  @override
  Color secondaryColor() => darkColors.secondaryColor();
  @override
  Color textColor() => darkColors.textColor();
}
