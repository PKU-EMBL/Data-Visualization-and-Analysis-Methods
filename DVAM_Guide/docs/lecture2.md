# Lecture 02 · Cross-language Workflow

<div class="dvam-lead" markdown>
Python and R are not competing camps. A data-science project can choose an ecosystem for each task. Stable data structures, environments, and interfaces connect the two workflows.
</div>

## Learning Objectives

- understand the complementary roles of Python and R in an analytical workflow;
- use a DataFrame as the core data structure for collaboration across tools;
- manage interpreters, variables, figures, and Notebooks in a unified environment such as Positron;
- call R from a Python process with `rpy2` while controlling the conversion boundary;
- build maintainable scripts, figures, and reports for the final project.

## Division of Tools

| Task | Python ecosystem | R ecosystem | Selection guidance |
| --- | --- | --- | --- |
| Data preparation | pandas, Polars | dplyr, tidyr | Choose according to data scale and team experience |
| Statistical modeling | scipy, statsmodels | stats, lme4, survival | For specialized models, check the R ecosystem first |
| Machine learning | scikit-learn, PyTorch | tidymodels, torch | Training and deployment often lean toward Python |
| Visualization | Matplotlib, Seaborn, Plotly | ggplot2, plotly | The syntax differs, but the visual principles should be shared |
| Interactive applications | Streamlit, Dash, FastAPI | Shiny | Consider deployment and long-term maintenance |

Do not add complexity just to use two languages. Use a cross-language call only when the other ecosystem offers a clear methodological, package, or communication advantage.

## Positron: A Unified Data-science Interface

[Positron](https://positron.posit.co/) supports Python and R workflows with interpreter selection, Notebooks, variable inspection, a figure panel, and a terminal. The course uses it as one example of a cross-language environment.

Recommended project-session order:

1. Open the project root rather than an individual script;
2. select the project's Python interpreter and R runtime;
3. run an environment check before loading data;
4. gradually move exploratory code into `src/`;
5. write final figures to `figures/` only when they can be regenerated.

## The DataFrame as a Collaboration Boundary

The most common cross-language failures are about data types, not syntax:

| Python / pandas | R | Note |
| --- | --- | --- |
| `float64` | `numeric` | Check missing and infinite values separately |
| `int64` | `integer` / `numeric` | Very large integers may change precision or type |
| `object` / `string` | `character` | Avoid mixing numbers and strings |
| `category` | `factor` | Factor levels and order affect modeling and figures |
| `datetime64` | `POSIXct` | Handle time zones explicitly |
| `bool` | `logical` | Check missing logical values |

!!! tip "Freeze a data contract before crossing languages"
    Define column names, types, units, category levels, and primary keys. A clear data contract is more reliable than repeatedly patching types in two environments.

## Using rpy2

See [Prerequisites](Prerequisites_guild.md) for installation. The example below creates data in Python, converts it to an R DataFrame, calls R's `aggregate()`, and converts the result back to pandas.

```python
import pandas as pd
import rpy2.robjects as ro
from rpy2.robjects import default_converter, pandas2ri
from rpy2.robjects.conversion import localconverter

df = pd.DataFrame(
    {
        "group": ["A", "A", "B", "B"],
        "value": [1.2, 1.5, 2.1, 2.4],
    }
)

converter = default_converter + pandas2ri.converter

with localconverter(converter):
    r_df = ro.conversion.py2rpy(df)

ro.globalenv["dva_df"] = r_df
r_summary = ro.r(
    """
    aggregate(value ~ group, data = dva_df, FUN = mean)
    """
)

with localconverter(converter):
    summary = ro.conversion.rpy2py(r_summary)

print(summary)
```

Prefer a local conversion context instead of enabling automatic conversion for an entire process. Conversion then occurs at an explicit boundary, with less implicit behavior in large projects.

!!! warning "Runtime requirement"
    `rpy2` requires an available R runtime. When R and Python come from different environments, common symptoms include missing shared libraries, inconsistent package paths, and failed data conversion.

## Four Levels of Advanced Visualization

### 1. Show the raw structure

Let readers see data volume, distributions, and unusual points. Use transparency, jitter, faceting, or two-dimensional density when overplotting is a problem.

### 2. Show statistical summaries

Means, medians, regression lines, and confidence intervals must match the research question. State what uncertainty represents instead of using unexplained error bars.

### 3. Organize a multi-panel narrative

A research figure set often follows:

- Panel A: data or study design;
- Panel B: primary finding;
- Panel C: robustness, stratification, or mechanism;
- Panel D: limitation, external validation, or application.

Panels should share colors, variable names, scale logic, and reading direction.

### 4. Export reusable results

```python
from pathlib import Path
import matplotlib.pyplot as plt

output = Path("figures")
output.mkdir(exist_ok=True)

fig, ax = plt.subplots(figsize=(7.2, 4.5))
# ... analysis and plotting ...
fig.savefig(output / "main_result.png", dpi=300, bbox_inches="tight")
fig.savefig(output / "main_result.pdf", bbox_inches="tight")
```

Bitmap files are useful for webpages and presentations. PDF and SVG are better for paper layout. Consider the journal, font licenses, and downstream editing requirements when choosing a format.

## Workflow Recommendations

<div class="dvam-grid" markdown>

<div class="dvam-card" markdown>
### Explore

Audit data, test variable relationships, and form hypotheses quickly in a Notebook, while keeping essential comments and random seeds.
</div>

<div class="dvam-card" markdown>
### Refactor

Turn repeated logic into functions, centralize paths and parameters, and separate data processing from display code.
</div>

<div class="dvam-card" markdown>
### Validate

Check leakage, overfitting, batch effects, sensitivity analyses, and cross-platform execution.
</div>

<div class="dvam-card" markdown>
### Communicate

Use the README to explain the entry point, the technical report to explain methods, figures to communicate evidence, and the repository to preserve a traceable process.
</div>

</div>

## After-class Exercise

1. Create a pandas DataFrame with at least a numeric column, a categorical column, and missing values;
2. pass the data to R and calculate one descriptive statistic by category;
3. convert the result back to Python and plot it;
4. record column types before and after conversion;
5. explain in the README why a cross-language approach is worthwhile for this step.

Afterwards, continue to the [Final Project requirements](final-project.md) and organize the method into a complete submission.
