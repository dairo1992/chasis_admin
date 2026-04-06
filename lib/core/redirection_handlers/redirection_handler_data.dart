final class RedirectionHandlerData {
  final String? redirectionRoute;
  final List<BaseRoute>? allowList;
  final List<BaseRoute>? denyList;

  RedirectionHandlerData({
    this.redirectionRoute,
    this.allowList,
    this.denyList,
  });
}
