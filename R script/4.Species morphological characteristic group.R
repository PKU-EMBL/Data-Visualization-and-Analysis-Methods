# 安装绘图和数据处理包
options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
install.packages("ggplot2")
install.packages("xml2", type = "binary")
install.packages("tidyverse", type = "binary")
install.packages(c("scales"))
install.packages(c("ggpubr"))
install.packages(c("naniar"))
install.packages("ggrepel", type = "binary") # 避免标签重叠
install.packages("patchwork", type = "binary") # 组合图表

# 加载包
library(ggplot2)
library(tidyverse)    # 核心绘图与数据处理
library(scales)       # 数据缩放与格式调整
library(ggpubr)       # 图表组合与美化
library(naniar)       # 缺失值处理
library(ggrepel)     # 美化标签
library(patchwork)   # 组合多图


# 1. 前4物种体长 - 体重关系散点图（合并视角）#

# ===================== 1.1 数据预处理（让数据更集中） =====================
# 读取数据（替换为你的实际文件路径）
data <- read_csv("individualOccurrence.csv", show_col_types = FALSE)

# 定义前4物种
top4_species <- c(
  "Krefftichthys anderssoni",
  "Electrona antarctica",
  "Notothenia coriiceps",
  "Protomyctophum tenisoni"
)

# 数据清洗+裁剪极端值（核心：剔除体长/体重的极端值，让点更集中）
plot_data <- data %>%
  filter(scientificName %in% top4_species) %>%
  mutate(standard_length = as.numeric(standard_length)) %>%
  # 过滤空值/负数值
  filter(!is.na(standard_length) & !is.na(weight) & weight > 0) %>%
  # 裁剪极端值（保留99%的核心数据，剔除极偏的点）
  filter(
    standard_length < quantile(standard_length, 0.99, na.rm = TRUE),
    weight < quantile(weight, 0.99, na.rm = TRUE)
  )

# ===================== 1.2 绘制散点图 =====================
ggplot(plot_data, aes(x = standard_length, y = weight)) +
  # 散点层：调整大小/透明度，避免重叠，区分度更高
  geom_point(
    aes(color = scientificName, shape = scientificName),
    alpha = 0.7,  # 透明度：避免点密集时糊成一团
    size = 2.5,    # 点大小：更清晰
    stroke = 0.5   # 点轮廓：增强辨识度
  ) +
  # 回归线层：加粗线条，浅色置信区间
  geom_smooth(
    aes(color = scientificName),
    method = "lm", 
    se = TRUE, 
    alpha = 0.2,   # 置信区间透明度
    linewidth = 1.2, # 回归线加粗
    show.legend = FALSE # 回归线不重复出现在图例
  ) +
  # 字体/标签优化（核心：放大+醒目）
labs(
  title = "Length-Weight Relationship of Top 4 Southern Ocean Fish Species",
  subtitle = "Combined View for Cross-Species Comparison",
  x = "Standard Length (mm)",
  y = "Weight (g)",
  color = "Species",
  shape = "Species"
) +
  # 主题美化
theme_minimal() +
  theme(
    # 标题：放大+居中+加粗
    plot.title = element_text(
      size = 18, face = "bold", hjust = 0.5, margin = margin(b = 10)
    ),
    plot.subtitle = element_text(
      size = 14, hjust = 0.5, color = "#666666", margin = margin(b = 15)
    ),
    # 坐标轴标题：放大+加粗
    axis.title.x = element_text(size = 16, face = "bold", margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, face = "bold", margin = margin(r = 10)),
    # 坐标轴标签：放大
    axis.text.x = element_text(size = 14, color = "#333333"),
    axis.text.y = element_text(size = 14, color = "#333333"),
    # 图例：放大+右对齐+调整间距
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = "right",
    legend.spacing.y = unit(0.5, "cm"),
    # 网格线：浅灰色，更柔和
    panel.grid.major = element_line(color = "#e0e0e0", linewidth = 0.5),
    panel.grid.minor = element_line(color = "#f0f0f0", linewidth = 0.3),
    # 背景：纯白色，更干净
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA)
  ) +
  # 配色优化（专业+区分度高）
scale_color_brewer(palette = "Set2", drop = FALSE) +
  scale_shape_discrete(drop = FALSE) +
  # 坐标轴范围微调（让数据更集中）
coord_cartesian(
  xlim = c(0, max(plot_data$standard_length, na.rm = TRUE) * 1.02),
  ylim = c(0, max(plot_data$weight, na.rm = TRUE) * 1.02),
  expand = FALSE # 取消坐标轴默认的留白，让数据更紧凑
)

# ===================== 1.3 保存高清图片 =====================
ggsave(
  filename = "Length-Weight_Relationship(Combined).png",
  width = 12, height = 8, dpi = 300, bg = "white"
)

cat("图1已保存！文件名为：Length-Weight_Relationship(Combined).png")


# 2.前4物种体长-体重关系分面图（单物种视角）#

# ===================== 2.1 数据预处理=====================
# 读取数据（替换为你的实际文件路径）
data <- read_csv("individualOccurrence.csv", show_col_types = FALSE)

# 定义前4物种
top4_species <- c(
  "Krefftichthys anderssoni",
  "Electrona antarctica",
  "Notothenia coriiceps",
  "Protomyctophum tenisoni"
)

# 数据清洗+裁剪极端值（核心：剔除体长/体重极端值，分面展示更集中）
plot_data <- data %>%
  filter(scientificName %in% top4_species) %>%
  mutate(
    standard_length = as.numeric(standard_length),
    weight = as.numeric(weight)
  ) %>%
  # 过滤空值/负体重
  filter(!is.na(standard_length) & !is.na(weight) & weight > 0) %>%
  # 裁剪极端值（保留99%核心数据，避免极偏点拉宽坐标轴）
  filter(
    standard_length < quantile(standard_length, 0.99, na.rm = TRUE),
    weight < quantile(weight, 0.99, na.rm = TRUE)
  ) %>%
  # 统一物种名称格式（分面标题更整洁）
  mutate(scientificName = factor(scientificName, levels = top4_species))

# ===================== 2.2 绘制分面图 =====================
ggplot(plot_data, aes(x = standard_length, y = weight)) +
  # 散点层：调整大小/透明度，避免重叠
  geom_point(
    color = "#2c7fb8", # 统一散点颜色（分面内无需区分物种）
    alpha = 0.7,
    size = 2,
    stroke = 0.3
  ) +
  # 回归线层：加粗+浅置信区间
  geom_smooth(
    method = "lm",
    se = TRUE,
    color = "#d95f02", # 回归线对比色
    alpha = 0.2,
    linewidth = 1.2
  ) +
  # 分面：按物种分面，2行2列（布局紧凑）
  facet_wrap(~scientificName, nrow = 2, ncol = 2) +
  # 字体/标签优化（和前三幅图完全统一）
labs(
  title = "Length-Weight Relationship of Top 4 Fish Species",
  subtitle = "Faceted View for Single-Species Detail Analysis (Core 99% Data)",
  x = "Standard Length (mm)",
  y = "Weight (g)"
) +
  # 主题美化（风格和前三幅图统一）
theme_minimal() +
  theme(
    # 总标题：放大+居中+加粗，字号和前三幅一致
    plot.title = element_text(
      size = 18, face = "bold", hjust = 0.5, margin = margin(b = 10)
    ),
    plot.subtitle = element_text(
      size = 14, hjust = 0.5, color = "#666666", margin = margin(b = 15)
    ),
    # 坐标轴标题：放大+加粗
    axis.title.x = element_text(size = 16, face = "bold", margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, face = "bold", margin = margin(r = 10)),
    # 坐标轴标签：放大（分面内字体仍清晰）
    axis.text.x = element_text(size = 12, color = "#333333"),
    axis.text.y = element_text(size = 12, color = "#333333"),
    # 分面标题（物种名）：放大+斜体+加粗
    strip.text = element_text(
      size = 14, face = "bold.italic", color = "#222222", margin = margin(5,0,5,0)
    ),
    # 分面边框：浅灰色，增强分隔感
    strip.background = element_rect(fill = "#f8f8f8", color = "#e0e0e0"),
    # 网格线：浅灰色，柔和不抢焦点
    panel.grid.major = element_line(color = "#e0e0e0", linewidth = 0.5),
    panel.grid.minor = element_line(color = "#f0f0f0", linewidth = 0.3),
    # 背景：纯白色，和前三幅图统一
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    # 分面间距：调整为适中，避免过挤/过松
    panel.spacing = unit(1, "cm")
  ) +
  # 坐标轴范围微调（让数据更集中）
coord_cartesian(
  xlim = c(0, max(plot_data$standard_length, na.rm = TRUE) * 1.02),
  ylim = c(0, max(plot_data$weight, na.rm = TRUE) * 1.02),
  expand = FALSE # 取消坐标轴留白，数据更紧凑
)

# ===================== 2.3 保存高清图片 =====================
ggsave(
  filename = "Length-Weight_Relationship(Faceted).png",
  width = 14, height = 10, dpi = 300, bg = "white"
)

cat("图2已保存！文件名为：Length-Weight_Relationship(Faceted).png")


# 3.前4物种不同生活阶段的体长分布箱线图 #

# ===================== 3.1 数据预处理 =====================
# 读取数据（替换为你的实际文件路径）
data <- read_csv("individualOccurrence.csv", show_col_types = FALSE)

# 定义前4物种
top4_species <- c(
  "Krefftichthys anderssoni",
  "Electrona antarctica",
  "Notothenia coriiceps",
  "Protomyctophum tenisoni"
)

# 数据清洗+裁剪极端值（核心：剔除体长极端值，让箱线图更集中）
plot_data <- data %>%
  filter(scientificName %in% top4_species) %>%
  mutate(standard_length = as.numeric(standard_length)) %>%
  # 过滤空值/无效生活阶段
  filter(!is.na(standard_length) & !is.na(lifeStage) & lifeStage != "") %>%
  # 裁剪体长极端值（保留99%核心数据）
  filter(standard_length < quantile(standard_length, 0.99, na.rm = TRUE))

# ===================== 3.2 绘制箱线图 =====================
ggplot(plot_data, aes(x = scientificName, y = standard_length)) +
  # 箱线图层：优化样式，增强区分度
  geom_boxplot(
    aes(fill = lifeStage),
    alpha = 0.8,        # 透明度：避免颜色过艳
    width = 0.7,        # 箱线宽度：更协调
    outlier.size = 1,   # 异常点大小：清晰但不突兀
    outlier.color = "#333333", # 异常点颜色：深灰
    linewidth = 0.8     # 箱线轮廓：加粗
  ) +
  # 字体/标签优化（和第一幅图统一风格）
labs(
  title = "Body Length Distribution by Life Stage for Top 4 Fish Species",
  subtitle = "Boxplot of Standard Length Across Life Stages",
  x = "Fish Species",
  y = "Standard Length (mm)",
  fill = "Life Stage"
) +
  # 主题美化
theme_minimal() +
  theme(
    # 标题：放大+居中+加粗，和第一幅图统一字号
    plot.title = element_text(
      size = 18, face = "bold", hjust = 0.5, margin = margin(b = 10)
    ),
    plot.subtitle = element_text(
      size = 14, hjust = 0.5, color = "#666666", margin = margin(b = 15)
    ),
    # 坐标轴标题：放大+加粗
    axis.title.x = element_text(size = 16, face = "bold", margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, face = "bold", margin = margin(r = 10)),
    # 坐标轴标签：放大，物种名斜体（生物学规范）
    axis.text.x = element_text(
      size = 14, color = "#333333", face = "italic", angle = 0, hjust = 0.5
    ),
    axis.text.y = element_text(size = 14, color = "#333333"),
    # 图例：放大+右对齐+调整间距
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = "right",
    legend.spacing.y = unit(0.5, "cm"),
    # 网格线：浅灰色，更柔和
    panel.grid.major = element_line(color = "#e0e0e0", linewidth = 0.5),
    panel.grid.minor = element_line(color = "#f0f0f0", linewidth = 0.3),
    # 背景：纯白色
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA)
  ) +
  # 配色优化（和第一幅图风格统一）
scale_fill_brewer(palette = "Pastel1", drop = FALSE) +
  # 坐标轴范围微调（让数据更集中）
coord_cartesian(
  ylim = c(0, max(plot_data$standard_length, na.rm = TRUE) * 1.02),
  expand = FALSE # 取消坐标轴留白，数据更紧凑
)

# ===================== 3.3 保存高清图片 =====================
ggsave(
  filename = "Body_length_distribution_by_life_stage.png",
  width = 14, height = 8, dpi = 300, bg = "white"
)

cat("图3已保存！文件名为：Body_length_distribution_by_life_stage.png")


# 4.前4物种不同性别的体重分布小提琴图 #

# ===================== 4.1 数据预处理 =====================
# 读取数据（替换为你的实际文件路径）
data <- read_csv("individualOccurrence.csv", show_col_types = FALSE)

# 定义前4物种
top4_species <- c(
  "Krefftichthys anderssoni",
  "Electrona antarctica",
  "Notothenia coriiceps",
  "Protomyctophum tenisoni"
)

# 数据清洗+裁剪极端值（核心：仅保留有效性别+剔除体重极端值）
plot_data <- data %>%
  filter(scientificName %in% top4_species) %>%
  mutate(weight = as.numeric(weight)) %>%
  # 过滤空值/负体重/无效性别（仅保留F/雌性、M/雄性）
  filter(
    !is.na(weight) & weight > 0,
    !is.na(sex) & sex %in% c("F", "M")
  ) %>%
  # 裁剪体重极端值（保留99%核心数据，避免极偏点拉宽坐标轴）
  filter(weight < quantile(weight, 0.99, na.rm = TRUE))

# ===================== 4.2 绘制小提琴图 =====================
ggplot(plot_data, aes(x = scientificName, y = weight)) +
  # 小提琴图层：优化样式，增强层次感
  geom_violin(
    aes(fill = sex),
    alpha = 0.8,        # 透明度：柔和不刺眼
    width = 0.8,        # 小提琴宽度：协调不拥挤
    linewidth = 0.6,    # 轮廓线加粗：增强边界感
    position = position_dodge(width = 0.9) # 分组错开：避免重叠
  ) +
  # 箱线图层（叠加在小提琴图内，展示统计特征）
  geom_boxplot(
    aes(color = sex),
    width = 0.2,        # 箱线宽度：不遮挡小提琴图
    outlier.size = 0.8, # 异常点大小：清晰但不突兀
    position = position_dodge(width = 0.9),
    show.legend = FALSE # 箱线图不重复出现在图例
  ) +
  # 字体/标签优化（和前两幅图完全统一）
labs(
  title = "Body Weight Distribution by Sex for Top 4 Fish Species",
  subtitle = "Violin Plot with Boxplot (Core 99% Data)",
  x = "Fish Species",
  y = "Weight (g)",
  fill = "Sex",
  color = "Sex"
) +
  # 主题美化（风格和前两幅图统一）
theme_minimal() +
  theme(
    # 标题：放大+居中+加粗，字号和前两幅一致
    plot.title = element_text(
      size = 18, face = "bold", hjust = 0.5, margin = margin(b = 10)
    ),
    plot.subtitle = element_text(
      size = 14, hjust = 0.5, color = "#666666", margin = margin(b = 15)
    ),
    # 坐标轴标题：放大+加粗
    axis.title.x = element_text(size = 16, face = "bold", margin = margin(t = 10)),
    axis.title.y = element_text(size = 16, face = "bold", margin = margin(r = 10)),
    # 坐标轴标签：放大，物种名斜体（生物学规范）
    axis.text.x = element_text(
      size = 14, color = "#333333", face = "italic", angle = 0, hjust = 0.5
    ),
    axis.text.y = element_text(size = 14, color = "#333333"),
    # 图例：放大+右对齐+调整间距
    legend.title = element_text(size = 14, face = "bold"),
    legend.text = element_text(size = 12),
    legend.position = "right",
    legend.spacing.y = unit(0.5, "cm"),
    # 网格线：浅灰色，柔和不抢焦点
    panel.grid.major = element_line(color = "#e0e0e0", linewidth = 0.5),
    panel.grid.minor = element_line(color = "#f0f0f0", linewidth = 0.3),
    # 背景：纯白色，和前两幅图统一
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA)
  ) +
  # 配色优化（柔和+区分度高）
scale_fill_manual(values = c("#66c2a5", "#fc8d62"), drop = FALSE) + # F/M 柔和配色
  scale_color_manual(values = c("#2c7fb8", "#d95f02"), drop = FALSE) + # 箱线轮廓对比色
  # 坐标轴范围微调（让数据更集中）
coord_cartesian(
  ylim = c(0, max(plot_data$weight, na.rm = TRUE) * 1.02),
  expand = FALSE # 取消坐标轴留白，数据更紧凑
)

# ===================== 4.3 保存高清图片 =====================
ggsave(
  filename = "body_weight_distribution_by_sex.png",
  width = 14, height = 8, dpi = 300, bg = "white"
)

cat("图4已保存！文件名为：body_weight_distribution_by_sex.png")