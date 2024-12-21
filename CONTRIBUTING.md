# Contributing to Flutter Clean Architecture Example

First off, thank you for considering contributing to this project! It's people like you that make this project such a great learning resource.

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code.

## How Can I Contribute?

### Reporting Bugs

Before creating bug reports, please check the issue list as you might find out that you don't need to create one. When you are creating a bug report, please include as many details as possible:

- Use a clear and descriptive title
- Describe the exact steps which reproduce the problem
- Provide specific examples to demonstrate the steps
- Describe the behavior you observed after following the steps
- Explain which behavior you expected to see instead and why
- Include screenshots if possible

### Suggesting Enhancements

If you have a suggestion for the project, we'd love to hear it. Enhancement suggestions are tracked as GitHub issues. When creating an enhancement suggestion, please include:

- Use a clear and descriptive title
- Provide a step-by-step description of the suggested enhancement
- Provide specific examples to demonstrate the steps
- Describe the current behavior and explain which behavior you expected to see instead
- Explain why this enhancement would be useful

### Pull Requests

1. Fork the repo and create your branch from `main`.
2. If you've added code that should be tested, add tests.
3. Ensure the test suite passes.
4. Make sure your code follows the existing code style.
5. Write a good commit message.

## Development Process

1. Clone the repository:

```bash
git clone https://github.com/andreydelgado/flutter-clean-architecture.git
```

2. Create a branch:

```bash
git checkout -b feature/my-feature
```

3. Set up development environment:

```bash
# Install dependencies
flutter pub get

# Generate necessary code
dart run build_runner build --delete-conflicting-outputs

# Run the development server
./run.sh
```

### Code Style

- Follow the [Effective Dart Style Guide](https://dart.dev/guides/language/effective-dart/style)
- Use meaningful variable and function names
- Write comments for complex logic
- Keep functions small and focused
- Use proper file and folder structure following Clean Architecture principles

### Commit Messages

- Use the present tense ("Add feature" not "Added feature")
- Use the imperative mood ("Move cursor to..." not "Moves cursor to...")
- Limit the first line to 72 characters or less
- Reference issues and pull requests liberally after the first line

### Documentation

- Update the README.md with details of changes to the interface
- Update the CHANGELOG.md following semantic versioning
- Add or update documentation comments in the code
- Update any relevant documentation pages

## Project Structure

When adding new features, please follow the existing project structure:

```
lib/
├── core/              # Core functionality used across features
├── features/          # Feature modules
│   └── feature_name/  # Specific feature
│       ├── data/      # Data layer
│       ├── domain/    # Domain layer
│       └── presentation/ # Presentation layer
└── main.dart
```

## Testing

- Write unit tests for all new code
- Update existing tests when modifying code
- Ensure all tests pass before submitting PR
- Include integration tests for new features
- Test edge cases and error conditions

## Questions?

Feel free to contact the project maintainer:

Andrey Delgado Araya
Email: andreydelgadoaraya@gmail.com
GitHub: https://github.com/andreydelgado
