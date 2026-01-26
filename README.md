# 基于Myctobase数据库的南大洋中层鱼类采样数据特征分析研究

## 项目简介

本项目将基于Myctobase数据库的相关数据，进行南大洋中层鱼类群落的丰度分析、物种分布、物种多样性及其形态特征分析，旨在为南大洋生态保护及可持续管理提供科学依据。
## 使用说明
准备数据
将三个CSV文件放置在脚本同目录下
确保数据格式正确
## 安装依赖
首次运行  
''' R
# 安装必要包
install.packages(c("tidyverse", "vegan", "dplyr", "ggplot2", "tidyr", "permute"))
install.packages("mapdata")
install.packages("patchwork")
install.packages("viridis", type = "binary")'''
更新包  
''' R
# 更新所有相关包
install.packages(c("ggplot2", "tidyverse", "scales", "rlang", "cli", "pillar"))

# 或更新所有已安装的包
update.packages(ask = FALSE, checkBuilt = TRUE)'''
## 数据来源

**Myctobase数据库 (https://zenodo.org/records/6562776)**
## 运行分析

多样性及丰度图表运行完整脚本：多样性与丰度.R 或在RStudio中逐段执行

## 输出结果

多样性指数表格：alpha_diversity.csv

地图图像文件（PNG格式）

统计图表（PNG格式）


三个主要数据文件：

- **1.event.csv**：记录采样事件的元数据，包含4780个采样网次的信息，包括采样地点、采样方法、采样时间等。  
- **2.groupOccurrence.csv**：记录了17,491条物种出现与丰度的详细数据，提供了不同物种的出现频率与相对丰度。  
- **3.individualOccurrence.csv**：记录每个个体的详细测量数据，包括体长、体重、性别、生活阶段等信息，是物种形态学分析的重要基础。

## 数据可视化

### 可视化工具

**R（version 4.5.2）**

### 图表绘制
#### 主要输出文件
##### 地图文件
Distribution of mesopelagic fish sampling sites.png - 采样点基础分布图  
Map of species richness distribution.png - 物种丰富度空间分布  
Map of Shannon index distribution.png - Shannon指数空间分布   
Comparative map of diversity distribution.png - 多样性对比图  
Heatmap of sampling site density.png - 采样密度热图  

##### 统计图表
species_richness_distribution.png - 物种丰富度分布直方图  
Species richness distribution across sectors.png - 各扇区丰富度分布   
Relationship between species richness and Shannon index.png - 丰富度与Shannon指数关系图  
Analysis of α-diversity in Southern Ocean mesopelagic fish.png - 多样性分析综合图  
sector_comparison_with_stats.png - 扇区比较统计图  
G1: 

G2: 

G3: 

G4: 

G5: 

G6: 

G7: 

G8: 

G9: 

G10: 

G11: 

G12: 

G13: 

G14: 

G15: 

G16: 

G17: 

G18: 
### 代码结构
#### 主要处理步骤
1. 数据加载与预处理
2. 读取CSV文件
3. 质量控制筛选
4. 数据合并与清理
5. 多样性指数计算
6. 创建物种-样方矩阵
7. 计算多样性指数
8. 地理坐标匹配
9. 可视化生成
10. 创建基础地图   
11.添加多样性数据图层  
12.生成统计图表  
'关键函数'
specnumber() - 计算物种丰富度
diversity() - 计算多样性指数（Shannon/Simpson）
ggplot() - 创建可视化图表
geom_point() - 添加散点图层
scale_color_gradientn() - 设置颜色渐变
## 🔒 License
* See [LICENSE](LICENSE) for details.
## '注意事项'
1. 坐标处理  
使用起始和结束坐标的平均值; 自动处理不同命名的经纬度列; 过滤缺失坐标的数据
2. 数据质量  
仅使用validation == 1的数据; 移除无物种名的记录; 处理零值（避免log(0)错误）
3. 内存管理  
建议在至少8GB内存的机器上运行; 大型数据集可能需要优化
4. 故障排除
常见问题:
包加载错误: 确保已安装所有依赖包, 尝试更新R和RStudio
数据读取失败: 检查文件编码（建议UTF-8）确认列名匹配
地图无法显示: 检查maps和mapdata包版本,确保有可用的互联网连接（用于下载地图数据）
## 调试模式
脚本包含详细的打印语句，可通过以下方式监控执行：
'''R
print("包加载状态：")
print("物种矩阵维度：")
print("Alpha多样性数据前几行：")'''
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

