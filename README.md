# 山东大学研究生毕业论文模板

本论文模板基于 [cnDelbert/SDU_thesis_template_for_postgraduate](https://github.com/cnDelbert/SDU_thesis_template_for_postgraduate) 修改而来，在 CTeX / TeX Live 环境下编译通过。

## 模板参照

参考的规范文件（位于本仓库中）：

- [2024版学位论文封面（扉页）.docx](./2024%E7%89%88%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E5%B0%81%E9%9D%A2%EF%BC%88%E6%89%89%E9%A1%B5%EF%BC%89.docx) — 封面排版格式
- [山东大学硕士学位论文模板_标准版.doc](./%E5%B1%B1%E4%B8%9C%E5%A4%A7%E5%AD%A6%E7%A1%95%E5%A3%AB%E5%AD%A6%E4%BD%8D%E8%AE%BA%E6%96%87%E6%A8%A1%E6%9D%BF_%E6%A0%87%E5%87%86%E7%89%88.doc) — 正文排版格式

## 主要修改

与原模板相比，本版本的主要修改包括：

- **封面重做**：根据 2024 版学位论文封面文件重新设计了封面排版
- **新增字段**：封面新增 `\Dform`（培养方式）和 `\DegreeType`（学位类型）字段
- **学位类型切换**：支持学术学位（黑色）/ 专业学位（红色）一键切换
- **格式规范文档**：[山东大学硕士学位论文格式规范.md](山东大学硕士学位论文格式规范.md)
- **内容示例化**：正文替换为通用示例，各章展示不同排版写法

## 项目文件结构

```
SDUthesis_latex/
├── SDUthesistemplate.tex      # 主入口文件
├── sduthesis.cls              # 论文样式文件（文档类）
├── sduthesis-front-cover.def  # 封面定义
├── sduthesis-statement.def    # 原创性声明
├── LICENSE                    # 许可证
├── .gitignore                 # Git 忽略规则
├── figures/                   # 图片存放目录
│   ├── SDU_master.jpg         # 封面校徽
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
├── ccmap.sty                  # 字符映射
├── dtklogos.sty               # 字体标识
└── gbt7714-numerical.bst      # GB/T 7714 参考文献格式
```

## 封面使用说明

封面信息在 `contents/titlepageinfo.tex` 中填写：

### 学位类型切换

在 `titlepageinfo.tex` 中切换（二选一，取消对应行的注释即可）：

```latex
\DegreeType{（学术学位）}                           % 默认，黑色
% \DegreeType{\textcolor{SDUred}{（专业学位）}}     % 专业学位，红色
```

## 编译方法

需要 CTeX 套装或 TeX Live，支持 `xelatex` 命令。

```bash
xelatex SDUthesistemplate.tex
bibtex SDUthesistemplate
xelatex SDUthesistemplate.tex
xelatex SDUthesistemplate.tex
```

> 如果 CTeX 中 ctex 包版本为 1.02c 或更早，请在 `SDUthesistemplate.tex` 开头取消注释：
> ```latex
> \expandafter\def\csname CTEX@spaceChar\endcsname{\hspace{1em}}
> ```

编译生成的 PDF 可直接打印，双面打印效果最佳。

## 快速开始

1. 编辑 `contents/titlepageinfo.tex`，填写封面信息
2. 编辑 `contents/ch1.tex` ~ `contents/ch5.tex`，替换各章正文
3. 编辑 `contents/abstract.tex`，填写中英文摘要
4. 编辑 `contents/reference.bib`，添加参考文献
5. 运行 `xelatex` 编译

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
