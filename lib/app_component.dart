import 'package:angular/angular.dart';

import 'src/client_list/client_list_component.dart';
import 'src/graph/graph_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'app_component.css',
  ],
  templateUrl: 'app_component.html',
  directives: [
    ClientListComponent,
    GraphComponent,
  ],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
