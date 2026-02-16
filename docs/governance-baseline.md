# Governance Baseline

Este documento define el contrato estructural y normativo del repositorio `baseline-scripts`.

Su propósito es garantizar:
- Consistencia organizacional
- Reproducibilidad técnica
- Gobernanza verificable
- Estándares mínimos obligatorios
- Compatibilidad con repositorios derivados

**Este documento es normativo. No es informativo.**


## 1. Alcances

El *baseline* establece:
- Estructura mínima del repositorio
- Estándares obligatorios de ingeniería
- Políticas de versionado
- Reglas de colaboración
- Requisitos de automatización
- Controles de integridad estructural

Todos los repositorios derivados deben cumplir estas reglas salvo desviación documentada explícitamente.


## 2. Estructura Mínima Obligatoria

El repositorio debe contener como mínimo:
- `.editorconfig`
- Configuración operativa de `commitlint`
- Configuración operativa de `release-please`
- Política de versionado (`docs/versioning.md`)
- Guía de estilo (`docs/bash-style-guide.md`)
- Plantillas oficiales (`docs/templates/`)
- Configuración de automatización de dependencias
- Documentación de gobernanza

### 2.1 Estructura de Directorios Estándar

Además de los artefactos mínimos obligatorios, el repositorio adopta la siguiente estructura base:

```bash
.
├── audit/
├── hardening/
├── maintenance/
├── scripts/
├── test/
│   ├── unit/
│   │   ├── example-test.sh        (ejecutable)
│   │   └── another-test.sh        (ejecutable)
│   └── lib/
│       └── test-helpers.sh        (no ejecutable)
├── lib/
├── docs/
│ ├── templates/
│ └── *.md
└── .github/workflows/
```

---

#### Reglas:

- `scripts/`  
    Contiene únicamente *scripts* ejecutables distribuidos como artefacto principal del repositorio.

- `lib/`  
    Contiene módulos reutilizables que pueden ser importados (`source`) por *scripts* productivos o pruebas.  
    No debe contener artefactos ejecutables distribuidos directamente al usuario final.

- `test/`  
    Contiene pruebas automatizadas.  
    Puede incluir subdirectorios internos para utilidades (`helpers/`, `fixtures/`, etc.) siempre que no contengan artefactos productivos.

- `docs/`  
    Contiene documentación normativa y técnica.

- `.github/workflows/`  
    Contiene exclusivamente automatizaciones CI/CD.

#### Reglas de ejecutabilidad:

- Los archivos en `scripts/` deben ser ejecutables.
- Los archivos en `test/unit/` deben ser ejecutables.
- Ningún archivo dentro de `lib/` o `test/lib/` debe tener permiso de ejecución.

La introducción de nuevas carpetas de primer nivel debe justificarse técnicamente.

Los contenidos de `test/` no forman parte del artefacto distribuible del baseline.


La modificación de la topología de primer nivel definida en esta sección constituye una ruptura del contrato estructural y requiere declaración explícita de `BREAKING CHANGE` conforme a SemVer.

### 2.2 Automatización Local (No Contractual)

El repositorio puede incluir un directorio `.githooks/` destinado a validaciones locales alineadas con las políticas de CI/CD.

Su propósito es:
- Reducir retroalimentación tardía
- Detectar incumplimientos antes de abrir un *Pull Request*
- Alinear comportamiento local con validaciones automatizadas

El uso de *hooks* locales es recomendado, pero no obligatorio.

La ausencia, modificación o eliminación del directorio `.githooks/` no constituye ruptura del contrato estructural del *baseline*.

Las validaciones críticas deben ejecutarse obligatoriamente en CI.  
Los *hooks* locales no sustituyen controles centralizados.

### 2.3 Configuración de Entorno (Recomendada)

El repositorio puede incluir configuraciones específicas de herramientas de desarrollo, tales como:

- `.vscode/settings.json`
- `.vscode/extensions.json`

Estas configuraciones tienen como objetivo:
- Mejorar la experiencia de desarrollo
- Homogeneizar estándares locales
- Reducir fricción operativa

Dichos archivos son opcionales y no forman parte de la estructura mínima obligatoria.

Su modificación o eliminación no constituye un cambio incompatible ni requiere incremento MAJOR.


## 3. Modelo de Desarrollo

Se adopta un modelo:
- *Trunk-based*
- Historial lineal
- Sin ramas permanentes adicionales
- *Pull Requests* obligatorios
- *Squash merge* obligatorio

Está prohibido:
- Push directo a `main`
- Reescritura del historial público
- Creación manual de *tags* de versión


## 4. Automatización Obligatoria

El *baseline* debe garantizar:
- Validación de *commits*
- Versionado automático
- Generación automática de *changelog*
- Integridad de etiquetas

Cuando CI esté habilitado, debe:
- Validar estructura mínima
- Ejecutar análisis estático
- Publicar resultados de seguridad (cuando aplique)


## 5. Control de Calidad

Todos los *scripts* derivados deben:
- Cumplir la [Bash Style Guide](bash-style-guide.md)
- Pasar análisis con *ShellCheck*
- Implementar manejo de errores explícito
- Ser idempotentes cuando aplique

Los desvíos deben justificarse técnicamente.


## 6. Contrato de Compatibilidad

Se considera ruptura del contrato estructural cuando:
- Se eliminan documentos normativos obligatorios
- Se altera el modelo de versionado
- Se debilitan restricciones de gobernanza
- Se introduce ambigüedad en reglas automáticas
- Se altera la topología base de directorios de primer nivel definida en la sección 2.1 sin declaración de `BREAKING CHANGE`


## 7. Protección de Integridad

El repositorio debe configurar:
- Protección de rama `main`
- Requerimiento de *Pull Request*
- Prohibición de *force-push*
- Restricción de eliminación de *tags*

Cuando la plataforma lo permita, se recomienda:
- Firmado de *commits*
- Firmado de *tags*
- Revisión obligatoria por al menos un mantenedor


## 8. Repositorios Derivados

Los repositorios creados a partir de este baseline:
- Heredan este contrato
- Deben mantener compatibilidad estructural
- Pueden extender, pero no debilitar, las reglas obligatorias

Si un repositorio derivado modifica esta gobernanza, debe documentarlo explícitamente.


## 9. Evolución del *Baseline*

Las modificaciones al *baseline* deben:
- Realizarse mediante *Pull Request*
- Cumplir *Conventional Commits*
- Declarar BREAKING CHANGE cuando aplique
- Mantener coherencia con *SemVer*

El *baseline* se versiona como cualquier otro proyecto, pero su impacto es organizacional.


## 10. Principios Rectores

Este *baseline* se rige por los siguientes principios:
- Determinismo
- Automatización por defecto
- Eliminación de intervención manual en *releases*
- Transparencia del historial
- Reproducibilidad técnica
- Mínima ambigüedad operativa


## 11. Cumplimiento

El incumplimiento de este contrato puede resultar en:
- Rechazo de *Pull Request*
- Bloqueo de *release*
- Revisión estructural obligatoria

Este documento forma parte integral de la gobernanza técnica del repositorio.
