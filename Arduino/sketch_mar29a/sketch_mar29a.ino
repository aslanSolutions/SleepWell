#include "DHT.h"
#include "TFT_eSPI.h"
#include "WiFi.h"


#define DHTPIN 0
#define DHTTYPE DHT11
#define ANALOG_PIN A0

DHT dht(DHTPIN, DHTTYPE);
int counter = 0;
int joyStick = 0;

int exp_size = 2881;

//Wifi information
const char* ssid = "SEM"; // WiFi Name
const char* password = "sem2025gu";  // WiFi Password 

//Wifi
WiFiClient espClient;

TFT_eSPI tft;


void setup_wifi() {

  delay(10);

  tft.setTextSize(2);
  tft.setCursor((320 - tft.textWidth("Connecting to Wi-Fi..")) / 2, 120);
  tft.print("Connecting to Wi-Fi..");

  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(ssid);
  WiFi.begin(ssid, password); // Connecting WiFi

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");

  tft.fillScreen(TFT_BLACK);
  tft.setCursor((320 - tft.textWidth("Connected!")) / 2, 120);
  tft.print("Connected!");

  Serial.println("IP address: ");
  Serial.println(WiFi.localIP()); // Display Local IP Address
}


void setup() {
  
  tft.begin();
  tft.fillScreen(TFT_BLACK);
  tft.setRotation(3);

  pinMode(WIO_LIGHT, INPUT);
  pinMode(WIO_MIC, INPUT);
  Serial.begin(115200);

  pinMode(WIO_5S_PRESS, INPUT);   
  pinMode(WIO_5S_UP, INPUT);  
  pinMode(WIO_5S_DOWN, INPUT);  
  pinMode(WIO_5S_LEFT, INPUT); 
  pinMode(WIO_5S_RIGHT, INPUT);

  dht.begin();

  setup_wifi();
  
}

void loop() {

  int light = analogRead(WIO_LIGHT);
  int sound = analogRead(WIO_MIC);
  int temperature = dht.readTemperature();
  int humidity = dht.readHumidity();

  if(counter > exp_size){
    return;
  }

  tft.fillScreen(TFT_BLACK);
  tft.setTextSize(2);

  int sqr = tft.height() / 1.5;
  int x1 = 0;
  int y1 = 0;
  int x2 = x1 + sqr;
  int y2 = y1 + sqr - 40;

  if (digitalRead(WIO_5S_DOWN) == LOW) {
    joyStick = 1;
  }
  if (digitalRead(WIO_5S_UP) == LOW) {
    joyStick = 2;
  }
  if (digitalRead(WIO_5S_RIGHT) == LOW) {
    joyStick = 3;
  }
  if (digitalRead(WIO_5S_LEFT) == LOW) {
    joyStick = 4;
  }
  if (digitalRead(WIO_5S_PRESS) == LOW) {
    joyStick = 0;
  }

  char tempStr[10];
  char humStr[10];
  char ligStr[10];
  char souStr[10];

  switch (joyStick) {
    case 1: // down
    {
      char tempStr[10];
      sprintf(tempStr, "%.1f C", temperature);
      tft.fillRect(0, 0, tft.height() + 80, tft.height() , TFT_RED);
      tft.setTextColor(TFT_BLACK);
      String tempString = "Temp: " + String(temperature);
      tft.drawString(tempString,15, 15);
      break;
    }

    case 2: { //up
      sprintf(humStr, "%.1f %%", humidity);
      tft.fillRect(0, 0, tft.height() + 80, tft.height() , TFT_GREEN);
      tft.setTextColor(TFT_BLACK);
      String humidity2 = "Humidity: " + String(humidity);
      tft.drawString(humidity2, 15, 15);
      break;
    }

    case 3: { //right
      sprintf(ligStr, "%.1f %%", light);
      tft.fillRect(0, 0, tft.height() + 80, tft.height() ,TFT_BLUE);
      tft.setTextColor(TFT_BLACK);
      String light2 = "Light: " + String(light);
      tft.drawString(light2, 15, 15);

      break;
    }

    case 4: { //left
      tft.fillRect(0, 0, tft.height() + 80, tft.height() , TFT_YELLOW);
      tft.setTextColor(TFT_BLACK);
      String sound1 = "Sound: " + String(sound);
      tft.drawString( sound1, 15, 15);
      break;
    }
    case 0: {
      sprintf(tempStr, "%.1f C", temperature);
      tft.fillRect(x1, y1, sqr, sqr, TFT_RED);
      tft.setTextColor(TFT_BLACK);
      String temperature1 = "Temp: " + String(temperature);
      tft.drawString(temperature1, 15, 15);



      sprintf(humStr, "%.1f %%", humidity);
      tft.fillRect(x2, y1, sqr, sqr, TFT_GREEN);
      tft.setTextColor(TFT_BLACK);
      String humidity1 = "Humidity: " + String(humidity);
      tft.drawString(humidity1, x2 + 15, 15);

      sprintf(ligStr, "%.1f %%", light);

      tft.fillRect(x1, y2, sqr, sqr, TFT_BLUE);
      tft.setTextColor(TFT_BLACK);
      String light1 = "Light: " + String(light);
      tft.drawString(light1, 15, y2 + 15);


      sprintf(souStr, "%.1f %%", sound);


      tft.fillRect(x2, y2, sqr, sqr, TFT_YELLOW);
      tft.setTextColor(TFT_BLACK);
      String sound1 = "Sound: " + String(sound);
      tft.drawString( sound1, x2 + 15, y2 + 15);

      break;
    }
  }

  counter = counter + 1;
  delay(1000);

}