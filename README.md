
## What is **Neetable App Template**?

Neetable App Template is a starter template for Flutter apps.
It's designed to be scalable and easy to maintain.

## Requirements

- Flutter: ^3.16.2
- Dart SDK version: ^3.2.2
- gotask: brew install go-task 
- jq: brew install jq

## Usage
#### Rename App

To reaname across all target platforms

```sh
task  renameapp  name=APP_NAME
```
---
#### Rename App Bundle
To reaname bundle identifier across all target platforms

```sh
task  renamebundle  bundle=BUNDLE_ID
```
---
#### Generate Copywriting

After adding all copywritings in app_en.arb, app_hi.arb, etc...
execute following to generate copywritings file for all languages

```sh
task  copywriting
```
---
#### Adding Light Theme

##### 1: Customise [app theme](https://appainter.dev) and then export theme
##### 2: Copy path of JSON schema downlaoded and run

```sh
task themelight path={JSON_PATH}

for eg:
task themelight path=/Users/udit/Downloads/appainter_theme.json
```
---
#### Adding Dark Theme

##### 1: Customise [app theme](https://appainter.dev) and then export theme
##### 2: Copy path of JSON schema downlaoded and run

```sh
task themedark path={JSON_PATH}

for eg:
task themedark path=/Users/udit/Downloads/appainter_theme.json
```
---
#### Generate Release APK
To generate release apk


```sh
task  releaseapk
```
#### Generate Release AppBundle
To generate release app bundle


```sh
task  appbundle
```

  
  

# Features

| Feature | Status    |
| :---:   | :---: |
| Platforms: Android, iOS, web |✅|
| Scalable Architecture using GetX |✅|
| [Dynamic App Styling](https://appainter.dev) |✅|
| Responsive Design |✅|
| Renaming App |✅|
| Renaming AppBundle |✅|
| Amplify Auth UI | ✅ |
| AppIcon Customisation | ✅ |
| Profile Page | 🕣|
| Basic Settings Page | 🕣 |
| Sign in and Sign Up Pages |🕣|
| Input Validators | 🕣 |
| Cached network image | 🕣 |
| Legal: Terms, Policy, Data Deletion |🕣|
| Email Support | 🕣
| Firebase Project Integration | 🕣
| Firebase Remote Config | 🕣
| Firebase Crashlytics | 🕣
| Firebase Analytics | 🕣
| In App Purchases (RevenueCat) | 🕣
| App Store Review Request | 🕣
| Local Notifications | 🕣
| Remote Notifications (Firebase) | 🕣
| HTTP Requests | 🕣
| Local Storage | 🕣
| Permissions | 🕣
| Environments | 🕣
| Localization | 🕣
| Dark Mode | 🕣
| Connectivity check | 🕣
| Hive - local database | 🕣
| MixPanel - analytics | 🕣
| Android - Release Signing | 🕣
| Onboarding | 🕣
| Forgot Password | 🕣
