# Flutter High-Performance Modular Stack (Template)

## 1. Architecture: Modular Clean Architecture
Designed for high scalability and rapid compilation via incremental builds.
- **SOLID**:
  - Single responsibility
  - Open Close
  - Liskov substitution
  - Interface segregation
  - Dependency inversion
- **Pattern design**:
  - **Creationals**: Singleton, Factory.
  - **Estructural**: Decorator, Facade, Adapter.
  - **Behavioral**: Observer, Strategy.
### Layers:
- **Presentation Layer**:
    - **UI**: Screens, Pages, and Atomic Widgets.
    - **State Management**: Notifiers (Riverpod), Blocs, or Cubits + UI State.
- **Domain Layer (Core Business Logic)**:
    - **UseCases**: Specific business rules.
    - **Repository Interfaces**: Contracts for data operations (Dependency Inversion).
    - **Entities**: Pure business models (Freezed).
    - **Mappers**: Domain-to-Data transformations (if required).
    - **Result**: Success or Failure that wil extend of Result<T>, if there is an error so use AppError
- **Data Layer (Infrastructure)**:
    - **Repository Implementations**: Logic to coordinate DataSources.
    - **DataSources (Local/Remote)**: API (Dio) and DB (Drift) implementations.
    - **DataSource Interfaces**: Contracts for specific data origins.
    - **Models/DTOs**: JSON-compatible entities (json_serializable).
    - **Mappers**: Data-to-Domain transformations.
    - **Result**: Success or Failure that wil extend of Result<T>, if there is an error so use AppError

### Module Strategy:
- **Root (App Shell)**: Glue code. Router, global Theme, and DI entry point.
- **Core Package**: Shared infrastructure (Network, DB, Failures, Base DI).
- **UI Core Package (core_ui)**: Centralized Design System (Colors, Typography, Spacing), Atomic Widgets (Buttons, Loaders, Inputs), and Global Translations (Common labels).
- **Feature Packages**: Self-contained modules per business capability with module-specific translations.

---

## 2. Dependency Injection: Micro-Packages Pattern
Uses `GetIt` + `injectable` to handle dependencies across module boundaries.
- **Module Side**: Annotate with `@InjectableInit.microPackage()` to generate a `module.dart`.
- **Root Side**: Use `@InjectableInit(includeMicroPackages: true)` to aggregate all module graphs into a single `getIt`.
- **Benefit**: No manual registration of services when adding new modules.
- **Infrastructure Registration**: Register `Dio`, `SecureStorage`, and Repositories as Singletons within the DI graph. 
    - **Data Layer**: Use `@lazySingleton` for Repository and DataSource implementations to optimize memory and ensure single instances.
    - **Presentation Layer**: Use Riverpod `@riverpod` Notifiers (auto-dispose by default) to manage UI state, ensuring features reuse the same pre-configured infrastructure without manual instantiation.

---

## 3. State Management: Riverpod 3.0 (Generator)
- **Reactive Logic**: Exclusive use of `@riverpod` annotations for auto-generated providers.
- **Functional UI States**: `AsyncValue` for standardized handling of loading "AsyncLoading", success "AsyncData" and "AsyncError" for error states. Acts as a state container that holds the latest emitted value and notifies the UI immediately.
- **Code Gen**: Faster development and compile-time safety for providers.
- **Concurrency**: Mandatory use of `async/await` (Futures) and `Streams` for non-blocking UI execution.
- **Lifecycle Management**:
    - Use `@Riverpod(keepAlive: true)` for global infrastructure (Repositories, DB, Auth Session) to prevent redundant re-initialization.
    - Default `autoDispose` for UI/Feature states to ensure optimal memory usage.
- **Result**: Success or Failure that wil extend of Result<T>, if there is an error so, use AppError sealed class, result will only usable on the Data and Domain, not on UI or Presentation layer, in presentation layer use AsyncValue.
---

## 4. Technical Core
- **Networking**: `Dio` + SSL Pinning (SecurityContext) + Interceptors + `connectivity_plus` (Network Awareness). *High-performance HTTP client with security (SHA-256 Fingerprinting) and network state detection.* Use constants for base URLs or static path segments. No hardcoded URL fragments in logic. **Standardized API Handling**: Implement a `safeApiCall` helper using `Result<T>` and `AppError`. It must handle:
    - **Success (2xx)**: Return `Result.success(data)`.
    - **Re-auth (403)**: Trigger automatic token refresh or re-authentication flow.
    - **Error Parsing (400)**: Decode JSON error bodies (e.g., `ApiResponseModel`) into specific `AppError` cases.
    - **Network Failures**: Catch `DioException` to map `SocketTimeout`, `UnknownHost`, and connectivity issues with retry logic.
- **Security**: `flutter_secure_storage` for sensitive data (Tokens/PII). *Encrypted storage for sensitive credentials using AES-256.* `screen_protector` to prevent screenshots, screen-recording, and content exposure in app switcher (iOS/Android). `flutter_jailbreak_detection` to detect Root/Jailbreak and protect app integrity. **Zero-Trace Memory**: Use `Uint8List` instead of `String` for passwords/tokens in RAM; overwrite with zeros after use to mitigate memory dumping. **App Integrity**: Implement Google Play Integrity / Apple App Attest to prevent cloned apps.
- **WebViews**: `webview_flutter`. *Explicitly disable JavaScript execution (`JavaScriptMode.disabled`) unless strictly required to mitigate Cross-Site Scripting (XSS) attacks.*
- **Persistence**: `Drift` (SQLite) + `SQLCipher` (`sqlcipher_flutter_libs`) for reactive, encrypted local storage. *Reactive database with AES-256 encryption at rest for offline-first capabilities.* *FTS5 & Indexing for high-speed queries.*
- **Observability**: `Talker` (Logs/Network) + `Firebase Crashlytics` & `Analytics` (Telemetry). *Advanced monitoring, crash reporting, and usage analytics.*
- **Models**: `Freezed` for immutability + `json_serializable` for API mapping. *Type-safe data modeling and automated JSON parsing.*
- **Internationalization (i18n)**: `slang` for type-safe translations. Decentralized strategy:
    - **Global i18n**: Common strings in `core_ui`.
    - **Feature i18n**: Module-specific strings within each feature package.
    *Type-safe code generation for multi-language support.*
- **Navigation**: `GoRouter` for declarative, deep-link ready routing. *Enterprise Navigation Strategy (GoRouter)*:
    - **URL-Driven Routing**: Every screen must map to a unique string path (e.g., `/home/details/:id`).
    - **Decoupled Architecture (Mediator Pattern)**: Feature packages never import each other for navigation.
    - **Stateful Navigation**: Use `StatefulShellRoute` for persistent bottom navigation (Tab state preservation).
    - **Guards (Redirects)**: Inspect session integrity (JWT) via `redirect` callbacks.
    - **Execution Rules**: Use `context.go` for state transitions (Login -> Home) and `context.push` for imperative stack allocation. Pass only primitives (IDs/Strings), never complex objects.
- **Quality Assurance**: `very_good_analysis`. *Strict linting rules to ensure code consistency and best practices.*
- **Performance & Threading**: Dart single-threaded model (Single Isolate). No memory locking or synchronization needed. Offload heavy CPU tasks (e.g., massive JSON decryption) to background `Isolates` via `compute()` to maintain 60 FPS UI.
- **Constant Management**:
    - Centralize API URLs and fixed strings in a dedicated `constants.dart` file per module or core.
    - **Naming Convention**: Follow *Effective Dart*. Use `camelCase` for all constant variables (e.g., `static const apiBaseUrl = '...'`), matching standard variable naming.

---

## 5. Setup Process (Checklist for New Projects)
1. **Directory Setup**: Create `packages/core`, `packages/core_ui`, and `packages/features/[name]`.
2. **Pubspec Linkage**: Use `path` dependencies in the root `pubspec.yaml`.
3. **DI Initialization**: 
    - Create `injection.dart` in each module (MicroPackage).
    - Create `injection.dart` in root (Main initializer).
4. **Build Pipeline**:
    - `dart run build_runner build` on `core`.
    - `dart run build_runner build` on `features`.
    - `dart run build_runner build` on `root`.
5. **Standardized Response**: Use an `ApiResult` or `Either` pattern for error handling in the Domain layer.

---

## 6. Workspace Management: Melos
- **Purpose**: Orchestrate multi-package development and cross-module scripts.
- **Config**: `melos.yaml` in root.
- **Commands**:
    - `melos bootstrap`: Sync all dependencies.
    - `melos run build`: Trigger `build_runner` on all modules (Injectable, Freezed, Slang).
    - `melos run watch`: Parallel real-time code generation.
    - `melos run analyze`: Static analysis across the workspace.
    - `melos run clean:deep`: Nuclear clean (cache + locks) for dependency resolution.
    - `melos run test`: Execute tests across the workspace.
    - `melos run build:apk`: Build obfuscated APK for production.
    - `melos run build:ipa`: Build obfuscated IPA for production.

---

## 7. Modular Testing Policy
- **Symmetry**: Test directory must mirror `lib/` structure.
- **Location**: Each module (Core/Feature) contains its own `test/` folder.
- **Tools**: `mocktail` (Mocking sin código generado), `flutter_test` (Unit/Widget).
- **Coverage Check**: Faster identification of missing tests by following Clean Architecture layers (Data/Domain/Presentation).
- **Execution**: Use `melos run test` for workspace-wide verification.

---

## 8. Module & Dependency Inversion
- **Prevent circular dependencies**: Create dedicated intermediate modules to break cycles.
- **Interfaces / Contracts (Dependency Inversion)**: Dedicated module containing ONLY interfaces for business logic. Features implement these interfaces without direct cross-module coupling.
- **Coordination (Mediator / Navigation)**: Dedicated navigation module (Mediator pattern) to manage routing between features, ensuring Feature A never imports Feature B.
- **Shared Entities**: Move domain entities used by multiple features to a shared core/contract package.

---

## 9. Observability, Security & i18n
- **Traceability**: `Talker` integration in the Core Package to centralize exceptions, network logs (Dio), and Riverpod states. Critical errors are asynchronously reported to `Firebase Crashlytics`.
- **Cryptography & Protection**: `flutter_secure_storage` for sensitive credentials and `screen_protector` to prevent unauthorized screen captures/recordings. `flutter_jailbreak_detection` to detect Root/Jailbreak and protect app integrity. **Zero-Trace Memory**: Use `Uint8List` instead of `String` for passwords/tokens in RAM; overwrite with zeros after use to mitigate memory dumping.
- **Network & Web Security**: SSL Pinning (SHA-256 Fingerprinting) and Certificate Transparency to prevent Man-in-the-Middle (MitM) attacks. Strict WebView policies disabling JavaScript by default to mitigate Cross-Site Scripting (XSS).
- **Code Integrity**: Obfuscated production builds (`--obfuscate`) to prevent reverse engineering. Avoid `runtimeType.toString()` for business logic or analytics as obfuscation renames classes.
- **Zero-Leak Policy**: PII (Personally Identifiable Information) must never be logged or shared with telemetry services (Talker/Firebase).
- **Internationalization (i18n)**: `slang` adoption with JSON-based code generation to ensure type-safe translations in the Presentation layer.

## 10. Performance & UI Policies
- **UI Consistency**: Decoupled module tree via `packages/core_ui` encapsulating the Design System (ThemeData, atoms, and design tokens).
- **List Optimization**: Mandatory use of `ListView.builder` or `ListView.separated` for lazy loading. Wrap in `Expanded` within `Column` layouts to correctly fill available space.
- **Modern Search**: Implement `SearchBar` & `SearchAnchor` (Material 3) for optimized search. Use a clear button (`X`) for non-empty queries and `Drift` to cache/display local search history when the query is blank.
- **State & Feedback**: Use Shimmer structures for `AsyncLoading` states and SVG/Lottie for empty/error states. 
- **Pagination**: Implement infinite scroll via `ScrollController` in `ListView.builder`, triggering batch fetching (LIMIT/OFFSET) at 80% scroll threshold.
- **OS Integration**: Use `ScrollViewKeyboardDismissBehavior.onDrag` and `FocusScope.unfocus()` to manage virtual keyboard and focus state efficiently.
- **Micro-Animations**: Use `AnimatedSwitcher` or implicit animations to smooth layout transitions during reactive filtering.
- **Code Quality**: Strict rules via `very_good_analysis` for automated static auditing.
- **Memory Management**: Strict enforcement of Riverpod lifecycle, mandating auto-dispose for view-specific states to free memory upon screen popping.
- **Logic over Theory (Interview Tip)**: Prioritize code efficiency. Use `final` for asynchronous data flows (Futures/Streams) and `const` constructors for all immutable widgets to optimize the element tree and reduce rebuilds.

---

## 11. Native SDK Bridges (R8/ProGuard Rules)
- **Context**: Plugins wrapping native libraries (.aar / .framework) are subject to R8/ProGuard shrinking in production builds.
- **Critical Categories**:
    - **Biometrics**: Advanced fingerprint/face-id vendor SDKs.
    - **KYC/Identity**: OCR scanning, liveness detection, and document validation.
    - **Hardware Security**: Physical tokens, HSM, or secure element access.
    - **NFC/Payments**: Direct chip communication for secure transactions.
- **Action**: Add vendor-specific exclusion rules to `android/app/proguard-rules.pro` to prevent R8 from stripping native implementation code.
- **Permissions (local_auth / Native SDKs)**:
    - **Android (`AndroidManifest.xml`)**: `<uses-permission android:name="android.permission.USE_BIOMETRIC"/>`.
    - **iOS (`Info.plist`)**: `<key>NSFaceIDUsageDescription</key><string>Biometric auth for secure access.</string>`.
- **Session Management**: Mandatory implementation of auto-lock on inactivity and session timeout policies for financial safety.

---
**Purpose**: Use this context as a blueprint to bootstrap any modern Flutter enterprise application.
