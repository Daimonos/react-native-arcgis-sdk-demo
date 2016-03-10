# ArcGIS Runtime SDK for Android and iOS in React Native

This repository is a proof of concept that demonstrate the feasibility of using [ArcGIS Runtime SDK for Android](https://developers.arcgis.com/android/) and [iOS](https://developers.arcgis.com/ios/) in a [React Native](https://facebook.github.io/react-native/) application. 

The demo is limited to the following functionalities:
- on Android
  - Initialize the map from a configurable list of Tile and Feature Service Layer (in JavaScript)
  - Zoom/unzoom the map through buttons (in JavaScript)
  - Center the map on the device location (in JavaScript)
  - Display the map center and scale (respond to map touch events)
- on iOS
  - Initialize the map with hardcoded layer (in Objective-C)
  - Zoom/unzoom the map through buttons managed (in JavaScript)
  - Center the map on the device location (in JavaScript)
  - Display the map center and scale (respond to map touch events and JavaScript/Objective-C navigation)

The application has only been tested with an iPhone 5 and a Nexus 5. 
This repository is provided as is, with no support in the context of a presentation given at the Esri Developer Summit 2016 [Native Apps in JavaScript with React Native: Lessons From a Prototype](https://cdn.rawgit.com/glazou/react-native-arcgis-sdk-demo/master/Native Apps in JavaScript with React Native - Lessons From a Prototype.pdf).
Feel free to get in touch if you are interested.

![untitled](https://cloud.githubusercontent.com/assets/994078/13557959/2d4eab42-e3ad-11e5-86e7-4d580cb51abc.png)

## Setup

The following setup has only been tested on Mac OS X 10.10.5. 
React Native has [experimental Linux and Windows support for Android](https://facebook.github.io/react-native/docs/linux-windows-support.html) but the project hasn't been tested.

For either platform:
- [Install React Native](https://facebook.github.io/react-native/docs/getting-started.html) (only the "Requirements" step is needed and flow is not needed)
- Clone this repository
- Open a terminal and navigate to the root of the repository
- Run `npm install`

iOS:
- Install Xcode (this project has been tested with Xcode 7.2.1)
- Install [ArcGIS Runtime SDK for iOS](https://developers.arcgis.com/ios/), see [Install the SDK manually](https://developers.arcgis.com/ios/objective-c/guide/install.htm#ESRI_SECTION1_D57435A2BEBC4D29AFA3A4CAA722506A) (use default location and settings ; other steps described on this page are not necessary ; I haven't tried using CocoaPods, it should also be an option)
- Open `ios/ArcGISMap.xcodeproj` with xCode and run the app on your device or a simulator

Android:
- Install Android Studio (this project has been tested with Android Studio 1.3.2)
- Install the latest Java SDK and Android SDK, see [React Native Android setup guide](https://facebook.github.io/react-native/docs/android-setup.html#content)
- Open Android Studio and import the existing project located in the `android` folder 
- In the terminal, from the project root, run `react-native run-android` 
- With Android Studio, run the project on your device or a simulator 
- If the project doesn't build it may be because the installation of the [ArcGIS Runtime SDK for Android](https://developers.arcgis.com/android/) through Maven has failed, if this seems like your issue, installing it manually may resolve the issue [see the installation documentation](https://developers.arcgis.com/android/guide/install-and-set-up.htm#ESRI_SECTION1_4108D3B809C54DD4A0BD37E6397EBFA8) (only the "The SDK download" step is needed, use the default install location)
- If running on a device and the application starts but display a red screen with a stack trace, try running the following command from a terminal in the root of the repository `adb reverse tcp:8081 tcp:8081` and use the reload bundle button. [See this page for more information about running on Android device](https://facebook.github.io/react-native/docs/running-on-device-android.html)

## Resources
- https://facebook.github.io/react-native/docs/getting-started.html
- https://github.com/jondot/awesome-react-native
- https://github.com/enaqx/awesome-react
- https://facebook.github.io/react-native/docs/native-components-android.html
- https://facebook.github.io/react-native/docs/native-components-ios.html
- https://developers.arcgis.com/ios/
- https://developers.arcgis.com/android/ 
- http://browniefed.com/blog/2015/11/24/react-native-how-to-bridge-an-objective-c-view-component/
