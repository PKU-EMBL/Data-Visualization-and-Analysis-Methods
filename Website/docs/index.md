---
hide:
  - toc
---

# Methodologies of Data Visualization and Analysis { .course-site-title }

## Course Overview { #intro }

**Fall 2026–2027**

This graduate course develops practical methods for data visualization and analysis. It is designed for students with limited programming or computational experience. The second session introduces AI-assisted visualization, including Vibe Coding and multi-agent workflows. We then build a foundation in Linux, command-line tools, development environments, debugging, version control, reproducible environments, and code quality. Python and R each receive two sessions, followed by a short survey of Rust and Julia. The final four sessions form a scientific visualization and figure-production series. Topics include publication standards, visual grammar, vector workflows, domain-specific tools for earth, atmospheric, and omics data, and AI-assisted graphics with MCP, SVG, reusable presets, and molecular visualization. Metagenomics provides one application context.

Students work through guided exercises, current research literature, and official documentation. They first build small figures, then connect advanced visualizations to geospatial, atmospheric, and omics data. A team project applies these workflows to an original question. AI tools support learning but do not replace understanding. Students must inspect generated code and figures and remain responsible for interpretation, privacy, and reproducibility.

<div class="course-facts" role="list" aria-label="Course at a glance">
<div role="listitem"><span>Term</span><strong>Fall 2026–2027</strong></div>
<div role="listitem"><span>Meeting</span><strong>Tuesday · 08:30–11:30</strong></div>
<div role="listitem"><span>Room</span><strong>C303</strong></div>
<div role="listitem"><span>Enrollment</span><strong>80 students</strong></div>
</div>

## Course Staff { #people }

### Instructors { #instructors }

<div class="course-people" markdown>
<article class="course-person" markdown>
<a href="https://see.pkusz.edu.cn/info/1012/1454.htm" target="_blank" rel="noopener"><img src="img/ke-yu.png" alt="Ke Yu" class="course-person__photo" /></a>

### [Ke Yu](https://see.pkusz.edu.cn/info/1012/1454.htm)

Instructor<br>
[yuke.sz@pku.edu.cn](mailto:yuke.sz@pku.edu.cn)
</article>
</div>

### Course Assistants { #course-assistants }

<div class="course-people" markdown>
<article class="course-person" markdown>
<img src="img/zhaorui-jiang.png" alt="Zhaorui Jiang" class="course-person__photo" />

### [Zhaorui Jiang](https://zhaorui-bi.github.io/)

CA
</article>
</div>

## Logistics { #logistics }

This graduate course is taught by **Ke Yu**. It meets every **Tuesday, 08:30–11:30**, in **C303** during **Fall 2026–2027**. Enrollment is limited to **80 students**.

Before the first meeting, complete the [Environment Setup](Prerequisites_guild.md).

## Schedule { #schedule }

Lectures meet every Tuesday, 08:30–11:30, in C303. The schedule moves from AI-assisted visualization and essential computational tools to Python, R, and a short Rust/Julia survey. The final four sessions form a scientific visualization and figure-production series. Metagenomics is one application context. Announcements from Instructor Ke Yu take precedence.

| # | Date | Description | Reading Material | Deadlines |
| --- | --- | --- | --- | --- |
| 1 | Tue Sep 8, 2026 | Course Overview + Shell + Environment Setup | [MIT: Course Overview + Introduction to the Shell](https://missing.csail.mit.edu/2026/course-shell/)<br>[MIT: Shell exercises](https://missing.csail.mit.edu/2026/course-shell/#exercises)<br>[MIT: Command-line Environment](https://missing.csail.mit.edu/2026/command-line-environment/)<br>[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html) |  |
| 2 | Tue Sep 15, 2026 | Agentic Coding + Vibe Coding + Multi-Agent Workflows | [MIT: Agentic Coding](https://missing.csail.mit.edu/2026/agentic-coding/)<br>[MIT: Beyond the Code](https://missing.csail.mit.edu/2026/beyond-code/)<br>[MIT: Development Environment and Tools](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT: Code Quality](https://missing.csail.mit.edu/2026/code-quality/) |  |
| 3 | Tue Sep 22, 2026 | Development Tools + Debugging + Git | [MIT: Development Environment and Tools](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT: Debugging and Profiling](https://missing.csail.mit.edu/2026/debugging-profiling/)<br>[MIT: Version Control and Git](https://missing.csail.mit.edu/2026/version-control/)<br>[Git Documentation](https://git-scm.com/doc) |  |
| 4 | Tue Oct 13, 2026 | Packaging + Reproducibility + Code Quality | [MIT: Packaging and Shipping Code](https://missing.csail.mit.edu/2026/shipping-code/)<br>[MIT: Code Quality](https://missing.csail.mit.edu/2026/code-quality/)<br>[Conda: Managing environments](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html)<br>[Python Packaging User Guide](https://packaging.python.org/en/latest/) |  |
| 5 | Tue Oct 20, 2026 | Python I: Programming Basics | [Python Tutorial](https://docs.python.org/3/tutorial/)<br>[Python Standard Library](https://docs.python.org/3/library/)<br>[NumPy: Quickstart](https://numpy.org/doc/stable/user/quickstart.html) |  |
| 6 | Tue Oct 27, 2026 | Python II: Data Analysis + Simple Visualization | [pandas: Getting started](https://pandas.pydata.org/docs/getting_started/index.html)<br>[pandas: User Guide](https://pandas.pydata.org/docs/user_guide/index.html)<br>[Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/) |  |
| 7 | Tue Nov 3, 2026 | R I: Programming Basics | [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)<br>[R Language Definition](https://cran.r-project.org/doc/manuals/r-release/R-lang.html)<br>[R Manuals](https://cran.r-project.org/manuals.html) |  |
| 8 | Tue Nov 10, 2026 | R II: Data Frames + Simple Visualization | [R for Data Science](https://r4ds.hadley.nz/)<br>[dplyr Documentation](https://dplyr.tidyverse.org/)<br>[tidyr Documentation](https://tidyr.tidyverse.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/) |  |
| 9 | Tue Nov 17, 2026 | AI-Driven New Language Learning: Rust + Julia | [The Rust Programming Language](https://doc.rust-lang.org/book/)<br>[Rust by Example](https://doc.rust-lang.org/rust-by-example/)<br>[The Cargo Book](https://doc.rust-lang.org/cargo/)<br>[Julia Documentation](https://docs.julialang.org/en/v1/)<br>[Julia DataFrames](https://dataframes.juliadata.org/stable/) |  |
| 10 | Tue Nov 24, 2026 | Advanced Visualization with Python and R | [Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/)<br>[Vega-Lite](https://vega.github.io/vega-lite/)<br>[QGIS](https://github.com/qgis/QGIS)<br>[xarray Documentation](https://docs.xarray.dev/en/stable/)<br>[Cartopy Documentation](https://cartopy.readthedocs.io/stable/)<br>[GeoPandas Mapping](https://geopandas.org/en/stable/docs/user_guide/mapping.html)<br>[PyGMT Documentation](https://www.pygmt.org/latest/)<br>[MetPy Documentation](https://unidata.github.io/MetPy/latest/)<br>[Py-ART Documentation](https://arm-doe.github.io/pyart/)<br>[wrf-python Plotting Examples](https://wrf-python.readthedocs.io/en/main/plot.html)<br>[Iris Documentation](https://scitools-iris.readthedocs.io/en/stable/)<br>[scverse Getting Started](https://scverse.org/learn/)<br>[Scanpy Plotting](https://scanpy.scverse.org/en/stable/tutorials/plotting/index.html)<br>[OmicVerse Documentation](https://omicverse.readthedocs.io/en/latest/index.html)<br>[Vitessce Documentation](https://vitessce.io/docs/) |  |
| 11 | Tue Dec 1, 2026 | Scientific Visualization and Figure Production (I): Publication Standards + Visual Grammar | [Nature Figure Guide](https://research-figure-guide.nature.com/)<br>[Nature: Preparing figures](https://research-figure-guide.nature.com/figures/preparing-figures-our-specifications/)<br>[Matplotlib: Choosing colormaps](https://matplotlib.org/stable/users/explain/colors/colormaps.html)<br>[ColorBrewer](https://colorbrewer2.org/) |  |
| 12 | Tue Dec 8, 2026 | Scientific Visualization and Figure Production (II): Illustrator + PowerPoint + BioRender + SVG | [Adobe Illustrator drawing tools](https://www.adobe.com/learn/illustrator/web/drawing-tools-basics)<br>[PowerPoint flow charts](https://support.microsoft.com/en-us/office/add-a-flow-chart-to-a-slide-in-powerpoint)<br>[BioRender templates](https://www.biorender.com/templates)<br>[MDN SVG](https://developer.mozilla.org/en-US/docs/Web/SVG)<br>[Inkscape Manual](https://inkscape-manuals.readthedocs.io/en/latest/) |  |
| 13 | Tue Dec 15, 2026 | Scientific Visualization and Figure Production (III): Domain-Specific Visualization, Earth + Atmospheric + Omics | [QGIS](https://github.com/qgis/QGIS)<br>[xarray Documentation](https://docs.xarray.dev/en/stable/)<br>[Cartopy Documentation](https://cartopy.readthedocs.io/stable/)<br>[PyGMT Documentation](https://www.pygmt.org/latest/)<br>[MetPy Documentation](https://unidata.github.io/MetPy/latest/)<br>[Py-ART Documentation](https://arm-doe.github.io/pyart/)<br>[scverse Getting Started](https://scverse.org/learn/)<br>[Scanpy Plotting](https://scanpy.scverse.org/en/stable/tutorials/plotting/index.html)<br>[OmicVerse Documentation](https://omicverse.readthedocs.io/en/latest/index.html)<br>[Vitessce Documentation](https://vitessce.io/docs/) |  |
| 14 | Tue Dec 22, 2026 | Scientific Visualization and Figure Production (IV): AI-Assisted Graphics, MCP + SVG + Protein Presets | [MCP Tools](https://modelcontextprotocol.io/specification/2025-06-18/server/tools)<br>[MCP TypeScript SDK](https://ts.sdk.modelcontextprotocol.io/v2/)<br>[SVG Reference](https://developer.mozilla.org/en-US/docs/Web/SVG/Reference)<br>[ChimeraX User Guide](https://www.cgl.ucsf.edu/chimerax/docs/user/index.html)<br>[ChimeraX Preset command](https://www.cgl.ucsf.edu/chimerax/docs/user/commands/preset.html)<br>[Mol* Viewer](https://molstar.org/viewer-docs/)<br>[RCSB Protein Data Bank](https://www.rcsb.org/) |  |
| 15 | Tue Dec 29, 2026 | Guest Lecture: Deep Learning (I) · [Shengwei Hou](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |
| 16 | Tue Jan 5, 2027 | Guest Lecture: Deep Learning (II) · [Shengwei Hou](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |

## Grading { #grading }

Assessment emphasizes the project process and final delivery. The instructor's published weights and deadlines take precedence over this overview.

- **Problem framing:** State a clear research question, data scope, and limitations.
- **Methods and visualization:** Match methods, visual encodings, and statistical summaries to the question.
- **Reproducibility:** Provide the environment, code, and instructions needed to reproduce each result.
- **Communication:** Present the analysis in a clear README, report, and set of figures.
- **Collaboration:** Document contributions, version-control decisions, and team work.

Final project details are **to be announced**.

## Research Projects

Teams of 2–4 students will define a real question and complete an original analysis. Project details: **To be announced.**

## Course Policies { #policies }

### Token Policy

- Students fund the tokens required for their own research work.
- Students undertaking a research project must maintain token access. Without token access, they should withdraw from the course immediately.
- In-class AI demonstrations and exercises use DeepSeek-V4-Flash throughout the course.
- `Tokenmaxxing` is not required. More tokens do not guarantee better results; use a budget that supports a clear question, explicit constraints, and reliable verification.
- **Personal view:** Tokens are experimental materials in the AI era. Direct use develops awareness of cost, quality, and latency. The scarce resource is not tokens, but worthwhile questions, clear constraints, and reliable acceptance criteria.

### Academic Integrity and AI Use

- Cite external ideas, code, data, figures, and generative tools.
- Submit only results that the team can explain and reproduce.

### Reproducibility and Data

- Include the environment, scripts, data-processing steps, and output locations.
- Never commit personal information, restricted data, credentials, or access tokens to a public repository.

### Communication with Course Staff

- Read the course documentation before raising general questions.
- For course-specific questions, contact Instructor Ke Yu at [yuke.sz@pku.edu.cn](mailto:yuke.sz@pku.edu.cn).

## Further Information

- [Environment Setup](Prerequisites_guild.md)
- [Final Project](final-project.md)
- [Course repository](https://github.com/PKU-EMBL/Methodologies-of-Data-Visualization-and-Analysis)
