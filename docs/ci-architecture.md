# Arquitectura de Integración Continua (CI)

Este documento define la arquitectura de automatización del repositorio `baseline-scripts`.

La CI no es un complemento; es el mecanismo de ejecución de la gobernanza técnica.


## 1. Principios de Diseño

La arquitectura CI se rige por los siguientes principios:

- Automatización obligatoria
- Validación temprana
- Determinismo
- Reproducibilidad
- Mínimo privilegio
- Separación de responsabilidades

La CI convierte reglas declarativas en controles ejecutables.


## 2. Objetivos de la CI

La arquitectura de integración continua debe garantizar:

1. Cumplimiento de *Conventional Commits*.
2. Versionado automático determinista.
3. Generación automática de *changelog*.
4. Validación estructural del repositorio.
5. Análisis estático de *scripts*.
6. Integridad de dependencias.
7. Prevención de debilitamiento de gobernanza.

Si una validación falla, el *Pull Request* no debe poder fusionarse.


## 3. Componentes Principales

La arquitectura CI se compone de los siguientes bloques:

### 3.1 Validación de *Commits*

Responsable de:

- Validar formato según *Conventional Commits*.
- Bloquear *commits* no conformes.
- Mantener coherencia con el modelo de versionado.

Impacto directo en derivación automática de versión.

### 3.2 Versionado Automatizado

Gestionado por `release-please`.

Responsable de:

- Analizar historial de *commits*.
- Determinar incremento *MAJOR* / *MINOR* / *PATCH*.
- Generar *Pull Request* de versión.
- Crear etiquetas `vX.Y.Z`.
- Actualizar `CHANGELOG.md`.

No se permite intervención manual.

### 3.3 Análisis Estático

Debe incluir:

- Ejecución de *ShellCheck*.
- Validación contra la [Bash Style Guide](bash-style-guide.md)
- Reporte estructurado de hallazgos.

Cuando sea posible, los resultados deben publicarse en formato SARIF para integrarse con herramientas de seguridad de la plataforma.

### 3.4 Validación Estructural

La CI debe garantizar que:

- Archivos obligatorios no hayan sido eliminados.
- No se debiliten reglas estructurales.
- No se modifique la política de versionado sin declaración explícita.
- No se introduzcan secretos.

La eliminación de artefactos normativos constituye una falla crítica.

### 3.5 Dependencias

Se deben validar:

- Actualizaciones automáticas.
- Compatibilidad con gobernanza.
- No introducción de cambios incompatibles sin declaración explícita.


## 4. Flujo de Ejecución

### 4.1 En *Pull Request*

Debe ejecutarse:

- Validación de *commits*.
- *Linting* y análisis estático.
- Validación estructural.
- Validación de configuración.

El PR solo puede fusionarse si todas las validaciones pasan.

### 4.2 En `main`

Debe ejecutarse:

- Evaluación de versionado.
- Generación de PR de *release*.
- Publicación de etiqueta tras aprobación.


## 5. Permisos y Seguridad

Los *workflows* deben:

- Utilizar permisos mínimos necesarios.
- Evitar *tokens* con privilegios excesivos.
- No exponer secretos en *logs*.
- Usar versiones fijas o controladas de acciones externas.

La arquitectura CI forma parte del modelo de seguridad estructural.


## 6. CI como Control de Gobernanza

La CI no solo valida código.

También protege:

- Integridad del modelo *trunk-based*.
- Determinismo de *releases*.
- Coherencia de documentación normativa.
- Cumplimiento del contrato estructural.

Si una regla no está automatizada, no está completamente protegida.

---

## 7. Evolución de la Arquitectura

Cambios en la arquitectura CI que:

- Alteren reglas obligatorias
- Debiliten validaciones
- Modifiquen el modelo de versionado
- Permitan *bypass* de controles

Deben declararse como `BREAKING CHANGE` cuando afecten el contrato estructural.


## 8. Repositorios Derivados

Los repositorios creados a partir de este *baseline* deben:

- Implementar una arquitectura CI equivalente o superior.
- Mantener validación de *commits*.
- Mantener versionado automático.
- No debilitar controles obligatorios.

La CI es parte integral del *baseline*.


## 9. Declaración Final

La arquitectura de integración continua es el mecanismo técnico que ejecuta la gobernanza.

Sin CI obligatoria:

- El versionado deja de ser determinista.
- La estructura deja de ser verificable.
- La seguridad pierde automatización.
- La gobernanza se vuelve opcional.

En este *baseline*, la gobernanza no es opcional.
