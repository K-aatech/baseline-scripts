# 🛡️ Seguridad: Preguntas Frecuentes (FAQ)

## 1. TruffleHog bloqueó mi *commit*, pero no es un secreto real

Es un **Falso Positivo**. Siga estos pasos:

1. Copie la ruta del archivo reportado.
2. Añádala a la sección `exclude_paths` en el archivo `.trufflehog.yaml` en la raíz del proyecto.
3. Intente el *commit* nuevamente.

## 2. El proceso de *commit* se queda congelado

Esto ocurre habitualmente porque su **Agente GPG** está bloqueado o cerrado.

- **Solución:** Intente firmar algo manualmente (`echo "test" | gpg --clearsign`) para activar el *prompt* de contraseña, o reinicie su agente GPG.

## 3. ¿Cómo reporto un secreto filtrado de verdad?

Si un secreto real llegó al historial de *Git*:

1. **Rote la credencial** inmediatamente (anúlela).
2. Notifique al equipo de Seguridad.
3. El historial deberá ser limpiado usando herramientas como `bfg-repo-cleaner` o `git filter-repo`.
