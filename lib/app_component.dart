import 'package:angular/angular.dart';

import 'src/list/client_list/client_list_component.dart';
import 'src/list/activity_list/activity_list_component.dart';
import 'src/graph/graph_component.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'dashboard-app',
  styleUrls: [
    'package:angular_components/app_layout/layout.scss.css',
    'package:angular_components/css/mdc_web/card/mdc-card.scss.css',
    'app_component.css',
  ],
  templateUrl: 'app_component.html',
  directives: [
    ClientListComponent,
    ActivityListComponent,
    GraphComponent,
  ],
  providers: [],
)
class AppComponent {
  // currently nothing is happening in here
}
