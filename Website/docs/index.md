---
hide:
  - toc
---

# Methodologies of Data Visualization and Analysis { .course-site-title }

## Course Overview { #intro }

**Fall 2026–2027**

This graduate course introduces practical methods for data visualization and analysis. It is designed for students who are new to programming or computational research. We begin with a short introduction to AI-assisted visualization. Students can use Vibe Coding and multi-agent tools as learning aids from the second class. We then introduce Linux and command-line tools, development environments, debugging, version control, reproducible environments, and code quality. The programming block gives Python and R two sessions each. It also includes a short survey of Rust and Julia. The final block applies these methods to metagenomics. Topics include study design, quality control, assembly, taxonomic and functional profiles, diversity, metagenome-assembled genomes, and interactive visualization.

Students will follow guided exercises and current documentation. They will build small figures before larger analyses. They will also complete an original team project. AI tools are assistants, not substitutes for understanding. Students must check generated code and figures. They remain responsible for interpretations, privacy, and reproducibility.

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

This is a **graduate-level course** taught by **Ke Yu**. It meets every **Tuesday from 08:30 to 11:30** in **C303**. The course runs during **Fall 2026–2027**. Enrollment is limited to **80 students**.

Before the first meeting, complete the [Environment Setup](Prerequisites_guild.md).

## Schedule { #schedule }

Lectures meet on Tuesdays from 08:30 to 11:30 in C303. The first session introduces AI-assisted visualization. The following sessions cover computational tools, Python, R, and a short Rust/Julia survey. The final sessions focus on metagenomics. Announcements from Instructor Ke Yu take precedence.

| # | Date | Description | Reading Material | Deadlines |
| --- | --- | --- | --- | --- |
| 1 | Tue Sep 8, 2026 | Course Overview + Shell + Environment Setup | [MIT: Course Overview + Introduction to the Shell](https://missing.csail.mit.edu/2026/course-shell/)<br>[MIT: Shell exercises](https://missing.csail.mit.edu/2026/course-shell/#exercises)<br>[MIT: Command-line Environment](https://missing.csail.mit.edu/2026/command-line-environment/)<br>[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html) |  |
| 2 | Tue Sep 15, 2026 | Agentic Coding + Vibe Coding + Multi-Agent Workflows | [MIT: Agentic Coding](https://missing.csail.mit.edu/2026/agentic-coding/)<br>[MIT: Beyond the Code](https://missing.csail.mit.edu/2026/beyond-code/)<br>[MIT: Development Environment and Tools](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT: Code Quality](https://missing.csail.mit.edu/2026/code-quality/) |  |
| 3 | Tue Sep 22, 2026 | Development Tools + Debugging + Git | [MIT: Development Environment and Tools](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT: Debugging and Profiling](https://missing.csail.mit.edu/2026/debugging-profiling/)<br>[MIT: Version Control and Git](https://missing.csail.mit.edu/2026/version-control/)<br>[Git Documentation](https://git-scm.com/doc) |  |
| 4 | Tue Oct 13, 2026 | Packaging + Reproducibility + Code Quality | [MIT: Packaging and Shipping Code](https://missing.csail.mit.edu/2026/shipping-code/)<br>[MIT: Code Quality](https://missing.csail.mit.edu/2026/code-quality/)<br>[Conda: Managing environments](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html)<br>[Python Packaging User Guide](https://packaging.python.org/en/latest/) |  |
| 5 | Tue Oct 20, 2026 | Python I: Programming Basics | [Python Tutorial](https://docs.python.org/3/tutorial/)<br>[Python Standard Library](https://docs.python.org/3/library/)<br>[NumPy: Quickstart](https://numpy.org/doc/stable/user/quickstart.html) |  |
| 6 | Tue Oct 27, 2026 | Python II: Data Analysis + Visualization | [pandas: Getting started](https://pandas.pydata.org/docs/getting_started/index.html)<br>[pandas: User Guide](https://pandas.pydata.org/docs/user_guide/index.html)<br>[Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/) |  |
| 7 | Tue Nov 3, 2026 | R I: Programming Basics | [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)<br>[R Language Definition](https://cran.r-project.org/doc/manuals/r-release/R-lang.html)<br>[R Manuals](https://cran.r-project.org/manuals.html) |  |
| 8 | Tue Nov 10, 2026 | R II: Tidy Data + Visualization | [R for Data Science](https://r4ds.hadley.nz/)<br>[dplyr Documentation](https://dplyr.tidyverse.org/)<br>[tidyr Documentation](https://tidyr.tidyverse.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/) |  |
| 9 | Tue Nov 17, 2026 | AI-Driven New Language Learning: Rust + Julia | [The Rust Programming Language](https://doc.rust-lang.org/book/)<br>[Rust by Example](https://doc.rust-lang.org/rust-by-example/)<br>[The Cargo Book](https://doc.rust-lang.org/cargo/)<br>[Julia Documentation](https://docs.julialang.org/en/v1/)<br>[Julia DataFrames](https://dataframes.juliadata.org/stable/) |  |
| 10 | Tue Nov 24, 2026 | Simple Visualization with Python and R | [Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/)<br>[Vega-Lite](https://vega.github.io/vega-lite/) |  |
| 11 | Tue Dec 1, 2026 | Metagenomics I: Basic Knowledge + Data Quality Control | [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)<br>[MultiQC](https://multiqc.info/)<br>[NCBI SRA Toolkit](https://github.com/ncbi/sra-tools) |  |
| 12 | Tue Dec 8, 2026 | Metagenomics II: Assembly + Binning + MAGs | [MEGAHIT](https://github.com/voutcn/megahit)<br>[MetaBAT 2](https://bitbucket.org/berkeleylab/metabat/src/master/README.md)<br>[CheckM2](https://github.com/chklovski/CheckM2)<br>[BASALT](https://github.com/PKU-EMBL/BASALT) |  |
| 13 | Tue Dec 15, 2026 | Metagenomics III: Taxonomic Annotation and Profiling | [Kraken 2 Manual](https://github.com/DerrickWood/kraken2/wiki/Manual)<br>[Bracken](https://ccb.jhu.edu/software/bracken/)<br>[MetaPhlAn](https://github.com/biobakery/MetaPhlAn)<br>[Sourmash](https://sourmash.readthedocs.io/) |  |
| 14 | Tue Dec 22, 2026 | Metagenomics IV: Functions Annotation + Diversity + Evolution | [HUMAnN](https://github.com/biobakery/humann)<br>[MetaCyc](https://metacyc.org/)<br>[phyloseq](https://doi.org/10.1371/journal.pcbi.1003531)<br>[vegan](https://cran.r-project.org/package=vegan)<br>[anvi'o Documentation](https://anvio.org/learn/) |  |
| 15 | Tue Dec 29, 2026 | Guest Lecture: Deep Learning (I) — [Shengwei Hou](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |
| 16 | Tue Jan 5, 2027 | Guest Lecture: Deep Learning (II) — [Shengwei Hou](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |

## Grading { #grading }

Assessment focuses on the project process and final delivery. Official weightings and deadlines published by the instructor take precedence over this overview.

- **Problem framing:** Define a clear research question, data scope, and limitation statement.
- **Methods and visualization:** Select methods, visual encodings, and statistical summaries that match the question.
- **Reproducibility:** Provide the environment, code, and run instructions needed to reproduce the result.
- **Communication:** Present the analysis in a clear README, technical report, and set of figures.
- **Collaboration:** Record contributions, version-control decisions, and team work.

Final project details are **to be announced**.

## Research Projects

Teams of 2–4 students will start from a real question and complete an original analysis. Project details: **To be announced.**

## Course Policies { #policies }

### Academic Integrity and AI Use

- Cite external ideas, code, data, figures, and generative tools.
- Submit only results that the team can explain and reproduce.

### Reproducibility and Data

- Include the environment, scripts, data-processing steps, and output locations.
- Never commit personal information, restricted data, credentials, or access tokens to a public repository.

### Communication with Course Staff

- Read the course documentation before raising general questions.
- Contact Instructor Ke Yu at [yuke.sz@pku.edu.cn](mailto:yuke.sz@pku.edu.cn) for course-specific questions.

## Further Information

- [Environment Setup](Prerequisites_guild.md)
- [Final Project](final-project.md)
- [Course repository](https://github.com/PKU-EMBL/Methodologies-of-Data-Visualization-and-Analysis)
