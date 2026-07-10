# Lecture 01 · 从数据到证据

<div class="dvam-lead" markdown>
本讲建立课程的核心分析框架：先澄清研究问题与数据结构，再选择统计摘要和视觉编码，最后形成能够被复核的结论。
</div>

## 学习目标

<div class="dvam-grid" markdown>

<div class="dvam-card" markdown>
### 问题建模

把宽泛主题转化为可检验的问题，明确分析单位、比较对象、响应变量与潜在混杂因素。
</div>

<div class="dvam-card" markdown>
### 数据审计

检查数据类型、缺失值、重复记录、异常值、单位与采样偏差，建立对数据质量的基本判断。
</div>

<div class="dvam-card" markdown>
### 图形选择

根据任务选择位置、长度、颜色、面积等视觉通道，并理解不同图表的适用边界。
</div>

<div class="dvam-card" markdown>
### 证据表达

让图题、坐标、图例、注释与不确定性共同支撑结论，而不是依赖装饰性效果。
</div>

</div>

## 分析闭环

```mermaid
flowchart LR
    A["Research Question"] --> B["Data Audit"]
    B --> C["Transform & Summarize"]
    C --> D["Visualize"]
    D --> E["Validate"]
    E --> F["Communicate"]
    F -. "new question" .-> A
```

一套成熟的分析流程通常不是线性的。可视化会暴露数据问题，验证会迫使我们重新定义指标，而表达过程也会检验结论是否真正清晰。

## 从研究主题到分析问题

“空气质量”“生物多样性”或“材料性能”只是主题，还不是可执行的问题。一个可分析的问题至少应回答四件事：

| 要素 | 需要回答的问题 | 示例 |
| --- | --- | --- |
| Analysis unit | 每一行代表什么？ | 城市—日期、样本—基因、材料—实验条件 |
| Outcome | 希望解释或预测什么？ | PM2.5、物种丰富度、CO₂ 吸附量 |
| Comparison | 哪些组别、时间或条件需要比较？ | 季节、处理组、材料类别 |
| Context | 哪些变量可能影响解释？ | 温度、批次、测量平台、空间位置 |

!!! example "把宽泛主题改写为问题"
    主题：“研究城市空气质量。”

    问题：“在控制季节与气象条件后，北京不同功能区的 PM2.5 水平是否存在稳定差异？这种差异在 2020–2025 年间如何变化？”

后一个表述明确了响应变量、比较维度、时间范围和潜在混杂因素，因此能够直接指导数据整理与图表设计。

## 数据结构与质量

### Tidy data

推荐把分析表整理为：

- 每个变量占一列；
- 每个观测占一行；
- 每类观测单位形成一张表；
- 列名稳定、单位明确、类别编码一致。

### 最小数据审计

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

这段检查不会自动判断数据是否“正确”，但能够快速暴露结构性问题。对异常值的处理必须结合采样与测量背景，不能仅凭箱线图或固定阈值直接删除。

## 视觉任务与图表选择

| 分析任务 | 优先考虑 | 谨慎使用 |
| --- | --- | --- |
| 比较大小 | 点图、条形图、区间图 | 3D 柱状图、面积不等的图标 |
| 查看分布 | 直方图、密度图、箱线图 + 原始点 | 只报告均值、不展示样本量 |
| 分析关系 | 散点图、回归线、二维密度 | 双 Y 轴、未经解释的平滑曲线 |
| 观察时间 | 折线图、事件标记、置信区间 | 类别顺序混乱的折线 |
| 展示组成 | 堆叠条形图、小倍图 | 类别过多的饼图 |
| 表达空间 | 分级设色图、点位图 | 未标准化人口或面积的原始计数地图 |

视觉编码的基本优先级通常是：**共同尺度上的位置 > 长度 > 角度 / 斜率 > 面积 > 颜色强度**。这不是绝对规则，但可以帮助你避免把精确比较交给不擅长精确判断的视觉通道。

## 一个透明的比较图

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

与只画均值条形图相比，“分布摘要 + 原始点”同时保留了中心趋势、离散程度和样本量信息。正式报告中还应说明数据来源、重复类型以及所采用的统计检验。

## 图形完整性

提交图表前逐项检查：

1. **尺度**：坐标变换是否必要并已说明？条形图是否从零开始？
2. **样本**：是否展示样本量、重复类型和缺失处理？
3. **不确定性**：误差条表示 SD、SE 还是 CI？
4. **颜色**：颜色是否具有语义？黑白打印和色觉差异下是否仍可区分？
5. **文字**：标题是否给出发现，而不是只重复变量名？
6. **来源**：数据、方法与图形生成代码是否可追踪？

!!! warning "相关不等于因果"
    散点图、相关系数或预测模型可以描述关联，但不能单独证明因果关系。结论强度必须与研究设计、数据质量和模型假设相匹配。

## 课后练习

选择一个公开表格数据集，完成以下交付：

- 一段不超过 80 字的研究问题；
- 一张数据字典，至少包含变量名、类型、单位与缺失说明；
- 一张展示分布的图和一张展示关系的图；
- 每张图配一条“结论 + 限制”说明；
- 提交可重新运行的 Notebook 或脚本。

下一讲将进一步讨论 [Python / R 跨语言工作流与进阶可视化](lecture2.md)。
