# 工具与资源索引

<div class="dvam-lead" markdown>
本页按分析任务整理官方文档与课程常用资源。外部工具会持续更新，安装参数与 API 请以官方页面为准。
</div>

## 环境与开发

| 工具 | 用途 | 官方入口 |
| --- | --- | --- |
| Conda | 跨平台环境与依赖管理 | [Managing environments](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html) |
| Python Packaging | venv、pip 与包管理基础 | [Packaging User Guide](https://packaging.python.org/en/latest/) |
| JupyterLab | Notebook 与交互式计算 | [JupyterLab Documentation](https://jupyterlab.readthedocs.io/) |
| Positron | Python / R 数据科学 IDE | [Positron Documentation](https://positron.posit.co/) |
| Git | 版本控制 | [Git Documentation](https://git-scm.com/doc) |
| GitHub | 协作、Issue 与 Pull Request | [GitHub Docs](https://docs.github.com/) |

## Python 数据栈

| 工具 | 适用任务 | 官方入口 |
| --- | --- | --- |
| NumPy | 数组与数值计算 | [NumPy Documentation](https://numpy.org/doc/) |
| pandas | 表格数据整理与分析 | [pandas Documentation](https://pandas.pydata.org/docs/) |
| SciPy | 科学计算与统计函数 | [SciPy Documentation](https://docs.scipy.org/doc/scipy/) |
| Matplotlib | 底层绘图与精细排版 | [Matplotlib Documentation](https://matplotlib.org/stable/) |
| Seaborn | 统计可视化 | [Seaborn Documentation](https://seaborn.pydata.org/) |
| scikit-learn | 传统机器学习与评估 | [User Guide](https://scikit-learn.org/stable/user_guide.html) |

## R 与跨语言

| 工具 | 适用任务 | 官方入口 |
| --- | --- | --- |
| R | 统计计算环境 | [R Manuals](https://cran.r-project.org/manuals.html) |
| ggplot2 | Grammar of Graphics 可视化 | [ggplot2 Documentation](https://ggplot2.tidyverse.org/) |
| dplyr | 数据变换 | [dplyr Documentation](https://dplyr.tidyverse.org/) |
| tidyr | Tidy data 整理 | [tidyr Documentation](https://tidyr.tidyverse.org/) |
| rpy2 | Python 中调用 R | [rpy2 Documentation](https://rpy2.github.io/doc/latest/html/) |

## 数据发现

- [Database Commons](https://ngdc.cncb.ac.cn/databasecommons/)：生命科学数据库目录；
- [MIBiG](https://mibig.secondarymetabolites.org/)：已知生物合成基因簇资源；
- [BiG-FAM](https://bigfam.bioinformatics.nl/home)：生物合成基因簇家族数据库；
- 各学科政府开放数据、国际组织数据门户与论文补充数据。

### 数据集筛选清单

选择数据前至少确认：

- [ ] 能否合法获取、分析和再分发
- [ ] 是否有稳定标识、版本或下载日期
- [ ] 样本量和变量能够回答研究问题
- [ ] 是否存在数据字典、方法说明与引用方式
- [ ] 缺失、偏差和采样范围是否可评估
- [ ] 团队能够在课程周期内完成清洗与分析

## 图表审阅清单

| 维度 | 核心问题 |
| --- | --- |
| Purpose | 读者第一眼应该比较什么？ |
| Data | 样本量、单位和缺失处理是否可见或可查？ |
| Encoding | 图形通道是否适合任务并保持一致语义？ |
| Uncertainty | 不确定性来源和统计含义是否明确？ |
| Accessibility | 字号、对比度与色觉差异是否得到考虑？ |
| Reproducibility | 图能否由仓库中的代码重新生成？ |

如需开始实践，请先完成 [环境准备](../Prerequisites_guild.md)；如需组织团队交付，请阅读 [课程项目](../final-project.md)。
