### SahYog : A integrated Disaster management system

<b>Hackathon </b>: uhack 5.0 <br>
<b>Team name </b>: Tech Avdans <br>
<b>Tracks </b>: Open Innovation  <br>

## Problem Statement: 
The combined effort to manage things during Disaster



## Proposed Solution : 
We save lives,because every live matters. Our project is complete ecosystem which helps civilian during natural and man made disasters. Also beneficial for rescue team as they will get exact location.
The problem of coordination , efficiency, lack of digital integrated system and automation in the current disaster management system  is solved with Sahyog. With the implementation of various sensors and Apis , the app will be automated. With the faster technology it will be world efficient and many lives will be saved. It will connect victims directly to concerned department related to the tragedy hence it will be digitally integrated.


## Currently Implemented Features : 
1. The user can register problems with pin point location, main problem type, number of people affected and a brief explaination
2. Implemented Push Notification to notify respective problem handling of a particular area filter using PIN CODE.



## Tech Stack Used :
![Flutter](https://img.shields.io/badge/flutter-%23039BE5.svg?style=for-the-badge&logo=flutter)
![Dart](https://img.shields.io/badge/dart-%23039BE5.svg?style=for-the-badge&logo=dart)
![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)
![Heroku](https://img.shields.io/badge/heroku-%23430098.svg?style=for-the-badge&logo=heroku&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)

### Folder structure
|-- civilian_app   //  Code of Flutter app for civilians to register problems <br>
|-- rescue_app    // Code of Flutter app for rescue members to get problems  <br>
|-- sahyog_server    // code of FCM push notification with Nodejs  <br>

## Future Scopes :
1. Adding pop screen like truecaller with different sound which enables the Rescue team member to get the disaster information without any delay
2. Use Gyroscope sensor for Earthquake, Temperature rise detector for Fire hazards, and many more to report the problem without human interaction with the phone.
3. Will try to implement a system to detect and avoid fake requests
4. The rescue members after indentifying problem can send acknowledge to the user and he/she can track the work
5. Display nearby hospitals on Map with number of bed availability by providing hospitals with interface to update details regularly.
6. A mass alert system which can notify all the required citizens about any warning with just single click.

## Challenges faced : 
While implementing push notification services, it was not running in Android emulator but it runs fortunately on Real device after a very long time. 
We found very less support of sensors in Flutter. Since we were making two different apps for the Civilian and Rescue team, we found it hard to manage it on the same system along with virtual devices.

