import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors.dart';
import 'typography.dart';

ThemeData buildBrewCraftTheme() {
  const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: kEspressoPrimary,
    onPrimary: kEspressoOnPrimary,
    primaryContainer: kEspressoPrimaryContainer,
    onPrimaryContainer: kEspressoOnPrimaryContainer,
    secondary: kCaramelSecondary,
    onSecondary: kCaramelOnSecondary,
    secondaryContainer: kCaramelSecondaryContainer,
    onSecondaryContainer: kCaramelOnSecondaryContainer,
    tertiary: kMochaTertiary,
    onTertiary: kMochaOnTertiary,
    tertiaryContainer: kMochaTertiaryContainer,
    onTertiaryContainer: kMochaOnTertiaryContainer,
    error: kErrorColor,
    onError: kOnErrorColor,
    errorContainer: kErrorContainer,
    onErrorContainer: kOnErrorContainer,
    surface: kSandSurface,
    onSurface: kSandOnSurface,
    surfaceContainerHighest: kSandSurfaceContainerHighest,
    outline: kEspressoOutline,
    outlineVariant: kEspressoOutlineVariant,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: kSandSurface,
    appBarTheme: const AppBarTheme(
      backgroundColor: kSandSurface,
      foregroundColor: kEspressoPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: kSandSurfaceContainer,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    textTheme: const TextTheme(
      displayLarge: BrewCraftTypography.displayLarge,
      displayMedium: BrewCraftTypography.displayMedium,
      headlineLarge: BrewCraftTypography.headlineLarge,
      headlineMedium: BrewCraftTypography.headlineMedium,
      headlineSmall: BrewCraftTypography.headlineSmall,
      titleLarge: BrewCraftTypography.titleLarge,
      titleMedium: BrewCraftTypography.titleMedium,
      titleSmall: BrewCraftTypography.titleSmall,
      bodyLarge: BrewCraftTypography.bodyLarge,
      bodyMedium: BrewCraftTypography.bodyMedium,
      bodySmall: BrewCraftTypography.bodySmall,
      labelLarge: BrewCraftTypography.labelLarge,
      labelMedium: BrewCraftTypography.labelMedium,
      labelSmall: BrewCraftTypography.labelSmall,
    ),
  );
}
