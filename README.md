# cv_checker

Front-end implementation of the cv Checker app.

## Getting Started

This is a basic app that Matches Job recruiters to Job seekers based on skills, experience and 
educalion level. It is primarily developed for the web.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


To run this application on web one Requires the following software:

Frontend

Flutter (3.16.5)
Dart SDK
Android studio (version 2020.3) or preffered IDE
Google chrome

Backend: (please see the Backend ReadMe file)
Azure data studio for database hosting
Docker


to run the web application:

set up local host route
open the application from android studio and navigate to the "lib" folder
click on the "Services" folder to access the "apiService.dart" file. (see Screenshot below)
cv_checker/lib/Services/apiService.dart

![img.png](img.png)

once you open the file paste a the url for the local host (see Screenshot below)

![img_1.png](img_1.png)

now you can proceed to run the application:
Paste the command below in your app terminal to run the application on CHROME  

 -flutter run -d chrome --web-browser-flag "--disable-web-security"
