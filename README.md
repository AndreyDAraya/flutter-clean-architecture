# Flutter Clean Architecture Example

A comprehensive example of Clean Architecture implementation in Flutter, featuring offline-first capabilities, BLoC pattern, and proper separation of concerns.

## 🏗 Architecture Overview

This project follows Clean Architecture principles, divided into three main layers:

### 1. Domain Layer (`lib/features/*/domain/`)

- Contains business logic and rules
- Platform and data source independent
- Components:
  - Entities
  - Repository Interfaces
  - Use Cases

### 2. Data Layer (`lib/features/*/data/`)

- Implements repositories
- Manages data sources
- Components:
  - Repository Implementations
  - Models
  - Data Sources (Remote & Local)

### 3. Presentation Layer (`lib/features/*/presentation/`)

- Manages UI and state
- Components:
  - BLoC (Business Logic Component)
  - Pages
  - Widgets

## 🛠 Technical Stack

- **State Management**: flutter_bloc ^8.1.4
- **Navigation**: go_router ^14.6.2
- **Dependency Injection**: get_it ^8.0.3
- **Local Database**: drift ^2.15.0
- **Network**: http ^1.2.0
- **Code Generation**: build_runner, json_serializable
- **Functional Programming**: dartz ^0.10.1

## 📁 Project Structure

```
lib/
├── core/
│   ├── error/
│   │   ├── failures.dart
│   │   └── exceptions.dart
│   ├── network/
│   │   └── network_info.dart
│   ├── routes/
│   │   └── app_router.dart
│   └── di/
│       └── injection_container.dart
└── features/
    └── users/
        ├── data/
        │   ├── datasources/
        │   ├── models/
        │   ├── repositories/
        │   └── local/
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        └── presentation/
            ├── bloc/
            ├── pages/
            └── widgets/
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.6.0)
- Dart SDK (>=3.6.0)
- Android Studio / VS Code
- Android SDK / Xcode (for iOS development)

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/flutter-clean-architecture.git
cd flutter-clean-architecture
```

2. Install dependencies:

```bash
flutter pub get
```

3. Generate necessary code:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Development Scripts

The project includes two utility scripts for development and building:

#### Development Mode (`run.sh`)

```bash
./run.sh
```

This script:

- Updates project dependencies
- Generates necessary code
- Launches the app in debug mode

#### Release Build (`compile.sh`)

```bash
./compile.sh
```

This script:

- Updates project dependencies
- Generates necessary code
- Analyzes code for issues
- Builds a release APK

## 🌟 Features

- **Offline First**: Local data persistence using drift
- **Clean Architecture**: Proper separation of concerns
- **Reactive Programming**: Using BLoC pattern
- **Dependency Injection**: Service locator pattern with GetIt
- **Error Handling**: Proper error handling with Either type
- **Code Generation**: Automated code generation for models and database
- **Navigation**: Declarative routing with go_router

## 📱 Application Features

- User List Display
- User Detail View
- Offline Support
- Error Handling
- Pull-to-Refresh
- Loading States


## 📦 Dependencies

### Production Dependencies

```yaml
flutter_bloc: ^8.1.4 # State Management
go_router: ^14.6.2 # Navigation
get_it: ^8.0.3 # Dependency Injection
drift: ^2.15.0 # Local Database
http: ^1.2.0 # Network Requests
dartz: ^0.10.1 # Functional Programming
equatable: ^2.0.5 # Value Equality
```

### Development Dependencies

```yaml
build_runner: ^2.4.8 # Code Generation
json_serializable: ^6.7.1
drift_dev: ^2.15.0
flutter_lints: ^5.0.0 # Linting
```

## 🤝 Contributing

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
