# Pokedex Intelligent Vision 📱⚡

A high-performance Pokedex application built with a strict modular architecture, integrating **Gemini AI** for real-time Pokemon identification via computer vision.

## 🚀 Core Technologies
- **Language:** [Dart 3.x](https://dart.dev/) & [Flutter 3.x](https://flutter.dev/)
- **State Management:** [Riverpod 2.x](https://riverpod.dev/) (Code generation for type safety).
- **Dependency Injection:** [Injectable](https://pub.dev/packages/injectable) & [GetIt](https://pub.dev/packages/get_it).
- **Navigation:** [GoRouter](https://pub.dev/packages/go_router) (Declarative routing).
- **Networking:** [Dio](https://pub.dev/packages/dio) with custom interceptors.
- **Generative AI:** [Google Generative AI (Gemini Flash 2.5)](https://ai.google.dev/).
- **Local Persistence:** [Drift](https://drift.simonbinder.eu/) (Reactive SQLite).

## 🏗️ Architecture & Best Practices
The project implements **Modular Clean Architecture** to ensure scalability and maintainability:

### Layers:
1.  **Data Layer:** Implementation of repositories, DataSources (Remote/Local), DTOs, and Mappers.
2.  **Domain Layer:** Pure business logic. Contains Entities, Repository Interfaces (Dependency Inversion), and Use Cases.
3.  **Presentation Layer:** Optimized UI with functional widgets, Notifiers (ViewModels), and reactive states using AsyncValue.

### Engineering Standards:
- **SOLID Principles:** Applied to ensure low coupling and high cohesion.
- **Dependency Inversion:** Interfaces bridge communication between layers.
- **Thread Safety:** Efficient use of Asynchronous programming to keep the UI thread jank-free.
- **Clean Code:** Highly readable, meaningful naming, and consistent formatting.

## ✨ Key Features
- **Global Pokedex:** Infinite list with reactive scrolling and optimized image caching (50MB cap).
- **Smart Search:** Instant filtering by Pokemon name or ID.
- **Gemini Vision:** AI-powered image scanning to identify Pokemon, types, and abilities with high precision.
- **Saved Collection:** Offline persistence of favorite Pokemon using a local database.
- **Fluid UI:** Detail views with smooth Hero transitions and Material 3 design.

## 🔑 Critical Configuration (Gemini AI)
The camera identification feature **requires** a valid Google Gemini API Key:

1.  Get your key at [Google AI Studio](https://aistudio.google.com/).
2.  Open the file: `packages/features/camera/lib/src/data/datasources/gemini_remote_data_source.dart`.
3.  Update the `_apiKey` constant:
    ```dart
    static const _apiKey = 'YOUR_API_KEY_HERE';
    ```
    *Warning: Never commit your private API keys to public repositories.*

## 🛠️ Installation & Setup
1.  Clone the repository.
2.  Fetch dependencies:
    ```bash
    flutter pub get
    ```
3.  Generate code (Mappers, DI, Riverpod):
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
4.  Run on your preferred device.

---
**Video**


https://github.com/user-attachments/assets/64466294-7124-4283-a8cf-d1c1b7b73598



https://github.com/user-attachments/assets/5ad0c622-6180-4ef9-958b-6f4bee6ee924

https://github.com/user-attachments/assets/7240bb54-f235-4a75-b513-c4685d6bce74




**Developer:** [CORZ](https://www.linkedin.com/in/omar-ramirez-6a51b7141/)  
**Date:** 2025-06-16
