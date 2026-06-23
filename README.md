# Twin Peaks Viewer — Distributable Scripts

Each viewer is a single self-contained file with the HTML visualiser and both
JSON models embedded. Recipients need only Python 3 — no Docker, no dependencies.

## Running a viewer

| Platform | Command |
|----------|---------|
| Mac / Linux / WSL | `bash run_dronboard.sh` |
| Windows / Mac / Linux | `python run_dronboard.py` |

Then open **http://localhost:8080** in a browser.
Press `Ctrl+C` to stop.

The viewer opens with comparison **hidden**. Click **"Show Comparison"** in the
toolbar to reveal which nodes are new / revised / deleted relative to the baseline.

---

## Available viewers

| File | Primary (main model) | VS (baseline) |
|------|----------------------|---------------|
| `run_dronboard.*` | DROnboard V1-aligned | DROnboard V0 |
| `run_dronology.*` | Dronology V2-aligned | Dronology V1-aligned |
| `run_dronology2.*` | Dronology V4-aligned | Dronology V3-aligned |

---

## Rebuilding

Run from `~/twinpeaks/` with the venv active:

```bash
cd ~/twinpeaks

# DROnboard — V1 vs V0
python3 build_viewer.py \
  icse-experiments/RQ3/dronboard/v1/V1-aligned.json \
  icse-experiments/RQ3/dronboard/v0/V0.json \
  ~/twinpeaks-experiments/run_dronboard

# Dronology — V2 vs V1
python3 build_viewer.py \
  icse-experiments/RQ2/delta-dronology/v2/V2-aligned.json \
  icse-experiments/RQ2/delta-dronology/v1/V1-aligned.json \
  ~/twinpeaks-experiments/run_dronology

# Dronology2 — V4 vs V3
python3 build_viewer.py \
  icse-experiments/RQ2/delta-dronology/v4/V4-aligned.json \
  icse-experiments/RQ2/delta-dronology/v3/V3-aligned.json \
  ~/twinpeaks-experiments/run_dronology2
```

Each command produces both a `.sh` and a `.py` file.

Rebuild whenever `twin-peaks.html` or the source JSON models change.
