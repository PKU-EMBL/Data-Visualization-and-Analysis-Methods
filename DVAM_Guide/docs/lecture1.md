# Lecture 01 · From Data to Evidence

<div class="dvam-lead" markdown>
This lecture introduces the course's analytical framework. We clarify the question and data structure, choose summaries and visual encodings, and produce conclusions that another reader can check.
</div>

## Learning Objectives

<div class="dvam-grid" markdown>

<div class="dvam-card" markdown>
### Problem framing

Turn a broad topic into a testable question. Define the unit of analysis, comparison, response variable, and potential confounders.
</div>

<div class="dvam-card" markdown>
### Data auditing

Inspect data types, missing values, duplicate records, outliers, units, and sampling bias before drawing conclusions.
</div>

<div class="dvam-card" markdown>
### Figure selection

Choose position, length, color, area, and other visual channels for the task, while understanding when each chart can mislead.
</div>

<div class="dvam-card" markdown>
### Evidence communication

Let titles, axes, legends, annotations, and uncertainty support the conclusion instead of relying on decorative effects.
</div>

</div>

## The Analytical Loop

```mermaid
flowchart LR
    A["Research Question"] --> B["Data Audit"]
    B --> C["Transform & Summarize"]
    C --> D["Visualize"]
    D --> E["Validate"]
    E --> F["Communicate"]
    F -. "new question" .-> A
```

A mature analytical workflow is rarely linear. Visualization can expose data problems. Validation can force us to redefine a metric. Communication can reveal that a conclusion is not yet clear.

## From a Topic to an Analytical Question

“Air quality,” “biodiversity,” and “material performance” are topics, not executable questions. An analytical question should answer four basic questions:

| Element | Question to answer | Example |
| --- | --- | --- |
| Analysis unit | What does each row represent? | City–date, sample–gene, material–experimental condition |
| Outcome | What do we want to explain or predict? | PM2.5, species richness, CO₂ adsorption |
| Comparison | Which groups, times, or conditions should be compared? | Season, treatment group, material category |
| Context | Which variables may affect the interpretation? | Temperature, batch, measurement platform, spatial location |

!!! example "Rewrite a broad topic as a question"
    Topic: “Study urban air quality.”

    Question: “After controlling for season and meteorological conditions, do Beijing's functional zones show stable differences in PM2.5, and how do those differences change from 2020 to 2025?”

The second formulation specifies the response variable, comparison, time range, and potential confounders. It can guide data preparation and figure design directly.

## Data Structure and Quality

### Tidy data

Organize an analytical table so that:

- each variable is a column;
- each observation is a row;
- each observational unit has its own table when appropriate;
- column names are stable, units are explicit, and category codes are consistent.

### A minimal data audit

```python
import pandas as pd

df = pd.read_csv("data/raw/observations.csv")

audit = {
    "rows": len(df),
    "columns": df.shape[1],
    "duplicates": int(df.duplicated().sum()),
    "missing_rate": df.isna().mean().sort_values(ascending=False),
    "dtypes": df.dtypes,
}

print(audit["rows"], audit["columns"], audit["duplicates"])
print(audit["missing_rate"].head())
print(audit["dtypes"])
```

This check does not decide whether the data are “correct.” It quickly exposes structural problems. Interpret outliers in the context of sampling and measurement. Do not delete observations solely from a box plot or a fixed threshold.

## Visual Tasks and Chart Selection

| Analytical task | Prefer | Use with care |
| --- | --- | --- |
| Compare magnitude | Dot plots, bar charts, interval plots | 3D bars, icons with unequal areas |
| Inspect a distribution | Histograms, density plots, box plots plus raw points | Reporting only a mean without sample size |
| Analyze a relationship | Scatter plots, regression lines, two-dimensional density | Dual Y-axes, unexplained smoothing curves |
| Observe time | Line charts, event markers, confidence intervals | Lines with an arbitrary category order |
| Show composition | Stacked bars, small multiples | Pie charts with too many categories |
| Express space | Choropleths, point maps | Raw counts without population or area normalization |

A useful default ordering for visual precision is: **position on a common scale > length > angle / slope > area > color intensity**. It is not an absolute rule, but it helps avoid assigning precise comparisons to channels that are difficult to judge accurately.

## A Transparent Comparison Figure

```python
import matplotlib.pyplot as plt
import pandas as pd
import seaborn as sns

df = pd.DataFrame(
    {
        "condition": ["Control"] * 5 + ["Treatment"] * 5,
        "value": [4.8, 5.1, 5.0, 4.7, 5.2, 6.1, 6.4, 5.9, 6.3, 6.0],
    }
)

sns.set_theme(style="whitegrid")
fig, ax = plt.subplots(figsize=(6.4, 4.2))

sns.boxplot(
    data=df,
    x="condition",
    y="value",
    width=0.42,
    color="#d9e7df",
    showfliers=False,
    ax=ax,
)
sns.stripplot(
    data=df,
    x="condition",
    y="value",
    color="#173f35",
    size=6,
    jitter=0.12,
    ax=ax,
)

ax.set(
    title="Treatment shifts the observed response",
    xlabel="Condition",
    ylabel="Response value (a.u.)",
)
sns.despine()
fig.tight_layout()
fig.savefig("figures/condition_comparison.png", dpi=300)
```

Compared with a bar chart of means alone, a distribution summary plus raw points preserves central tendency, spread, and sample-size information. A formal report should also state the data source, replication type, and statistical test.

## Figure Integrity

Before submitting a figure, check:

1. **Scale:** Is a coordinate transformation necessary and documented? Does a bar chart start at zero?
2. **Sample:** Are sample size, replication type, and missing-data handling visible?
3. **Uncertainty:** Do error bars represent SD, SE, or a confidence interval?
4. **Color:** Does color have a consistent meaning? Is the figure readable in grayscale and under color-vision differences?
5. **Text:** Does the title state a finding rather than repeat a variable name?
6. **Provenance:** Can the data, methods, and figure-generation code be traced?

!!! warning "Correlation is not causation"
    A scatter plot, correlation coefficient, or predictive model can describe an association, but cannot establish causality on its own. The strength of a conclusion must match the study design, data quality, and model assumptions.

## After-class Exercise

Choose a public tabular dataset and deliver:

- a research question in no more than 80 words;
- a data dictionary with variable name, type, unit, and missing-value notes;
- one distribution figure and one relationship figure;
- a “conclusion + limitation” statement for each figure;
- a rerunnable Notebook or script.

The next lecture discusses the [Python / R cross-language workflow and advanced visualization](lecture2.md).
