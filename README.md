# *Baseline Scripts* 🛡️

![Linting](https://github.com/K-aatech/baseline-scripts/actions/workflows/linting.yml/badge.svg?branch=main)
![Security](https://github.com/K-aatech/baseline-scripts/actions/workflows/secret-scanning.yml/badge.svg?branch=main)
![License](https://img.shields.io/github/license/K-aatech/baseline-scripts)

Este es un **Repositorio Template** diseñado para ser la base de cualquier proyecto de automatización. Su objetivo es eliminar la fatiga de configuración inicial, garantizando que cada *script* nazca en un entorno con estándares de calidad y seguridad empresarial.

## 💎 Filosofía: *Security by Design & Default*

Este repositorio no solo "soporta" seguridad; la impone.

- **Zero Leak Tolerance**: Escaneo de secretos obligatorio en cada *commit* local y validación profunda en CI.
- **Inmutabilidad**: Todas las *GitHub Actions* están pineadas mediante **Commit SHA** para prevenir ataques de cadena de suministro.
- **Calidad Automatizada**: Uso estricto de **Conventional Commits** y validación de sintaxis en tiempo real.

## 🛠️ Capacidades de Normalización

El repositorio incluye configuraciones predefinidas para garantizar la consistencia en cualquier editor:

- **`.editorconfig`**: Normalización de fines de línea, indentación y codificación.
- **`.vscode/settings.json`**: Configuración optimizada para Visual Studio Code (Auto-format al guardar).
- **Convenciones**: Validación de **Conventional Commits** para un historial de cambios legible y profesional.

## 🔍 Herramientas Incluidas

| Herramienta | Función | Implementación |
| :--- | :--- | :--- |
| **TruffleHog** | Detección de secretos y llaves | Local (*Hook*) + CI (*Workflow*) |
| **ShellCheck** | *Linter* para *scripts* de *Shell* | Local (*Hook*) |
| **Pre-commit** | Orquestador de validaciones | *Hooks* de *Git* |
| **Dependabot** | Actualización de dependencias | Automatizado semanal |
| **MarkdownLint** | Estándar de documentación | Local + CI |

## 📦 Requisitos del Entorno Local

Para que el ecosistema funcione correctamente en tu máquina, necesitas instalar:

1. **Python 3.x**: Para gestionar `pre-commit`.
2. **Pre-commit**:

    ```bash
      pip install pre-commit
    ```

3. **TruffleHog v3**: [Instrucciones oficiales](https://github.com/trufflesecurity/trufflehog). Debe estar en tu `$PATH`.
4. **ShellCheck**: Requerido para validar la lógica de los *scripts* `.sh`.

## ⚙️ Instalación y Uso

1. **Usar este *Template*:** Haz clic en el botón "*Use this template*" en *GitHub* para crear tu nuevo repositorio.

2. **Clonar e Inicializar**:

    ```bash
    git clone <tu-repo>
    cd <tu-repo>
    pre-commit install
    ```

3. **Extensiones Recomendadas (*VS Code*):**
Al abrir el proyecto en *VS Code*, se te sugerirá la instalación de herramientas clave como:

- `esbenp.prettier-vscode`
- `EditorConfig.EditorConfig`
- `foxundermoon.shellcheck`
- `davidanson.vscode-markdownlint`
- `redhat.vscode-yaml`
- `vivaxy.vscode-conventional-commits`

## 🫱🏻‍🫲🏾 Contribución y Gobernanza

- **CODEOWNERS**: Revisión obligatoria para cambios en infraestructura de CI.

- ***Templates***: Uso obligatorio de formularios estructurados para *bugs* y nuevas peticiones.

- ***Dependabot***: Actualización automática de dependencias y acciones de *GitHub*.

Las *Pull Requests* requieren pasar todos los *checks* de CI y cumplir con el *template* de descripción proporcionado.
