# Resource Index

<div class="dvam-lead" markdown>
This page groups official documentation by analytical task. Tools change over time. Use the official pages for current installation instructions and APIs.
</div>

## Environment and Development

| Tool | Use | Official entry point |
| --- | --- | --- |
| Conda | Manage environments and dependencies | [Managing environments](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html) |
| Python Packaging | Create environments and install packages | [Packaging User Guide](https://packaging.python.org/en/latest/) |
| JupyterLab | Run notebooks and interactive analyses | [JupyterLab Documentation](https://jupyterlab.readthedocs.io/) |
| Positron | Develop in Python and R | [Positron Documentation](https://positron.posit.co/) |
| Git | Version control | [Git Documentation](https://git-scm.com/doc) |
| GitHub | Collaborate with issues and pull requests | [GitHub Docs](https://docs.github.com/) |
| The Missing Semester | Command-line tools, environments, version control, and packaging | [Course site](https://missing.csail.mit.edu/) |
| Rust | Build safe systems and command-line tools | [The Rust Programming Language](https://doc.rust-lang.org/book/) |
| Cargo | Manage Rust packages and builds | [The Cargo Book](https://doc.rust-lang.org/cargo/) |

## Python Data Stack

| Tool | Typical task | Official entry point |
| --- | --- | --- |
| NumPy | Work with arrays and numerical data | [NumPy Documentation](https://numpy.org/doc/) |
| pandas | Prepare and analyze tabular data | [pandas Documentation](https://pandas.pydata.org/docs/) |
| SciPy | Run scientific and statistical calculations | [SciPy Documentation](https://docs.scipy.org/doc/scipy/) |
| Matplotlib | Build precise plots and layouts | [Matplotlib Documentation](https://matplotlib.org/stable/) |
| Seaborn | Build statistical visualizations | [Seaborn Documentation](https://seaborn.pydata.org/) |
| scikit-learn | Train and evaluate classical models | [User Guide](https://scikit-learn.org/stable/user_guide.html) |

## R and Cross-language Work

| Tool | Typical task | Official entry point |
| --- | --- | --- |
| R | Run statistical analyses | [R Manuals](https://cran.r-project.org/manuals.html) |
| ggplot2 | Build Grammar of Graphics plots | [ggplot2 Documentation](https://ggplot2.tidyverse.org/) |
| dplyr | Transform data frames | [dplyr Documentation](https://dplyr.tidyverse.org/) |
| tidyr | Reshape tidy data | [tidyr Documentation](https://tidyr.tidyverse.org/) |
| rpy2 | Call R from Python | [rpy2 Documentation](https://rpy2.github.io/doc/latest/html/) |

## Scientific Visualization

These tools extend Python and R workflows to geospatial, earth-science, atmospheric, single-cell, and multi-omics data.

| Tool | Typical task | Official entry point |
| --- | --- | --- |
| QGIS | Explore, analyze, and publish raster, vector, mesh, and point-cloud data | [QGIS repository](https://github.com/qgis/QGIS) |
| xarray | Work with labeled multidimensional arrays, NetCDF, and climate or earth-science data | [xarray Documentation](https://docs.xarray.dev/en/stable/) |
| Cartopy | Map data with coordinate reference systems and projections | [Cartopy Documentation](https://cartopy.readthedocs.io/stable/) |
| GeoPandas | Plot vector layers, joins, and thematic maps | [Mapping and plotting](https://geopandas.org/en/stable/docs/user_guide/mapping.html) |
| PyGMT | Create publication-quality maps and geophysical figures | [PyGMT Documentation](https://www.pygmt.org/latest/) |
| MetPy | Analyze weather data and create meteorological plots | [MetPy Documentation](https://unidata.github.io/MetPy/latest/) |
| Py-ART | Process and visualize weather-radar data | [Py-ART Documentation](https://arm-doe.github.io/pyart/) |
| wrf-python | Diagnose and plot output from the WRF model | [Plotting examples](https://wrf-python.readthedocs.io/en/main/plot.html) |
| Iris | Analyze and visualize multidimensional earth-science data | [Iris Documentation](https://scitools-iris.readthedocs.io/en/stable/) |
| scverse | Organize single-cell and multimodal analysis workflows | [Getting Started](https://scverse.org/learn/) |
| Scanpy | Plot embeddings, expression summaries, and clustering results | [Plotting tutorials](https://scanpy.scverse.org/en/stable/tutorials/plotting/index.html) |
| OmicVerse | Explore transcriptomics, single-cell, spatial, and multi-omics data | [OmicVerse Documentation](https://omicverse.readthedocs.io/en/latest/index.html) |
| Vitessce | Build linked interactive views for spatial and single-cell data | [Vitessce Documentation](https://vitessce.io/docs/) |

## Data Discovery

- [Database Commons](https://ngdc.cncb.ac.cn/databasecommons/) provides a directory of life-science databases.
- [MIBiG](https://mibig.secondarymetabolites.org/) stores known biosynthetic gene clusters.
- [BiG-FAM](https://bigfam.bioinformatics.nl/home) groups biosynthetic gene-cluster families.
- Government portals, international-organization portals, and paper supplements provide additional datasets.

### Dataset Selection Checklist

Before choosing a dataset, confirm the following:

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

Start with the [Environment Setup](../Prerequisites_guild.md). Then read the [Final Project requirements](../final-project.md) to organize your team submission.
