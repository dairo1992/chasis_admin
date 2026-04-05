extension MapExtension on Map {
  //Esta función es la más sencilla y se usa para obtener el valor asociado a una key específica de un mapa.
  //Si la clave no existe o el valor no puede ser interpretado como el tipo T que esperas, devuelve null en lugar de lanzar un error.
  T? getOrNull<T>(String key) {
    return _safeUnwrap(key: key, mapper: (T data) => data);
  }

  //Esta función es útil cuando el valor asociado a una key es otro mapa (Map<String, dynamic>) y necesitas transformar ese mapa en un objeto de tu propio tipo T
  //(por ejemplo, un objeto de una clase User o Product). Si la clave no existe, el valor no es un mapa, o el builder falla, devuelve null.
  T? getOrNullWithBuilder<T>(
    String key,
    T Function(Map<String, dynamic> data) builder,
  ) {
    return _safeUnwrap(
      key: key,
      mapper: (Map<String, dynamic> data) => builder(data),
    );
  }

  //Esta función está diseñada para manejar casos donde el valor asociado a una key es una lista de mapas (List<Map<String, dynamic>>).
  //Te permite iterar sobre cada mapa de la lista y transformarlo en un objeto de tu tipo T usando un builder que tú defines.
  //Si la clave no existe, el valor no es una lista, o si algún elemento de la lista no es un mapa o el builder falla para alguno, devuelve null.
  List<T>? getListOrNullWithBuilder<T>(
    String key,
    T Function(Map<String, dynamic> data) builder,
  ) {
    final List<T>? result = _safeUnwrap(
      key: key,
      mapper: (List data) {
        var r = data.map((e) => builder(e as Map<String, dynamic>)).toList();
        return r;
      },
    );
    if (result != null) return result;
    return [];
  }

  //Esta es la función auxiliar privada que todas las demás funciones de la extensión utilizan.
  //Su propósito principal es manejar de forma segura la recuperación de datos de un mapa, envolviendo la lógica de acceso y conversión en un bloque try-catch para evitar que la aplicación falle si algo sale mal.
  Output? _safeUnwrap<Output, AuxEntity>({
    required String key,
    required Output Function(AuxEntity) mapper,
  }) {
    if (!containsKey(key)) return null;
    try {
      final data = this[key] as AuxEntity;
      return mapper(data);
    } catch (_) {
      return null;
    }
  }
}
