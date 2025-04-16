command To run this source code, you can use the following method: for canvaskit via chrome

flutter run -d chrome --web-renderer canvaskit --release for html via chrome
flutter run -d chrome --web-renderer html --release or using localhost on another browser
flutter run -d web-server this is just for development & testing
flutter run -d chrome --web-browser-flag "--disable-web-security"
To build image render this code, you can use the following method:

flutter build web (debug mode)
flutter build web --release (release mode)
flutter build web --web-renderer html --release (render html & release mode)
flutter build web --web-renderer canvaskit --release (render canvaskit & release mode)
