# Environment Setup

Prior programming experience is welcome but not required. Before the first class, install Python, R, Rust, and either JupyterLab or Positron. You also need a Unix-like shell. Use Linux or macOS, or use WSL on Windows. Keep one project environment and record its dependencies.

The course follows a workflow similar to [The Missing Semester of Your CS Education](https://missing.csail.mit.edu/). Its lessons on the shell, command-line tools, development environments, version control, and packaging provide useful preparation.

Install Rust with [rustup](https://rustup.rs/). It provides the `rustc` compiler and `cargo` package manager used in the Rust session.

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

On Windows, use WSL when you need a Unix-like terminal. See the [official WSL guide](https://learn.microsoft.com/windows/wsl/install) and the [Conda environment guide](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html) for platform-specific steps.

## Ready check

- [ ] Python and R return version numbers;
- [ ] `rustc --version` and `cargo --version` return version numbers;
- [ ] A Jupyter Notebook or script runs in the project environment;
- [ ] `pandas`, `matplotlib`, and `seaborn` import successfully.

After the check, return to the [course homepage](index.md).
