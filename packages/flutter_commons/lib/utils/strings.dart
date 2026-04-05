class Strings {
  const Strings();

  static const Strings I = Strings();

  // General

  String get appName => 'Admin Dashboard';
  String get getInto => 'Ingresar';
  String get empty => '';
  String get space => ' ';
  String get close => 'Cerrar';
  String get genericHeaderLeadingText => 'Volver';
  String get genericHeaderActionText => 'Salir';
  String get middleDash => ' - ';
  String get bulletListSeparator => '*';
  String get remaingTime => 'Tiempo Restante';
  String get toRemember => 'Recuerda';
  String get seeDetails => 'Ver detalles';

  // Generic Buttons

  String get btnContinue => 'Continuar';
  String get btnGoBack => 'Volver';
  String get btnOut => 'Salir';
  String get btnTryAgain => 'Intentar nuevamente';
  String get btnDelete => 'Eliminar';
  String get btnApprove => 'Autorizar';

  // Handlers
  String get invalidOperation => 'Operacion invalida';
  String get errorTitle => 'Ha ocurrido un error técnico';
  String unHandledErrorMessage({required bool useSeparation}) {
    final separator = useSeparation ? '\n' : '';
    return 'Estamos trabajando para restablecer el servicio y estar$separator operativos nuevamente';
  }
}
