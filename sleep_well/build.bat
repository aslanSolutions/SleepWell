@echo off

rem Clean previous build artifacts
call flutter clean

rem Fetch project dependencies
call flutter pub get

rem Build the project for Android using Gradle
cd android
call gradlew.bat assembleDebug

rem Return to the project root directory
cd ..

rem Run tests (optional)
call flutter test

rem Launch the app on the specified emulator device
call flutter run -d all
