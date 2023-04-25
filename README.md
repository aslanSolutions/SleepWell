# Sleep Well

## Introducation
Welcome to our project, which is focused on using the Wio Terminal, an Arduino-based device, to monitor the environment during sleep. Our aim is to provide users with a comprehensive understanding of their sleep quality by gathering data on temperature, humidity, light, and noise levels throughout the night. At the end of each night, the collected data is analyzed and assigned a score, indicating the quality of the user's sleep. We plan to save this data on a mobile application for easy access and further analysis. Here, you will find the code for the program, as well as any additional information related to the project.

## Instructions

### Installation

To install the project from the repository, as user for this project, you need to have some specific requirement like;
- [ ] You should setup both of Arduino and Flutter framework. 
 - - [ ] You can install and setup Arduino IDE from the official website, [Click here](https://www.arduino.cc/en/software)
 - - [ ] Flutter framework, can be downloaded by the official Flutter website, [Click here](https://docs.flutter.dev/get-started/install)
- [ ] You should have the Wio Seeed Terminal to upload the code on it by using Arduino IDE, and there is going to be several sensors with the terminal you can connect;
 - [ ] External Sensor:
    - - [ ] Tempereture & Humidity Sensor
    - - [ ] Loudness Sensor
 - [ ] Internal Sensors:
    - - [ ] Light Sensor


- [ ] 
Then you need the following sensors: 
 - - [ ] x1
 - - [ ] x2 
 - - [ ] x3

- [ ] 
Now that all the hardware is here, you will need to install [Arduino IDE](https://www.arduino.cc/en/software) and implement the Wio Terminal Library inside the Arduino IDE. This can be done by going File > Preferences, then paste this [URL](https://files.seeedstudio.com/arduino/package_seeeduino_boards_index.json) to Additional Boards Manager. 
- [ ] 
Now you need to select and install the Wio Terminal board by Tools > Board > Board Manager and Search Wio Terminal. 
- [ ] 
Once that is done, you can now select the board from the board list and cope/paste the arduino code in this project. 
- [ ] 
All that is left now is to verify and upload the code to your Wio Terminal. 

- [ ] 
When it comes to the Andriod App or computer web-based program, we have no idea yet.....

 
## Usage
Use examples liberally, and show the expected output if you can. It's helpful to have inline the smallest example of usage that you can demonstrate, while providing links to more sophisticated examples if they are too long to reasonably include in the README.

## Support
Tell people where they can go to for help. It can be any combination of an issue tracker, a chat room, an email address, etc.

## Contributing
State if you are open to contributions and what your requirements are for accepting them.

For people who want to make changes to your project, it's helpful to have some documentation on how to get started. Perhaps there is a script that they should run or some environment variables that they need to set. Make these steps explicit. These instructions could also be useful to your future self.

You can also document commands to lint the code or run tests. These steps help to ensure high code quality and reduce the likelihood that the changes inadvertently break something. Having instructions for running tests is especially helpful if it requires external setup, such as starting a Selenium server for testing in a browser.

## Authors and acknowledgment
Show your appreciation to those who have contributed to the project.

## License
For open source projects, say how it is licensed.

