// import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/shared/utils/app_colors.dart';
import 'package:parking_app/shared/utils/app_font_weight.dart';
import 'package:parking_app/shared/utils/app_spacing.dart';
import 'package:parking_app/shared/utils/app_text_style.dart';

/// {@template app_theme}
/// The Default App [ThemeData].
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme();

  /// Default `ThemeData` for App UI.
  ThemeData get themeData {
    return ThemeData(
      // primary: AppColors.primary,
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
      bottomNavigationBarTheme: _bottomAppBarTheme,
      chipTheme: _chipTheme,
      floatingActionButtonTheme: _floatingActionButtonTheme,
      fontFamily: 'Kantumruy Pro',
      useMaterial3: false,
      dialogTheme: _dialogTheme,
      filledButtonTheme: _filledButtonTheme,
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
      backgroundColor: AppColors.white,
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
      secondary: AppColors.primary,
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
      backgroundColor: AppColors.black,
      elevation: 4,
      behavior: SnackBarBehavior.floating,
    );
  }

  Color get _backgroundColor => AppColors.background;

  AppBarTheme get _appBarTheme {
    return AppBarTheme(
      iconTheme: _iconTheme,
      elevation: 0,
      toolbarHeight: 64,
      backgroundColor: AppColors.primary,
      centerTitle: true,
      scrolledUnderElevation: .4,
      shadowColor: AppColors.transparent,
      foregroundColor: AppColors.black,
      titleTextStyle: UITextStyle.bodyText1.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.white,
      ),
    );
  }

  IconThemeData get _iconTheme {
    return const IconThemeData(
      color: AppColors.white,
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
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
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
    bodyColor: AppColors.black,
    displayColor: AppColors.black,
    decorationColor: AppColors.black,
  );

  InputDecorationTheme get _inputDecorationTheme {
    return InputDecorationTheme(
      suffixIconColor: AppColors.mediumEmphasisSurface,
      prefixIconColor: AppColors.mediumEmphasisSurface,
      hoverColor: AppColors.inputHover,
      focusColor: AppColors.inputFocused,
      fillColor: AppColors.grey.withAlpha(30),
      enabledBorder: _textFieldBorder,
      focusedBorder: _textFieldBorder,
      disabledBorder: _textFieldBorder,
      hintStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.mediumEmphasisSurface,
      ),
      labelStyle: UITextStyle.bodyText1.copyWith(
        color: AppColors.primary,
        fontWeight: AppFontWeight.medium,
      ),
      contentPadding: const EdgeInsets.all(AppSpacing.lg),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSpacing.md)),
      ),
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
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: AppSpacing.xlg,
        ),
        backgroundColor: AppColors.primary,
      ),
    );
  }

  TextButtonThemeData get _textButtonTheme {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: _textTheme.labelLarge?.copyWith(
          fontWeight: AppFontWeight.light,
        ),
        foregroundColor: AppColors.black,
        splashFactory: InkRipple.splashFactory,
      ),
    );
  }

  BottomSheetThemeData get _bottomSheetTheme {
    return const BottomSheetThemeData(
      backgroundColor: AppColors.white,
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
          return AppColors.primaryContainer;
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
        width: 1.5,
        color: AppColors.primary,
      ),
    );

BottomNavigationBarThemeData get _bottomAppBarTheme {
  return BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkBackground,
    selectedItemColor: AppColors.white,
    unselectedItemColor: AppColors.white.withAlpha(704),
  );
}

ChipThemeData get _chipTheme {
  return const ChipThemeData(
    backgroundColor: AppColors.transparent,
  );
}
