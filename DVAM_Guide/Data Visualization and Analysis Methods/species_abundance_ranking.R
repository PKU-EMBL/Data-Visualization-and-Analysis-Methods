# 加载所需包
library(tidyverse)
library(lubridate)
library(scales)
library(patchwork)
library(RColorBrewer)


# 1.物种丰度排名图 #

# ---------------------- 1.1 数据读取与预处理 ----------------------

# 读取数据
event_df <- read.csv("event.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
group_occur_df <- read.csv("groupOccurrence.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))

# 数据合并（通过eventID关联）
combined_df <- inner_join(group_occur_df, event_df, by = "eventID")

# 数据清洗
clean_df <- combined_df %>%
  # 筛选指定区域
  filter(sector %in% c("Atlantic", "EastPacific", "Indian", "WestPacific")) %>%
  # 过滤无效的个体数（非数值/负数/NA）
  mutate(individualCount = as.numeric(individualCount)) %>%
  filter(!is.na(individualCount), individualCount >= 0) %>%
  # 提取年份（可选，用于按年份分析）
  mutate(
    event_datetime = dmy_hm(start_eventTime), # 解析日/月/年 时:分格式
    year = year(event_datetime)               # 提取年份
  ) %>%
  # 保留核心字段
  select(scientificName, individualCount, sector, year)

# ---------------------- 1.2 数据准备（整体/分区/年份） ----------------------

# 1.2.1 整体+分区图数据（Top10物种）
# 按物种汇总整体丰度
total_species_abundance <- clean_df %>%
  group_by(scientificName) %>%
  summarise(total_individuals = sum(individualCount, na.rm = TRUE), .groups = "drop") %>%
  arrange(desc(total_individuals))

# 提取整体Top10物种
top10_species <- total_species_abundance %>%
  slice_head(n = 10) %>%
  pull(scientificName)

# 分区Top10数据
region_top10_data <- clean_df %>%
  filter(scientificName %in% top10_species) %>%
  group_by(scientificName, sector) %>%
  summarise(total_individuals = sum(individualCount, na.rm = TRUE), .groups = "drop") %>%
  arrange(sector, desc(total_individuals)) %>%
  mutate(scientificName = factor(scientificName, levels = rev(top10_species)))

# 1.2.2 年份图数据（Top4年份+各年Top10物种）
# 计算各年份总丰度，筛选Top4年份
yearly_total_abundance <- clean_df %>%
  group_by(year) %>%
  summarise(year_total_individuals = sum(individualCount, na.rm = TRUE), .groups = "drop") %>%
  arrange(desc(year_total_individuals))
top4_years <- yearly_total_abundance %>% slice_head(n = 4) %>% pull(year)

# Top4年份的物种丰度（各年Top10）
yearly_top10_data <- clean_df %>%
  filter(year %in% top4_years) %>%
  group_by(year, scientificName) %>%
  summarise(total_individuals = sum(individualCount, na.rm = TRUE), .groups = "drop") %>%
  group_by(year) %>%
  mutate(rank = row_number(desc(total_individuals))) %>%
  filter(rank <= 10) %>%
  ungroup()

# ---------------------- 1.3 绘制可视化图表 ----------------------
# 图1：整体物种丰度排名（Top10）横向条形图
p1 <- ggplot(
  total_species_abundance %>% slice_head(n = 10) %>% mutate(scientificName = factor(scientificName, levels = rev(.$scientificName))),
  aes(x = scientificName, y = total_individuals)
) +
  geom_col(fill = "#2E86AB", alpha = 0.8) +
  geom_text(aes(label = comma(total_individuals)), hjust = -0.1, size = 3) + # 添加数值标签
  scale_y_continuous(labels = comma_format(), expand = expansion(mult = c(0, 0.1))) +
  coord_flip() +
  labs(
    title = "Overall",
    x = "Scientific Name",
    y = "Total Individual Count"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    axis.text.y = element_text(size = 9),
    plot.margin = margin(0.5, 0.5, 0.5, 0.5, "cm")
  )

# 图2：分区域Top10物种丰度条形图
p2 <- ggplot(region_top10_data, aes(x = scientificName, y = total_individuals, fill = sector)) +
  geom_col(position = "dodge", alpha = 0.8) +
  # 坐标轴标签格式化（科学计数法）
  scale_y_continuous(labels = scientific_format()) +
  # 翻转坐标轴，便于阅读物种名
  coord_flip() +
  # 自定义颜色
  scale_fill_brewer(palette = "Set1", name = "Region") +
  # 标题和标签
  labs(
    title = "By Region",
    subtitle = "Myctobase Database: Mesopelagic Fish Survey",
    x = "Scientific Name",
    y = "Total Individual Count"
  ) +
  # 主题优化
  theme_minimal() +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    axis.text.y = element_text(size = 9),
    legend.position = "bottom",
    legend.title = element_text(size = 9),
    legend.text = element_text(size = 8),
    plot.margin = margin(0.5, 0.5, 0.5, 0.5, "cm")
  )

# 图3：分年份Top10物种横向条形图（颜色区分物种）
p3 <- ggplot(yearly_top10_data, aes(
  x = reorder(scientificName, total_individuals), # 分面内按丰度排序
  y = total_individuals, 
  fill = scientificName
)) +
  geom_col(alpha = 0.8, show.legend = FALSE) + # 隐藏图例（避免拥挤）
  # 按Top4年份分面，每行2个年份（适配4个年份的最优布局）
  facet_wrap(~year, ncol = 2, scales = "free_y") +
  coord_flip() +
  # 自定义颜色（区分度高，色盲友好）
  scale_fill_viridis_d(option = "mako", begin = 0.1, end = 0.9) +
  # 坐标轴格式化：大数用科学计数法，避免标签重叠
  scale_y_continuous(labels = scientific_format(), expand = expansion(mult = c(0, 0.1))) +
  # 标题和标签（突出Top4年份）
  labs(
    title = "Top 10 Most Abundant Species in 4 Highest-Abundance Years",
    x = "Scientific Name",
    y = "Total Individual Count",
    caption = "Data source: Myctobase (zenodo.org/records/6562776)"
  ) +
  # 主题优化（适配4个分面）
  theme_minimal() +
  theme(
    plot.title = element_text(size = 12, face = "bold", hjust = 0.5),
    strip.text = element_text(size = 10, face = "bold"), # 年份标签加粗
    axis.text.y = element_text(size = 8), # 物种名放大，提升可读性
    axis.text.x = element_text(size = 8), # 取消x轴文字旋转
    panel.spacing = unit(1, "cm"), # 增大分面间距
    plot.margin = margin(0.5, 0.5, 0.5, 0.5, "cm") # 调整图片边距
  )

# ---------------------- 1.4 组合三张图（上二下一） ----------------------
# 步骤1：左右组合p1和p2，添加顶部总标题
top_plots <- (p1 + p2) 
 
# 步骤2：上下组合（顶部组合图 + 年份图），调整高度比例
final_combined_plot <- top_plots / p3 +
  plot_layout(heights = c(1, 1.2))+# 年份图高度略高（1.2倍），适配4个分面
  plot_annotation(
    title = "Southern Ocean Mesopelagic Fish Species Abundance Analysis",
    subtitle = "Myctobase Database | Top 10 Species by Overall & Region & Key Years",
    theme = theme(
      plot.title = element_text(size = 16, face = "bold", hjust = 0.5),
      plot.subtitle = element_text(size = 12, hjust = 0.5, color = "#555555")
    )
  ) 

# ---------------------- 1.5 输出图表 ----------------------
# 分别显示图表
print(p1)
print(p2)
print(p3)

# 显示最终组合图
print(final_combined_plot)

# 保存图表（高分辨率）
ggsave(
  "Species Abundance Analysis.png",
  final_combined_plot,
  width = 16,  # 宽度适配左右两张图
  height = 14, # 高度适配上下布局（上部分+下部分）
  dpi = 300,
  bg = "white"
)


# 2.物种丰度年度折线图 & 季节对比柱形图 #

# ---------------------- 2.1 数据读取与预处理 ----------------------
# 读取数据
event_df <- read.csv("event.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))
group_occur_df <- read.csv("groupOccurrence.csv", stringsAsFactors = FALSE, na.strings = c("", "NA"))

# 数据合并（通过eventID关联）
combined_df <- inner_join(group_occur_df, event_df, by = "eventID")

# 数据清洗与时间解析（保留所有月份数据）
clean_df_full <- combined_df %>%
  # 转换核心字段为数值型
  mutate(
    individualCount = as.numeric(individualCount),
    # 解析日/月/年 时:分格式的时间
    event_datetime = dmy_hm(start_eventTime),
    # 提取年份和月份（保留所有月份）
    year = year(event_datetime),
    month = month(event_datetime),
    # 划分季节（仅标注，不过滤）
    season = case_when(
      month %in% c(12, 1, 2) ~ "Summer",
      month %in% c(6, 7, 8) ~ "Winter",
      TRUE ~ "Other" # 保留其他季节数据
    )
  ) %>%
  # 过滤有效数据（仅过滤无效丰度/时间，不过滤季节）
  filter(
    !is.na(individualCount), individualCount >= 0, # 有效丰度
    !is.na(year), !is.na(month)                   # 有效时间
  ) %>%
  # 保留核心字段
  select(scientificName, individualCount, year, month, season)

# 为季节动态图筛选仅夏冬季的数据（单独子集）
clean_df_season <- clean_df_full %>%
  filter(season %in% c("Summer", "Winter"))

# ---------------------- 2.2 筛选Top3物种+定义统一配色 ----------------------
# 筛选Top3物种（全量数据）
top3_species_df <- clean_df_full %>%
  group_by(scientificName) %>%
  summarise(total_individuals = sum(individualCount, na.rm = TRUE), .groups = "drop") %>%
  arrange(desc(total_individuals)) %>%
  slice_head(n = 3) %>%
  mutate(rank = row_number())

top3_species <- top3_species_df$scientificName
cat("前三名优势物种（全量数据）：\n")
for (i in 1:nrow(top3_species_df)) {
  cat(paste0("第", top3_species_df$rank[i], "名：", top3_species_df$scientificName[i], 
             "（总丰度：", comma(top3_species_df$total_individuals[i]), "）\n"))
}

# 定义统一的颜色映射（关键！保证两个图颜色一致）
# Set1配色前3个颜色 + 黑色（总丰度）
species_colors <- c(
  "Total" = "black",  # 总丰度固定为黑色
  setNames(brewer.pal(3, "Set1"), top3_species) # Top3物种对应Set1的3个颜色
)
# ---------------------- 2.3 数据汇总（年度趋势+季节动态） ----------------------
# 2.3.1 年度趋势数据（全量月份数据）
# 总丰度年度数据（所有月份）
yearly_total <- clean_df_full %>%
  group_by(year) %>%
  summarise(
    total_individuals = sum(individualCount, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(scientificName = "Total")

# Top3物种年度数据（所有月份）
yearly_top3 <- clean_df_full %>%
  filter(scientificName %in% top3_species) %>%
  group_by(year, scientificName) %>%
  summarise(
    total_individuals = sum(individualCount, na.rm = TRUE),
    .groups = "drop"
  )

# 合并年度趋势数据
yearly_data <- bind_rows(yearly_total, yearly_top3) %>%
  arrange(year, scientificName)

# 2.3.2 季节动态数据（仅夏冬季）
# 总丰度季节数据
seasonal_total <- clean_df_season %>%
  group_by(season) %>%
  summarise(
    total_individuals = sum(individualCount, na.rm = TRUE),
    .groups = "drop"
  ) %>%
  mutate(scientificName = "Total")

# Top3物种季节数据
seasonal_top3 <- clean_df_season %>%
  filter(scientificName %in% top3_species) %>%
  group_by(season, scientificName) %>%
  summarise(
    total_individuals = sum(individualCount, na.rm = TRUE),
    .groups = "drop"
  )

# 合并季节动态数据
seasonal_data <- bind_rows(seasonal_total, seasonal_top3) %>%
  mutate(season = factor(season, levels = c("Summer", "Winter")))

# ---------------------- 2.4 绘制可视化图表 ----------------------
# 2.4.1 年度趋势折线图（含所有月份数据）
yearly_trend_plot <- ggplot(yearly_data, aes(x = year, y = total_individuals, 
                                             color = scientificName, group = scientificName)) +
  # 折线+数据点
  geom_line(linewidth = 1.2) +
  geom_point(size = 2, alpha = 0.8) +
  # 丰度轴格式化（科学计数法）
  scale_y_continuous(labels = scientific_format(), limits = c(0, NA)) +
  # 自定义配色
  scale_color_manual(
    name = "Species",  # 图例名称与季节图一致
    values = species_colors
  ) +
  # 标题和标签
  labs(
    title = "Annual Trend of Mesopelagic Fish Abundance (1991-2019)",
    subtitle = "Total Abundance + Top 3 Dominant Species",
    x = "Year",
    y = "Total Individual Count",
    caption = "Data source: Myctobase (zenodo.org/records/6562776)"
  ) +
  # 主题优化
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.position = "bottom",  # 强制显示图例
    legend.title = element_text(size = 10, face = "bold"),
    panel.grid = element_line(color = "gray80", linewidth = 0.1)
  )

# 2.4.2 季节动态对比柱状图（仅夏冬季）
seasonal_bar_plot <- ggplot(seasonal_data, aes(x = season, y = total_individuals, fill = scientificName)) +
  # 分组柱状图
  geom_col(position = "dodge", alpha = 0.8, width = 0.7) +
  # 数值标签
  geom_text(
    aes(label = comma(total_individuals)),
    position = position_dodge(width = 0.7),
    vjust = -0.3, size = 3.5
  ) +
  # 丰度轴格式化
  scale_y_continuous(labels = comma_format()) +
  # 应用统一的颜色映射（柱状填充色）
  scale_fill_manual(
    name = "Species",  # 图例名称与年度图一致
    values = species_colors
  ) +
  # 分面
  facet_wrap(~scientificName, scales = "free_y", ncol = 2) +
  # 标题和标签
  labs(
    title = "Seasonal Dynamics of Mesopelagic Fish Abundance",
    subtitle = "Summer (Dec-Feb) vs Winter (Jun-Aug) | Southern Ocean",
    x = "Season",
    y = "Total Individual Count",
    caption = "Data source: Myctobase (zenodo.org/records/6562776)"
  ) +
  # 主题优化
  theme_minimal() +
  theme(
    plot.title = element_text(size = 14, face = "bold", hjust = 0.5),
    plot.subtitle = element_text(size = 12, hjust = 0.5),
    legend.position = "none",
    strip.text = element_text(size = 10, face = "italic"),
    panel.grid = element_line(color = "gray80", linewidth = 0.1)
  )

# ---------------------- 2.5 显示并保存图表 ----------------------
# 显示图表
print(yearly_trend_plot)
print(seasonal_bar_plot)

# 保存高清图表
ggsave(
  "yearly_abundance_trend.png",
  yearly_trend_plot,
  width = 12, height = 8, dpi = 300, bg = "white"
)

ggsave(
  "seasonal_abundance_dynamics.png",
  seasonal_bar_plot,
  width = 14, height = 10, dpi = 300, bg = "white"
)