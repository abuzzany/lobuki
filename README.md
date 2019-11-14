# Lobuki

![alt text](https://lasillarotarm.blob.core.windows.net/images/2018/10/18/javinoble-focus-0.28-0.1-480-345.jpg "Logo Title Text 1")

Bienvenido a Lobuki 💅, el Web Scraper para ~~truquear~~ automatizar tus tareas
de [Coyote](https://coyote.resuelve.io/inicio) (Sistema de administración de personal de Resuelve).

## TO-DO
Esta gema aún continua en desarrollo, si quieres contribuir con funcionalidades 
"interesantes" que faltan por desarrollar.

- Apartar comida
- Contestas el motivometro

## Desarrollo
No se te olvide que tienes que tener instalado [ruby >= 2.5.1](https://www.ruby-lang.org/es/) 
y [bundler](https://bundler.io/) para poder instalar las dependencias.

Construir gema:

```
gem build lobuki.gemspec
```

Instalar gema:

```
gem install ./lobuki-[version].gem
```
 

## ¿Como se usa esto?

Antes de todo tienes que crear las variables de entorno `GOOGLE_USER` y `GOOGLE_PASSWORD`
las cuales son necesrias para poder hacer Login en Coyote.

Para marcar tu hora de entrada y ser un colaborador ~~responsable~~ haz el import de la gema
dentro de una sesión de `irb` y ejecuta la siguiente función:

```ruby
    require 'lobuki'
```

```ruby
    Lobuki::Attends.check
```
