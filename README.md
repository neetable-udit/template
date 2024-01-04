## What is **Neetable App Template**?
Neetable App Template is a starter template for Flutter apps.
It's designed to be scalable and easy to maintain.

## Requirements

- Flutter: 3.16.2
- Dart SDK version: 3.2.2
- Go Task: [Installation](https://taskfile.dev/installation)

## Usage

#### Rename App
To reaname across all target platforms

```sh
task renameapp name=APP_NAME
```

#### Rename App Bundle
To reaname bundle identifier across all target platforms

```sh
task renamebundle bundle=BUNDLE_ID
```

#### Generate Copywriting
After adding all copywritings in app_en.arb, app_hi.arb, etc...
execute following to generate copywritings file for all languages

```sh
task copywriting
```

#### Generate Release APK
To generate release apk

```sh
task releaseapk
```

#### Generate Release AppBundle
To generate release app bundle

```sh
task appbundle
```


# Features

| Feature                                                              | Status |
|----------------------------------------------------------------------|--------|
| Platforms: Android, iOS, web | 🆕
| Scalable Architecture using [getx](https://bloclibrary.dev/)         | 🆕   
| Navigation using [go_router](https://pub.dev/packages/go_router)     | ✅ 
| Scalable App Styling                                                 | 🆕 
| GitHub Actions - code and formatting check                           | 🕣 
| Responsive Design                                                    | ✅ 
| Profile Page                                                         | ✅ 
| Settings Page: sign out, app version...                              | ✅ 
| Legal: Terms, Policy, Data Deletion                                  | 🕣 
| Google Fonts                                                         | ✅ 
| Sign in and Sign Up Pages                                            | ✅ 
| Input Validators                                                     | ✅ 
| Cached network image                                                 | ✅ 
| Email Support                                                        | 🕣
| Firebase Project Integration                                         | 🕣 
| Firebase Authentication                                              | 🕣 
| Firebase Remote Config                                               | 🕣
| Firebase Crashlytics                                                 | 🕣 
| Firebase Firestore                                                   | 🕣
| Firebase Analytics                                                   | 🕣
| Firebase Storage                                                     | 🕣 
| Amplify Auth UI                                                      | 🕣 
| In App Purchases (RevenueCat)                                        | 🕣 
| App Store Review Request                                             | 🕣
| Local Notifications                                                  | 🕣 
| Remote Notifications (Firebase)                                      | 🕣
| HTTP Requests                                                        | 🕣 
| Local Storage                                                        | 🕣 
| Permissions                                                          | 🕣 
| Environments                                                         | 🕣 
| Localization                                                         | 🕣 
| Dark Mode                                                            | 🕣
| Connectivity check                                                   | 🕣
| Hive - local database                                                | 🕣
| MixPanel - analytics                                                 | 🕣
| Android - Release Signing                                            | 🕣 
| Onboarding                                                           | 🕣 
| Forgot Password                                                      | 🕣 
