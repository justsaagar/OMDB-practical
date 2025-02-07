# omdb_practical

## Project Details
This project is a Flutter application designed to show movie list it's details from OMDB API..

## Links
- **GitHub Repository**: [GitHub Repo URL](https://github.com/justsaagar/OMDB-practical.git)
- **Branch**:dev

## Development Setup

### Prerequisites
- Flutter SDK: `v3.27.0`
- Dart Version: `3.6.0`

Make sure you have Flutter and Dart set up on your machine before you proceed with the setup. You can install Flutter from [flutter.dev](https://flutter.dev/docs/get-started/install).

### Run the Project

1. **Clone the Repository**:
    ```bash
    git clone https://github.com/justsaagar/OMDB-practical.git
    cd OMDB-practical
    ```

2. **Install Dependencies**:
   Run the following command to get all the dependencies required by the project:
    ```bash
    flutter pub get
    ```

3. **Serialise model**:
   To serialise model use following command:
    ```bash
    dart run build_runner build
    ```

3. **Run the App**:
   To run the app on an emulator or connected device:
    ```bash
    flutter run
    ```

### Common command

1. **Combined code**:
    ```bash
    flutter --version && flutter clean && flutter pub get && dart run build_runner build
    ```

### Build the App

1. **Build for Android**:
   To build the app for an Android release:
    ```bash
    flutter build apk --release --no-tree-shake-icons
    ```

2. **Build for iOS**:
   To build the app for iOS:
    ```bash
    flutter build ios --release
    ```

## Notes
- Ensure that you have the appropriate development environment set up for Android or iOS.
- For further instructions on how to configure your device or emulator, refer to [Flutter Installation Guide](https://flutter.dev/docs/get-started/install).
- If you encounter issues with code generation (e.g., errors with `build_runner`), try clearing any generated files by running the following:
    ```bash
    dart run build_runner clean
    ```
- If you want to use single command you can do by running the following:
    ```bash
    flutter --version && flutter clean && flutter pub get && dart run build_runner build
    ```