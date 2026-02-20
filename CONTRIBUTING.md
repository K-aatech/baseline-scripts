# Directrices de contribución

Gracias por contribuir a este repositorio.

Este proyecto sigue un estricto modelo de gobernanza para garantizar la integridad estructural, la reproducibilidad y las versiones deterministas. Todas las contribuciones deben cumplir con las políticas definidas en:

- [docs/governance-baseline.md](docs/governance-baseline.md)
- [docs/versioning.md](docs/versioning.md)
- [docs/bash-style-guide.md](docs/bash-style-guide.md)

## 1. Modelo de contribución

Este repositorio sigue un flujo de trabajo *Trunk-Based*.

Reglas:

- No se permiten envíos directos a `main`.
- Todos los cambios deben enviarse mediante *Pull Request*.
- *Squash merge* es obligatoria.
- Las ramas deben ser de corta duración.

## 2. Convención de nombres de ramas

Las ramas deben seguir este formato:

- `feat/<description>`
- `fix/<description>`
- `refactor/<description>`
- `docs/<description>`
- `ci/<description>`
- `chore/<description>`

Ejemplos:

- `feat/add-shellcheck-workflow`
- `fix/handle-empty-argument`
- `docs/update-versioning-policy`

Los nombres de las ramas deben escribirse en minúsculas y con guiones.

## 3. Convención de *Commit*

Todos los *commits* deben seguir *Conventional Commits*:

`type(scope optional): short description`

Tipos permitidos:

- `feat`
- `fix`
- `perf`
- `refactor`
- `docs`
- `ci`
- `test`
- `chore`
- `build`

Ejemplos:

`feat(ci): add sarif upload workflow`
`fix: handle missing dependency validation`
`docs: clear gobernance contract`

Los *commits* se validan automáticamente. Los *commits* que no cumplan con los requisitos fallarán en la CI.

## 4. Requisitos de *Pull Request*

Cada *Pull Request* debe:

- Explicar el propósito del cambio.
- Describir el impacto en la gobernanza o la estructura (si corresponde).
- Indicar si el cambio es retrocompatible.
- Declarar explícitamente si introduce un `BREAKING CHANGE`.
- Superar todas las comprobaciones de CI.

Si el cambio afecta a la gobernanza, el control de versiones o la estructura base, debe estar claramente justificado.

## 5. Definición de Finalizado

Una contribución se considera completa cuando:

- Sigue las confirmaciones convencionales.
- Supera todas las validaciones de CI.
- La documentación se actualiza cuando es necesario.
- No debilita las reglas de gobernanza.
- Mantiene la compatibilidad estructural.

## 6. *BREAKING CHANGE*

Si un cambio modifica:

- La estructura requerida del repositorio
- Las políticas de gobernanza
- El comportamiento del control de versiones
- Las herramientas obligatorias

Debe declararse mediante:

`feat!: descripción`

o

`BREAKING CHANGE: explicación`

No declarar los cambios importantes puede bloquear la *Pull Request*.

## 7. Consideraciones de seguridad

Los colaboradores no deben:

- Introducir secretos en el repositorio.
- Deshabilitar las validaciones obligatorias de CI.
- Debilitar los requisitos de protección de las ramas.
- Modificar la automatización de las versiones sin justificación.

Para prevenir la fuga accidental de credenciales, este repositorio implementa un escudo de seguridad obligatorio tanto en local como en la CI.

Los cambios relacionados con la seguridad deben discutirse antes de su implementación.

## 8. Escudo de Seguridad Local (Pre-commit)

Es obligatorio configurar el *framework* de `pre-commit` para validar que no se introduzcan secretos antes de realizar cualquier envío. Usamos **TruffleHog** como motor de escaneo inmutable.

### Requisitos previos por entorno (febrero 2026)

#### 🪟 Windows (Nativo)

1. Instalar *Python* y *pip*: `pip install pre-commit`
2. Instalar *TruffleHog*: `scoop install trufflehog` o descarga del binario oficial.

#### 🐧 Linux (WSL/Ubuntu) o 🍎 macOS

1. Instalar el *framework*: `pipx install pre-commit` (o via *Homebrew*).
2. Instalar *TruffleHog*: `brew install trufflehog` o via *script* oficial de *TruffleSecurity*.

### Instalación en el repositorio

Una vez instaladas las herramientas en su sistema, ejecute en la raíz del proyecto:

```bash
pre-commit install
```

---

> [!IMPORTANT]
> "Es obligatorio tener el binario de TruffleHog instalado y accesible globalmente en el sistema (PATH) antes de ejecutar pre-commit install, ya que el hook utiliza el motor local para garantizar la máxima velocidad de ejecución."

El *commit* será rechazado automáticamente si se detecta un secreto. Para gestionar falsos positivos, consulte el archivo `.trufflehog.yaml`. El uso de `--no-verify` está estrictamente auditado y causará el fallo inmediato de la CI.

### 💡 Gestión de Hallazgos y Falsos Positivos

Si TruffleHog bloquea un *commit*:

1. **Verifique el hallazgo:** El reporte en consola le indicará el archivo y la línea.
2. **Si es un secreto real:** Rótele inmediatamente, elimínelo del historial y use variables de entorno o un *Secret Manager*.
3. **Si es un falso positivo:** Añada la ruta del archivo al bloque `exclude_paths` en `.trufflehog.yaml`.

> [!TIP]
> **¿Git se congela al hacer *commit*?** > Asegúrese de que su agente GPG esté activo y desbloqueado. Si usa una llave con contraseña, el proceso esperará indefinidamente a que usted la introduzca en el *prompt* de su sistema.

## 9. Estándares de Calidad del Código

Todos los *scripts* de *Bash* deben:

- Seguir la [Guía de Estilo de *Bash*](docs/bash-style-guide.md).
- Usar `set -euo pipefail`.
- Validar las dependencias externas.
- Implementar la gestión explícita de errores.
- Ser idempotente cuando corresponda.

El cumplimiento de *ShellCheck* es obligatorio.

## 10. Revisión y Aprobación

Se requiere la aprobación de al menos un mantenedor antes de la fusión.

Los mantenedores pueden rechazar contribuciones que:

- Infrinjan las reglas de gobernanza.
- Introduzcan ambigüedad.
- Reduzcan el determinismo.
- Disminuyan la integridad estructural.

## 11. Autoridad del Mantenedor

Los mantenedores son responsables de:

- Proteger la integridad del repositorio.
- Aplicar la gobernanza.
- Preservar el comportamiento determinista de las versiones.

Las reglas de gobernanza prevalecen sobre las preferencias individuales.

## 12. Ampliación del *Baseline*

Si propone ampliar la línea base:

- Asegúrese de la compatibilidad con versiones anteriores siempre que sea posible.
- Documente el cambio claramente.
- Evalúe el impacto en los repositorios derivados.
- Siga las reglas de control de versiones semántico.

Los cambios en la gobernanza pueden requerir una actualización de versión principal.

---

Al contribuir a este repositorio, acepta seguir estas directrices y respetar el modelo de gobernanza técnica definido por esta línea base.
