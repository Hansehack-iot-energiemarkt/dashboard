@JS('Paho.MQTT')
library paho;

import 'package:js/js.dart';

@JS('Paho.MQTT.Client')
class Client {
  external String get host;
  external void set host(String host);
  external num get port;
  external void set port(num port);
  external String get path;
  external void set path(String path);
  external String get clientId;
  external void set clientId(String clientId);
  
  external Function get onConnectionLost;
  external void set onConnectionLost(Function onConnectionLost);
  external Function get onMessageDelivered;
  external void set onMessageDelivered(Function onMessageDelivered);
  external Function get onMessageArrived;
  external void set onMessageArrived(Function onMessageArrived);
  external Function get onConnected;
  external void set onConnected(Function onConnected);
  
  external factory Client(ClientOptions options);

  external void connect(ConnectOptions connectOptions);
  external void disconnect();
  external void publish(String topic, String payload, num qos, bool retained);
  external void send(Message msg);
  external void subscribe(String filter, SubscribeOptions subscribeOptions);
}

@JS('Paho.MQTT.Message')
class Message {
  external String get payloadString;
  external String get destinationName;
  external void set destinationName(String destinationName);
  external num get qos;
  external void set qos(num qos);
  external bool get retained;
  external void set retained(bool retained);
  external bool get duplicate;
  external void set duplicate(bool duplicate);
  
  external factory Message(String payload);
}

@JS()
@anonymous
abstract class ClientOptions {
  external String get host;
  external num get port;
  external String get path;
  external String get clientId;

  external factory ClientOptions({String host, num port, String path, String clientId});
}

@JS()
@anonymous
abstract class ConnectOptions {
  external num get timeout;
  external String get userName;
  external String get password;
  external Message get willMessage;
  external num get keepAliveInterval;
  external bool get cleanSession;
  external bool get useSSL;
  external Function get onSuccess;
  external Function get onFailure;
  external List<String> get hosts;
  external List<num> get ports;
  external bool get reconnect;
  external num get mqttVersion;
  external bool get mqttVersionExplicit;
  external List<String> get uris;

  external factory ConnectOptions({
    num timeout, String userName, String password, Message willMessage,
    num keepAliveInterval, bool cleanSession, bool useSSL, Function onSuccess,
    Function onFailure, List<String> hosts, List<num> ports, bool reconnect,
    num mqttVersion, bool mqttVersionExplicit, List<String> uris
  });
}

@JS()
@anonymous
abstract class SubscribeOptions {
  external num get qos;
  external void set qos(num qos);
  external Function get onSuccess;
  external void set onSuccess(Function onSuccess);
  external Function get onFailure;
  external void set onFailure(Function onFailure);
  external num get timeout;
  external void set timeout(num timeout);

  external factory SubscribeOptions({num qos, Function onSuccess, Function onFailure, num timeout});
}