import 'package:angular/angular.dart';

import 'package:mqtt_client/mqtt_client.dart';

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
  providers: [ClassProvider(MqttService)],
)
class AppComponent implements AfterContentInit {

  ngAfterContentInit() {
    new MqttService().connect();
  }
}

class MqttService {
  void connect() async {
    MqttClient client = MqttClient("10.250.252.184", "dashboard");

    print("connecting");

    try {
      await client.connect();
    } catch (e) {
      print("Exception thrown: ${e}");
      client.disconnect();
    }

    if (client.connectionState == ConnectionState.connected) {
      print("EXAMPLE::Mosquitto client connected");
    } else {
      print("EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, state is ${client.connectionState}");
      client.disconnect();
    }

    print("connected");

    client.subscribe("hansehack/energylevel", MqttQos.exactlyOnce);

    client.updates.listen((List<MqttReceivedMessage> c) {
      final MqttPublishMessage recMess = c[0].payload as MqttPublishMessage;
      final String pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print(pt);
    });
  }
}
