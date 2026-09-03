---
hide:
  - toc
---

# 数据可视化与分析方法 { .course-site-title }

## 课程概览 { #intro }

**2026–2027 秋季学期**

本研究生课程介绍数据可视化与分析的实用方法，面向编程或计算研究经验较少的学生。课程从第二次课开始引入 AI 辅助可视化，并逐步讲解 Vibe Coding、多智能体工具、Linux 与命令行、开发环境、调试、版本控制、可复现环境和代码质量。随后安排 Python 与 R 各两次课，并用一节课快速了解 Rust 和 Julia。最后四次课聚焦宏基因组学，覆盖研究设计、质量控制、组装、分类与功能注释、多样性、宏基因组组装基因组（MAGs）以及交互式可视化。

学生将通过引导式练习和近期文献学习，在完成小型图表后开展完整分析，并将高级可视化连接到地球空间、大气科学与组学数据，最终以团队形式完成原创项目。AI 工具只能作为辅助；每位学生都需要检查生成的代码和图表，并对分析解释、数据隐私和结果可复现性负责。

## 课程团队 { #people }

### 任课教师 { #instructors }

<div class="course-people" markdown>
<article class="course-person" markdown>
<a href="https://see.pkusz.edu.cn/info/1012/1454.htm" target="_blank" rel="noopener"><img src="../img/ke-yu.png" alt="Ke Yu" class="course-person__photo" /></a>

### [Ke Yu](https://see.pkusz.edu.cn/info/1012/1454.htm)

任课教师<br>
[yuke.sz@pku.edu.cn](mailto:yuke.sz@pku.edu.cn)
</article>
</div>

### 课程助教 { #course-assistants }

<div class="course-people" markdown>
<article class="course-person" markdown>
<img src="../img/zhaorui-jiang.png" alt="Zhaorui Jiang" class="course-person__photo" />

### [Zhaorui Jiang](https://zhaorui-bi.github.io/)

课程助教
</article>
</div>

## 课程信息 { #logistics }

本研究生课程由 [Ke Yu](https://see.pkusz.edu.cn/info/1012/1454.htm) 授课，时间为每周二 08:30–11:30，地点为 C303，面向 2026–2027 秋季学期，限 80 人。

课前请完成[Environment Setup（环境配置）](../Prerequisites_guild.md)。

## 课程安排 { #schedule }

课程均在周二 08:30–11:30 于 C303 进行。第一次课介绍课程与环境，第二次课开始学习 AI 辅助可视化，随后覆盖计算工具、Python、R、Rust/Julia 和宏基因组学。课程安排可能根据任课教师通知调整。

| # | 日期 | 内容 | Reading Material | Deadlines |
| --- | --- | --- | --- | --- |
| 1 | 2026 年 9 月 8 日 | 课程概览 + Shell + 环境配置 | [MIT：课程概览与 Shell](https://missing.csail.mit.edu/2026/course-shell/)<br>[MIT：Shell 练习](https://missing.csail.mit.edu/2026/course-shell/#exercises)<br>[MIT：命令行环境](https://missing.csail.mit.edu/2026/command-line-environment/)<br>[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html) |  |
| 2 | 2026 年 9 月 15 日 | Agentic Coding + Vibe Coding + 多智能体工作流 | [MIT：Agentic Coding](https://missing.csail.mit.edu/2026/agentic-coding/)<br>[MIT：Beyond the Code](https://missing.csail.mit.edu/2026/beyond-code/)<br>[MIT：开发环境与工具](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT：代码质量](https://missing.csail.mit.edu/2026/code-quality/) |  |
| 3 | 2026 年 9 月 22 日 | 开发工具 + 调试 + Git | [MIT：开发环境与工具](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT：调试与性能分析](https://missing.csail.mit.edu/2026/debugging-profiling/)<br>[MIT：版本控制与 Git](https://missing.csail.mit.edu/2026/version-control/)<br>[Git Documentation](https://git-scm.com/doc) |  |
| 4 | 2026 年 10 月 13 日 | 打包 + 可复现性 + 代码质量 | [MIT：打包与发布代码](https://missing.csail.mit.edu/2026/shipping-code/)<br>[MIT：代码质量](https://missing.csail.mit.edu/2026/code-quality/)<br>[Conda：环境管理](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html)<br>[Python Packaging User Guide](https://packaging.python.org/en/latest/) |  |
| 5 | 2026 年 10 月 20 日 | Python I：编程基础 | [Python Tutorial](https://docs.python.org/3/tutorial/)<br>[Python Standard Library](https://docs.python.org/3/library/)<br>[NumPy：Quickstart](https://numpy.org/doc/stable/user/quickstart.html) |  |
| 6 | 2026 年 10 月 27 日 | Python II：数据分析 + 简单可视化 | [pandas：Getting started](https://pandas.pydata.org/docs/getting_started/index.html)<br>[pandas：User Guide](https://pandas.pydata.org/docs/user_guide/index.html)<br>[Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/) |  |
| 7 | 2026 年 11 月 3 日 | R I：编程基础 | [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)<br>[R Language Definition](https://cran.r-project.org/doc/manuals/r-release/R-lang.html)<br>[R Manuals](https://cran.r-project.org/manuals.html) |  |
| 8 | 2026 年 11 月 10 日 | R II：整洁数据 + 简单可视化 | [R for Data Science](https://r4ds.hadley.nz/)<br>[dplyr Documentation](https://dplyr.tidyverse.org/)<br>[tidyr Documentation](https://tidyr.tidyverse.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/) |  |
| 9 | 2026 年 11 月 17 日 | AI 驱动的新语言学习：Rust + Julia | [The Rust Programming Language](https://doc.rust-lang.org/book/)<br>[Rust by Example](https://doc.rust-lang.org/rust-by-example/)<br>[The Cargo Book](https://doc.rust-lang.org/cargo/)<br>[Julia Documentation](https://docs.julialang.org/en/v1/)<br>[Julia DataFrames](https://dataframes.juliadata.org/stable/) |  |
| 10 | 2026 年 11 月 24 日 | Python 与 R 的高级可视化 | [Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/)<br>[Vega-Lite](https://vega.github.io/vega-lite/)<br>[QGIS](https://github.com/qgis/QGIS)<br>[xarray Documentation](https://docs.xarray.dev/en/stable/)<br>[Cartopy Documentation](https://cartopy.readthedocs.io/stable/)<br>[GeoPandas Mapping](https://geopandas.org/en/stable/docs/user_guide/mapping.html)<br>[PyGMT Documentation](https://www.pygmt.org/latest/)<br>[MetPy Documentation](https://unidata.github.io/MetPy/latest/)<br>[Py-ART Documentation](https://arm-doe.github.io/pyart/)<br>[wrf-python Plotting Examples](https://wrf-python.readthedocs.io/en/main/plot.html)<br>[Iris Documentation](https://scitools-iris.readthedocs.io/en/stable/)<br>[scverse Getting Started](https://scverse.org/learn/)<br>[Scanpy Plotting](https://scanpy.scverse.org/en/stable/tutorials/plotting/index.html)<br>[OmicVerse Documentation](https://omicverse.readthedocs.io/en/latest/index.html)<br>[Vitessce Documentation](https://vitessce.io/docs/) |  |
| 11 | 2026 年 12 月 1 日 | 宏基因组学 I：基础知识 + 数据质量控制 | [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)<br>[MultiQC](https://multiqc.info/)<br>[NCBI SRA Toolkit](https://github.com/ncbi/sra-tools) |  |
| 12 | 2026 年 12 月 8 日 | 宏基因组学 II：组装 + 分箱 + MAGs | [MEGAHIT](https://github.com/voutcn/megahit)<br>[MetaBAT 2](https://bitbucket.org/berkeleylab/metabat/src/master/README.md)<br>[CheckM2](https://github.com/chklovski/CheckM2)<br>[BASALT](https://github.com/PKU-EMBL/BASALT) |  |
| 13 | 2026 年 12 月 15 日 | 宏基因组学 III：分类注释与群落 profiling | [Kraken 2 Manual](https://github.com/DerrickWood/kraken2/wiki/Manual)<br>[Bracken](https://ccb.jhu.edu/software/bracken/)<br>[MetaPhlAn](https://github.com/biobakery/MetaPhlAn)<br>[Sourmash](https://sourmash.readthedocs.io/) |  |
| 14 | 2026 年 12 月 22 日 | 宏基因组学 IV：功能注释 + 多样性 + 演化 | [HUMAnN](https://github.com/biobakery/humann)<br>[MetaCyc](https://metacyc.org/)<br>[phyloseq](https://doi.org/10.1371/journal.pcbi.1003531)<br>[vegan](https://cran.r-project.org/package=vegan)<br>[anvi'o Documentation](https://anvio.org/learn/) |  |
| 15 | 2026 年 12 月 29 日 | Guest Lecture：深度学习（一）— [侯圣伟](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |
| 16 | 2027 年 1 月 5 日 | Guest Lecture：深度学习（二）— [侯圣伟](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |

## 考核 { #grading }

课程考核关注项目过程与最终成果。任课教师发布的正式权重和时间安排优先于本页概览。

- **问题定义：** 明确研究问题、数据范围和局限性。
- **方法与可视化：** 选择与研究问题匹配的方法、视觉编码和统计摘要。
- **可复现性：** 提供可复现实验所需的环境、代码和运行说明。
- **表达与协作：** 通过 README、报告、图表和贡献记录清晰呈现分析。

Final Project 的具体要求**待公布**。

## Research Projects

学生将以 2–4 人团队围绕真实问题完成原创分析项目。项目详情：**待公布**。

## 课程政策 { #policies }

### 学术诚信与 AI 使用

- 引用外部观点、代码、数据、图表和生成式工具。
- 只提交团队能够解释并复现的结果。

### 可复现性与数据

- 记录环境、脚本、数据处理步骤和输出位置。
- 不要在公开仓库中提交个人信息、受限数据、凭据或访问令牌。

### 联系课程团队

- 提问前请先阅读课程文档。
- 课程问题请联系任课教师 [Ke Yu](mailto:yuke.sz@pku.edu.cn)。

## Further Information

- [Environment Setup（环境配置）](../Prerequisites_guild.md)
- [Final Project](../final-project.md)
- [课程仓库](https://github.com/PKU-EMBL/Methodologies-of-Data-Visualization-and-Analysis)
