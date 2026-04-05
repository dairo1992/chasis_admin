import 'package:flutter_commons/utils/constants.dart';
import 'package:flutter_commons/utils/display_platform/display_platform.dart';
import 'package:flutter_commons/utils/display_platform/display_platform_provider.dart';
import 'package:flutter_commons/utils/enums/material_columns.dart';

enum DisplayTarget {
  mobile(
    starts: Constants.mobileScreenStartsWith,
    ends: Constants.mobileScreenEndsWith,
    margin: Constants.mobileHorizontalMargin,
    maxBodyWidth: Constants.mobileMaxBodyWidth,
    columns: MaterialColumns.c4,
    gutter: Constants.mobileGutter,
  ),
  tablet(
    starts: Constants.tabletScreenStartsWith,
    ends: Constants.tabletScreenEndsWith,
    margin: Constants.tabletHorizontalMargin,
    maxBodyWidth: Constants.tabletMaxBodyWidth,
    columns: MaterialColumns.c8,
    gutter: Constants.tabletGutter,
  ),
  desktop(
    starts: Constants.desktopScreenStartsWith,
    ends: Constants.desktopScreenEndsWith,
    margin: Constants.desktopHorizontalMargin,
    maxBodyWidth: Constants.desktopMaxBodyWidth,
    columns: MaterialColumns.c12,
    gutter: Constants.desktopGutter,
  );

  // define el ancho minimo de caso correspondiente
  final double starts;

  // define el ancho maximo de caso correspondiente
  final double ends;

  // define el margin horizontal minimo de caso correspondiente
  final double margin;

  // define el ancho maximo para el contenido encapsulado
  final double maxBodyWidth;

  // define las columnas maximas que puede ocupar el contenido encapsulado
  final MaterialColumns columns;

  //define el espaciado minimo entre columnas
  final double gutter;

  //obtiene la plataforma actual
  DisplayPlatform get platform {
    return DisplayPlatformProvider.instance.get().current;
  }

  // saber si la plataforma es de escritorio
  bool get isWeb => DisplayPlatformProvider.instance.get().isWeb;

  // saber si la plataforma es movil
  bool get isApp => DisplayPlatformProvider.instance.get().isApp;

  // saber si el objetivo de despliegue es 'mobile' y la plataforma sobre la que esta corriendo es 'app'
  bool get isMobileApp => isApp && this == DisplayTarget.mobile;

  const DisplayTarget({
    required this.starts,
    required this.ends,
    required this.margin,
    required this.maxBodyWidth,
    required this.columns,
    required this.gutter,
  });

  factory DisplayTarget.init({required double width}) {
    return values.firstWhere(
      (item) => (width >= item.starts && width <= item.ends),
      orElse: () => DisplayTarget.mobile,
    );
  }
}
