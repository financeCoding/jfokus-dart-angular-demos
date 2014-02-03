import 'package:angular/angular.dart';
import 'dart:html';

@NgDirective(
    selector: '[active-when-route]'
)
class CurrentRoute {
  Router router;
  Element element;

  CurrentRoute(this.element, this.router) {
    toggleActive();

    router.onRouteStart.listen((e) {
      toggleActive();
    });
  }

  bool isRoute() {
    // TODO how to tell if we're in the default route?
    if (router.activePath.isEmpty) return false; // this happens on initial load
    return element.attributes['current-route'] == router.activePath.first.name;
  }

  void toggleActive() {
    if (isRoute()) {
      element.classes.add('active');
    } else {
      element.classes.remove('active');
    }
  }
}

class AppRouteInitializer implements RouteInitializer {
  init(Router router, ViewFactory view) {
    router.root
      ..addRoute(
          name: 'overview',
          path: '/overview',
          defaultRoute: true,
          enter: view('views/overview.html'))
      ..addRoute(name: 'reports',
          path: '/reports',
          enter: view('views/reports.html'))
      ..addRoute(name: 'analytics',
          path: '/analytics',
          enter: view('views/analytics.html'));
  }
}

main() {
  ngBootstrap(module: new AngularModule()
    ..type(CurrentRoute)
    ..type(RouteInitializer, implementedBy: AppRouteInitializer)
    ..factory(NgRoutingUsePushState, (_) => new NgRoutingUsePushState.value(false))
  );
}