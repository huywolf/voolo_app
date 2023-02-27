# voolo_application

## Overall Info
- Introduction: this is Voolo application project
- Framework: Flutter - version 3.3.0
- Updated at: 20/02/2023
- Plugin: GetX
- Third-party: hyperverge, firebase

## Technology & Project Introduction

Use Flutter 3.x to build a set of features containing predefined folder structure, style themes, API access, state management, routing & dependencies, etc. The project structure is clear and can be easily used as a Flutter template project. Technologies used include but are not limited to [Flutter](https://flutter.cn/), [Dart](https://dart.dev/), [GetX](https://pub.dev/packages/get), etc.

<!-- <p align='center'>
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/2.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/3.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/4.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/5.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/6.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/7.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/8.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/9.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/voolo_app/blob/master/assets/screenshot/chat.gif" width="237px" heght="416px" />
</p> -->

## Installation & Use

**Step 1:**

Fork this project to your own warehouse:

```
...
```

**Step 2:**

Open the project folder with VS Code and execute the following command to install the dependency package:

```
flutter pub get
```

**Step 3:**
- Generate files, include app icon
```
flutter pub run flutter_launcher_icons
flutter packages pub run build_runner build --delete-conflicting-outputs
```

**Step 4:**

Open the main.dart file in the lib folder, F5 or Ctrl + F5 to run the project, and then you can start developing and debugging.

## Folder structure

The following is the project folder structure (only the folders under lib are introduced)

```
lib/
|- api - Global Restful api requests, including interceptors, etc.
   |- interceptors - Interceptors, including auth, request, and response interceptors.
   |- api.dart - Restful api export file.
|- lang - Internationalization, including translation files, translation service files, etc.
   |- lang.dart - Language export file.
|- models - Various structured entity classes, divided into request and response entities.
   |- models.dart - Entity class export file.
|- modules - Business module folder.
   |- auth - Login & Registration Module.
   |- home - Home module.
   |- splash - Splash module.
   |- modules.dart - Module export file.
|- routes - Routing module.
   |- app_pages.dart - Routing page configuration.
   |- app_routes.dart - Route names.
   |- routes.dart - Route export file.
|- Shared - Global shared folders, including static variables, global services, utils, global Widgets, etc.
   |- shared.dart - Global shared export file.
|- theme - Theme folder.
|- app_bindings.dart - Services started before the app runs, such as Restful api.
|- di.dart - Global dependency injection objects, such as SharedPreferences, etc.
|- main.dart - Main entry.
```

## Demo account

Test User as below:
  
    email: "eve.holt@reqres.in",
    password: "pistol"
