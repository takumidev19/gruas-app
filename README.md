# Sistema Multiplataforma de Gestión de Grúas

Sistema completo para la gestión de servicios de grúas, desarrollado con Flutter y Firebase, organizado como un **monorepo** usando [Melos](https://melos.invertase.dev/).

---

## Estructura del Monorepo

```
Gruas/
├── gruas_admin_desktop/      # App de escritorio para administradores
├── gruas_worker/             # App móvil para conductores
├── gruas_user/               # App móvil para usuarios
├── gruas_landing_user/       # Landing page para usuarios
├── gruas_landing_worker/     # Landing page para conductores
├── gruas_landing_admin/      # Landing page para administración
├── packages/                 # Paquetes compartidos (core, ui, etc.)
│   ├── core/                 # Lógica de negocio y servicios compartidos
│   └── ui/                   # Componentes visuales reutilizables
├── melos.yaml                # Configuración de Melos
├── pubspec.yaml              # Solo para Melos (no es una app)
└── README.md                 # Documentación principal
```

---

## Uso de Melos

Este monorepo utiliza [Melos](https://melos.invertase.dev/) para gestionar múltiples paquetes y apps Flutter.

### Comandos útiles:

- Instalar dependencias y vincular paquetes:
  ```bash
  melos bootstrap
  ```
- Analizar el código de todos los paquetes:
  ```bash
  melos analyze
  ```
- Ejecutar pruebas en todos los paquetes:
  ```bash
  melos test
  ```
- Formatear el código:
  ```bash
  melos format
  ```
- Limpiar builds:
  ```bash
  melos clean
  ```

> **Nota:** Ejecuta estos comandos desde la raíz del monorepo.

---

## Configuración Inicial para Desarrolladores

1. **Clona el repositorio:**
   ```bash
   git clone https://github.com/tu-usuario/gruas.git
   cd gruas
   ```
2. **Instala Melos globalmente:**
   ```bash
   dart pub global activate melos
   ```
3. **Instala dependencias y vincula paquetes:**
   ```bash
   melos bootstrap
   ```
4. **Configura Firebase en cada app:**
   - Ejecuta `flutterfire configure` en cada app (ejemplo: `gruas_admin_desktop`)
   - Copia el archivo `firebase_options.dart` generado a la carpeta `lib/` de cada app
   - Asegúrate de inicializar Firebase en el `main.dart` de cada app
5. **Configura Google Maps (si aplica):**
   - Obtén una API key y configúrala en cada app móvil

---

## Buenas Prácticas y Convenciones

- **Estructura de ramas:**
  - `main`: Producción
  - `develop`: Desarrollo principal
  - `feature/*`, `bugfix/*`, `release/*`: Flujos de trabajo recomendados
- **Código:**
  - Sigue las guías de estilo de Dart/Flutter
  - Documenta funciones, clases y servicios importantes
  - Escribe pruebas unitarias y de integración
  - Usa widgets y servicios compartidos desde `packages/`
- **Commits:**
  - Usa mensajes claros y descriptivos
  - Ejemplo: `feat(worker): agregar pantalla de historial de servicios`

---

## Cómo agregar un nuevo paquete/app

1. Crea el nuevo paquete/app dentro de la carpeta correspondiente (`packages/` o raíz para apps).
2. Agrega la ruta en `melos.yaml` si es necesario.
3. Ejecuta `melos bootstrap` para vincular dependencias.
4. Sigue las buenas prácticas de estructura y documentación.

---

## Contribución

1. Haz un fork del repositorio
2. Crea una rama para tu feature (`git checkout -b feature/mi-feature`)
3. Realiza tus cambios y commitea (`git commit -m 'feat: mi feature'`)
4. Haz push a tu rama (`git push origin feature/mi-feature`)
5. Abre un Pull Request

---

## Contacto y Soporte

- **Responsable:** Joaquin Tapia - j.tapia.fuentes18@gmail.com
- **Repositorio:** [https://github.com/tu-usuario/gruas](https://github.com/tu-usuario/gruas)

---

## Licencia

Este proyecto está bajo la Licencia MIT - ver el archivo [LICENSE](LICENSE) para más detalles.
