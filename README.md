# Sistema Multiplataforma de Gestión de Grúas

Este proyecto es un sistema completo para la gestión de servicios de grúas, desarrollado con Flutter y Firebase.

## Características

- Autenticación de usuarios con diferentes roles (Administrador, Usuario, Trabajador)
- Panel de administración para gestión total del sistema
- Aplicación móvil para usuarios finales
- Aplicación móvil para trabajadores
- Interfaz web para diferentes propósitos
- Integración con Google Maps para seguimiento en tiempo real
- Sistema de notificaciones push
- Gestión de ubicaciones y rutas
- Sistema de calificaciones y reseñas
- Historial de servicios y reportes

## Requisitos

- Flutter SDK (versión >=3.3.0)
- Dart SDK (versión >=3.3.0)
- Firebase CLI
- Android Studio / Visual Studio Code
- Git
- Cuenta de Google Cloud Platform (para Google Maps)

## Configuración

1. Clona el repositorio:
```bash
git clone https://github.com/tu-usuario/gruas.git
cd gruas
```

2. Instala las dependencias:
```bash
flutter pub get
```

3. Configura Firebase:
   - Crea un proyecto en Firebase Console
   - Habilita Authentication y Firestore
   - Configura las reglas de seguridad en Firestore
   - Descarga y configura los archivos de configuración de Firebase
   - Actualiza las credenciales en `lib/firebase_options.dart`

4. Configura Google Maps:
   - Obtén una API key de Google Maps
   - Configura las restricciones de la API key
   - Actualiza la API key en la configuración del proyecto

5. Ejecuta la aplicación:
```bash
flutter run
```

## Estructura del Proyecto

```
gruas/
├── lib/
│   ├── core/
│   │   ├── routes/
│   │   └── theme/
│   ├── features/
│   │   ├── admin/
│   │   ├── auth/
│   │   ├── user/
│   │   └── worker/
│   ├── models/
│   ├── services/
│   └── utils/
├── assets/
│   ├── images/
│   ├── icons/
│   └── fonts/
├── test/
└── web/
```

## Tecnologías Utilizadas

- Flutter (SDK >=3.3.0)
- Firebase
  - Authentication
  - Firestore
  - Cloud Storage
- Provider y Flutter Bloc (Gestión de estado)
- Go Router (Navegación)
- Material Design 3
- Google Maps Flutter
- Flutter Local Notifications
- Geolocator
- Google Fonts

## Roles de Usuario

### Administrador
- Acceso completo al sistema
- Gestión de usuarios y trabajadores
- Gestión de grúas y servicios
- Generación de reportes
- Configuración del sistema
- Monitoreo de servicios en tiempo real

### Usuario
- Solicitud de servicios
- Seguimiento de servicios activos en tiempo real
- Historial de servicios
- Calificación de servicios
- Gestión de perfil y preferencias
- Notificaciones push

### Trabajador
- Gestión de disponibilidad
- Visualización de servicios asignados
- Actualización de estado de servicios
- Registro de horas trabajadas
- Navegación integrada con Google Maps
- Notificaciones de nuevos servicios

## Contribución

1. Fork el repositorio
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.

## Contacto

Joaquin Tapia - j.tapia.fuentes18@gmail.com

Link del Proyecto: [https://github.com/tu-usuario/gruas](https://github.com/tu-usuario/gruas)
