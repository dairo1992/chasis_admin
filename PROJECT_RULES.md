# Project Architectural Rules

This document outlines the strict architectural standards for the `chasis_admin` project.

## 1. Clean Architecture
The project must be organized into clear layers:
- **Domain**: Contains business logic, entities, repository interfaces, and use cases. No dependencies on external libraries or the data layer.
- **Data**: Contains repository implementations, data sources (API/DB), and models (DTOs).
- **Presentation**: Contains UI logic (BLoCs), pages, and widgets.

## 2. Atomic Design
The `presentation` layer follows Atomic Design principles:
- **Molecules**: Small combinations of base components (e.g., a labeled input field). Use `shadcn_ui` components as the base.
- **Organisms**: Complex UI sections (e.g., a Login Form, a Navigation Bar).
- **Pages**: Full screens that compose organisms and molecules.

## 3. BLoC Architecture
- Always use `flutter_bloc`.
- **Mandatory**: Extend base classes from `packages/flutter_core_package`:
  - `BaseBloc` for business logic.
  - `BaseState` for state representation.
  - `UIState` for handling loading, success, and error states.

## 4. Dependency Injection
- Use `get_it`.
- Use a modular approach with `AuthInjector`, `HomeInjector`, etc., implementing the `DependencyInjector` interface from `flutter_commons`.

## 5. Coding Standards
- **Naming**: Use descriptive names. Avoid abbreviations.
- **Immutability**: Prefer `const` constructors and immutable states.
- **Testing**: Every new feature should include unit tests using `mocktail` and `bloc_test`.
