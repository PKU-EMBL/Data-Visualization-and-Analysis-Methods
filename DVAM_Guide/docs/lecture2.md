# Lecture 02 · 跨语言工作流

<div class="dvam-lead" markdown>
Python 与 R 并不是互相替代的两套阵营。成熟的数据科学项目会根据任务选择生态，并通过稳定的数据结构、环境与接口把它们连接起来。
</div>

## 学习目标

- 理解 Python 与 R 在数据分析流程中的互补关系；
- 使用 DataFrame 作为跨工具协作的核心数据结构；
- 在 Positron 等统一环境中管理解释器、变量、图形与 Notebook；
- 使用 `rpy2` 在 Python 进程中调用 R，并控制数据转换边界；
- 为最终项目建立可维护的脚本、图形和报告工作流。

## 工具分工

| 任务 | Python 生态 | R 生态 | 选择建议 |
| --- | --- | --- | --- |
| 数据整理 | pandas、Polars | dplyr、tidyr | 依据数据规模与团队熟悉度 |
| 统计建模 | scipy、statsmodels | stats、lme4、survival | 复杂统计模型常优先查看 R 生态 |
| 机器学习 | scikit-learn、PyTorch | tidymodels、torch | 训练与部署通常更偏 Python |
| 可视化 | Matplotlib、Seaborn、Plotly | ggplot2、plotly | 语法体系不同，但均应遵循同一视觉原则 |
| 交互应用 | Streamlit、Dash、FastAPI | Shiny | 根据部署环境和团队维护能力选择 |

不要为了“同时使用两种语言”而增加复杂度。只有当另一生态提供明确的方法、包或表达优势时，跨语言调用才有价值。

## Positron：统一的数据科学界面

[Positron](https://positron.posit.co/) 面向 Python 与 R 数据科学工作流，提供解释器选择、Notebook、变量查看、图形面板与终端等能力。课程总结中将其作为跨语言分析环境进行介绍。

建议的项目会话顺序：

1. 打开项目根目录，而不是单独打开某个脚本；
2. 选择项目对应的 Python 解释器与 R；
3. 先运行环境检查，再加载数据；
4. 将探索性代码逐步整理到 `src/` 中；
5. 仅把能够重新生成的最终图表写入 `figures/`。

## DataFrame 是协作边界

跨语言工作流最容易出错的地方不是语法，而是数据类型转换：

| Python / pandas | R | 注意事项 |
| --- | --- | --- |
| `float64` | `numeric` | 缺失值与无穷值需单独检查 |
| `int64` | `integer` / `numeric` | 超大整数可能发生精度或类型变化 |
| `object` / `string` | `character` | 避免混合数字与字符串 |
| `category` | `factor` | 因子水平与顺序会影响建模和作图 |
| `datetime64` | `POSIXct` | 时区必须显式处理 |
| `bool` | `logical` | 检查缺失逻辑值 |

!!! tip "跨语言前先冻结数据契约"
    明确列名、类型、单位、类别水平和主键。比起在两个环境中反复修补类型，一个清晰的数据契约更可靠。

## 使用 rpy2

安装方式见 [环境准备](Prerequisites_guild.md)。以下示例在 Python 中创建数据，将其转换为 R DataFrame，调用 R 的 `aggregate()`，再转换回 pandas。

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

ro.globalenv["dvam_df"] = r_df
r_summary = ro.r(
    """
    aggregate(value ~ group, data = dvam_df, FUN = mean)
    """
)

with localconverter(converter):
    summary = ro.conversion.rpy2py(r_summary)

print(summary)
```

推荐使用局部转换上下文，而不是在整个进程中永久启用自动转换。这样可以让数据转换发生在明确位置，减少大型项目中的隐式行为。

!!! warning "运行前提"
    `rpy2` 依赖可用的 R 运行时。若 R 与 Python 来自不同环境，常见症状包括找不到共享库、包路径不一致或数据类型转换失败。

## 进阶可视化的四个层次

### 1. 展示原始结构

优先让读者看到数据量、分布和异常点。必要时使用透明度、抖动、分面或二维密度减少遮挡。

### 2. 展示统计摘要

均值、中位数、回归线和置信区间必须与研究问题相匹配。图中应明确不确定性代表什么，而不是使用无说明的误差条。

### 3. 组织多面板叙事

一个研究型图组通常遵循：

- Panel A：数据或研究设计；
- Panel B：主要发现；
- Panel C：稳健性、分层或机制解释；
- Panel D：限制、外部验证或应用。

面板之间应共享配色、变量命名、尺度逻辑与阅读方向。

### 4. 输出可复用结果

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

位图适合网页与演示，PDF / SVG 等矢量格式适合论文排版；具体格式还应考虑期刊、字体许可与下游编辑需求。

## 工作流建议

<div class="dvam-grid" markdown>

<div class="dvam-card" markdown>
### Explore

在 Notebook 中快速审计数据、验证变量关系和形成假设，但保留必要注释与随机种子。
</div>

<div class="dvam-card" markdown>
### Refactor

把重复逻辑整理为函数，把路径与参数集中管理，把数据处理从展示代码中分离。
</div>

<div class="dvam-card" markdown>
### Validate

检查数据泄漏、过拟合、批次效应、敏感性分析和跨平台可运行性。
</div>

<div class="dvam-card" markdown>
### Communicate

用 README 解释入口，用技术报告说明方法，用图表传达主要证据，用仓库保存可追踪过程。
</div>

</div>

## 课后练习

1. 用 pandas 创建一个至少包含数值列、类别列和缺失值的 DataFrame；
2. 将数据传入 R，按类别计算一个描述统计量；
3. 把结果转换回 Python 并绘图；
4. 记录转换前后的列类型；
5. 在 README 中说明为什么这一步值得使用跨语言方案。

完成后可继续阅读 [课程项目要求](final-project.md)，将方法组织成完整交付。
