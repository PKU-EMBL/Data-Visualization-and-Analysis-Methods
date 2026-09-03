# Resource Index

<div class="dvam-lead" markdown>
This page groups official documentation and common resources by analytical task. External tools change over time. Use the official pages for current installation parameters and APIs.
</div>

## Environment and Development

| Tool | Use | Official entry point |
| --- | --- | --- |
| Conda | Cross-platform environments and dependency management | [Managing environments](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html) |
| Python Packaging | venv, pip, and package-management basics | [Packaging User Guide](https://packaging.python.org/en/latest/) |
| JupyterLab | Notebooks and interactive computing | [JupyterLab Documentation](https://jupyterlab.readthedocs.io/) |
| Positron | Python / R data-science IDE | [Positron Documentation](https://positron.posit.co/) |
| Git | Version control | [Git Documentation](https://git-scm.com/doc) |
| GitHub | Collaboration, Issues, and Pull Requests | [GitHub Docs](https://docs.github.com/) |

## Python Data Stack

| Tool | Typical task | Official entry point |
| --- | --- | --- |
| NumPy | Arrays and numerical computing | [NumPy Documentation](https://numpy.org/doc/) |
| pandas | Tabular data preparation and analysis | [pandas Documentation](https://pandas.pydata.org/docs/) |
| SciPy | Scientific computing and statistical functions | [SciPy Documentation](https://docs.scipy.org/doc/scipy/) |
| Matplotlib | Low-level plotting and precise layout | [Matplotlib Documentation](https://matplotlib.org/stable/) |
| Seaborn | Statistical visualization | [Seaborn Documentation](https://seaborn.pydata.org/) |
| scikit-learn | Classical machine learning and evaluation | [User Guide](https://scikit-learn.org/stable/user_guide.html) |

## R and Cross-language Work

| Tool | Typical task | Official entry point |
| --- | --- | --- |
| R | Statistical-computing environment | [R Manuals](https://cran.r-project.org/manuals.html) |
| ggplot2 | Grammar of Graphics visualization | [ggplot2 Documentation](https://ggplot2.tidyverse.org/) |
| dplyr | Data transformation | [dplyr Documentation](https://dplyr.tidyverse.org/) |
| tidyr | Tidy-data reshaping | [tidyr Documentation](https://tidyr.tidyverse.org/) |
| rpy2 | Calling R from Python | [rpy2 Documentation](https://rpy2.github.io/doc/latest/html/) |

## Data Discovery

- [Database Commons](https://ngdc.cncb.ac.cn/databasecommons/): directory of life-science databases;
- [MIBiG](https://mibig.secondarymetabolites.org/): resource for known biosynthetic gene clusters;
- [BiG-FAM](https://bigfam.bioinformatics.nl/home): biosynthetic gene-cluster family database;
- government open-data portals, international-organization data portals, and supplementary data from papers.

### Dataset Selection Checklist

Before choosing a dataset, confirm:

- [ ] It can legally be acquired, analyzed, and redistributed
- [ ] It has a stable identifier, version, or download date
- [ ] Its sample size and variables can answer the research question
- [ ] A data dictionary, method description, and citation format are available
- [ ] Missingness, bias, and sampling scope can be evaluated
- [ ] The team can clean and analyze it within the course schedule

## Figure Review Checklist

| Dimension | Core question |
| --- | --- |
| Purpose | What should readers compare at first glance? |
| Data | Are sample size, units, and missing-data handling visible or findable? |
| Encoding | Are visual channels suitable for the task and semantically consistent? |
| Uncertainty | Are sources and statistical meaning of uncertainty explicit? |
| Accessibility | Have type size, contrast, and color-vision differences been considered? |
| Reproducibility | Can the figure be regenerated from code in the repository? |

To begin, complete the [Prerequisites](../Prerequisites_guild.md). Then read the [Final Project requirements](../final-project.md) to organize a team submission.
