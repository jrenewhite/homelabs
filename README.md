# Homelabs

Infraestructura y evidencia operativa de los homelabs administrados desde este
repositorio. Cada ubicación conserva su línea base declarada, sus instrucciones
locales y la evidencia fechada obtenida durante el descubrimiento.

## Estructura

- `docs/`: procesos compartidos y documentación por etapa.
- `locations/<sitio>/`: inventario declarado, instrucciones locales, evidencia
  y archivos de entorno locales no versionados.
- `scripts/`: toolkit para comprobaciones, descubrimiento Omada e inventario de
  hosts. Consulta también [scripts/README.md](scripts/README.md).

## Sitios y estado documentado

| Sitio | Línea base e instrucciones | Evidencia y estado |
| --- | --- | --- |
| Colibrí 138 | [inventario](locations/colibri-138/inventory.yaml), [Stage 0](locations/colibri-138/stage-0.md), [Stage 1](locations/colibri-138/stage-1.md) | [sondeos del router](locations/colibri-138/probe-results/) e [inventarios de hosts](locations/colibri-138/inventory-results/) |
| Perú 39 | [inventario](locations/peru-39/inventory.yaml), [Stage 0](locations/peru-39/stage-0.md), [Stage 1](locations/peru-39/stage-1.md) | [estado actual](locations/peru-39/current-state.md), [sondeos del router](locations/peru-39/probe-results/) e [inventarios de hosts](locations/peru-39/inventory-results/) |
| Legaria 94 | [inventario](locations/legaria-94/inventory.yaml) | Preparación local; consulta sus archivos antes de ejecutar cualquier etapa. |

El inventario es la línea base declarada. Las observaciones fechadas del router
y de cada host reflejan el estado efectivo en el momento de la captura; no se
debe inferir el estado actual únicamente a partir de una evidencia antigua.

## Etapas operativas

[Stage 0 de Omada](docs/stages/omada-stage-0.md) descubre de forma de solo
lectura el modelo, firmware, DHCP, ARP y capacidades del router. No cambia
reservas, DNS, configuración de red ni firmware.

[Stage 1 de hosts Linux](docs/stages/linux-host-stage-1.md) identifica hosts a
partir de evidencia local y recopila su inventario. La única mutación remota
permitida por esa etapa es añadir de forma idempotente la llave pública de
gestión a `authorized_keys` cuando sea necesario. Cada sitio puede añadir
restricciones mediante su propio `stage-*.md`.

Antes de actuar, lee las instrucciones de la etapa, el archivo de sitio y la
evidencia más reciente. El estado observado gana frente a etiquetas DHCP o
suposiciones de hardware.

## Seguridad

Los archivos `locations/*/.env` están ignorados por Git. Contienen valores
locales para la administración y nunca deben añadirse, imprimirse ni incluirse
en evidencia. Tampoco se versionan contraseñas, tokens, llaves privadas ni
`known_hosts` de una máquina de gestión.

Antes de confirmar evidencia, revisa `git status`, el diff preparado y el
contenido generado para asegurar que no contengan secretos. No modifiques un
router o un host fuera del alcance explícito de la etapa en curso.

## Incorporar una máquina de gestión nueva

En Linux o WSL, instala las herramientas locales necesarias. En Debian/Ubuntu:

```bash
sudo apt update
sudo apt install -y openssh-client sshpass expect
```

En CachyOS/Arch:

```bash
sudo pacman -S --needed openssh sshpass expect
```

Clona por HTTPS en la ubicación estándar y valida el toolkit:

```bash
mkdir -p ~/Code
git clone https://github.com/jrenewhite/homelabs.git ~/Code/homelabs
cd ~/Code/homelabs
git pull --ff-only
bash scripts/homelab --help
bash scripts/check-deps.sh
```

Restaura los `.env` de los sitios aplicables mediante una transferencia privada
desde una máquina de gestión autorizada; deben permanecer fuera de Git y con
permisos restringidos. No uses este repositorio, capturas de terminal ni
documentación para transportar valores de credenciales.

Si se autoriza migrar la identidad de gestión existente, coloca solamente
`homelabing` y `homelabing.pub` en `~/.ssh/`; no copies `known_hosts`. Aplica:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/homelabing
chmod 644 ~/.ssh/homelabing.pub
```

Para cargar un entorno local que pudiera tener finales de línea de Windows sin
mostrar sus valores:

```bash
source <(sed 's/\r$//' locations/<sitio>/.env)
```

Después, comprueba acceso con llave a un host conocido y vuelve a ejecutar
`bash scripts/check-deps.sh`. Consulta las instrucciones de cada sitio antes de
iniciar Stage 0 o Stage 1.
