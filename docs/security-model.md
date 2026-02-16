# Modelo de Seguridad

Este documento define el modelo de seguridad estructural del repositorio `baseline-scripts`.

La seguridad en este *baseline* no se limita a la gestión de vulnerabilidades, se integra en la gobernanza, la automatización y la aplicación estructural.


## 1. Filosofía de Seguridad

La línea base está diseñada bajo los siguientes principios:

- Versiones deterministas
- Intervención manual mínima
- Aplicación explícita de la gobernanza
- Superficie de privilegios reducida
- Automatización sobre discreción
- Artefactos de lanzamiento inmutables

La seguridad se considera inseparable de la gobernanza del repositorio.


## 2. Recursos a Proteger

Los principales recursos de este repositorio son:

1. Integridad de la versión (etiquetas de versión y registro de cambios)
2. Integridad de la rama (`main`)
3. Flujos de trabajo de automatización
4. Documentación de gobernanza
5. Reglas estructurales de la línea base
6. Compatibilidad con repositorios derivados
7. Modelo de confianza del colaborador

La vulneración de cualquiera de estos recursos se considera un evento de seguridad.


## 3. Modelo de Amenazas

Esta línea base asume riesgos potenciales, incluyendo:

- Envíos directos no autorizados a `main`
- Omisión de la automatización de lanzamientos
- Creación o modificación manual de etiquetas
- Configuración incorrecta de CI que permite la escalada de privilegios
- Inyección de dependencias maliciosas
- Debilitamiento de la gobernanza estructural
- Introducción de secretos
- Derivación de versiones inconsistente

La postura de seguridad busca mitigar estos riesgos estructuralmente.


## 4. Límites de Confianza

El repositorio aplica los siguientes límites de confianza:

- Solo las *Pull Request* pueden modificar `main`.
- Las etiquetas se generan exclusivamente mediante automatización.
- Los *pipelines* de CI operan con privilegios mínimos.
- Los colaboradores no controlan directamente el control de versiones de los lanzamientos.
- Los cambios en la gobernanza requieren una revisión explícita.

Cualquier intento de cruzar estos límites debe considerarse un problema de seguridad.


## 5. Controles Estructurales

La línea base depende de los siguientes controles:

### 5.1 Protección de Ramas

- Rama `main` protegida
- *Pull Request* obligatorias
- Comprobaciones de estado requeridas
- Sin inserción forzada
- Sin eliminación

### 5.2 Protección de Versiones

- Etiquetado automatizado de versiones
- Sin creación manual de etiquetas
- Etiquetas de versión protegidas (`v*`)
- Generación determinista de registros de cambios

### 5.3 Cumplimiento de CI

- Validación del formato de *commit*
- Cumplimiento de *linting*
- Validación de actualización de dependencias
- Comprobaciones de cumplimiento estructural

### 5.4 Prevención de Secretos

- Sin credenciales incrustadas
- Sin *tokens* de texto plano
- Escaneo de secretos habilitado (si la plataforma lo permite)


## 6. Consideraciones sobre la Cadena de Suministro

Los riesgos de seguridad pueden provenir de:

- Dependencias externas
- Flujos de trabajo de *GitHub Actions*
- Automatización de herramientas de terceros 

Las estrategias de mitigación incluyen:

- Versiones de *Actions* fijadas
- Permisos mínimos para flujos de trabajo
- Actualizaciones automatizadas de dependencias
- Proceso controlado de revisión de actualizaciones

Las actualizaciones de dependencias no deben debilitar las garantías de gobernanza.


## 7. Integridad de la versión

La integridad de la versión depende de:

- Cumplimiento de los *Conventional Commits*
- Aplicación de la fusión por *squash*
- Derivación automatizada de versiones
- Etiquetas inmutables

Cualquier intervención manual en el control de versiones constituye una vulneración de la integridad del proceso.


## 8. Gobernanza como seguridad

Los documentos de gobernanza son artefactos de seguridad.

Modificación de:

- Reglas de control de versiones
- Requisitos estructurales
- Aplicación de CI
- Expectativas de protección de ramas

Sin declarar cambios importantes, se debilita la seguridad estructural.

Por lo tanto, las modificaciones de gobernanza se consideran cambios de alto impacto.


## 9. Principio de Mínimo Privilegio

Los flujos de trabajo y los encargados de mantenimiento deben operar con el mínimo privilegio:

- Permisos mínimos del repositorio
- Sin acceso de escritura innecesario
- *Tokens* de automatización controlados

Las acciones administrativas deben limitarse a los encargados de mantenimiento designados.


## 10. Clasificación de Incidentes

Los eventos de seguridad pueden incluir:

- Manipulación de versiones
- Evasión de la gobernanza
- Modificación estructural no autorizada
- Compromiso de dependencias
- Exposición de secretos

Cada evento debe evaluarse en función de su impacto en la integridad estructural y el determinismo de la versión.


## 11. Responsabilidad Derivada del Repositorio

Los repositorios derivados de esta línea base deben:

- Definir su propia postura de seguridad operativa.
- Preservar la integridad de la gobernanza estructural.
- Evitar el debilitamiento de la aplicación automatizada.

Cualquier desviación del modelo de seguridad de la línea base debe documentarse explícitamente.


## 12. Evolución del Modelo

Este modelo de seguridad evoluciona con la línea base.

Cambios en:

- Supuestos de amenazas
- Mecanismos de control
- Herramientas de cumplimiento

Debe seguir las reglas de control de versiones semánticas y gobernanza.

Los cambios importantes en el modelo de seguridad requieren un incremento de versión *MAJOR*.

---

En esta línea base, la seguridad es estructural, procedimental y automatizada.

No es opcional.
