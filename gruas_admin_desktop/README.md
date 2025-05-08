# Grúas - Panel de Administración

Aplicación de escritorio para la gestión central de servicios de grúas.

## Características

- Gestión completa de usuarios y trabajadores
- Monitoreo en tiempo real de la flota
- Gestión de servicios y emergencias
- Reportes y estadísticas
- Configuración del sistema
- Gestión de pagos y facturación

## Requisitos

- Flutter SDK (versión >=3.3.0)
- Dart SDK (versión >=3.3.0)
- Firebase CLI
- Visual Studio Code
- Windows 10 o superior

## Configuración

1. Instala las dependencias:
```bash
flutter pub get
```

2. Configura Firebase:
   - Crea un proyecto en Firebase Console
   - Habilita Authentication y Firestore
   - Descarga y configura los archivos de configuración de Firebase
   - Actualiza las credenciales en `lib/firebase_options.dart`

3. Ejecuta la aplicación:
```bash
flutter run -d windows
```

## Estructura del Proyecto

```
gruas_admin_desktop/
├── lib/
│   ├── core/
│   │   ├── routes/
│   │   └── theme/
│   ├── features/
│   │   ├── auth/
│   │   ├── dashboard/
│   │   ├── users/
│   │   ├── workers/
│   │   ├── services/
│   │   └── reports/
│   ├── models/
│   ├── services/
│   └── utils/
├── assets/
│   ├── images/
│   ├── icons/
│   └── fonts/
└── test/
```

## Tecnologías Utilizadas

- Flutter
- Firebase (Authentication, Firestore)
- Provider (Gestión de estado)
- Go Router (Navegación)
- Material Design 3
- Windows Desktop Support
