# ALTIA · Sistema de gestión

Sistema de gestión para ALTIA, empresa de desarrollo de páginas web. Funciona como un tablero estilo Monday con estas secciones:

- **Proyectos**: tablero agrupado por estado, con responsable, prioridad, entrega, presupuesto, lo cobrado y el avance.
- **Tareas**: planner semanal y mensual; las tarjetas se arrastran entre días.
- **Calendario**: eventos y entregas, con exportación CSV para importar en Google Calendar.
- **Clientes**: agenda de contactos, con exportación CSV para Google Contactos (Gmail).
- **Contabilidad**: ingresos, egresos, balance, cuentas por cobrar y exportación a CSV.
- **Mapa**: clientes ubicados en el mapa de México y de los municipios de Michoacán.

## Tecnología

- Una sola página (`index.html`) publicada con GitHub Pages.
- Datos en **Supabase**: la tabla `public.registros` (ver `schema.sql`), con seguridad a nivel de fila (RLS). Solo los usuarios autenticados pueden leer y escribir.
- Inicio de sesión con Supabase Auth. Usuarios: Fabiola y Ulises. El registro público está desactivado.
- Los cambios se sincronizan en vivo entre los dos usuarios (Supabase Realtime).

La llave que aparece en `index.html` es la llave pública (*anon/publishable*) de Supabase y está hecha para usarse en el navegador; los datos los protegen las políticas RLS y el inicio de sesión.
