#include "DHT.h"
#include "wifiMqtt.h"
#define DHTPIN 0
#define DHTTYPE DHT11

DHT dht(DHTPIN, DHTTYPE);
int counter = 0;
int light_value = 0;
int sound_value = 0;
int temperature_value = 0;
int humidity_value = 0;

int exp_size = 2881;

int* light_array = new int[exp_size];
int* sound_array = new int[exp_size];
int* temperature_array = new int[exp_size];
int* humidity_array = new int[exp_size];


void setup() {
  pinMode(WIO_LIGHT, INPUT);
  pinMode(WIO_MIC, INPUT);
  Serial.begin(9600);
  Serial.begin(115200);
  dht.begin();

  memset(light_array, 0, sizeof(light_array));
  memset(sound_array, 0, sizeof(sound_array));
  memset(temperature_array, 0, sizeof(temperature_array));
  memset(humidity_array, 0, sizeof(humidity_array));

  light_array[0] = 1;
  sound_array[0] = 1;
  temperature_array[0] = 1;
  humidity_array[0] = 1;
}

void loop() {

  if(counter > exp_size){
    return;
  }

  int light = analogRead(WIO_LIGHT);
  int sound = analogRead(WIO_MIC);
  int temperature = dht.readTemperature();
  int humidity = dht.readHumidity();

  Serial.print("Current Values, Counter: " + String(counter) + " Light " + String(light) + " sound " + String(sound) + " temperature " + String(temperature) + " humidity " + String(humidity) + "  ||||  ");

 

  light_array[counter] = light;
  sound_array[counter] = sound;
  temperature_array[counter] = temperature;
  humidity_array[counter] = humidity;

  int light_median = 0, sound_median = 0, temperature_median = 0, humidity_median = 0;
  
  //Loop to to find the values until the specific done
  for (int i = 0; i < counter; i++) {
    //For all the task!! There is already variables which you have to use while imlpementing the each task
    
    //TODO Light 
    light_median += light_array[i];

    /*
    The conuter is gonig to increase every time to write the value which measured from the light sensor
    */
    //Implement it here

    //TODO loudness
    /*
    The conuter is gonig to increase every time to write the value which measured from the sensor loudness
    */
    //Implement it here

    //TODO Temperature
    /*
    The conuter is gonig to increase every time to write the value which measured from the sensor temperature
    */
        temperature_median += temperature_array[i];


    //TODO Humidity
    /*
    The conuter is gonig to increase every time to write the value which measured from the sensor humidity
    */
    //Implement it here

    humidity_median += humidity_array[i];
  }


  light_median = light_median / counter;
  sound_avarage = //TODO: Find the way to calculate the avarage of the loudness values
  temperature_avarage = //TODO: Find the way to calculate the avarage of the temperature values
  humidity_median = humidity_median / counter;


 
  Serial.print("Average Values, Counter: " + String(counter) + " Light " + String(light_avarage) + " sound " + String(sound_avarage) + " temperature " + String(temperature_avarage) + " humidity " + String(humidity_median));
  Serial.println();

  //Here to increase the value of the counter every time, it is increasing by 1
  counter += 1;

  delay(1);

}