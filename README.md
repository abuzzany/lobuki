# Lobuki

Bienvenido a Lobuki 💅, el Web Scraper para ~~truquear~~ automatizar tus tareas
de [Coyote](https://coyote.resuelve.io/inicio) (Sistema de administración de personal de Resuelve).

## TO-DO
Esta gema aún continua en desarrollo, si quieres contribuir con funcionalidades 
"interesantes" que faltan por desarrollar.

- A partar comida
- Contestas el motivometro

## Desarrollo
No se te olvide que tienes que tener instalado [ruby >= 2.5.1](https://www.ruby-lang.org/es/) 
y [bundler](https://bundler.io/) para poder instalar las dependencias.

Construir gema:

```
gem build lobuki.gemspec
```

```
gem insall ./lobuki-[version].gem
```
 

## ¿Como se usa esto?

Antes de todo tienes que crear las variables de entorno `GOOGLE_USER` y `GOOGLE_PASSWORD`
las cuales son necesrias para poder hacer Login en Coyote.

Para marcar tu hora de entrada y ser un colaborador ~~responsable~~ solo ejecuta la
siguiente función detro de una sesión de `irb` y hacer el import de la gema:

```ruby
    require 'lobuki'
```

```ruby
    Lobuki::Attends.check
```
