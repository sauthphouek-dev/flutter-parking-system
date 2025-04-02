import 'package:flutter/material.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/utils/app_font_weight.dart';
import 'package:parking_app/shared/utils/app_spacing.dart';
import 'package:parking_app/shared/utils/app_text_style.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppDarkTheme {
  /// {@macro app_theme}
  const AppDarkTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      canvasColor: _backgroundColor,
      scaffoldBackgroundColor: _backgroundColor,
      iconTheme: _iconTheme,
      appBarTheme: _appBarTheme,
      dividerTheme: _dividerTheme,
      textTheme: _textTheme,
      inputDecorationTheme: _inputDecorationTheme,
      buttonTheme: _buttonTheme,
      splashColor: AppColors.transparent,
      snackBarTheme: _snackBarTheme,
      elevatedButtonTheme: _elevatedButtonTheme,
      textButtonTheme: _textButtonTheme,
      colorScheme: _colorScheme,
      bottomSheetTheme: _bottomSheetTheme,
      listTileTheme: _listTileTheme,
      switchTheme: _switchTheme,
      progressIndicatorTheme: _progressIndicatorTheme,
      tabBarTheme: _tabBarTheme,
      bottomNavigationBarTheme: _bottomNavigationAppBarTheme,
      chipTheme: _chipTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
      useMaterial3: false,
      dialogTheme: _dialogTheme,
      fontFamily: 'Kantumruy Pro',
      filledButtonTheme: _filledButtonTheme,
      bottomAppBarTheme: _bottomAppBarTheme,
    );
  }

  FilledButtonThemeData get _filledButtonTheme {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        minimumSize: const Size(1, 46),
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSpacing.sm)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: AppSpacing.xlg,
        ),
        backgroundColor: AppColors.grey.withAlpha(50),
        foregroundColor: AppColors.grey.shade300,
      ),
    );
  }

  DialogThemeData get _dialogTheme {
    return DialogThemeData(
      backgroundColor: AppColors.primaryDark,
      elevation: 0,
      shadowColor: AppColors.transparent,
      surfaceTintColor: AppColors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      alignment: Alignment.center,
      iconColor: AppColors.lightBlue,
      titleTextStyle: UITextStyle.bodyText1.copyWith(
        fontWeight: AppFontWeight.medium,
        color: AppColors.primary,
      ),
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.primary,
      ),
      actionsPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      insetPadding: const EdgeInsets.all(AppSpacing.md),
      clipBehavior: Clip.none,
    );
  }

  ColorScheme get _colorScheme {
    return ColorScheme.light(
      secondary: AppColors.grey.shade100,
      surface: _backgroundColor,
    );
  }

  SnackBarThemeData get _snackBarTheme {
    return SnackBarThemeData(
      contentTextStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      actionTextColor: AppColors.lightBlue,
      backgroundColor: AppColors.darkBackground,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  Color get _backgroundColor => AppColors.darkBackground;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: AppColors.primaryDark,
      centerTitle: true,
      scrolledUnderElevation: .4,
      shadowColor: AppColors.transparent,
      foregroundColor: AppColors.lightBlue,
      titleTextStyle: UITextStyle.bodyText1.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.lightBlue,
      ),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.lightBlue,
      size: AppSpacing.xlg,
    );
  }

  DividerThemeData get _dividerTheme {
    return DividerThemeData(
      color: AppColors.outlineLight.withAlpha(10),
    );
  }

  TextTheme get _textTheme => uiTextTheme;

  /// The Content text theme based on [ContentTextStyle].
  static final contentTextTheme = TextTheme(
    displayLarge: ContentTextStyle.headline1,
    displayMedium: ContentTextStyle.headline2,
    displaySmall: ContentTextStyle.headline3,
    headlineMedium: ContentTextStyle.headline4,
    headlineSmall: ContentTextStyle.headline5,
    titleLarge: ContentTextStyle.headline6,
    titleMedium: ContentTextStyle.subtitle1,
    titleSmall: ContentTextStyle.subtitle2,
    bodyLarge: ContentTextStyle.bodyText1,
    bodyMedium: ContentTextStyle.bodyText2,
    labelLarge: ContentTextStyle.button,
    bodySmall: ContentTextStyle.caption,
    labelSmall: ContentTextStyle.overline,
  ).apply(
    bodyColor: AppColors.white,
    displayColor: AppColors.white,
    decorationColor: AppColors.white,
  );

  /// The UI text theme based on [UITextStyle].
  static final uiTextTheme = TextTheme(
    displayLarge: UITextStyle.headline1,
    displayMedium: UITextStyle.headline2,
    displaySmall: UITextStyle.headline3,
    headlineMedium: UITextStyle.headline4,
    headlineSmall: UITextStyle.headline5,
    titleLarge: UITextStyle.headline6,
    titleMedium: UITextStyle.subtitle1,
    titleSmall: UITextStyle.subtitle2,
    bodyLarge: UITextStyle.bodyText1,
    bodyMedium: UITextStyle.bodyText2,
    labelLarge: UITextStyle.button,
    bodySmall: UITextStyle.caption,
    labelSmall: UITextStyle.overline,
  ).apply(
    bodyColor: AppColors.white,
    displayColor: AppColors.white,
    decorationColor: AppColors.white,
  );

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      suffixIconColor: AppColors.mediumEmphasisSurface,
      prefixIconColor: AppColors.mediumEmphasisSurface,
      hoverColor: AppColors.inputHover,
      focusColor: AppColors.inputFocused,
      fillColor: AppColors.grey.shade800.withAlpha(50),
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      hintStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.grey,
      ),
      labelStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.lightBlue,
        fontWeight: AppFontWeight.medium,
      ),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: const OutlineInputBorder(),
      filled: true,
      isDense: true,
      errorStyle: UITextStyle.caption,
    );
  }

  ButtonThemeData get _buttonTheme {
    return ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
    );
  }

  ElevatedButtonThemeData get _elevatedButtonTheme {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(1, 46),
        shadowColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSpacing.sm)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: AppSpacing.xlg,
        ),
        backgroundColor: AppColors.lightBlue,
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
          color: AppColors.white,
          decorationColor: AppColors.white,
        ),
        foregroundColor: AppColors.white,
        splashFactory: InkRipple.splashFactory,
      ),
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.primaryDark,
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSpacing.lg),
          topRight: Radius.circular(AppSpacing.lg),
        ),
      ),
    );
  }

  ListTileThemeData get _listTileTheme {
    return const ListTileThemeData(
      iconColor: AppColors.onBackground,
      contentPadding: EdgeInsets.all(AppSpacing.lg),
    );
  }

  SwitchThemeData get _switchTheme {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.darkAqua;
        }
        return AppColors.eerieBlack;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.lightBlue;
        }
        return AppColors.paleSky;
      }),
    );
  }

  ProgressIndicatorThemeData get _progressIndicatorTheme {
    return const ProgressIndicatorThemeData(
      color: AppColors.darkAqua,
      circularTrackColor: AppColors.borderOutline,
    );
  }

  TabBarTheme get _tabBarTheme {
    return TabBarTheme(
      labelStyle: UITextStyle.button,
      labelColor: AppColors.darkAqua,
      labelPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.lg,
        vertical: AppSpacing.md + AppSpacing.xxs,
      ),
      unselectedLabelStyle: UITextStyle.button,
      unselectedLabelColor: AppColors.mediumEmphasisSurface,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 3,
          color: AppColors.darkAqua,
        ),
      ),
      indicatorSize: TabBarIndicatorSize.label,
    );
  }

  FloatingActionButtonThemeData get _floatingActionButtonTheme {
    return FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      splashColor: AppColors.primary.withAlpha(24),
      elevation: 0,
      highlightElevation: 0,
    );
  }
}

InputBorder get _textFieldBorder => const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        color: AppColors.primary,
      ),
    );

BottomNavigationBarThemeData get _bottomNavigationAppBarTheme {
  return BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkBackground,
    selectedItemColor: AppColors.lightBlue,
    unselectedItemColor: AppColors.white.withAlpha(70),
  );
}

// _bottomAppBarTheme
BottomAppBarTheme get _bottomAppBarTheme {
  return const BottomAppBarTheme(
    color: AppColors.darkBackground,
    elevation: 0,
    shape: CircularNotchedRectangle(),
  );
}

ChipThemeData get _chipTheme {
  return const ChipThemeData(
    backgroundColor: AppColors.transparent,
  );
}
