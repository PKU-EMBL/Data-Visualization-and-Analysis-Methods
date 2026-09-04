---
hide:
  - toc
---

# 数据可视化与分析方法 { .course-site-title }

## 课程概览 { #intro }

**2026–2027 秋季学期**

本研究生课程介绍数据可视化与分析的实用方法，面向编程或计算研究经验较少的学生。第二次课开始学习 AI 辅助可视化，包括 Vibe Coding 和多智能体工作流。随后建立 Linux、命令行、开发环境、调试、版本控制、可复现环境和代码质量基础。Python 与 R 各安排两次课，再用一节课快速了解 Rust 和 Julia。最后四次课组成科研可视化与绘图系列，涵盖论文规范、视觉语法、矢量流程、地球与大气科学及组学工具，以及结合 MCP、SVG、可复用预设和分子可视化的 AI 辅助绘图。宏基因组学是其中一个应用场景。

学生通过引导式练习、近期文献和官方文档学习，先完成小型图表，再将高级可视化连接到地球空间、大气科学和组学数据，并以团队形式完成原创项目。AI 工具用于辅助学习，不能替代理解。每位学生都需要检查生成的代码和图表，并对分析解释、数据隐私和结果可复现性负责。

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

本研究生课程由 [Ke Yu](https://see.pkusz.edu.cn/info/1012/1454.htm) 授课。课程安排在 2026–2027 秋季学期，每周二 08:30–11:30 于 C303 上课，限 80 人。

课前请完成[Environment Setup（环境配置）](../Prerequisites_guild.md)。

## 课程安排 { #schedule }

课程均在周二 08:30–11:30 于 C303 进行。课程从 AI 辅助可视化和计算基础开始，随后学习 Python、R、Rust/Julia 与高级可视化。最后四次课组成科研可视化与绘图系列，使用地球、大气、组学和蛋白质数据作为领域示例。课程安排以任课教师通知为准。

| # | 日期 | 内容 | Reading Material | Deadlines |
| --- | --- | --- | --- | --- |
| 1 | 2026 年 9 月 8 日 | 课程概览 + Shell + 环境配置 | [MIT：课程概览与 Shell](https://missing.csail.mit.edu/2026/course-shell/)<br>[MIT：Shell 练习](https://missing.csail.mit.edu/2026/course-shell/#exercises)<br>[MIT：命令行环境](https://missing.csail.mit.edu/2026/command-line-environment/)<br>[Bash Reference Manual](https://www.gnu.org/software/bash/manual/bash.html) |  |
| 2 | 2026 年 9 月 15 日 | Agentic Coding + Vibe Coding + 多智能体工作流 | [MIT：Agentic Coding](https://missing.csail.mit.edu/2026/agentic-coding/)<br>[MIT：Beyond the Code](https://missing.csail.mit.edu/2026/beyond-code/)<br>[MIT：开发环境与工具](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT：代码质量](https://missing.csail.mit.edu/2026/code-quality/) |  |
| 3 | 2026 年 9 月 22 日 | 开发工具 + 调试 + Git | [MIT：开发环境与工具](https://missing.csail.mit.edu/2026/development-environment/)<br>[MIT：调试与性能分析](https://missing.csail.mit.edu/2026/debugging-profiling/)<br>[MIT：版本控制与 Git](https://missing.csail.mit.edu/2026/version-control/)<br>[Git Documentation](https://git-scm.com/doc) |  |
| 4 | 2026 年 10 月 13 日 | 打包 + 可复现性 + 代码质量 | [MIT：打包与发布代码](https://missing.csail.mit.edu/2026/shipping-code/)<br>[MIT：代码质量](https://missing.csail.mit.edu/2026/code-quality/)<br>[Conda：环境管理](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html)<br>[Python Packaging User Guide](https://packaging.python.org/en/latest/) |  |
| 5 | 2026 年 10 月 20 日 | Python I：编程基础 | [Python Tutorial](https://docs.python.org/3/tutorial/)<br>[Python Standard Library](https://docs.python.org/3/library/)<br>[NumPy：Quickstart](https://numpy.org/doc/stable/user/quickstart.html) |  |
| 6 | 2026 年 10 月 27 日 | Python II：数据分析 + 简单可视化 | [pandas：Getting started](https://pandas.pydata.org/docs/getting_started/index.html)<br>[pandas：User Guide](https://pandas.pydata.org/docs/user_guide/index.html)<br>[Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/) |  |
| 7 | 2026 年 11 月 3 日 | R I：编程基础 | [An Introduction to R](https://cran.r-project.org/doc/manuals/r-release/R-intro.html)<br>[R Language Definition](https://cran.r-project.org/doc/manuals/r-release/R-lang.html)<br>[R Manuals](https://cran.r-project.org/manuals.html) |  |
| 8 | 2026 年 11 月 10 日 | R II：数据框 + 简单可视化 | [R for Data Science](https://r4ds.hadley.nz/)<br>[dplyr Documentation](https://dplyr.tidyverse.org/)<br>[tidyr Documentation](https://tidyr.tidyverse.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/) |  |
| 9 | 2026 年 11 月 17 日 | AI 驱动的新语言学习：Rust + Julia | [The Rust Programming Language](https://doc.rust-lang.org/book/)<br>[Rust by Example](https://doc.rust-lang.org/rust-by-example/)<br>[The Cargo Book](https://doc.rust-lang.org/cargo/)<br>[Julia Documentation](https://docs.julialang.org/en/v1/)<br>[Julia DataFrames](https://dataframes.juliadata.org/stable/) |  |
| 10 | 2026 年 11 月 24 日 | Python 与 R 的高级可视化 | [Matplotlib Documentation](https://matplotlib.org/stable/)<br>[Seaborn Documentation](https://seaborn.pydata.org/)<br>[ggplot2 Documentation](https://ggplot2.tidyverse.org/)<br>[Vega-Lite](https://vega.github.io/vega-lite/)<br>[QGIS](https://github.com/qgis/QGIS)<br>[xarray Documentation](https://docs.xarray.dev/en/stable/)<br>[Cartopy Documentation](https://cartopy.readthedocs.io/stable/)<br>[GeoPandas Mapping](https://geopandas.org/en/stable/docs/user_guide/mapping.html)<br>[PyGMT Documentation](https://www.pygmt.org/latest/)<br>[MetPy Documentation](https://unidata.github.io/MetPy/latest/)<br>[Py-ART Documentation](https://arm-doe.github.io/pyart/)<br>[wrf-python Plotting Examples](https://wrf-python.readthedocs.io/en/main/plot.html)<br>[Iris Documentation](https://scitools-iris.readthedocs.io/en/stable/)<br>[scverse Getting Started](https://scverse.org/learn/)<br>[Scanpy Plotting](https://scanpy.scverse.org/en/stable/tutorials/plotting/index.html)<br>[OmicVerse Documentation](https://omicverse.readthedocs.io/en/latest/index.html)<br>[Vitessce Documentation](https://vitessce.io/docs/) |  |
| 11 | 2026 年 12 月 1 日 | 科研可视化与绘图系列（I）：论文发表规范 + 视觉语法 | [Nature Figure Guide](https://research-figure-guide.nature.com/)<br>[Nature：Preparing figures](https://research-figure-guide.nature.com/figures/preparing-figures-our-specifications/)<br>[Matplotlib：Choosing colormaps](https://matplotlib.org/stable/users/explain/colors/colormaps.html)<br>[ColorBrewer](https://colorbrewer2.org/) |  |
| 12 | 2026 年 12 月 8 日 | 科研可视化与绘图系列（II）：Illustrator + PowerPoint + BioRender + SVG | [Adobe Illustrator drawing tools](https://www.adobe.com/learn/illustrator/web/drawing-tools-basics)<br>[PowerPoint flow charts](https://support.microsoft.com/en-us/office/add-a-flow-chart-to-a-slide-in-powerpoint)<br>[BioRender templates](https://www.biorender.com/templates)<br>[MDN SVG](https://developer.mozilla.org/en-US/docs/Web/SVG)<br>[Inkscape Manual](https://inkscape-manuals.readthedocs.io/en/latest/) |  |
| 13 | 2026 年 12 月 15 日 | 科研可视化与绘图系列（III）：领域可视化，地球 + 大气 + 组学 | [QGIS](https://github.com/qgis/QGIS)<br>[xarray Documentation](https://docs.xarray.dev/en/stable/)<br>[Cartopy Documentation](https://cartopy.readthedocs.io/stable/)<br>[PyGMT Documentation](https://www.pygmt.org/latest/)<br>[MetPy Documentation](https://unidata.github.io/MetPy/latest/)<br>[Py-ART Documentation](https://arm-doe.github.io/pyart/)<br>[scverse Getting Started](https://scverse.org/learn/)<br>[Scanpy Plotting](https://scanpy.scverse.org/en/stable/tutorials/plotting/index.html)<br>[OmicVerse Documentation](https://omicverse.readthedocs.io/en/latest/index.html)<br>[Vitessce Documentation](https://vitessce.io/docs/) |  |
| 14 | 2026 年 12 月 22 日 | 科研可视化与绘图系列（IV）：AI 辅助绘图，MCP + SVG + 蛋白质预设 | [MCP Tools](https://modelcontextprotocol.org/specification/2025-06-18/server/tools)<br>[MCP TypeScript SDK](https://ts.sdk.modelcontextprotocol.io/v2/)<br>[SVG Reference](https://developer.mozilla.org/en-US/docs/Web/SVG/Reference)<br>[ChimeraX User Guide](https://www.cgl.ucsf.edu/chimerax/docs/user/index.html)<br>[ChimeraX Preset command](https://www.cgl.ucsf.edu/chimerax/docs/user/commands/preset.html)<br>[Mol* Viewer](https://molstar.org/viewer-docs/)<br>[RCSB Protein Data Bank](https://www.rcsb.org/) |  |
| 15 | 2026 年 12 月 29 日 | Guest Lecture：深度学习（一）· [侯圣伟](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |
| 16 | 2027 年 1 月 5 日 | Guest Lecture：深度学习（二）· [侯圣伟](https://www.sustech.edu.cn/zh/faculties/houshengwei.html) |  |  |

## 考核 { #grading }

课程考核关注项目过程与最终成果。任课教师发布的正式权重和时间安排优先于本页概览。

- **问题定义：** 明确研究问题、数据范围和局限性。
- **方法与可视化：** 选择与研究问题匹配的方法、视觉编码和统计摘要。
- **可复现性：** 提供复现结果所需的环境、代码和运行说明。
- **表达与协作：** 通过 README、报告、图表和贡献记录清晰呈现分析。

Final Project 的具体要求**待公布**。

## Research Projects

学生将以 2–4 人团队围绕真实问题完成原创分析。项目详情：**待公布**。

## 课程政策 { #policies }

### Token 使用政策

- 研究项目所需的 Token 由学生自行承担费用。
- 参与研究项目的学生必须保持可用的 Token 访问权限。没有 Token 的学生应立即退课。
- 课程课堂中的 AI 演示与练习全程使用 DeepSeek-V4-Flash。
- 不需要 `tokenmaxxing`。更多 Token 不等于更好的结果；预算应服务于明确的问题、清晰的约束和可靠的验收。
- **个人观点：** Token 是 AI 时代的实验耗材。亲自使用，才能形成对成本、质量和延迟的判断。真正稀缺的不是 Token，而是值得花 Token 的问题、清晰的约束和可靠的验收标准。

### 学术诚信与 AI 使用

- 引用外部观点、代码、数据、图表和生成式工具。
- 只提交团队能够解释并复现的结果。

### 可复现性与数据

- 记录环境、脚本、数据处理步骤和输出位置。
- 不要在公开仓库中提交个人信息、受限数据、凭据或访问令牌。

### 联系课程团队

- 提问前请先阅读课程文档。
- 课程问题请联系任课教师 [Ke Yu](mailto:yuke.sz@pku.edu.cn)。

## 更多信息

- [Environment Setup（环境配置）](../Prerequisites_guild.md)
- [Final Project](../final-project.md)
- [课程仓库](https://github.com/PKU-EMBL/Methodologies-of-Data-Visualization-and-Analysis)
