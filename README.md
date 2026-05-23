**macroLessMacroEngine (MLME)** is a **macro-free** command execution engine for Minecraft Java Edition datapacks.

It provides a powerful, modular framework for running, queuing, scheduling, and managing complex command logic without relying on function macros (`$(var)`), making it compatible with Minecraft 1.19.3 and newer.

---

## ✨ Features

- **Fully Macro-Free**: Works on versions before 1.20.2 and avoids macro overhead.
- **Dynamic Command Execution**: Uses a hidden command block at `(0, -64, 0)` to run commands stored in NBT.
- **Rich API Modules**:
  - **Run** — Immediate command execution
  - **Run As** — Execute as specific entities
  - **Queue** — Delayed sequential execution (one command per 3 ticks)
  - **Batch** — Bulk command queuing
  - **Schedule** — Delayed and repeating tasks
  - **Cooldown** — Player + global cooldowns
  - **Fiber** — Lightweight coroutine-style async tasks (spawn, yield, resume)
  - **Event / Hook** — Player join, death, respawn, level-up hooks
  - **State** — Persistent key-value storage
  - **Rate Limiting** — Token bucket system
  - **Locks** — Mutex-style synchronization
  - **Permissions** — Simple permission levels (0-3+)
  - **Broadcast** — Titles, actionbars, messages, sounds
  - **Tags & Counters** — Helper utilities
- **LanternLoad** compatible (integrated load status)
- **Debug & Stats** tools included
- **Lightweight & Performant**

---

## 📦 Compatibility

- **Minecraft**: 1.19.3 – 1.21.5+ (tested up to pack format 101)
- **No Mods Required**
- Works in multiplayer and singleplayer

---

## 🛠 Installation

1. Download the latest release from [GitHub Releases](https://github.com/runtoolkit/macroLessMacroEngine/releases) or clone the repo.
2. Extract the `mlme` folder into your world's `datapacks/` directory.
3. Reload the world (`/reload`).
4. You should see the message:  
   ` [MLME] macroLessMacroEngine v1.0.0 loaded!`

---

## 📖 Quick Start

### Run a command immediately
```mcfunction
data modify storage mlme:cmd Command set value "say Hello from MLME!"
function mlme:api/run/cmd
```

### Run as an entity
```mcfunction
tag @e[type=zombie,limit=1] add mlme.executor
data modify storage mlme:cmd Command set value "execute as @e[tag=mlme.executor] at @s run say I am a zombie!"
function mlme:api/run/as
```

### Queue multiple commands
```mcfunction
data modify storage mlme:cmd Command set value "say Step 1"
function mlme:api/queue/add

data modify storage mlme:cmd Command set value "say Step 2"
function mlme:api/queue/add

function mlme:api/queue/run
```

### Schedule a delayed command
```mcfunction
data modify storage mlme:cmd Command set value "say Delayed message!"
data modify storage mlme:cmd Delay set value 60
function mlme:api/schedule/run
```

### Cooldown example
```mcfunction
data modify storage mlme:cd Ticks set value 100
function mlme:api/cooldown/set

execute if function mlme:api/cooldown/check run say Ready!
```

### Fiber (coroutine-style)
```mcfunction
data modify storage mlme:input fiber.id set value "boss_intro"
data modify storage mlme:input fiber.resume_cmd set value "function mypack:boss/step0"
function mlme:api/fiber/spawn
```

See `data/mlme/function/api/util/help.mcfunction` for full API documentation in-game.

---

## 📋 Full API Overview

### Core
- `mlme:api/run/cmd`
- `mlme:api/run/as`
- `mlme:api/queue/*`
- `mlme:api/batch/*`
- `mlme:api/schedule/*`

### Utilities
- `mlme:api/util/help`
- `mlme:api/util/stats`
- `mlme:api/util/debug_toggle`
- `mlme:api/util/reset_all`

### Advanced
- `mlme:api/fiber/*`
- `mlme:api/cooldown/*`
- `mlme:api/event/register` (hooks)
- `mlme:api/state/*`
- `mlme:api/ratelimit/*`
- `mlme:api/lock/*`
- `mlme:api/perm/*`

Full documentation is available inside the datapack under `data/mlme/function/api/`.

---

## ⚠️ Limitations (Macro-Free Design)

- Some dynamic operations (e.g. matching state/fiber by runtime string ID) have limitations.
- For best performance, prefer **scoreboard-based patterns** when possible (e.g. `#flag.myflag`, `#lock.mylock`, `#rl.mybucket`).
- Dynamic tag names and complex string matching require the command block tunnel.

---

## 🧪 Development & Contributing

This project is designed to be a **foundational library** for other datapacks.

Feel free to:
- Open issues for bugs or feature requests
- Submit PRs
- Use it as a dependency in your own packs

---

## 📄 License

MIT License — see [LICENSE](LICENSE) file.

---

## Credits

Created as a macro-free alternative to existing macro-heavy engines.

**Happy datapacking!** 🚀

---

*Made with ❤️ for the Minecraft datapack community.*