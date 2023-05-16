import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';

class BrokerConnection {
  final String TOPIC = 'wio/values';
  final String LOCAL_HOST = '';
  final int PORT = 8081;
  final CLIENT_ID = 'Group-1';

  late MqttServerClient client =
      MqttServerClient.withPort(LOCAL_HOST, CLIENT_ID, PORT);
  late BuildContext build;

  BrokerConnection(BuildContext context) {
    this.build = context;
  }

  /// Connecting functionality of the MQTT client to the server.
  Future<int> _connect() async {
    client.logging(on: false);
    client.setProtocolV311();
    client.keepAlivePeriod = 100;
    client.connectTimeoutPeriod = 2000;
    client.autoReconnect = true; //set auto reconnect
    client.resubscribeOnAutoReconnect = false;
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    

    final connectionMess = MqttConnectMessage()
        .withWillTopic('willTopic')
        .withWillMessage('Group 1 connection platform')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);
    print('Mosquitto is connecting....');
    client.connectionMessage = connectionMess;

    // Try to connect to the server
    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      print('client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      print('socket exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('Mosquitto client connected');
    } else {
      print(
          'ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    print('Subscribing to the sleep/app topic');
    const topic = 'sleep/app';
    client.subscribe(topic, MqttQos.atMostOnce);

    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

      print(
          'Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });

    client.published!.listen((MqttPublishMessage message) {
      print(
          'Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
    });

    final builder = MqttClientPayloadBuilder();
    builder.addString('Hello from Group 1');

    print('Subscribing to the $topic topic');
    client.subscribe(topic, MqttQos.exactlyOnce);

    print('Publishing our topic');
    client.publishMessage(TOPIC, MqttQos.exactlyOnce, builder.payload!);

    //unsubscribe and exit gracefully
    print('Unsubscribing');
    client.unsubscribe(topic);

    // Wait for the unsubscribe message from the broker
    await MqttUtilities.asyncSleep(2);
    print('Disconnecting....');
    client.disconnect();
    print('Exiting normally');
    return 0;
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('OnDisconnected callback is solicited, this is correct');
    } else {
      print(
          'OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
      exit(-1);
    }
  }

  void onConnected() {
    print('Client connection was successful');
  }
}
