---
hide:
  - toc
---

# Methodologies of Data Visualization and Analysis { .course-site-title }

## Course Overview { #intro }

**Fall 2026–2027**

This graduate course builds practical foundations for data visualization and analysis. It is designed for students who may be new to programming or computational research. We begin with the tools that make analysis possible: Linux and the command line, files and processes, shell pipelines, editors, version control, project environments, and reproducible workflows. Students then learn Python and R step by step, moving from basic syntax to data frames, tidy data, visual encoding, statistical summaries, and clear figures.

The second half applies these skills to biological data, with an emphasis on metagenomics. We will work with sequencing reads, contigs, metagenome-assembled genomes, taxonomic profiles, functional annotations, and compositional data. Students will use Python and R to build and critique visualizations, document their decisions, and complete an original team project. After the core foundations, the course introduces Agentic Coding and Vibe Coding as practical tools for explanation, drafting, debugging, and workflow automation. We emphasize understanding, code quality, privacy, and verification rather than dependence on agents.

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

This is a **graduate-level course** taught by **Ke Yu**. It meets every **Tuesday, 08:30–11:30**, in **C303** during **Fall 2026–2027**, with an enrollment cap of **80 students**.

Before the first meeting, complete the [prerequisites and environment setup](Prerequisites_guild.md).

## Schedule { #schedule }

Lectures meet on Tuesdays from 08:30 to 11:30 in C303. The schedule follows a foundation-first sequence: command-line tools, programming, reproducible workflows, visualization, and then metagenomics applications. Announcements from Instructor Ke Yu take precedence.

| # | Date | Description | Reading Material | Deadlines |
| --- | --- | --- | --- | --- |
| 1 | Tue Sep 8, 2026 | Course Overview + Introduction to the Shell | [MIT: Course Overview + Introduction to the Shell](https://missing.csail.mit.edu/2026/course-shell/)<br>[MIT: Shell exercises](https://missing.csail.mit.edu/2026/course-shell/#exercises) |  |
| 2 | Tue Sep 15, 2026 | Command-line Environment: files, paths, pipes, and data streams | [MIT: Command-line Environment](https://missing.csail.mit.edu/2026/command-line-environment/)<br>[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html) |  |
| 3 | Tue Sep 22, 2026 | Development Environment and Tools: editors, terminals, notebooks, and help | [MIT: Development Environment and Tools](https://missing.csail.mit.edu/2026/development-environment/)<br>[JupyterLab Documentation](https://jupyterlab.readthedocs.io/)<br>[Positron Documentation](https://positron.posit.co/) |  |
| 4 | Tue Oct 13, 2026 | Debugging and Profiling: reading errors, checking assumptions, and finding bottlenecks | [MIT: Debugging and Profiling](https://missing.csail.mit.edu/2026/debugging-profiling/)<br>[Python: `pdb` debugger](https://docs.python.org/3/library/pdb.html) |  |
| 5 | Tue Oct 20, 2026 | Version Control with Git and GitHub | [MIT: Version Control and Git](https://missing.csail.mit.edu/2026/version-control/)<br>[Git Documentation](https://git-scm.com/doc)<br>[GitHub: Hello World](https://docs.github.com/en/get-started/start-your-journey/hello-world) |  |
| 6 | Tue Oct 27, 2026 | Reproducible Environments and Packaging: Conda, venv, and project structure | [MIT: Packaging and Shipping Code](https://missing.csail.mit.edu/2026/shipping-code/)<br>[Conda: Managing environments](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html)<br>[Python Packaging User Guide](https://packaging.python.org/en/latest/) |  |
| 7 | Tue Nov 3, 2026 | Python Foundations for Data Analysis: types, functions, files, and DataFrames | [Python Tutorial](https://docs.python.org/3/tutorial/)<br>[NumPy: Quickstart](https://numpy.org/doc/stable/user/quickstart.html)<br>[pandas: Getting started](https://pandas.pydata.org/docs/getting_started/index.html) |  |
| 8 | Tue Nov 10, 2026 | R Foundations, Tidy Data, and Visual Encoding | [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)<br>[R for Data Science](https://r4ds.hadley.nz/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/) |  |
| 9 | Tue Nov 17, 2026 | Data Wrangling, Statistical Summaries, and Figure Integrity across Python and R | [pandas: User Guide](https://pandas.pydata.org/docs/user_guide/index.html)<br>[dplyr Documentation](https://dplyr.tidyverse.org/)<br>[SciPy Statistics](https://docs.scipy.org/doc/scipy/reference/stats.html)<br>[Matplotlib Documentation](https://matplotlib.org/stable/) |  |
| 10 | Tue Nov 24, 2026 | Code Quality: tests, review, documentation, and reproducible figures | [MIT: Code Quality](https://missing.csail.mit.edu/2026/code-quality/)<br>[Seaborn Documentation](https://seaborn.pydata.org/)<br>[R Packages](https://r-pkgs.org/) |  |
| 11 | Tue Dec 1, 2026 | Agentic Coding and Vibe Coding for Scientific Workflows | [MIT: Agentic Coding](https://missing.csail.mit.edu/2026/agentic-coding/)<br>[MIT: Development Environment and Tools](https://missing.csail.mit.edu/2026/development-environment/) |  |
| 12 | Tue Dec 8, 2026 | Beyond the Code: communication, collaboration, automation, and responsible tool use | [MIT: Beyond the Code](https://missing.csail.mit.edu/2026/beyond-code/)<br>[GitHub Documentation](https://docs.github.com/) |  |
| 13 | Tue Dec 15, 2026 | Metagenomics Data: reads, contigs, MAGs, and quality control | [QIIME 2 Documentation](https://docs.qiime2.org/)<br>[Kraken 2 Manual](https://github.com/DerrickWood/kraken2/wiki/Manual)<br>[FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) |  |
| 14 | Tue Dec 22, 2026 | Taxonomic, Functional, and Diversity Visualization for Metagenomics | [MetaPhlAn](https://github.com/biobakery/MetaPhlAn)<br>[HUMAnN](https://github.com/biobakery/humann)<br>[phyloseq](https://doi.org/10.1371/journal.pcbi.1003531)<br>[anvi'o Documentation](https://anvio.org/learn/) |  |
| 15 | Tue Dec 29, 2026 | Guest Lecture: Deep Learning for Scientific Data (I) — [Shengwei Hou](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |
| 16 | Tue Jan 5, 2027 | Guest Lecture: Deep Learning for Scientific Data (II) — [Shengwei Hou](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |

## Grading { #grading }

Assessment focuses on the project process and final delivery. Official weightings and deadlines published by the instructor take precedence over this overview.

- **Problem framing:** a clear, answerable research question with an explicit data scope and limitation statement;
- **Method and visualization:** methods, visual encodings, and statistical interpretation that match the question;
- **Reproducibility:** an environment, code, and run instructions that allow another reader to reproduce the result;
- **Communication:** a clear, honest README, technical report, and set of figures;
- **Collaboration:** transparent contributions, version control, and team decisions.

Final Project: **To be announced.**

## Research Projects

Teams of 2–4 students will work from a real question and complete an original analysis. Project details: **To be announced.**

## Course Policies { #policies }

### Academic Integrity and AI Use

- Cite external ideas, code, data, figures, and generative tools;
- submit only results that the team can explain and reproduce.

### Reproducibility and Data

- Include the environment, scripts, data-processing steps, and output locations;
- never commit personal information, restricted data, credentials, or access tokens to a public repository.

### Communication with Course Staff

- Read the course documentation before raising general questions;
- contact Instructor Ke Yu at [yuke.sz@pku.edu.cn](mailto:yuke.sz@pku.edu.cn) for course-specific questions.

## Further Information

- [Prerequisites](Prerequisites_guild.md)
- [Final Project](final-project.md)
- [Course repository](https://github.com/PKU-EMBL/Methodologies-of-Data-Visualization-and-Analysis)
