# Política de Seguridad

Este repositorio define la base estructural y de gobernanza para proyectos de automatización basados ​​en *Bash*.

La seguridad se considera una preocupación fundamental.


## 1. Alcance

Esta política se aplica a:

- El repositorio de base.
- Automatización, flujos de trabajo y mecanismos de lanzamiento.
- Plantillas y documentación de gobernanza.
- Configuraciones de herramientas incluidas en la base.

Los repositorios derivados deben definir sus propias políticas de seguridad, incluso si están alineados con este documento.

---

## 2. Reportar una vulnerabilidad

Si descubre una vulnerabilidad de seguridad, no abra un informe público.

En su lugar:

1. Reporte el problema de forma privada a los responsables del repositorio.
2. Proporcione una descripción clara y reproducible.
3. Incluya una evaluación de impacto si se conoce.
4. Sugiera una solución si es posible.

Los detalles confidenciales no deben divulgarse públicamente hasta que se disponga de una mitigación.


## 3. Tipos de Problemas de Seguridad

Los problemas de seguridad pueden incluir:

- Configuraciones incorrectas del flujo de trabajo que permiten la escalada de privilegios.
- Omisión de la automatización de versiones.
- Exposición de secretos o credenciales.
- Vulnerabilidades de dependencia.
- Configuración incorrecta de permisos.
- Debilidades estructurales en la aplicación de la gobernanza.

Las inconsistencias en la documentación que podrían debilitar la gobernanza también pueden considerarse problemas de seguridad.


## 4. Proceso de Gestión

Al recibir un informe:

1. Los responsables del mantenimiento acusarán recibo.
2. Se evaluará el riesgo.
3. Se identificarán los componentes afectados.
4. Se definirá un plan de remediación.
5. Se preparará una solución en una rama controlada.
6. La divulgación se realizará después de la mitigación.

El plazo depende de la gravedad y la complejidad.


## 5. Clasificación de Gravedad

Los problemas se pueden clasificar como:

- Bajo: Documentación o debilidades menores en la aplicación.
- Medio: Configuración incorrecta de la automatización sin riesgo directo de privilegios.
- Alto: Compromiso del proceso de lanzamiento, omisión de la gobernanza o riesgo de integridad estructural.
- Crítico: Exposición de credenciales, omisión de la ejecución o riesgo de toma de control del repositorio.

La clasificación debe alinearse con el [Modelo de Seguridad](./docs/security-model.md) estructural del repositorio.

La clasificación de gravedad determina la urgencia de la respuesta.


## 6. Divulgación Coordinada

El proyecto sigue los principios de divulgación responsable:

- No se realizará divulgación pública antes de la mitigación.
- No se publicarán los detalles del *exploit* antes del lanzamiento del parche.
- Actualizar el registro de cambios de forma transparente una vez resuelto.
- Actualización de la versión siguiendo las reglas de *SemVer*.

Los cambios importantes relacionados con la seguridad deben seguir las *Conventional Commits*.


## 7. Seguridad de Dependencias

El repositorio puede depender de actualizaciones automatizadas de dependencias.

Las actualizaciones de seguridad deben:

- Priorizarse.
- No debilitar las reglas de gobernanza.
- Validarse mediante CI antes de la fusión.
 
Las actualizaciones de dependencias no deben introducir cambios estructurales importantes sin declaración.


## 8. Secretos y Credenciales

Está estrictamente prohibido:

- Hacer *commit* con secretos.
- Almacenar *tokens* en texto plano.
- Incrustar credenciales en flujos de trabajo.
- Deshabilitar el escaneo de secretos.

Si se hace un *commit* de un secreto accidentalmente se debe:

1. Revocar el secreto inmediatamente.
2. Rotar las credenciales.
3. Abrir una *Pull Request* para su corrección.
4. Documentar el incidente internamente.


## 9. Gestión de *Tokens* Automatizados

El repositorio puede utilizar *tokens* de automatización para procesos de *release* u otras operaciones controladas de CI.

Estos *tokens* deben:

- Ser ***Fine-Grained*** cuando la plataforma lo permita.
- Tener alcance mínimo necesario.
- Tener expiración definida.
- Ser rotados periódicamente.
- No incluir permisos administrativos.
- Estar restringidos a cuentas técnicas o de servicio.

La configuración de dichos *tokens* forma parte del modelo de seguridad estructural del proyecto.

El uso indebido, ampliación de privilegios o reutilización fuera del flujo autorizado constituye un incidente de seguridad.


## 10. Protección de ramas y etiquetas

La postura de seguridad requiere:

- Rama principal protegida.
- No forzar *push*.
- Requerir *Pull Request*.
- Modificación de etiquetas restringida.
- Verificaciones de CI forzadas.

Deshabilitar estas protecciones constituye una infracción de gobernanza.


## 11. Seguridad y Cambios Importantes

Si una corrección de seguridad requiere una modificación estructural:

- Puede activar una versión *MAJOR*.
- Debe documentarse explícitamente.
- No debe alterar las expectativas de gobernanza de forma silenciosa.


## 12. Responsabilidad del Mantenedor

Los mantenedores son responsables de:

- Preservar la integridad de la versión.
- Proteger los procesos de automatización.
- Garantizar el control de versiones determinista.
- Prevenir la erosión de la gobernanza.

La seguridad es inseparable de la gobernanza.


## 13. Descargo de responsabilidad

Este repositorio proporciona estándares estructurales y de gobernanza.

Los repositorios derivados son responsables de definir los controles de seguridad adecuados a su riesgo operativo.
