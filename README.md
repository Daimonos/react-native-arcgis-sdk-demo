# ArcGIS Runtime SDK for Android and iOS in React Native

This repository is a proof of concept that illustrate the feasibility of exposing ArcGIS Runtime SDK for Android and iOS in React Native. 

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

The application has only been tested with an iPhone 5 and a Nexus 5. This repository is provided without support as a proof of concept in the context of a presentation given at the Esri Developer Summit 2016 "Native Apps in JavaScript with React Native: Lessons From a Prototype". Feel free to get in touch if you are interested.

## Setup

The following setup has only been tested on Mac OS X 10.10.5. React Native has [experimental Linux and Windows support](https://facebook.github.io/react-native/docs/linux-windows-support.html) but it hasn't been tested.

- [Install React Native](https://facebook.github.io/react-native/docs/getting-started.html) (only the "Requirements" step is needed and flow is not needed)
- Install Xcode and Android Studio (tested with Xcode 7.2.1 and Android Studio 1.3.2)
- Install [ArcGIS Runtime SDK for iOS](https://developers.arcgis.com/ios/), see [Install the SDK manually](https://developers.arcgis.com/ios/objective-c/guide/install.htm#ESRI_SECTION1_D57435A2BEBC4D29AFA3A4CAA722506A) (use default location and settings ; other steps described on this page are not necessary ; I haven't tried using CocoaPods, it should also be an option)
- Clone this repository
- Open a terminal and navigate to the root of the repository
- Run `npm install`
- Open `ios/ArcGISMap.xcodeproj` with xCode and run the app on your device or a simulator
- Open Android Studio and Import the existing project located in `android` 
- Run the app on your device or a simulator with Android Studio
- If the application build and start on your device but you get a red screen with a stack trace, try running the following commands from a terminal in the root of the repository `react-native run-android` and `adb reverse tcp:8081 tcp:8081`
- If the project doesn't build it may be because the installation of the [ArcGIS Runtime SDK for Android](https://developers.arcgis.com/android/) through Maven has failed, if this seems like your issue, installing it manually may resolve the issue [see the installation documentation](https://developers.arcgis.com/android/guide/install-and-set-up.htm#ESRI_SECTION1_4108D3B809C54DD4A0BD37E6397EBFA8) (only the "The SDK download" step is needed, use the default install location)

## Resources
- https://github.com/jondot/awesome-react-native
- https://github.com/enaqx/awesome-react
- https://facebook.github.io/react-native/docs/native-components-android.html
- https://facebook.github.io/react-native/docs/native-components-ios.html
