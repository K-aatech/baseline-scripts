# 🏁 Guía de Configuración del Entorno (Setup)

Este documento detalla los pasos obligatorios para configurar su entorno local y cumplir con los estándares de gobernanza de **K'aatech**.

## 1. Instalación de Dependencias Base

Antes de inicializar el repositorio, debe contar con las siguientes herramientas:

### 🐍 Lenguaje de Orquestación (*Python*)

Requerido para ejecutar el *framework* de validación.

- **Verificación**: `python --version` o `python3 --version`
- **Instalación**: [python.org](https://www.python.org/) o vía gestor de paquetes.

### 🪟 Windows (Vía [Scoop](https://scoop.sh/))

```powershell
pip install pre-commit
scoop install shellcheck trufflehog
```

### 🐧 Linux (WSL/Ubuntu) o 🍎 macOS

```bash
# Framework (Use pip3 si pip no está disponible)
pip install pre-commit

# Linters y Seguridad
# macOS
brew install shellcheck trufflehog

# Linux (Ubuntu/Debian)
sudo apt install shellcheck
```

> [!TIP]
> TruffleHog en Linux: vía [script oficial](https://github.com/trufflesecurity/trufflehog) o descarga de binario

### 🔑 Credenciales de Automatización (*GitHub*)

Para que el flujo de *Release Please* pueda crear *Pull Requests* de versión y etiquetas automáticamente, se requiere un **Personal Access Token (PAT)**.

- **Nombre del Secret**: `RELEASE_PLEASE_PAT`
- **Permisos mínimos**: `contents: write`, `pull-requests: write`.
- **Configuración**: Debe cargarse en *Settings > Secrets and variables > Actions* del repositorio.

## 2. Inicialización del Repositorio

Una vez instaladas las herramientas en su sistema, ejecute estos comandos:

1. Clonar e ingresar (si aún no lo ha hecho):

    ```bash
    git clone https://github.com/K-aatech/baseline-scripts.git
    cd baseline-scripts
    ```

2. Vincular los *hooks* de `pre-commit`:
Esto registra los *scripts* de validación en su carpeta local `.git/hooks/`, vinculandolos al ciclo de vida de Git para que se ejecuten **automáticamente** en cada *commit*.

    ```bash
    pre-commit install --install-hooks
    pre-commit install --hook-type commit-msg
    ```

3. Validación inicial:
Descarga los entornos aislados de los *linters* y verifica el estado actual.

    ```bash
    pre-commit run --all-files
    ```

## 3. Configuración de Extensiones Recomendadas (*VS Code*)

Al abrir el proyecto en *VS Code*, se te sugerirá la instalación de las extensiones recomendadas en `.vscode/extensions.json`. Esto habilitará el formateo automático y las alertas de *ShellCheck* en tiempo real mientras escribe.

## 4. Checklist de Verificación Final

- [ ] **Python 3.x** instalado y accesible.
- [ ] **Git** configurado (`user.name` y `user.email`).
- [ ] ***TruffleHog*** accesible en el PATH (`trufflehog --version`).
- [ ] ***ShellCheck*** accesible en el PATH (`shellcheck --version`).
- [ ] **PAT `RELEASE_PLEASE_PAT`** configurado en los *Secrets* de *GitHub*.
- [ ] ***Hooks* de *pre-commit*** vinculados correctamente.
- [ ] Extensiones recomendadas instaladas en *VS Code*.
- [ ] Ejecutado `pre-commit run --all-files` sin errores.
- [ ] ***Commit* de prueba**: Realice un *commit* pequeño para validar que no haya errores de entorno.

> [!CAUTION]
> **Bloqueo de Commits**: Si no instala `trufflehog` y `shellcheck` localmente, el proceso fallará. Los *hooks* usan motores locales por velocidad y privacidad.

¿Tienes problemas con los *hooks* o secretos? Revisa las FAQs de Seguridad [aquí](./FAQS_SECURITY.md).
