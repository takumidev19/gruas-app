# Grúas - Panel de Administración

Aplicación de escritorio para la gestión central de servicios de grúas.

## Características principales

- Gestión completa de usuarios y trabajadores
- Edición avanzada de usuarios: puedes modificar nombre, email y rol (admin, user, worker)
- Visualización detallada de cada usuario: email, nombre, rol, creado por (nombre), fecha de creación
- Verificación de seguridad para editar usuarios mediante API REST de Firebase Auth (exclusivo para escritorio)
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
   - Copia tu API Key de Firebase y colócala en `lib/services/users_service.dart` en la constante `firebaseApiKey`

3. Ejecuta la aplicación:
```bash
flutter run -d windows
```

## Estructura del Proyecto

```
gruas_admin_desktop/
├── lib/
│   ├── core/
│   ├── screens/
│   ├── services/
│   ├── widgets/
│   └── firebase_options.dart
├── assets/
├── test/
└── ...
```

## Tecnologías Utilizadas

- Flutter
- Firebase (Authentication, Firestore)
- http (para API REST de verificación de contraseña)
- Go Router (Navegación)
- Material Design 3
- Windows Desktop Support

## Notas de seguridad

- La verificación de contraseña para editar usuarios se realiza mediante la API REST de Firebase Auth, ya que la reautenticación nativa no está soportada en Windows Desktop.
- El campo "creado por" muestra el nombre del usuario creador, consultando Firestore automáticamente.

## Contribuciones

Si deseas contribuir, por favor abre un issue o un pull request.
