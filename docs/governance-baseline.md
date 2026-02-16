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
- Configuración de `commitlint`
- Configuración de `release-please`
- Política de versionado (`docs/versioning.md`)
- Guía de estilo (`docs/bash-style-guide.md`)
- Plantillas oficiales (`docs/templates/`)
- Configuración de dependencias automatizadas
- Documentación de gobernanza

La eliminación o modificación estructural de estos elementos constituye un cambio incompatible (MAJOR).


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
- Se modifica la estructura mínima sin declarar `BREAKING CHANGE`


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
