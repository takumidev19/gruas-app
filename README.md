# Sistema Multiplataforma de Gestión de Grúas

Este proyecto es un sistema completo para la gestión de servicios de grúas, desarrollado con Flutter y Firebase.

## Características

- Autenticación de usuarios con diferentes roles (Administrador, Usuario, Trabajador)
- Panel de administración para gestión total del sistema
- Aplicación móvil para usuarios finales
- Aplicación móvil para trabajadores
- Interfaz web para diferentes propósitos

## Requisitos

- Flutter SDK (última versión estable)
- Dart SDK (última versión estable)
- Firebase CLI
- Android Studio / Visual Studio Code
- Git

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
   - Descarga y configura los archivos de configuración de Firebase
   - Actualiza las credenciales en `lib/firebase_options.dart`

4. Ejecuta la aplicación:
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
└── test/
```

## Roles de Usuario

### Administrador
- Acceso completo al sistema
- Gestión de usuarios y trabajadores
- Gestión de grúas y servicios
- Generación de reportes

### Usuario
- Solicitud de servicios
- Seguimiento de servicios activos
- Historial de servicios
- Calificación de servicios

### Trabajador
- Gestión de disponibilidad
- Visualización de servicios asignados
- Actualización de estado de servicios
- Registro de horas trabajadas

## Tecnologías Utilizadas

- Flutter
- Firebase (Authentication, Firestore)
- Provider (Gestión de estado)
- Go Router (Navegación)
- Material Design 3

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
