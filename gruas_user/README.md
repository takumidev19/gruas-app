# Grúas - App de Usuario

Aplicación móvil para clientes que necesitan servicios de grúa.

## Características

- Solicitud de servicios de grúa
- Seguimiento en tiempo real de la grúa asignada
- Historial de servicios
- Calificación de servicios
- Sistema de pagos
- Notificaciones push

## Requisitos

- Flutter SDK (versión >=3.3.0)
- Dart SDK (versión >=3.3.0)
- Firebase CLI
- Android Studio / Visual Studio Code

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
flutter run
```

## Estructura del Proyecto

```
gruas_user/
├── lib/
│   ├── core/
│   │   ├── routes/
│   │   └── theme/
│   ├── features/
│   │   ├── auth/
│   │   ├── services/
│   │   └── profile/
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
- Google Maps Flutter
- Material Design 3
