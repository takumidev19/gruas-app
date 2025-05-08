# Guía de Contribución

¡Gracias por tu interés en contribuir al proyecto Grúas! Este documento proporciona las pautas y el proceso para contribuir.

## Código de Conducta

Este proyecto y todos los que participan en él se rigen por nuestro Código de Conducta. Al participar, se espera que respetes este código.

## ¿Cómo Contribuir?

### Reportar Bugs

1. Usa el sistema de issues de GitHub
2. Usa la plantilla de bug report
3. Incluye:
   - Descripción clara y concisa
   - Pasos para reproducir
   - Comportamiento esperado
   - Capturas de pantalla si aplica
   - Versión de Flutter/Dart
   - Sistema operativo

### Sugerir Mejoras

1. Usa el sistema de issues de GitHub
2. Usa la plantilla de feature request
3. Incluye:
   - Descripción clara del problema
   - Propuesta de solución
   - Alternativas consideradas
   - Impacto esperado

### Pull Requests

1. Fork el repositorio
2. Crea una rama descriptiva
3. Haz commits atómicos
4. Sigue las convenciones de código
5. Incluye pruebas
6. Actualiza la documentación
7. Abre el PR contra `develop`

## Convenciones de Código

### Dart/Flutter

- Seguir las [guías de estilo de Dart](https://dart.dev/guides/language/effective-dart/style)
- Usar `flutter analyze` y `flutter format`
- Mantener la cobertura de pruebas >80%
- Documentar APIs públicas

### HTML/CSS

- Seguir las guías de estilo de Bootstrap
- Mantener el código semántico
- Optimizar para rendimiento
- Asegurar accesibilidad

## Estructura de Ramas

- `main`: Código en producción
- `develop`: Rama de desarrollo principal
- `feature/*`: Nuevas características
- `bugfix/*`: Correcciones de errores
- `release/*`: Preparación de releases

## Proceso de Desarrollo

1. Crear rama desde `develop`
2. Desarrollar y probar
3. Crear PR contra `develop`
4. Revisión de código
5. Merge a `develop`
6. Pruebas de integración
7. Merge a `main` para release

## Configuración del Entorno

1. Instala las herramientas:
   ```bash
   flutter doctor
   ```

2. Configura el IDE:
   - Instala plugins de Flutter/Dart
   - Configura el formateador
   - Configura el linter

3. Clona y configura:
   ```bash
   git clone https://github.com/tu-usuario/gruas.git
   cd gruas
   flutter pub get
   ```

## Pruebas

- Escribir pruebas unitarias
- Escribir pruebas de widget
- Escribir pruebas de integración
- Mantener la cobertura de pruebas

## Documentación

- Documentar APIs públicas
- Mantener READMEs actualizados
- Documentar cambios importantes
- Incluir ejemplos de uso

## Release

1. Actualizar versiones
2. Actualizar changelog
3. Crear tag
4. Publicar release
5. Actualizar documentación

## Contacto

Para preguntas o dudas:
- Abre un issue
- Contacta a los mantenedores
- Únete a nuestro Discord

## Licencia

Al contribuir, aceptas que tus contribuciones serán licenciadas bajo la misma licencia del proyecto. 