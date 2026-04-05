abstract final class Constants {
  static const packageName = 'commons_app';

  //Routes
  static const webBaseHREF = '/'; //definir
  static const routePathSeparator = '/';
  static const rootScreenRoute = '';
  static const authenticationRouteName = 'authentication';
  static const homeRouteName = 'home';

  // ancho minimo que puede tener una pantalla para un dispositivo tipo movil
  static const double mobileScreenStartsWith = 0;

  // ancho maximo que puede tener una pantalla para un dispositivo tipo movil
  static const double mobileScreenEndsWith = 599;

  // ancho minimo que puede tener una pantalla para un dispositivo tipo tablet
  static const double tabletScreenStartsWith = 600;

  // ancho maximo que puede tener una pantalla para un dispositivo tipo tablet
  static const double tabletScreenEndsWith = 1239;

  // ancho minimo que puede tener una pantalla para un dispositivo tipo movil
  static const double desktopScreenStartsWith = 1240;

  // ancho maximo que puede tener una pantalla para un dispositivo tipo movil
  static const double desktopScreenEndsWith = double.infinity;

  //margen horizontal minimo que se debe usar en pantallas tipo movil segun material design
  static const double mobileHorizontalMargin = 16;

  //margen horizontal minimo que se debe usar en pantallas tipo tablet segun material design
  static const double tabletHorizontalMargin = 32;

  //margen horizontal minimo que se debe usar en pantallas tipo desktop segun material design
  static const double desktopHorizontalMargin = 156;

  //tamaño maximo que se debe usar para trabajar el contenido de pantallas tipo mobile segun material design
  static const double mobileMaxBodyWidth = double.maxFinite;

  //tamaño maximo que se debe usar para trabajar el contenido de pantallas tipo tablet segun material design
  static const double tabletMaxBodyWidth = 870;

  //tamaño maximo que se debe usar para trabajar el contenido de pantallas tipo desktop segun material design
  static const double desktopMaxBodyWidth = 1140;

  //tamaño de searacion entre columnas en pantallas tipo movil segun material design
  static const double mobileGutter = 16;

  //tamaño de searacion entre columnas en pantallas tipo tablet segun material design
  static const double tabletGutter = 16;

  //tamaño de searacion entre columnas en pantallas tipo desktop segun material design
  static const double desktopGutter = 24;

  //ancho minimo (general) de un componente de notificacion
  static const double notificationMinWidth = 0;

  //ancho maximo (general) de un componente de notificacion
  static const double notificationMaxWidth = 1128;

  // ancho minimo (general) de un componente de tipo 'toast'
  static const double toastMinWidth = 328;

  // ancho maximo (general) de un componente de tipo 'toast'
  static const double toastMaxWidth = 328;

  //alto maximo del modal en pantallas tipo desktop
  static const double maxHeightModalWidget = 600;

  //ancho en modal xSmall
  static const double xSmallWidthModalWidget = 360;

  //ancho en modal small
  static const double smallWidthModalWidget = 464;

  //ancho en modal medium
  static const double mediumWidthModalWidget = 570;

  //ancho en modal large
  static const double largeWidthModalWidget = 960;

  // define la cantidad minima de digitos que debe tener el campo de numero de telefono
  static const int minPhoneDigits = 12;

  // define la cantidad maxima de digitos que debe tener el campo de numero de telefono
  static const int maxPhoneDigits = 12;

  // define la cantidad maxima de caracteres que debe tener el campo fecha con formato dd/mm/yyyy
  static const int maxBirthDateChars = 10;

  // define el tiempo que esperan los input de tipo password para volver a enmascarar el texto
  static const passwordAutoHideDefaultTimeLimit = Duration(seconds: 3);

  //Representacion de la letra 'a' en int
  static const int asciiLowercaseA = 97;

  //Representacion de la letra 'z' en int
  static const int asciiLowercaseZ = 122;

  //Representacion de la letra 'A' en int
  static const int asciiUppercaseA = 65;

  //Representacion de la letra 'Z' en int
  static const int asciiUppercaseZ = 90;

  //define el tiempo en milisegundos que se debe esperar los botones antes de ejecutar el siguiente onPress.
  static const int debonceMilliseconds = 250;

  // define el ancho maximo de las Card de los productos
  static const double cardProductMaxWidth = 360;

  // define el ancho minimo de las Card de los productos
  static const double cardProductMinWidth = 260;

  // define el tiempo en milisegundos que durara la animacion de los botones de scroll
  static const int animationMilliseconds = 300;

  static const maxFormatedDateLength = 10;
}
