# Prerequisites

<div class="dvam-lead" markdown>
A stable environment supports reproducible research. This page lists the minimum setup: **Git + Conda + Python + R + Jupyter / Positron**.
</div>

## Before You Start

Make sure you can:

- navigate to a directory, create files, and run commands in a terminal;
- distinguish a system environment, virtual environment, and project directory;
- understand the basic structure of CSV, TSV, and Excel data;
- read a simple Python or R error message.

!!! tip "Recommended principle"
    Use one independent environment per project. Record dependencies before analysis. Do not accumulate packages in the system Python or Conda `base` environment.

## Choose a Platform

| Platform | Recommended approach | Notes |
| --- | --- | --- |
| Windows | WSL 2 + Conda / Miniforge | Closer to a Linux research environment and useful for command-line, cross-platform reproduction |
| macOS | Miniforge / Conda | On Apple Silicon, prefer native `arm64` packages and avoid mixing architectures |
| Linux | Miniforge / Conda | Suitable for servers, workstations, and later high-performance computing |

Windows users can consult the [official WSL installation guide](https://learn.microsoft.com/windows/wsl/install). Follow the [Conda documentation](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html) for environment management.

## Create the Course Environment

### Option A · Conda (recommended)

```bash
conda create -n methodologies-dva -c conda-forge \
  python=3.11 r-base jupyterlab \
  numpy pandas scipy matplotlib seaborn scikit-learn

conda activate methodologies-dva
```

To call R from Python, install `rpy2` as well:

```bash
conda install -c conda-forge rpy2
```

Verify the environment:

```bash
python --version
R --version
python -c "import numpy, pandas, matplotlib, seaborn; print('Methodologies of Data Visualization and Analysis environment ready')"
```

### Option B · venv + pip / uv

If a project only needs Python, use a lightweight virtual environment:

=== "venv"

    ```bash
    python -m venv .venv
    source .venv/bin/activate
    python -m pip install -U pip
    python -m pip install jupyterlab numpy pandas scipy matplotlib seaborn scikit-learn
    ```

=== "uv"

    ```bash
    uv venv --python 3.11
    source .venv/bin/activate
    uv pip install jupyterlab numpy pandas scipy matplotlib seaborn scikit-learn
    ```

On Windows PowerShell, activation is usually `.venv\Scripts\Activate.ps1`. When a project uses both Python and R, prefer Conda to manage the underlying dependencies together.

## Editors and Interactive Environments

The course supports JupyterLab, VS Code, RStudio, and Positron. [Positron](https://positron.posit.co/) provides one interface for Python, R, variable inspection, figure review, and Notebook work.

Check three things during setup:

1. the editor's selected Python interpreter comes from the `methodologies-dva` environment;
2. the R executable can be called directly from the terminal;
3. the Notebook kernel matches the project environment.

!!! warning "The most common environment problem"
    “The import works in the terminal but fails in the Notebook” usually means that the Notebook uses another interpreter or kernel. The package may be installed correctly.

## Git and Project Structure

Each team project should contain at least:

```text
dva-project/
├── README.md
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
├── src/
├── figures/
├── report/
└── environment.yml
```

- `data/raw/` stores raw data and is read-only in principle;
- `data/processed/` stores intermediate data that scripts can regenerate;
- `src/` stores reusable functions and analytical scripts;
- `figures/` stores final figures with stable, traceable file names;
- `environment.yml` or `requirements.txt` records dependencies.

## Common Questions

??? question "Conda is slow or reports dependency conflicts. What should I do?"
    Rebuild a new environment instead of repeatedly modifying an old environment that mixes Conda and pip. If necessary, reduce the number of packages installed at once and check that channels are consistent.

??? question "macOS reports that a package has the wrong architecture. What should I do?"
    Check that the terminal, Conda, and Python all run on the same architecture. On Apple Silicon, do not mix `arm64` and `x86_64` packages in one environment.

??? question "rpy2 cannot find R. What should I do?"
    First confirm that `R --version` runs in the same terminal. Then check that Python and R come from the same Conda environment. Prefer installing `r-base` and `rpy2` together from Conda-forge rather than setting `R_HOME` manually.

??? question "Should data files be committed to GitHub?"
    Small datasets that are licensed for redistribution may be committed. Large, restricted, or personal datasets should use a public link, download script, or controlled storage, with acquisition and license information in the README.

## Ready Check

- [ ] Activate the project environment and confirm Python / R versions
- [ ] Run a Jupyter Notebook or script
- [ ] Import `pandas`, `matplotlib`, and `seaborn`
- [ ] Complete one `git clone`, `git add`, and `git commit`
- [ ] Create a clear project structure without modifying raw data directly

After these checks, continue to [Lecture 01 · From Data to Evidence](lecture1.md).
