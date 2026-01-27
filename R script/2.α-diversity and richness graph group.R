# 安装包（注释掉已安装的部分，避免重复安装）
# install.packages(c("tidyverse", "vegan", "dplyr", "ggplot2", "tidyr", "permute"))
# install.packages("mapdata")
# install.packages("patchwork")
# install.packages("viridis", type = "binary")
# 更新所有相关的包
install.packages(c("ggplot2", "tidyverse", "scales", "rlang", "cli", "pillar"))

# 或者更新所有已安装的包
update.packages(ask = FALSE, checkBuilt = TRUE)

# 重新加载包
library(ggplot2)
library(tidyverse)
# 加载包（注意加载顺序以避免冲突）
library(maps)
library(mapdata)
library(vegan)  # 用于计算多样性指数
library(dplyr)
library(tidyr)
library(patchwork)  # 用于组合图形
library(viridis)    # 用于颜色渐变

# 检查包版本和冲突
print("包加载状态：")
print(paste("maps版本:", packageVersion("maps")))
print(paste("mapdata版本:", packageVersion("mapdata")))

# 读取数据
event <- read.csv("event.csv")  # 采样事件数据
group_occurrence <- read.csv("groupOccurrence.csv")  # 物种出现数据
individual <- read.csv("individualOccurrence.csv")  # 个体数据

# 筛选通过质量控制的数据
event_qc <- event %>% 
  filter(validation == 1)  # 仅使用通过质量控制的记录

# 合并事件数据和物种出现数据
merged_data <- group_occurrence %>%
  inner_join(event_qc, by = "eventID") %>%
  filter(!is.na(scientificName) & scientificName != "")  # 移除无物种名的记录

# --------------------1.创建物种-样方矩阵（每个采样事件为一个样方）---------------------------------
species_matrix <- merged_data %>%
  # 将物种计数转换为宽格式矩阵
  group_by(eventID, scientificName) %>%
  summarise(abundance = sum(individualCount, na.rm = TRUE), .groups = 'drop') %>%  
  pivot_wider(
    names_from = scientificName,
    values_from = abundance,
    values_fill = 0
  ) %>%
  column_to_rownames("eventID")

# 检查矩阵结构
print("物种矩阵维度：")
print(dim(species_matrix))  # 查看矩阵维度（样方数 × 物种数）
print("前5个物种：")
print(head(species_matrix[, 1:5]))  # 查看前5个物种

# ----------------------------------2.计算相关参数------------------------------
#2.1计算物种丰富度（每个样方的物种数）
species_richness <- specnumber(species_matrix)

# 2.2计算Shannon多样性指数
shannon_index <- diversity(species_matrix, index = "shannon")

#2.3计算Simpson指数
simpson_index <- diversity(species_matrix, index = "simpson")

# 2.4计算Pielou均匀度指数（需要处理log(0)的情况）
pielou_evenness <- ifelse(species_richness > 0, shannon_index / log(species_richness), 0)

# -----------------------------------3.组合所有指数到数据框------------------------------
alpha_diversity <- data.frame(
  eventID = rownames(species_matrix),
  richness = species_richness,
  shannon = shannon_index,
  simpson = simpson_index,
  pielou = pielou_evenness
)

print("Alpha多样性数据前几行：")
print(head(alpha_diversity))

# ------------------------------------4.计算平均坐标（使用起始和结束坐标）---------------------
# 使用正确的if语句格式
if (all(c("start_latitude", "end_latitude", "start_longitude", "end_longitude") %in% colnames(event_qc))) {
  alpha_with_geo <- alpha_diversity %>%
    left_join(
      event_qc %>% 
        mutate(
          latitude = (start_latitude + end_latitude) / 2,
          longitude = (start_longitude + end_longitude) / 2
        ) %>%
        select(eventID, sector, latitude, longitude),
      by = "eventID"
    )
} else {
  # 如果坐标列不存在，尝试使用其他可能的列名
  possible_lat <- grep("lat", colnames(event_qc), value = TRUE, ignore.case = TRUE)
  possible_lon <- grep("lon", colnames(event_qc), value = TRUE, ignore.case = TRUE)
  
  if (length(possible_lat) > 0 & length(possible_lon) > 0) {
    alpha_with_geo <- alpha_diversity %>%
      left_join(
        event_qc %>% 
          rename(latitude = possible_lat[1], longitude = possible_lon[1]) %>%
          select(eventID, sector, latitude, longitude),
        by = "eventID"
      )
  } else {
    stop("在event_qc中找不到经纬度列")
  }
}

print("Alpha多样性数据合并地理信息后：")
print(head(alpha_with_geo))

#-------------------------------5.按区域分组计算平均多样性------------------------------
if ("sector" %in% colnames(alpha_with_geo)) {
  regional_alpha <- alpha_with_geo %>%
    group_by(sector) %>%
    summarise(
      mean_richness = mean(richness, na.rm = TRUE),
      sd_richness = sd(richness, na.rm = TRUE),
      mean_shannon = mean(shannon, na.rm = TRUE),
      sd_shannon = sd(shannon, na.rm = TRUE),
      n_samples = n(),
      .groups = 'drop'
    )
  
  print("区域多样性统计：")
  print(regional_alpha)
} else {
  warning("sector列不存在，跳过区域统计")
}

# 检查alpha_with_geo数据
print("数据检查：")
print(paste("总样本数:", nrow(alpha_with_geo)))
print(paste("纬度列是否存在:", "latitude" %in% colnames(alpha_with_geo)))
print(paste("经度列是否存在:", "longitude" %in% colnames(alpha_with_geo)))

# 过滤有坐标的数据
alpha_coords <- alpha_with_geo %>%
  filter(!is.na(latitude), !is.na(longitude))

print(paste("有坐标的样本数:", nrow(alpha_coords)))
print(paste("坐标缺失率:", round((nrow(alpha_with_geo)-nrow(alpha_coords))/nrow(alpha_with_geo)*100, 2), "%"))
# ------------------------------6.绘制分布图-------------------------------------
# 获取世界地图数据
world_map <- map_data("world")

# 查看地图数据范围
print("世界地图数据范围：")
print(range(world_map$long))
print(range(world_map$lat))

# 创建基本地图
basic_map <- ggplot() +
  geom_polygon(data = world_map, 
               aes(x = long, y = lat, group = group),
               fill = "gray85", color = "gray70", linewidth = 0.2) +
  coord_cartesian(xlim = c(-180, 180), ylim = c(-90, -40)) +
  labs(title = "南大洋区域地图", x = "经度", y = "纬度") +
  theme_minimal()


# =================================6.1简单散点图================================================
if (nrow(alpha_coords) > 0) {
  map_simple <- basic_map +
    geom_point(data = alpha_coords,
               aes(x = longitude, y = latitude),
               color = "red", size = 1.5, alpha = 0.5) +
    labs(title = "Distribution of mesopelagic fish sampling sites in the Southern Ocean",
         subtitle = paste("采样点数量:", nrow(alpha_coords))) +
    theme(plot.title = element_text(face = "bold", hjust = 0.5))
  
  print(map_simple)
  
  # 保存
  ggsave("Distribution of mesopelagic fish sampling sites.png", map_simple, width = 10, height = 7, dpi = 300)
} else {
  warning("没有有效的坐标数据，无法创建地图")
}

# 创建颜色渐变函数（使用R内置颜色）
create_color_palette <- function(n) {
  # 使用热图颜色：蓝色->青色->绿色->黄色->红色
  colorRampPalette(c("blue", "cyan", "green", "yellow", "red"))(n)
}

#=====================================6.2按丰富度着色的地图============================================
if (nrow(alpha_coords) > 0) {
  map_richness <- basic_map +
    geom_point(data = alpha_coords,
               aes(x = longitude, y = latitude, 
                   color = richness, size = richness),
               alpha = 0.7) +
    coord_cartesian(xlim = c(-180, 180), ylim = c(-90, -40)) +
    scale_color_gradientn(
      colors = create_color_palette(100),
      name = "Species richness"
    ) +
    scale_size_continuous(
      range = c(1, 8),
      name = "Species richness",
      guide = "none"  # 隐藏大小图例，避免重复
    ) +
    labs(
      title = "Spatial distribution of mesopelagic fish species richness in the Southern Ocean
",
      subtitle = paste("Number of samples:", nrow(alpha_coords),
                       " | Mean species richness:", round(mean(alpha_coords$richness, na.rm = TRUE), 2)),
      x = "Longitude",
      y = "Latitude"
    ) +
    theme_minimal() +
    theme(
      plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
      plot.subtitle = element_text(color = "gray40", hjust = 0.5),
      legend.position = "right"
    )
  
  print(map_richness)
  ggsave("Map of species richness distribution.png", map_richness, width = 12, height = 8, dpi = 300)
}

#======================================6.3Shannon指数地图=========================================
if (nrow(alpha_coords) > 0) {
  map_shannon <- basic_map +
    geom_point(data = alpha_coords,
               aes(x = longitude, y = latitude, 
                   color = shannon, size = shannon),
               alpha = 0.7) +
    coord_cartesian(xlim = c(-180, 180), ylim = c(-90, -40)) +
    scale_color_gradientn(
      colors = c("purple", "blue", "green", "yellow", "orange"),
      name = "Shannon指数"
    ) +
    scale_size_continuous(
      range = c(1, 8),
      name = "Shannon指数",
      guide = "none"
    ) +
    labs(
      title = "Spatial distribution of Shannon index for mesopelagic fish in the Southern Ocean ",
      subtitle = paste("Number of samples:", nrow(alpha_coords),
                       " | Mean Shannon index:", round(mean(alpha_coords$shannon, na.rm = TRUE), 2)),
      x = "Longitude",
      y = "Latitude"
    ) +
    theme_minimal()
  
  print(map_shannon)
  ggsave("Map of Shannon index distribution.png", map_shannon, width = 12, height = 8, dpi = 300)
}

#================================= 6.4组合丰富度和Shannon指数地图=================================
if (nrow(alpha_coords) > 0) {
  # 丰富度地图（左）
  p_left <- basic_map +
    geom_point(data = alpha_coords,
               aes(x = longitude, y = latitude, color = richness),
               size = 1.5, alpha = 0.7) +
    coord_cartesian(xlim = c(-180, 180), ylim = c(-90, -40)) +
    scale_color_gradientn(
      colors = create_color_palette(100),
      name = "Species richness"
    ) +
    labs(title = "A. Species richness", x = "Longitude", y = "Latitude") +
    theme_minimal() +
    theme(legend.position = "bottom")
  
  # Shannon指数地图（右）
  p_right <- basic_map +
    geom_point(data = alpha_coords,
               aes(x = longitude, y = latitude, color = shannon),
               size = 1.5, alpha = 0.7) +
    coord_cartesian(xlim = c(-180, 180), ylim = c(-90, -40)) +
    scale_color_gradientn(
      colors = c("purple", "blue", "green", "yellow"),
      name = "Shannon index"
    ) +
    labs(title = "B. Shannon index", x = "Longitude", y = "Latitude") +
    theme_minimal() +
    theme(legend.position = "bottom")
  
  # 组合
  combined_map <- p_left + p_right +
    plot_annotation(
      title = "Spatial distribution comparison of α-diversity in Southern Ocean mesopelagic fish ",
      subtitle = paste("Total number of sampling sites:", nrow(alpha_coords)),
      caption = "Data source: Mycobase database"
    )
  
  print(combined_map)
  ggsave("Comparative map of diversity distribution .png", combined_map, width = 16, height = 7, dpi = 300)
}

#===========================================6.5 创建采样密度热图 =====================================
if (nrow(alpha_coords) > 0) {
  # 方法1：使用stat_bin_2d创建矩形热图
  density_map <- basic_map +
    # 2D分箱统计
    stat_bin_2d(data = alpha_coords,
                aes(x = longitude, y = latitude),
                bins = 30, alpha = 0.8) +
    coord_cartesian(xlim = c(-180, 180), ylim = c(-90, -40)) +
    scale_fill_gradientn(
      colors = c("blue", "cyan", "green", "yellow", "red"),
      name = "Sampling site density ",
      trans = "log10"  # 对数变换以更好显示
    ) +
    labs(
      title = "Heatmap of sampling site density for mesopelagic fish in the Southern Ocean",
      subtitle = "Warmer colors represent higher sampling site density",
      x = "Longitude",
      y = "Latitude"
    ) +
    theme_minimal()
  
  print(density_map)
  ggsave("Heatmap of sampling site density.png", density_map, width = 12, height = 8, dpi = 300)
}

# 创建南极地区的地图
antarctic_map <- ggplot() +
  # 绘制世界地图背景
  geom_polygon(data = world_map, 
               aes(x = long, y = lat, group = group),
               fill = "gray85", color = "gray70", linewidth = 0.2) +
  # 限制在南大洋区域（南纬40°以南）
  coord_cartesian(xlim = c(-180, 180), ylim = c(-90, -40)) +
  labs(x = "Longitude", y = "latitude") +
  theme_minimal() +
  theme(
    panel.background = element_rect(fill = "lightblue", color = NA),
    panel.grid.major = element_line(color = "gray90", linewidth = 0.3),
    panel.grid.minor = element_blank()
  )


# 确保alpha_with_geo中有经纬度数据
if ("latitude" %in% colnames(alpha_with_geo) & "longitude" %in% colnames(alpha_with_geo)) {
  # 过滤掉没有坐标的数据
  alpha_coords <- alpha_with_geo %>%
    filter(!is.na(latitude) & !is.na(longitude))
  
  print(paste("有坐标的样本数：", nrow(alpha_coords)))
  
  if (nrow(alpha_coords) > 0) {
    # 创建带采样点的地图
    map_with_points <- antarctic_map +
      # 添加采样点，按物种丰富度着色
      geom_point(data = alpha_coords,
                 aes(x = longitude, y = latitude, 
                     color = richness, size = richness),
                 alpha = 0.7) +
      # 颜色渐变
      scale_color_gradientn(
        colors = c("blue", "cyan", "green", "yellow", "red"),
        name = "species richness",
        breaks = seq(0, max(alpha_coords$richness, na.rm = TRUE), length.out = 5)
      ) +
      # 点大小
      scale_size_continuous(
        range = c(1, 8),
        name = "species richness",
        guide = "none"  # 避免重复图例
      ) +
      # 标题
      labs(
        title = "Distribution of mesopelagic fish sampling sites in the Southern Ocean (colored by species richness)",
        subtitle = paste("Number of samples：", nrow(alpha_coords)),
        caption = "Data source: Mycobase database"
      ) +
      theme(
        plot.title = element_text(face = "bold", size = 14, hjust = 0.5),
        plot.subtitle = element_text(color = "gray40", hjust = 0.5),
        legend.position = "right"
      )
    
    print(map_with_points)
    
    # 保存地图
    ggsave("Sampling site distribution - species richness.png", map_with_points, 
           width = 12, height = 8, dpi = 300)
  }
}
#--------------------------------------7.绘制统计图表----------------------------------------------
# ====================================7.1绘制丰富度直方图==========================================
if (nrow(alpha_with_geo) > 0) {
  p_richness_enhanced <- ggplot(alpha_with_geo, aes(x = richness)) +
    geom_histogram(binwidth = 1, fill = "steelblue", alpha = 0.8, color = "black") +
    geom_vline(aes(xintercept = mean(richness, na.rm = TRUE)), 
               color = "red", linetype = "dashed", linewidth = 1) +
    geom_vline(aes(xintercept = mean(richness, na.rm = TRUE) + sd(richness, na.rm = TRUE)), 
               color = "orange", linetype = "dotted", linewidth = 0.7) +
    geom_vline(aes(xintercept = mean(richness, na.rm = TRUE) - sd(richness, na.rm = TRUE)), 
               color = "orange", linetype = "dotted", linewidth = 0.7) +
    stat_function(fun = function(x) dnorm(x, mean = mean(alpha_with_geo$richness, na.rm = TRUE), 
                                          sd = sd(alpha_with_geo$richness, na.rm = TRUE)) * 
                    nrow(alpha_with_geo) * 1, 
                  color = "darkred", linewidth = 1) +
    labs(
      title = "Species richness distribution",
      subtitle = paste0("n = ", nrow(alpha_with_geo), 
                        " | Mean = ", round(mean(alpha_with_geo$richness, na.rm = TRUE), 2),
                        " | Standard deviation  = ", round(sd(alpha_with_geo$richness, na.rm = TRUE), 2)),
      x = "Number of species",
      y = "Frequency"
    ) +
    theme_minimal() +
    theme(plot.subtitle = element_text(color = "gray30", size = 10))
  
  print(p_richness_enhanced)
  ggsave("species_richness_distribution.png", p_richness_enhanced, width = 10, height = 6, dpi = 300)
}

#=================================== 7.2各扇区物种丰富度分布的直方图===================================
if (nrow(alpha_with_geo) > 0 && "sector" %in% colnames(alpha_with_geo)) {
  p_faceted <- ggplot(alpha_with_geo, aes(x = richness)) +
    geom_histogram(binwidth = 1, fill = "steelblue", alpha = 0.8) +
    facet_wrap(~ sector, scales = "free_y") +  # 按扇区分面
    labs(
      title = "Species richness distribution across sectors",
      x = "Number of species",
      y = "Frequency"
    ) +
    theme_minimal() +
    theme(strip.background = element_rect(fill = "gray90"),
          strip.text = element_text(face = "bold"))
  
  print(p_faceted)
  ggsave("Species richness distribution across sectors.png", p_faceted, width = 10, height = 6, dpi = 300)
}

  
  # ======================================7.3散点图及相关性分析==========================================
  scatter_plot <- ggplot(alpha_with_geo, aes(x = richness, y = shannon)) +
    geom_point(aes(color = sector), alpha = 0.6, size = 2) +
    geom_smooth(method = "lm", se = TRUE, color = "red") +
    labs(
      title = "Relationship between species richness and Shannon index ",
      x = "Species richness ",
      y = "Shannon diversity index"
    ) +
    theme_minimal()
  
  print(scatter_plot)
  ggsave("Relationship between species richness and Shannon index.png", scatter_plot, width = 10, height = 6, dpi = 300)

# 组合图表，添加总标题
if (nrow(alpha_with_geo) > 0) {
  p1 <- ggplot(alpha_with_geo, aes(x = richness)) +
    geom_histogram(binwidth = 1, fill = "steelblue", alpha = 0.8) +
    labs(title = "Species richness distribution", x = "Number of species", y = "Frequency")
  
  p2 <- ggplot(alpha_with_geo, aes(x = "All samples ", y = richness)) +
    geom_boxplot(fill = "steelblue", alpha = 0.7) +
    labs(title = "Boxplot of species richness ", x = "", y = "Number of species") +
    theme(axis.text.x = element_blank())
  
  p3 <- ggplot(alpha_with_geo, aes(x = shannon)) +
    geom_histogram(binwidth = 0.1, fill = "darkgreen", alpha = 0.8) +
    labs(title = "Shannon index distribution", x = "Shannon index", y = "Frequency")
  
  p4 <- ggplot(alpha_with_geo, aes(x = "All samples", y = shannon)) +
    geom_boxplot(fill = "darkgreen", alpha = 0.7) +
    labs(title = "Boxplot of Shannon index ", x = "", y = "Shannon index") +
    theme(axis.text.x = element_blank())
  
  # ====================================7.4组合图表================================================
  combined_plot <- (p1 + p2) / (p3 + p4) +
    plot_annotation(
      title = "Analysis of α-diversity in Southern Ocean mesopelagic fish",
      subtitle = "Histograms show distribution shapes, boxplots display statistical summaries",
      caption = paste("data resource: Mycobase | Number of species:", nrow(alpha_with_geo))
    )
  
  print(combined_plot)
  ggsave("Analysis of α-diversity in Southern Ocean mesopelagic fish.png", combined_plot, width = 10, height = 6, dpi = 300)
}
if (nrow(alpha_with_geo) > 0 && "sector" %in% colnames(alpha_with_geo)) {
  if (!require(patchwork, quietly = TRUE)) {
    install.packages("patchwork")
    library(patchwork)
  }
  
  # =======================================7.5计算统计检验结果===========================================
  if (length(unique(alpha_with_geo$sector)) > 1) {
    # 物种丰富度ANOVA
    anova_richness <- aov(richness ~ sector, data = alpha_with_geo)
    p_value_richness <- summary(anova_richness)[[1]][1, "Pr(>F)"]
    
    # Shannon指数ANOVA
    anova_shannon <- aov(shannon ~ sector, data = alpha_with_geo)
    p_value_shannon <- summary(anova_shannon)[[1]][1, "Pr(>F)"]
  }
  
  p_box_richness_group <- ggplot(alpha_with_geo, aes(x = sector, y = richness, fill = sector)) +
    geom_boxplot(alpha = 0.7) +
    stat_summary(fun = mean, geom = "point", shape = 23, size = 3, fill = "red") +
    labs(
      title = paste0("Species richness (p = ", ifelse(exists("p_value_richness"), 
                                                      round(p_value_richness, 4), "NA"), ")"),
      x = "",
      y = "Number of species"
    ) +
    theme_minimal() +
    theme(legend.position = "none",
          axis.text.x = element_text(angle = 45, hjust = 1))
  
  p_box_shannon_group <- ggplot(alpha_with_geo, aes(x = sector, y = shannon, fill = sector)) +
    geom_boxplot(alpha = 0.7) +
    stat_summary(fun = mean, geom = "point", shape = 23, size = 3, fill = "red") +
    labs(
      title = paste0("Shannon index (p = ", ifelse(exists("p_value_shannon"), 
                                                   round(p_value_shannon, 4), "NA"), ")"),
      x = "Sectors",
      y = "Shannon index"
    ) +
    theme_minimal() +
    theme(legend.position = "none",
          axis.text.x = element_text(angle = 45, hjust = 1))
  
  # 合并图
  combined_plot <- p_box_richness_group + p_box_shannon_group +
    plot_layout(ncol = 2) +
    plot_annotation(
      title = "Comparison of α-diversity indices across different sectors",
      subtitle = paste("Red diamond = mean | Total samples =", nrow(alpha_with_geo)),
      caption = "p-value from one-way ANOVA"
    )
  
  print(combined_plot)
  
  # 保存带统计结果的图
  ggsave("sector_comparison_with_stats.png", combined_plot, width = 14, height = 7, dpi = 300)
}
print("finished！")

