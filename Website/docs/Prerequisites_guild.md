# Prerequisites

Basic programming experience is welcome but not required. Before the first class, install Python, R, and either JupyterLab or Positron. You should also have access to a Unix-like shell: Linux or macOS, or WSL on Windows. Use one project environment and record its dependencies.

The course follows a foundation-first workflow similar to [The Missing Semester of Your CS Education](https://missing.csail.mit.edu/). Its shell, command-line, development-environment, version-control, and packaging lessons are useful preparation.

## Recommended setup

Conda keeps Python and R dependencies in one environment:

```bash
conda create -n methodologies-dva -c conda-forge \
  python=3.11 r-base rpy2 jupyterlab \
  numpy pandas scipy matplotlib seaborn scikit-learn

conda activate methodologies-dva
```

Check that the environment is available:

```bash
python --version
R --version
python -c "import numpy, pandas, matplotlib, seaborn; print('Course environment ready')"
```

If a project only needs Python, a virtual environment is sufficient:

```bash
python -m venv .venv
source .venv/bin/activate
python -m pip install -U pip
python -m pip install jupyterlab numpy pandas scipy matplotlib seaborn scikit-learn
```

On Windows, use WSL when a Unix-like terminal is helpful. See the [official WSL guide](https://learn.microsoft.com/windows/wsl/install) and the [Conda environment guide](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html) for platform-specific steps.

## Ready check

- [ ] Python and R return a version number;
- [ ] a Jupyter Notebook or script runs in the project environment;
- [ ] `pandas`, `matplotlib`, and `seaborn` import successfully.

After the check, return to the [course homepage](index.md).
