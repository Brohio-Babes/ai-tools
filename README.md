# ai-tools

Personal AI skills aggregator for Claude Code. Consolidates external skill repos and custom skills into one place, available across every project.

## Structure

```
ai-tools/
├── agent-skills/          ← submodule: addyosmani/agent-skills
├── graphify/              ← submodule: safishamsi/graphify (branch v3)
├── skills/                ← your own custom skills (add here)
├── .claude/
│   └── commands/          ← promoted commands (symlink targets for install.sh)
├── .claude-plugin/
│   └── plugin.json        ← registers this repo as a Claude Code plugin
└── install.sh             ← symlinks selected commands to ~/.claude/commands/
```

## Setup

### Option A — Install as a Claude Code plugin (Cowork / app-level)

```
/plugin install /path/to/ai-tools
```

Exposes the commands in `.claude/commands/` across all projects.

### Option B — Symlink to ~/.claude/commands/ (Claude Code CLI)

```bash
git clone <this-repo> ~/ai-tools
cd ~/ai-tools
git submodule update --init --recursive
bash install.sh
```

`install.sh` symlinks a curated set of commands into `~/.claude/commands/`. Uncomment lines in the script to promote more commands.

### graphify extra step

graphify requires its Python package:

```bash
pip install graphifyy && graphify install
```

## Adding commands

1. Browse `agent-skills/.claude/commands/` for available commands
2. Uncomment the relevant line in `install.sh`
3. Re-run `bash install.sh`

For your own skills, add them under `skills/` and add a `symlink_command` line to `install.sh`.

## Keeping submodules up to date

```bash
git submodule update --remote
```

Run this when you want to pull in upstream changes. Submodules don't auto-update.

## Current commands (examples — not exhaustive)

| Command | Source | What it does |
|---------|--------|--------------|
| `/spec` | agent-skills | Spec-driven development — write a spec before code |
| `/graphify` | graphify | Build a knowledge graph from any folder of files |
| `/plan` | agent-skills | Break a spec into an atomic task plan |
| `/build` | agent-skills | Incremental implementation with quality gates |
| `/test` | agent-skills | Prove the code works |
| `/review` | agent-skills | Code review before merge |
| `/ship` | agent-skills | Ship to production |

Uncomment lines in `install.sh` to activate the ones you want.
