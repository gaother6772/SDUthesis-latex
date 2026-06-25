% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sduthesis}[2026/06/24 v1.2.0 Shandong University Thesis Template for Postgraduate]
%------解决表格换行问题-------
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}  
%------解决表格换行问题-------

% ----- KVoptions Packages -----
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=SDU, prefix=SDU@opt@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{SDU}{#1}}

% ----- Declare Options -----
% ----- CHSstyle
\DeclareBoolOption[true]{chsstyle}
\DeclareComplementaryOption{nochsstyle}{chsstyle}
% ----- draft/print
\DeclareBoolOption[false]{print}
\DeclareComplementaryOption{noprint}{print}
% ----- double/single
\DeclareBoolOption[true]{double}
\DeclareComplementaryOption{single}{double}
% ----- cover/degree/statement
\DeclareStringOption[2024]{cover}
\DeclareStringOption[academic]{degree}
\DeclareBoolOption[true]{statement}
\DeclareComplementaryOption{nostatement}{statement}
% ----- Default Options
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
% Validate string options once, before layout files consume them.
\newif\ifSDU@cover@legacy
\newif\ifSDU@degree@professional
\ifdefstring{\SDU@opt@cover}{2024}{%
  \SDU@cover@legacyfalse
}{%
  \ifdefstring{\SDU@opt@cover}{legacy}{%
    \SDU@cover@legacytrue
  }{%
    \ClassError{sduthesis}{Invalid cover option `\SDU@opt@cover'}{Use cover=2024 or cover=legacy.}%
  }%
}
\ifdefstring{\SDU@opt@degree}{academic}{%
  \SDU@degree@professionalfalse
}{%
  \ifdefstring{\SDU@opt@degree}{professional}{%
    \SDU@degree@professionaltrue
  }{%
    \ClassError{sduthesis}{Invalid degree option `\SDU@opt@degree'}{Use degree=academic or degree=professional.}%
  }%
}
% A4 纸张；双面模式使用镜像页边距并保证章从奇数页开始。
\ifSDU@opt@double
  \LoadClass[a4paper,12pt,twoside,openright]{book}
\else
  \LoadClass[a4paper,12pt,oneside,openany]{book}
\fi
%------print------

%------中文支持------
\RequirePackage[scheme=plain,UTF8,heading,fontset=none]{ctex}
% 2024 版模板以 Windows 字体为基准；显式配置粗体/斜体映射以避免静默回退。
\setCJKmainfont[BoldFont=SimHei,ItalicFont=KaiTi]{SimSun}
\setCJKsansfont[AutoFakeBold=2]{SimHei}
\setCJKmonofont{FangSong}
\setCJKfamilyfont{zhsong}[BoldFont=SimHei,ItalicFont=KaiTi]{SimSun}
\setCJKfamilyfont{zhhei}[AutoFakeBold=2]{SimHei}
\setCJKfamilyfont{zhfs}{FangSong}
\setCJKfamilyfont{zhkai}{KaiTi}
\providecommand{\songti}{}
\providecommand{\heiti}{}
\providecommand{\fangsong}{}
\providecommand{\kaishu}{}
\renewcommand{\songti}{\CJKfamily{zhsong}}
\renewcommand{\heiti}{\CJKfamily{zhhei}}
\renewcommand{\fangsong}{\CJKfamily{zhfs}}
\renewcommand{\kaishu}{\CJKfamily{zhkai}}
%----字体名
%\RequirePackage{ifpdf,ifxetex}
%\ifpdf
%	\newcommand{\fzbHei}{\heiti}
%\else
%	\newcommand{\fzbHei}{\heiti}
%\fi
%------中文支持------

%%%%%%%%%%%%%%%%%%%%%%%%页面设置%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
\ifSDU@opt@double
  \newcommand{\GeoOptions}{inner=3.0cm,outer=2.5cm,top=2.5cm,bottom=2.5cm,headheight=0.7cm,headsep=0.3cm,footskip=0.75cm}
\else
  \newcommand{\GeoOptions}{left=3.0cm,right=2.5cm,top=2.5cm,bottom=2.5cm,headheight=0.7cm,headsep=0.3cm,footskip=0.75cm}
\fi
%\newcommand{\GeoOptions}{left=2.75cm, right=2.75cm, top=3cm, bottom=3cm}
%\fi
\RequirePackage[\GeoOptions]{geometry}
%------页面设置------
%------行距------
\linespread{1.3}
\addtolength{\parskip}{.3ex}
%------行距------
%%%%%%%%%%%%%%%%%%%%%页眉页脚%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
%----清除设置----
\pagestyle{fancyplain}
\fancyhf{}
%----清除设置----

%----页眉划线----
\renewcommand{\headrule}{%
	\hrule\@height1.5pt\@width\headwidth%
	\vskip1pt%
	\hrule\@height\headrulewidth\@width\headwidth%
}
%----眉脚内容----
% ----------页眉----------
\pagestyle{fancy}
%\fancyhf{}
%\makeatletter
\ifSDU@opt@chsstyle
\chead{\songti\zihao{5}\the\ThesisHeader}% 山东大学硕士学位论文
\else
\chead{\small \the\EThesisHeader}
\fi
%\makeatother
% ----------页脚----------
\cfoot{{~\thepage~}}  % 页码居中显示,不加--
%\fancyfoot[LE,RO]{--{~\thepage~}--}   % 页码居外侧显示
%----眉脚内容----
%------页眉页脚------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%数学支持%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsbsy}
\RequirePackage{bm}
\RequirePackage{mathrsfs}
\newcommand*{\me}{\ensuremath{\mathrm{e}}}				%自然对数的底
\newcommand*{\mi}{\ensuremath{\mathrm{i}}}				%虚数单位
\newcommand*{\dif}{\ensuremath{\,\mathrm{d}}}			%微分算子
\DeclareMathAlphabet{\mathsfsl}{OT1}{cmss}{m}{sl}
\newcommand*{\VEC}[1]{\ensuremath{\boldsymbol{#1}}}		%向量
\newcommand*{\MATRIX}[1]{\ensuremath{\mathsfsl{#1}}}	%矩阵名称
\newcommand*{\TENSOR}[1]{\ensuremath{\mathsfsl{#1}}}	%张量名称
\newcommand*{\HUA}[1]{\ensuremath{\mathscr{{#1}}}} 		%输出花体字母
\newcommand*{\SHUANG}[1]{\ensuremath{\mathbb{{#1}}}}	%输出双线字母
\numberwithin{equation}{chapter}						%公式编号随section变化
%------数学支持------

%%%%%%%%%%%%%%%%%%%%%%%%%%图表支持%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
%----图档搜索路径----
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}
%----图档搜索路径----
\RequirePackage{booktabs}
%%----表格行距----
\renewcommand\arraystretch{1.3}
%-----算法行距----
\RequirePackage[ruled,linesnumbered]{algorithm2e}
\SetAlFnt{\linespread{1.3}\normalfont} % 将行距设置为1.5倍
%%----表格行距----
%----编号----
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
\renewcommand\theequation{\arabic{chapter}-\arabic{equation}}
\renewcommand {\thetable} {\thechapter{}-\arabic{table}}
\renewcommand {\thefigure} {\thechapter{}-\arabic{figure}}
%----编号----
%----不浮动----
\makeatletter
\newcommand{\figcaption}{\def\@captype{figure}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\caption}
\makeatother
\RequirePackage{caption}
\captionsetup[figure]{font={small, bf}, labelsep=space, skip=6pt, position=bottom}
\captionsetup[table]{font={small, bf}, labelsep=space, skip=6pt, position=top}
% 浮动页从顶部排版，避免小表格或算法被垂直居中在大块空白中。
\makeatletter
\setlength{\@fptop}{0pt}
\setlength{\@fpsep}{14pt}
\setlength{\@fpbot}{0pt plus 1fil}
\makeatother
\renewcommand{\topfraction}{0.95}
\renewcommand{\bottomfraction}{0.95}
\renewcommand{\textfraction}{0.06}
\renewcommand{\floatpagefraction}{0.80}
\setlength{\textfloatsep}{16pt plus 3pt minus 3pt}
\setlength{\floatsep}{14pt plus 3pt minus 3pt}
%----不浮动----
\RequirePackage{multirow}
%------图表支持------

%%%%%%%%%%%%%%%%%%%%%%%%%%%交叉引用%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{unicode,hypertexnames=false}
\hypersetup{colorlinks=true}
\hypersetup{linkcolor=black}
\pdfstringdefDisableCommands{\def\quad{ }}
\makeatletter
\ifSDU@opt@print
	\hypersetup{allcolors=black}
\else\relax\fi
\makeatother
%------交叉引用------


%%%%%%%%%%%%%%%%%%%%%%%%%中文摘要%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\cnabstractname{摘\quad\quad 要}
\newcommand\cnkeywordsname{关键词}
\newcommand\cnkeywords[1]{%
	%	\vspace{1cm}%
	\begingroup
	\setlength\parskip{0pt}% 段前段后间距为0
	\setlength\parindent{0pt}% 无缩进
	%	\singlespacing% 单倍行距（假设您已经使用了 setspace 宏包）
	\setlength\baselineskip{20pt}% 固定值20磅行距
	\justifying\songti% 使用宋体
	\zihao{-4}% 小四号
	\noindent% 无缩进
	% {\songti\bfseries\zihao{-4}\cnkeywordsname：}
	{\heiti\zihao{-4}\cnkeywordsname：}% 使用黑体（替换原来的 \bfseries），并保留原有的字号和标签
	#1% 关键词加粗
	\endgroup% 结束局部组，恢复先前的格式设置
}
%其后关键词用全角分号分隔，中文字体为宋体，小四号，两端对齐，无缩进，段前0行，段后0行，固定值20磅。
\newenvironment{cnabstract}{%
	\newpage
	\phantomsection
	\vspace*{24pt}% 新增：设置标题段前间距为24pt
	\centerline{\noindent\zihao{-3}\bfseries\heiti\cnabstractname}\vspace{18pt}% 修改：设置段后间距为18pt
	\addcontentsline{toc}{chapter}{摘\quad{}要} %使目录中以章级别显示“摘要”
	\addcontentsline{toe}{chapter}{Chinese Abstract}
	\setlength{\parindent}{2em}% 新增：设置首行缩进为2字符
	\setlength{\parskip}{0pt}% 新增：设置段前段后间距为0
	%		\linespread{1}% 新增：设置正文单倍行距
	%		\zihao{-4}% 修改：删除这一行，因为不需要在这里设置字号
	\justifying\songti\zihao{-4}\setlength{\baselineskip}{20pt}\selectfont
}{%
	\clearpage
}
%---------- 中文摘要--------------

%%%%%%%%%%%%%%%%%%%%%%%%%英文摘要%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\enabstractname{ABSTRACT}
\newcommand\enkeywordsname{Key words}
\newcommand\enkeywords[1]{%
	%	\vspace{1cm}%
	\begingroup
	\setlength\parskip{0pt}% 段前段后间距为0
	\setlength\parindent{0pt}% 无缩进
	%	\singlespacing% 单倍行距（假设您已经使用了 setspace 宏包）
	\setlength\baselineskip{20pt}% 固定值20磅行距
	\justifying\zihao{-4}% 小四号
	\noindent% 无缩进
	{\bfseries\zihao{-4}\enkeywordsname：}% 使用黑体（替换原来的 \bfseries），并保留原有的字号和标签
	#1% 关键词加粗
	\endgroup% 结束局部组，恢复先前的格式设置
}
\newenvironment{enabstract}{%
	\newpage
	\phantomsection
	\vspace*{24pt}% 新增：设置标题段前间距为24pt
	\centerline{\noindent\zihao{-3}\bfseries\enabstractname}\vspace{18pt}% 修改：设置段后间距为18pt
	\addcontentsline{toc}{chapter}{ABSTRACT}
	\addcontentsline{toe}{chapter}{English Abstract}
	\setlength{\parindent}{1.2em}% 新增：设置首行缩进为2字符
	\setlength{\parskip}{0pt}% 新增：设置段前段后间距为0
	%		\linespread{1}% 新增：设置正文单倍行距
	%		\zihao{-4}% 修改：删除这一行，因为不需要在这里设置字号
	\justifying\zihao{-4}\setlength{\baselineskip}{20pt}\selectfont
}{%
	\clearpage
}
%------英文摘要-----------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%目录%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\def\@bfdottedtocline#1#2#3#4#5{%
\ifnum #1>\c@tocdepth \else
  \vskip \z@ \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
   \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode \songti
   \@tempdima #3\relax
   \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
   {#4}\normalfont\nobreak
   \leaders\hbox{$\m@th
      \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
      mu$}\hfill
   \nobreak
   \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
   \par}%
\fi}
\renewcommand*\l@chapter{\@bfdottedtocline{0}{0em}{1.5em}}
\renewcommand*\l@section{\@bfdottedtocline{1}{1.5em}{1.5em}}
\renewcommand*\l@subsection{\@bfdottedtocline{2}{3em}{1.8em}}
\renewcommand*\l@subsubsection{\@bfdottedtocline{3}{4.8em}{2em}}
\makeatother
%--------目录-------------

%%%%%%%%%%%%%%%%%%%%%%English Contents%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\newcommand\engcontentsname{Contents}
\newcommand\tableofengcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\engcontentsname
        \@mkboth{%
           \MakeUppercase\engcontentsname}{\MakeUppercase\engcontentsname}}%
    \@starttoc{toe}% !!!!Define a new contents!!!!
    \if@restonecol\twocolumn\fi
    }
%\newcommand\addengcontents[2]{%
%    \addcontentsline{toe}{#1}{\protect\numberline { \csname the#1\endcsname}#2}}
\newcommand\echapter[1]{\addcontentsline{toe}{chapter}{\protect\numberline{Chapter \thechapter}#1}}
\newcommand\esection[1]{\addcontentsline{toe}{section}{\protect\numberline{\thesection}#1}}
\newcommand\esubsection[1]{\addcontentsline{toe}{subsection}{\protect\numberline{\thesubsection}#1}}
\newcommand\esubsubsection[1]{\addcontentsline{toe}{subsubsection}{\protect\numberline{\thesubsubsection}#1}}
\makeatother
%—————————English Contents—————————————

%%%%%%%%%%%%%%%%%%%%%%%%%符号说明%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\symboldescriptionname{符号对照表}
\newenvironment{symboldescription}{%
	\newpage
	\phantomsection
	\vspace*{24pt}% 新增：设置标题段前间距为24pt
	\centerline{\zihao{-3}\bfseries\symboldescriptionname}\vspace{18pt}% 修改：设置段后间距为18pt
}{%
	\clearpage
}
%----------------------符号说明-------------------------------
%
%\makeatletter
%\ifSDU@opt@chsstyle
%%%%%%%%%%%%%%%%%%%标题与日期%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ctexset{
  figurename = {图},
  tablename = {表},
  bibname = {参考文献},
  contentsname = {目\quad{}{}录},
  today = small,
  chapter = {
    name = {,},
    format = {\centering},
    nameformat = {\bfseries\heiti\zihao{-3}},
    titleformat = {\bfseries\heiti\zihao{-3}},
    aftername = {\ },
    beforeskip = {24pt},
    afterskip = {18pt},
    afterindent = true
  },
  section = {
    format = {\bfseries\heiti\raggedright\zihao{4}},
    beforeskip = {24pt},
    afterskip = {6pt},
    afterindent = true
  },
  subsection = {
    format = {\bfseries\heiti\raggedright\zihao{-4}},
    beforeskip = {12pt},
    afterskip = {6pt},
    afterindent = true
  },
  subsubsection = {
    format = {\heiti\raggedright\zihao{-4}},
    beforeskip = {12pt},
    afterskip = {6pt},
    afterindent = true
  },
  appendix = {
    name = {附录~},
    number = {\Alph{chapter}}
  }
}
%
%%%%%%%%%%%%%%%%%%%致谢%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\acknowledgment}
{
	\clearpage  %加这个命令后，目录中的页码才显示正确
	\phantomsection %加这个命令后，目录中的超链接才指向正确的页码	
	\vspace*{24pt}%
	\centerline{\bfseries\heiti\zihao{-3}{致\hspace{4ex}谢}}\vspace{18pt}%
	\addcontentsline{toc}{chapter}{致\quad{}谢} %使目录中以章级别显示“致谢”
	\addcontentsline{toe}{chapter}{Acknowledgement}
}
%----------致谢---------------------

%%%%%%%%%%%%%%%%%%%%结论%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\conclusion}
{
	\clearpage
	\phantomsection
	\refstepcounter{chapter}%
	\setcounter{section}{0}%
	\vspace*{24pt}%
	\centerline{\bfseries\heiti\zihao{-3}{结\quad\quad 论}}\vspace{18pt}%
	\addcontentsline{toc}{chapter}{结\quad{}论}
	\addcontentsline{toe}{chapter}{Conclusion}
}
\newcommand{\econclusion}[1]{
	\addcontentsline{toe}{chapter}{#1}
}
%----------结论---------------------

%%%%%%%%%%%%%%%%%%%%参考文献%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{gbt7714}
\newcommand{\upcite}[1]{\cite{#1}}
\renewcommand{\bibfont}{\justifying\songti\zihao{-4}\setlength{\baselineskip}{20pt}\selectfont}
\setlength{\bibsep}{0pt plus 0.5ex}
\setlength{\bibhang}{0.74cm}
%------参考文献------
% \RequirePackage[numbers]{gbt7714}
% \renewcommand{\bibfont}{\justifying\zihao{-4}}
% \setlength{\bibsep}{0pt plus 0.5ex}
%\else\relax\fi
%\setlength\baselineskip{20pt}\selectfont
\newcommand\ereferences[1]{% Optional argument for the title if it's different from "References"
	\addcontentsline{toe}{chapter}{%
		\if\relax\detokenize{#1}\relax % If no optional argument is provided, use "References"
		References%
		\else
		#1%
		\fi
	}%
}
%----参考文献---------------
%----首行缩进----
\RequirePackage{indentfirst}
%----首行缩进----
%\else\relax\fi
\setlength{\parindent}{2em}
%\makeatletter

%\linespread{1.3}
%\addtolength{\parskip}{.3ex}

%\setlength{\parskip}{0pt}% 设置段前段后间距为0pt
%\setlength{\baselineskip}{20pt}
\raggedbottom% 页面底部不强制拉伸段间距
\AtBeginDocument{\songti\selectfont}% 正文默认宋体
%------中文风格------

%%%%%%%%%%%%%%%%%%%封面%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makeatletter
\input{sduthesis-front-cover.def}
\makeatother
%------封面------

%%%%%%%%%%%%%%%%%%%声明%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\input{sduthesis-statement.def}
%------声明------
\makeatletter
%------Make------
\newcommand{\SDUblankpage}{%
  \clearpage
  \thispagestyle{empty}%
  \null
  \clearpage
}
\newcommand{\makefrontmatter}{%
  \maketitlepage
  \ifSDU@opt@print\SDUblankpage\else\clearpage\fi
  \ifSDU@opt@statement
    \makestatement
    \ifSDU@opt@print\SDUblankpage\else\clearpage\fi
  \fi
  \pagestyle{fancy}
  \setcounter{page}{1}
}
% Backward-compatible name used by releases before v1.2.0.
\newcommand{\maketitlepagestatement}{\makefrontmatter}
\newcommand{\maketableofcontents}{%
    \pagenumbering{Roman}
    \setcounter{secnumdepth}{3}% 确保 subsubsection 被编号
    \tableofcontents
    \ifSDU@opt@double
        \cleardoublepage
    \else
        \clearpage
    \fi
 %   \pagenumbering{arabic}\setcounter{page}{1}
}
%------Make------
\endinput

%------载入宏包------
%--中文支持
ctex
%--页面设置
geometry
%--页眉页脚
fancyhdr
%--数学支持
amsmath
amsfonts
amsthm
amssymb
amsbsy
bm
mathrsfs
%--图表
graphicx
booktabs
amsmath
%------载入宏包------
