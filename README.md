## About this repository

This repository provides a runnable comparison between the MeTTa interpreter and PeTTa. It contains focused `.metta` test suites that exercise core language features, list/set operations, evaluation control, typing, quoting, and atomspace interactions across both engines.

## Repository structure

- Root `.metta` tests
	- `tests_*.metta` — focused suites (equality, errors, evaluation, lists, math, nondeterminism, quoting, sets, types, atomspace)
- `DOCS.md` — detailed comparisons, tables, and notes (migrated from the previous README)

## Prerequisites

- MeTTa available.
- SWI-Prolog (required by PeTTa’s runner `run.sh`);

## Installation

- MeTTa (Hyperon)

```bash
pip install hyperon
# optional version check
metta --version
```

- PeTTa (clone separately)

```bash
git clone https://github.com/patham9/PeTTa ~/PeTTa
# optional: install SWI-Prolog if not present; then you can run ./run.sh
~/PeTTa/run.sh --help
```

## How to run tests

- Run a test with MeTTa (Hyperon):

```bash
metta ./tests_mathematical_operations.metta
```

- Run a test with PeTTa (from your cloned PeTTa folder):

```bash
cd ~/PeTTa
./run.sh ./tests_mathematical_operations.metta
```


## What’s included (at a glance)

- Keyword coverage for PeTTa with short descriptions
- Side-by-side “works/doesn’t” observations for MeTTa vs PeTTa
- Focused tests for: equality/reduction, error handling, evaluation control, math, lists, nondeterminism, types, quoting, set ops, atomspace

For the full keyword list and comparison tables, see the documentation in `docs/`.

## Contributing

- Add or adjust tests: create/update a `tests_*.metta` file at the root
- Keep tests simple and focused; place error-producing lines at the end or behind comments
- Update the docs tables to reflect new support and behaviors
