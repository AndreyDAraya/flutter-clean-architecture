# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2024-01-20

### Added

- Initial release with Clean Architecture implementation
- User list and detail features
- Offline-first capability using drift database
- BLoC pattern for state management
- Dependency injection using GetIt
- Navigation using go_router
- Error handling with Either type
- Development and build scripts (run.sh and compile.sh)
- Comprehensive documentation
- GNU General Public License v3.0

### Features

- User list display with pull-to-refresh
- User detail view
- Offline data persistence
- Error handling and loading states
- Responsive UI design

### Technical Implementation

- Clean Architecture with three layers (domain, data, presentation)
- BLoC pattern for state management
- Local database using drift
- Remote data fetching with http package
- Dependency injection with GetIt
- Code generation for models and database
- Proper error handling with Either type

### Documentation

- README with project overview and setup instructions
- CONTRIBUTING guidelines
- Code documentation and comments
- License information

## [Unreleased]

### Planned Features

- Unit tests implementation
- Integration tests
- CI/CD pipeline
- Performance optimizations
- Additional features (user search, filtering, etc.)
- Dark mode support
- Localization
