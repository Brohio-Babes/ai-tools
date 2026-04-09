---
description: Turn any folder of files into a navigable knowledge graph with community detection
---

# Source
This command comes from graphify (submodule).
Full skill: graphify/graphify/skill.md

Invoke graphify on the specified path (defaults to current directory).

## Usage
- `/graphify` — full pipeline on current directory
- `/graphify <path>` — full pipeline on a specific path
- `/graphify <path> --update` — incremental, only re-extract changed files
- `/graphify <path> --mode deep` — thorough extraction, richer inferred edges
- `/graphify <path> --no-viz` — skip visualization, just report + JSON

## Outputs
- `graphify-out/graph.html` — interactive graph (click, search, filter)
- `graphify-out/GRAPH_REPORT.md` — plain-language audit report
- `graphify-out/graph.json` — persistent graph for future queries

Read graphify/graphify/skill.md for full usage and all flags.
