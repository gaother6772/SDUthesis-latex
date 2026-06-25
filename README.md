# 山东大学研究生毕业论文模板

本论文模板基于 [cnDelbert/SDU_thesis_template_for_postgraduate](https://github.com/cnDelbert/SDU_thesis_template_for_postgraduate) 修改而来，已在 Windows + TeX Live 2024 环境下使用 XeLaTeX 编译通过。

## 模板参照

参考的规范文件（位于本仓库中）：

- [2024版学位论文封面（扉页）.docx](./2024%E7%89%88%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E5%B0%81%E9%9D%A2%EF%BC%88%E6%89%89%E9%A1%B5%EF%BC%89.docx) — 封面排版格式
- [山东大学硕士学位论文模板_标准版.doc](./%E5%B1%B1%E4%B8%9C%E5%A4%A7%E5%AD%A6%E7%A1%95%E5%A3%AB%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E6%A8%A1%E6%9D%BF_%E6%A0%87%E5%87%86%E7%89%88.doc) — 正文排版格式

## 主要修改

与原模板相比，本版本的主要修改包括：

- **封面重做**：根据 2024 版学位论文封面文件重新设计了封面排版
- **双封面支持**：可在 2024 版封面和旧版封面之间切换
- **学位类型切换**：支持学术学位 / 专业学位，标签按封面版本自动显示
- **声明页开关**：默认包含原创性声明，也可生成不带声明的草稿版本
- **格式规范文档**：[山东大学硕士学位论文格式规范.md](山东大学硕士学位论文格式规范.md)
- **内容示例化**：正文替换为通用示例，各章展示不同排版写法
- **打印模式**：`print` 选项自动使用黑色超链接，并在封面和声明后插入装订空白页
- **单双面模式**：`single` 使用单面版式；`double` 使用镜像页边距并让各章从奇数页开始

## 项目文件结构

```
SDUthesis_latex/
├── SDUthesistemplate.tex      # 主入口文件
├── sduthesis.cls              # 论文样式文件（文档类）
├── sduthesis-front-cover.def  # 封面字段与版本分派
├── sduthesis-cover-2024.def   # 2024 版封面
├── sduthesis-cover-legacy.def # 旧版封面
├── sduthesis-statement.def    # 原创性声明
├── LICENSE                    # 许可证
├── .gitignore                 # Git 忽略规则
├── figures/                   # 图片存放目录
│   ├── SDU_master.jpg         # 封面校徽
│   ├── SDU.jpg                # 旧版封面标题图
│   └── ...                    # 示例图片
├── contents/                  # 正文内容目录
│   ├── titlepageinfo.tex      # 封面信息（标题、作者等）
│   ├── usersettings.tex       # 自定义设置
│   ├── abstract.tex           # 中英文摘要
│   ├── ch1.tex ~ ch5.tex      # 各章正文
│   ├── conclusions.tex        # 结论
│   ├── acknowledgement.tex    # 致谢
│   ├── symbol.tex             # 符号说明
│   ├── miscellaneous.tex      # 发表论文及获奖
│   ├── appendix1.tex          # 附录
│   └── reference.bib          # 参考文献库
├── dtklogos.sty               # 字体标识
└── gbt7714-numerical.bst      # GB/T 7714 参考文献格式
```

## 文档类选项

封面字段仍在 `contents/titlepageinfo.tex` 中填写；封面版本、学位类型和声明页在主文件的 `\documentclass` 中统一控制：

| 选项 | 可选值 | 默认值 | 作用 |
|------|--------|--------|------|
| `cover` | `2024` / `legacy` | `2024` | 选择 2024 版或旧版封面 |
| `degree` | `academic` / `professional` | `academic` | 选择学术学位或专业学位 |
| 声明页 | `statement` / `nostatement` | `statement` | 是否生成原创性声明页 |
| 页面 | `single` / `double` | `double` | 单面或双面排版 |
| 输出 | `print` / `noprint` | `noprint` | 打印模式会插入装订空白页并关闭彩色链接 |

默认的 2024 版学术学位打印稿：

```latex
\documentclass[single,print,cover=2024,degree=academic,statement]{sduthesis}
```

旧版专业学位封面、不带声明的草稿：

```latex
\documentclass[single,print,cover=legacy,degree=professional,nostatement]{sduthesis}
```

旧版学术学位封面不显示“（学术学位）”，旧版专业学位封面显示红色“（专业学位）”；旧版封面不显示“培养方式”。如果学校提供了特殊标签，仍可在 `titlepageinfo.tex` 中使用 `\DegreeType{...}` 覆盖自动标签。

> `nostatement` 仅用于草稿、匿名评审或内部版本。正式提交前应以学校当年要求为准，通常必须保留原创性声明。

## 编译方法

推荐使用 TeX Live 2024 或更新版本，并确保系统安装 Times New Roman 字体。最简单的构建方式是：

```bash
latexmk -xelatex SDUthesistemplate.tex
```

也可以手动执行完整流程：

```bash
xelatex SDUthesistemplate.tex
bibtex SDUthesistemplate
xelatex SDUthesistemplate.tex
xelatex SDUthesistemplate.tex
```

模板入口默认为 2024 版、学术学位、包含声明。电子版可移除 `print`；双面装订可将 `single` 改为 `double`。

## 快速开始

1. 编辑 `contents/titlepageinfo.tex`，填写封面信息
2. 编辑 `contents/ch1.tex` ~ `contents/ch5.tex`，替换各章正文
3. 编辑 `contents/abstract.tex`，填写中英文摘要
4. 编辑 `contents/reference.bib`，添加参考文献
5. 运行 `latexmk -xelatex SDUthesistemplate.tex` 编译

如需清理辅助文件，可运行：

```bash
latexmk -C
```

## 各章示例内容速览

| 章节 | 文件 | 展示的排版写法 |
|------|------|---------------|
| 第一章 绪论 | `ch1.tex` | 公式、定理环境（definition/theorem/lemma/corollary/remark）、引用 |
| 第二章 预备知识 | `ch2.tex` | 算法环境、三线表、无序列表 |
| 第三章 方法 | `ch3.tex` | 图片插入、跨章引用 |
| 第四章 实现细节 | `ch4.tex` | 多行合并表格、子图排版、矩阵、分段函数 |
| 第五章 实验 | `ch5.tex` | 结果表格加粗、图片插入、消融实验表 |

## License

本项目采用 Creative Commons Attribution-NonCommercial 3.0 China Mainland License（CC BY-NC 3.0 CN）发布。完整的许可条款见 [LICENSE](./LICENSE) 文件。

- 协议概要：<https://creativecommons.org/licenses/by-nc/3.0/cn/deed.zh>
- 法律文本：<https://creativecommons.org/licenses/by-nc/3.0/cn/legalcode>
