# 环境准备

<div class="dvam-lead" markdown>
稳定的分析环境是可复现研究的第一步。本页给出一套面向课程实践的最小配置：**Git + Conda + Python + R + Jupyter / Positron**。
</div>

## 开始之前

请确认你能够完成以下基础操作：

- 在终端中进入目录、创建文件并运行命令；
- 区分“系统环境”“虚拟环境”和“项目目录”；
- 理解 CSV / TSV / Excel 等表格数据的基本结构；
- 能够阅读简单的 Python 或 R 报错信息。

!!! tip "推荐原则"
    每个项目使用独立环境；先记录依赖，再开始分析。避免在系统 Python 或 Conda 的 `base` 环境中长期堆叠包。

## 平台选择

| 平台 | 推荐方式 | 适用说明 |
| --- | --- | --- |
| Windows | WSL 2 + Conda / Miniforge | 更接近 Linux 科研环境，适合需要命令行与跨平台复现的项目 |
| macOS | Miniforge / Conda | Apple Silicon 设备优先选择原生 `arm64` 包，减少架构混用 |
| Linux | Miniforge / Conda | 适合服务器、工作站与后续高性能计算环境 |

Windows 用户可参考 [WSL 官方安装说明](https://learn.microsoft.com/windows/wsl/install)；Conda 环境管理以 [Conda 官方文档](https://docs.conda.io/projects/conda/en/stable/user-guide/tasks/manage-environments.html) 为准。

## 建立课程环境

### 方案 A · Conda（推荐）

```bash
conda create -n dvam -c conda-forge \
  python=3.11 r-base jupyterlab \
  numpy pandas scipy matplotlib seaborn scikit-learn

conda activate dvam
```

如需在 Python 中调用 R，再安装 `rpy2`：

```bash
conda install -c conda-forge rpy2
```

验证环境：

```bash
python --version
R --version
python -c "import numpy, pandas, matplotlib, seaborn; print('DVAM environment ready')"
```

### 方案 B · venv + pip / uv

如果项目只需要 Python，可使用轻量虚拟环境：

=== "venv"

    ```bash
    python -m venv .venv
    source .venv/bin/activate
    python -m pip install -U pip
    python -m pip install jupyterlab numpy pandas scipy matplotlib seaborn scikit-learn
    ```

=== "uv"

    ```bash
    uv venv --python 3.11
    source .venv/bin/activate
    uv pip install jupyterlab numpy pandas scipy matplotlib seaborn scikit-learn
    ```

Windows PowerShell 的激活命令通常为 `.venv\Scripts\Activate.ps1`。如果同时使用 Python 与 R，优先采用 Conda 统一管理底层依赖。

## 编辑器与交互环境

课程允许使用 JupyterLab、VS Code、RStudio 或 Positron。若希望在同一界面中完成 Python、R、变量查看、图形检查与 Notebook 工作，推荐尝试 [Positron](https://positron.posit.co/)。

配置时请检查三件事：

1. 编辑器当前选择的 Python 解释器是否来自 `dvam` 环境；
2. R 可执行文件是否能够在终端中直接调用；
3. Notebook Kernel 是否与项目环境一致。

!!! warning "最常见的环境问题"
    “终端中可以导入，Notebook 中却报错”通常不是包没有安装，而是 Notebook 使用了另一个解释器或 Kernel。

## Git 与项目目录

建议每个团队项目至少包含以下结构：

```text
dvam-project/
├── README.md
├── data/
│   ├── raw/
│   └── processed/
├── notebooks/
├── src/
├── figures/
├── report/
└── environment.yml
```

- `data/raw/` 保存原始数据，原则上只读；
- `data/processed/` 保存可由脚本重新生成的中间数据；
- `src/` 保存可复用函数与分析脚本；
- `figures/` 保存最终图表，文件名应稳定且可追踪；
- `environment.yml` 或 `requirements.txt` 记录依赖。

## 常见问题

??? question "Conda 安装很慢或依赖冲突怎么办？"
    优先在新环境中重建，不要持续修改已经混合使用 Conda 与 pip 的旧环境。必要时减少一次安装的包数量，并检查渠道是否统一。

??? question "macOS 提示包的架构不一致怎么办？"
    检查终端、Conda 与 Python 是否都运行在同一架构下。Apple Silicon 上不要在同一个环境中混用 `arm64` 与 `x86_64` 包。

??? question "rpy2 找不到 R 怎么办？"
    先确认 `R --version` 能在同一终端中运行，再检查 Python 与 R 是否来自同一个 Conda 环境。相比手工设置 `R_HOME`，优先使用 Conda-forge 同时安装 `r-base` 与 `rpy2`。

??? question "数据文件是否应该提交到 GitHub？"
    小型、允许公开的数据可以提交；大型数据、受限数据或含个人信息的数据应使用公开仓库链接、下载脚本或受控存储，并在 README 中说明获取方式与许可。

## 就绪检查

- [ ] 能够激活项目环境并确认 Python / R 版本
- [ ] 能够运行一个 Jupyter Notebook 或脚本
- [ ] 能够导入 `pandas`、`matplotlib` 与 `seaborn`
- [ ] 能够完成一次 `git clone`、`git add` 与 `git commit`
- [ ] 已建立清晰的项目目录，并避免直接修改原始数据

完成以上检查后，可继续阅读 [Lecture 01 · 从数据到证据](lecture1.md)。
