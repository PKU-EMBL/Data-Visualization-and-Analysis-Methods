# 基于Myctobase数据库的南大洋中层鱼类采样数据特征分析研究

## 项目简介
# 南大洋中层鱼类生态数据分析系统
本项目是一个完整的R数据分析工作流，用于处理、分析和可视化南大洋中层鱼类生态数据。系统包含三个核心分析模块：

1. **Alpha多样性分析** - 计算和可视化物种多样性指数及其空间分布
2. **体长-体重关系分析** - 研究主要鱼类的异速生长关系
3. **物种丰度动态分析** - 分析物种丰度的时空变化模式

## 数据来源

- **主要数据源**：**Myctobase数据库 (https://zenodo.org/records/6562776)**
- **数据记录**：Zenodo数据库记录 6562776
- **时间跨度**：1991-2019年
- **地理范围**：南大洋四大海区（大西洋、东太平洋、印度洋、西太平洋）
- **数据文件**：
- **1.event.csv**：记录采样事件的元数据，包含4780个采样网次的信息，包括采样地点、采样方法、采样时间等。  
- **2.groupOccurrence.csv**：记录了17,491条物种出现与丰度的详细数据，提供了不同物种的出现频率与相对丰度。  
- **3.individualOccurrence.csv**：记录每个个体的详细测量数据，包括体长、体重、性别、生活阶段等信息，是物种形态学分析的重要基础。
## 系统要求

### 软件环境
- **R版本**：≥ 4.0.0
- **RStudio**：≥ 1.4.0（推荐）
- **操作系统**：Windows 10/11, macOS 10.14+, Linux Ubuntu 18.04+
### 运行分析

多样性及丰度图表运行完整脚本：多样性与丰度.R 或在RStudio中逐段执行

## 输出结果

多样性指数表格：alpha_diversity.csv

地图图像文件（PNG格式）

统计图表（PNG格式）

## 数据可视化

### 可视化工具

**R（version 4.5.2）**

### 硬件建议
- **内存**：≥ 8GB RAM
- **存储**：≥ 1GB可用空间
- **显示器**：支持1920×1080分辨率，用于高分辨率图表显示

## 安装配置

### 1. 配置CRAN镜像源（中国用户推荐）
```r
chooseCRANmirror()
options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
```

### 2. 安装必需R包

#### 基础数据包
```r
install.packages(c("tidyverse", "vegan", "dplyr", "ggplot2", "tidyr", "permute"))
install.packages("mapdata")
install.packages("patchwork")
install.packages("viridis", type = "binary")
```

#### 扩展功能包
```r
# Windows用户建议使用二进制包
install.packages("xml2", type = "binary")
install.packages("tidyverse", type = "binary")
install.packages("readxl", type = "binary")
install.packages("ggrepel", type = "binary")
install.packages("patchwork", type = "binary")

# 其他依赖包
install.packages(c("scales", "ggpubr", "naniar", "lubridate", "RColorBrewer"))
```

### 3. 更新现有包
```r
# 更新所有相关包
install.packages(c("ggplot2", "tidyverse", "scales", "rlang", "cli", "pillar"))

# 或更新所有已安装的包
update.packages(ask = FALSE, checkBuilt = TRUE)
```

## 模块一：Alpha多样性分析

### 功能概述
计算南大洋中层鱼类物种的Alpha多样性指数，并进行空间可视化：
- **物种丰富度** (Species Richness)
- **Shannon多样性指数**
- **Simpson指数**
- **Pielou均匀度指数**

### 数据要求
- `event.csv` - 采样事件数据（需包含经纬度信息）
- `groupOccurrence.csv` - 物种出现数据

### 运行代码
```r
# 运行完整分析
source("1.Sampling point distribution map.R")
source("2.α-diversity and richness graph group.R")
```

### 输出文件
| 文件名称 | 描述 | 尺寸 | 格式 |
|---------|------|------|------|
| `Antarctic sampling points.png` | 采样站点分布图 | 10×10英寸 | PNG |
| `Map of species richness distribution.png` | 物种丰富度空间分布 | 12×8英寸 | PNG |
| `Map of Shannon index distribution.png` | Shannon指数空间分布 | 12×8英寸 | PNG |
| `Comparative map of diversity distribution.png` | 多样性对比图 | 16×7英寸 | PNG |
| `Heatmap of sampling site density.png` | 采样密度热图 | 12×8英寸 | PNG |
| `species_richness_distribution.png` | 物种丰富度分布直方图 | 10×6英寸 | PNG |
| `Species richness distribution across sectors.png` | 各扇区丰富度分布 | 10×6英寸 | PNG |
| `Relationship between species richness and Shannon index.png` | 丰富度与Shannon指数关系图 | 10×6英寸 | PNG |
| `Analysis of α-diversity in Southern Ocean mesopelagic fish.png` | 多样性分析综合图 | 10×6英寸 | PNG |
| `sector_comparison_with_stats.png` | 扇区比较统计图 | 14×7英寸 | PNG |

### 核心算法
```r
# 物种丰富度计算
species_richness <- specnumber(species_matrix)

# Shannon多样性指数
shannon_index <- diversity(species_matrix, index = "shannon")

# Simpson指数
simpson_index <- diversity(species_matrix, index = "simpson")

# Pielou均匀度指数
pielou_evenness <- ifelse(species_richness > 0, shannon_index / log(species_richness), 0)
```

## 模块二：物种丰度动态分析

### 功能概述
分析南大洋中层鱼类物种丰度的时空变化模式：
1. **物种丰度排名** - 识别最丰富的物种
2. **区域分布** - 比较四大海区的物种组成
3. **时间动态** - 分析年度趋势和季节性变化

### 数据要求
- `event.csv` - 采样事件元数据
- `groupOccurrence.csv` - 物种出现记录

### 运行代码
```r
# 运行完整分析
source("3.Species abundance plot group.R")
```

### 子模块2.1：物种丰度排名分析

#### 功能特点
- 识别全球Top10最丰富物种
- 按四大海区分区比较
- 按最高丰度年份分年度分析

#### 输出文件
- **Species Abundance Analysis.png**：综合排名图表
  - 尺寸：16×14英寸，300 DPI
  - 格式：PNG（透明背景）

#### 图表内容
1. **A面板**：全球Top10物种条形图
2. **B面板**：四大海区物种丰度比较
3. **C面板**：Top4年份的物种丰度分面图

### 子模块2.2：物种丰度时间动态分析

#### 功能特点
- 1991-2019年连续时间序列分析
- 识别Top3优势物种
- 夏季（12月-2月）vs 冬季（6月-8月）对比

#### 输出文件
1. **yearly_abundance_trend.png**：年度趋势折线图
   - 尺寸：12×8英寸
   - 显示：总丰度 + Top3物种

2. **seasonal_abundance_dynamics.png**：季节动态柱状图
   - 尺寸：14×10英寸
   - 显示：夏冬季对比 + 物种分面

### 核心算法
```r
# Top10物种筛选
total_species_abundance <- clean_df %>%
  group_by(scientificName) %>%
  summarise(total_individuals = sum(individualCount, na.rm = TRUE)) %>%
  arrange(desc(total_individuals))

# Top4年份筛选
yearly_total_abundance <- clean_df %>%
  group_by(year) %>%
  summarise(year_total_individuals = sum(individualCount, na.rm = TRUE)) %>%
  arrange(desc(year_total_individuals))

top4_years <- yearly_total_abundance %>% 
  slice_head(n = 4) %>% 
  pull(year)
```

## 模块三：体长-体重关系分析

### 功能概述
分析南大洋四种丰度最高的中层鱼类的体长-体重关系，探索鱼类生长模式：
- **线性回归模型** - 建立体长与体重的统计关系
- **物种间比较** - 对比不同物种的生长策略
- **可视化** - 生成高质量散点图与回归线

### 数据要求
- `individualOccurrence.csv` - 个体数据（需包含体长和体重信息）
- 必需字段：
  - `scientificName`: 物种学名
  - `standard_length`: 标准长度（毫米）
  - `weight`: 体重（克）

### 运行代码
```r
# 运行完整分析
source("4.Species morphological characteristic group.R")
```

### 输出文件
| 文件名称 | 描述 | 尺寸 | 格式 |
|---------|------|------|------|
| `Length-Weight_Relationship(Combined).png` | 前4物种体长-体重关系散点图（合并视角） | 12×8英寸 | PNG |
| `Length-Weight_Relationship(Faceted).png` | 前4物种体长-体重关系散点图（单物种视角） | 14×10英寸 | PNG |
| `Body_length_distribution_by_life_stage.png` | 前4物种不同生活阶段的体长分布箱线图 | 14×8英寸 | PNG |
| `body_weight_distribution_by_sex.png` | 前4物种不同性别的体重分布小提琴图 | 14×8英寸 | PNG |

### 核心算法
```r
# 选择丰度最高的4个物种
top4_species <- fish_data %>%
  count(scientificName) %>%
  top_n(4, n) %>%
  pull(scientificName)

# 线性回归分析
linear_models <- lapply(top4_species, function(sp) {
  data_subset <- filter(fish_data, scientificName == sp)
  lm(log(weight) ~ log(standard_length), data = data_subset)
})
```

### 统计指标
1. **回归斜率**：反映生长速率，斜率>1表示正异速生长
2. **R²值**：表示体长解释体重变异的比例
3. **置信区间**：表示回归系数的可靠性
4. **物种间比较**：通过比较不同物种的回归线了解生长策略差异


## 数据预处理流程

### 通用数据清洗步骤
```r
# 核心处理步骤
combined_df <- inner_join(group_occur_df, event_df, by = "eventID")

clean_df <- combined_df %>%
  filter(sector %in% c("Atlantic", "EastPacific", "Indian", "WestPacific")) %>%
  mutate(individualCount = as.numeric(individualCount)) %>%
  filter(!is.na(individualCount), individualCount >= 0)
```

### 时间解析
```r
# 解析日期时间格式
clean_df <- clean_df %>%
  mutate(
    event_datetime = dmy_hm(start_eventTime),
    year = year(event_datetime),
    month = month(event_datetime),
    season = case_when(
      month %in% c(12, 1, 2) ~ "Summer",
      month %in% c(6, 7, 8) ~ "Winter",
      TRUE ~ "Other"
    )
  )
```

## 可视化配置

### 统一颜色方案
```r
# Set1调色板（色盲友好）
species_colors <- c(
  "Total" = "black",
  setNames(brewer.pal(3, "Set1"), top3_species)
)

# 多样性地图颜色梯度
create_color_palette <- function(n) {
  colorRampPalette(c("blue", "cyan", "green", "yellow", "red"))(n)
}
```

### 自定义主题
```r
theme_custom <- theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5, color = "#555555"),
    legend.position = "bottom",
    legend.title = element_text(size = 10, face = "bold"),
    panel.grid = element_line(color = "gray80", linewidth = 0.1),
    axis.text = element_text(size = 9),
    strip.text = element_text(size = 10, face = "bold")
  )
```

## 输出配置

### 图表尺寸标准
| 图表类型 | 宽度(英寸) | 高度(英寸) | DPI | 背景 |
|---------|-----------|-----------|-----|------|
| 综合排名图 | 16 | 14 | 300 | 透明 |
| 年度趋势图 | 12 | 8 | 300 | 白色 |
| 季节动态图 | 14 | 10 | 300 | 白色 |
| 多样性地图 | 12-16 | 7-8 | 300 | 透明 |
| 体长-体重图 | 12 | 8 | 300 | 白色 |

### 保存设置
```r
ggsave(
  "output_file.png",
  plot_object,
  width = 12,
  height = 8,
  dpi = 300,
  bg = "white"
)
```

## 质量控制

### 数据验证
1. **完整性检查**：验证eventID匹配率
2. **数值有效性**：过滤负值和NA值
3. **时间范围**：确认1991-2019年数据覆盖
4. **地理范围**：限制在四大海区
5. **单位一致性**：确保体长为毫米，体重为克

### 可视化验证
1. **颜色一致性**：确保跨图表配色统一
2. **标签可读性**：优化物种名显示
3. **比例合理性**：使用科学计数法处理大数值
4. **图例清晰度**：提供明确的图例说明
5. **统计显著性**：标注p值和置信区间

## 扩展功能

### 可选分析模块
1. **物种多样性指数**：计算Shannon、Simpson指数
2. **地理热点分析**：识别高丰度区域
3. **物种关联分析**：探索物种共现模式
4. **气候变化响应**：分析温度与丰度的关系
5. **群落结构分析**：使用NMDS、PCA等排序方法

### 数据输出选项
```r
# 导出分析结果
write.csv(analysis_results, "species_abundance_summary.csv", row.names = FALSE)
write.csv(temporal_trends, "yearly_trends.csv", row.names = FALSE)
write.csv(diversity_indices, "alpha_diversity_results.csv", row.names = FALSE)
write.csv(length_weight_models, "growth_models_summary.csv", row.names = FALSE)
```

## 故障排除

### 常见问题及解决方案

#### 1. 包安装失败
```r
# 解决方案
install.packages("包名", dependencies = TRUE)
# 或使用二进制包
install.packages("包名", type = "binary")
```

#### 2. 内存不足错误
```r
# 清理内存
rm(list = ls())
gc()

# 分批处理数据
chunk_size <- 100000
data_chunks <- split(original_data, 
                     ceiling(seq_along(original_data)/chunk_size))
```

#### 3. 日期解析错误
```r
# 检查日期格式
head(event_df$start_eventTime)

# 尝试不同解析函数
event_datetime <- parse_date_time(start_eventTime, 
                                  orders = c("dmy HM", "ymd HM", "mdy HM"))
```

#### 4. 地图无法显示
```r
# 检查地图包
print(paste("maps版本:", packageVersion("maps")))
print(paste("mapdata版本:", packageVersion("mapdata")))

# 重新下载地图数据
maps::map("world", fill = TRUE, col = "white")
```

#### 5. 颜色显示问题
```r
# 检查调色板
RColorBrewer::display.brewer.all()

# 使用替代配色
scale_color_viridis_d(option = "mako")
```

### 调试模式
```r
# 启用详细输出
debug_mode <- TRUE

if(debug_mode) {
  print(paste("数据行数:", nrow(clean_df)))
  print(paste("物种数:", length(unique(clean_df$scientificName))))
  print(paste("时间范围:", min(clean_df$year), "-", max(clean_df$year)))
  print("数据预览:")
  print(head(clean_df, 5))
  
  # 检查坐标数据
  print(paste("有效坐标样本:", sum(!is.na(clean_df$latitude))))
}
```
## 小组成员

- **马欣雨 2501212915**

- **周楠 2501212938**

- **郑婷玮 2501212910**

## 参考文献

### 数据引用
> Myctobase Database. (2022). Southern Ocean Mesopelagic Fish Survey Data. Zenodo. https://doi.org/10.5281/zenodo.6562776

### 方法参考文献



## 许可证

本项目采用**MIT开源许可证**。

### 主要条款
1. 允许商业使用、修改、分发
2. 允许私人使用
3. 必须保留版权声明
4. 不提供任何担保

## 🔒 License
* See [LICENSE](LICENSE) for details.

## 扩展功能
可根据需要修改：
1. 调整地图范围和分辨率
2. 添加新的多样性指数
3. 自定义颜色方案
4. 增加统计检验方法
5. 支持其他数据格式  
## ✒️ Citation

```bibtex
@misc{PKU-EMBL_DataVis,
  author       = {{PKU-EMBL}},
  title        = {Data Visualization and Analysis Methods},
  year         = {2024},
  publisher    = {GitHub},
  journal      = {GitHub repository},
  howpublished = {\url{https://github.com/PKU-EMBL/Data-Visualization-and-Analysis-Methods}},
  note         = {Accessed: 2024-05-20}
}
```

