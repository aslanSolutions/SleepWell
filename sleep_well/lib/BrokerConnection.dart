import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart';

final client = MqttServerClient.withPort('192.168.50.225', 'Group1',8883,maxConnectionAttempts: 5);
late mqtt.MqttClientConnectionStatus connectionState;

BrokerConnection(BuildContext context){

}
void _MqttClient(){
  client.logging(on: true);
  client.keepAlivePeriod = 100;
  client.onDisconnected = onDisconnected;
  client.onConnected = onConnected;
  client.onSubscribed = onSubscribed;
  client.secure = false;

  final securityContext = SecurityContext.defaultContext;

  client.securityContext = securityContext;
  client.setProtocolV311();

  final mqtt.MqttConnectMessage connectMessage = mqtt.MqttConnectMessage()
      .withClientIdentifier('Group1')
      .startClean()
      .keepAliveFor(30);
  client.connectionMessage = connectMessage;
}

Future<void> _connectClient() async{
  try{
    print('Mosquitto client connecting....');
    connectionState = mqtt.MqttConnectionState.connecting as mqtt.MqttClientConnectionStatus;
    await client.connect();

  }on  Exception catch (e) {
    print('MQTTClientWrapper::client exception - $e');
    connectionState = mqtt.MqttConnectionState.disconnected as mqtt.MqttClientConnectionStatus;
    client.disconnect();
  }
  if (client.connectionStatus?.state == mqtt.MqttConnectionState.connected) {
    connectionState = mqtt.MqttConnectionState.connected as mqtt.MqttClientConnectionStatus;
    print('Mosquitto client connected');
  }else{
    print(
        'MQTTClientWrapper::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
    connectionState = mqtt.MqttConnectionState.disconnected as mqtt.MqttClientConnectionStatus;
    client.disconnect();
  }
}

void onSubscribed(String topic) {
  print('Subscription confirmed for topic $topic');
}

/// The unsolicited disconnect callback
void onDisconnected() {
  print('OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin ==
      mqtt.MqttDisconnectionOrigin.solicited) {
    print('OnDisconnected callback is solicited, this is correct');
  } else {
    print(
        'OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
    exit(-1);
  }

}

/// The successful connect callback
void onConnected() {
  print(
      'EXAMPLE::OnConnected client callback - Client connection was successful');
}


