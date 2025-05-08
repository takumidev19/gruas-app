# Sistema Multiplataforma de Gestión de Grúas

Sistema completo para la gestión de servicios de grúas, desarrollado con Flutter y Firebase.

## Estructura del Proyecto

```
gruas/
├── apps/                      # Aplicaciones Flutter
│   ├── user/                  # App móvil para usuarios
│   ├── worker/                # App móvil para conductores
│   └── admin/                 # App de escritorio para administradores
│
├── web/                       # Landing pages
│   ├── user/                  # Landing page para usuarios
│   ├── worker/                # Landing page para conductores
│   └── admin/                 # Landing page para administradores
│
├── shared/                    # Código compartido
├── docs/                      # Documentación
└── .github/                   # Configuración de GitHub
```

## Aplicaciones

### App de Usuario (`apps/user/`)
Aplicación móvil para clientes que necesitan servicios de grúa.
- Solicitud de servicios
- Seguimiento en tiempo real
- Historial y calificaciones
- Sistema de pagos

### App de Trabajador (`apps/worker/`)
Aplicación móvil para conductores de grúas.
- Gestión de disponibilidad
- Navegación y mapas
- Gestión de servicios
- Reportes y horas trabajadas

### Panel de Administración (`apps/admin/`)
Aplicación de escritorio para gestión central.
- Gestión de usuarios y trabajadores
- Monitoreo de flota
- Reportes y estadísticas
- Configuración del sistema

## Landing Pages

### Usuario (`web/user/`)
Sitio web para promocionar la app de usuario.
- Información de servicios
- Beneficios
- Descarga de la app

### Trabajador (`web/worker/`)
Sitio web para reclutamiento de conductores.
- Beneficios para conductores
- Requisitos
- Proceso de registro

### Administración (`web/admin/`)
Sitio web para el panel de administración.
- Características del panel
- Beneficios
- Solicitud de demo

## Requisitos

- Flutter SDK (versión >=3.3.0)
- Dart SDK (versión >=3.3.0)
- Firebase CLI
- Android Studio / Visual Studio Code
- Git
- Cuenta de Google Cloud Platform

## Configuración

1. Clona el repositorio:
```bash
git clone https://github.com/tu-usuario/gruas.git
cd gruas
```

2. Instala las dependencias de cada aplicación:
```bash
cd apps/user && flutter pub get
cd ../worker && flutter pub get
cd ../admin && flutter pub get
```

3. Configura Firebase:
   - Crea un proyecto en Firebase Console
   - Habilita Authentication y Firestore
   - Configura las reglas de seguridad
   - Descarga y configura los archivos de Firebase
   - Actualiza las credenciales en cada app

4. Configura Google Maps:
   - Obtén una API key de Google Maps
   - Configura las restricciones
   - Actualiza la API key en la configuración

## Desarrollo

### Estructura de Ramas
- `main`: Código en producción
- `develop`: Rama de desarrollo principal
- `feature/*`: Nuevas características
- `bugfix/*`: Correcciones de errores
- `release/*`: Preparación de releases

### Convenciones de Código
- Seguir las guías de estilo de Dart/Flutter
- Documentar el código con comentarios
- Escribir pruebas unitarias
- Mantener el código limpio y mantenible

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