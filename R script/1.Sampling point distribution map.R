install.packages(c("ggrepel"))

# 加载所需包
library(tidyverse)
library(sf)
library(rnaturalearth)
library(rnaturalearthdata)
library(viridis)
library(ggspatial)  # 用于添加经纬度网格

# 1. 读取数据
# 请将文件路径替换为你的实际路径
event_df <- read.csv("event.csv", stringsAsFactors = FALSE)

# 查看数据基本信息（帮助了解缺失值情况）
cat("原始数据总行数：", nrow(event_df), "\n")
cat("经度缺失值数量：", sum(is.na(event_df$start_longitude)), "\n")
cat("纬度缺失值数量：", sum(is.na(event_df$start_latitude)), "\n")

# 2. 数据清洗：移除坐标缺失的行 + 过滤南极区域坐标
event_df_clean <- event_df %>%
  filter(!is.na(start_longitude) & !is.na(start_latitude),
         start_latitude <= 0)# 只保留南半球坐标) 

# 3. 构建以南极点为中心的地图基础
# 获取世界地图（陆地）和海域数据
world_land <- ne_countries(scale = "medium", returnclass = "sf")
# 定义南极投影（极地立体投影）
antarctic_crs <- "+proj=stere +lat_0=-90 +lat_ts=-71 +lon_0=0 +k=1 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs"
# 转换陆地和海域数据到南极投影
world_land_antarctic <- st_transform(world_land, crs = antarctic_crs)

# 4. 处理采样点坐标
# 将采样点转换为sf对象并设置原始坐标系（WGS84）
event_sf <- st_as_sf(
  event_df_clean,
  coords = c("start_longitude", "start_latitude"),
  crs = 4326 # WGS84
) %>%
  st_transform(crs = antarctic_crs) # 转换到南极投影

# 5. 为每个cruiseCode分配唯一颜色
# 使用随机颜色生成器，确保每个航次颜色唯一
set.seed(123) # 固定随机种子保证颜色可重复
cruise_colors <- event_df_clean %>%
  distinct(cruiseCode) %>%
  mutate(color = sample(viridis_pal(option = "H")(n())))
# 合并颜色信息到采样点数据
event_sf <- event_sf %>%
  left_join(cruise_colors, by = "cruiseCode")

# 6. 绘制带经纬度和海域的南极地图
p <- ggplot() +
  # 添加南极洲陆地（浅灰色）
  geom_sf(data = world_land_antarctic, fill = "lightgray", color = NA) +
  # 添加采样点（同一cruiseCode同色）
  geom_sf(
    data = event_sf,
    aes(color = I(color)), # 直接使用预分配的颜色
    size = 0.8,
    alpha = 0.6, # 半透明处理，缓解点过多重叠问题
  ) +
  # 设置地图范围
  coord_sf(
    crs = antarctic_crs,  
    xlim = c(-5e6, 5e6),
    ylim = c(-5e6, 5e6)
  ) +
  # 自定义经纬度刻度和标签
  ggspatial::annotation_scale(
    location = "bl", 
    width_hint = 0.2,
    bar_cols = c("gray60", "white"),
    text_family = "sans",
    style = "ticks" # 更适配极地投影的比例尺样式
  ) +
  # 主题设置
  theme_bw() +
  theme(
    axis.title = element_text(size = 10),
    axis.text = element_text(size = 8),
    axis.ticks = element_line(size = 0.3),
    panel.grid.major = element_line(color = "gray80", linetype = "dashed", size = 0.2),
    panel.grid.minor = element_blank(),
    legend.position = "none",
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    panel.background = element_blank(),
  ) +
  # 设置轴标签
  labs(
    title = "Distribution of antarctic sampling points",
    x = "longitude (°E)",
    y = "latitude (°S)"
  ) +
  # 手动添加极地投影的经纬度标签（更贴合南极视角）
  annotate(
    "text", x = 0, y = 4.8e6, label = "0°",
    size = 3, fontface = "bold"
  ) +
  annotate(
    "text", x = 0, y = -4.8e6, label = "90°S",
    size = 3, fontface = "bold"
  ) +
  annotate(
    "text", x = -4.8e6, y = 0, label = "180°W",
    size = 3, fontface = "bold"
  ) +
  annotate(
    "text", x = 4.8e6, y = 0, label = "180°E",
    size = 3, fontface = "bold"
  )

# 显示地图
print(p)

#保存高清地图
ggsave("Antarctic_sampling_points.png", p, width = 10, height = 10, dpi = 300)
