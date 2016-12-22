%%% "casthesis.cls"
\NeedsTeXFormat{LaTeX2e}[2009/06/29]
\ProvidesClass{ucasthesis}[2017/12/21 v1.0a LaTeX Class Written by Zan Pan]

%% options 
\LoadClass[a4paper,12pt,twoside,openany,titlepage,draft]{book}

%% check for common mistakes
\RequirePackage[l2tabu, orthodox]{nag}

%% AMS packages
\RequirePackage{amssymb}
\RequirePackage{amsthm}

%% load mathtools instead of amsmath
\RequirePackage{mathtools}

%% general style
\RequirePackage[svgnames]{xcolor}
\RequirePackage[format=hang,labelfont={small,sf},labelsep=quad,textfont=small,
 justification=justified,margin={2em,2em}]{caption}
\RequirePackage[top=1.2cm,bottom=1.2cm,left=2.7cm,right=2.7cm,
 headsep=0.6cm,footnotesep=0.6cm,includefoot,includehead]{geometry}
\RequirePackage[bookmarksopen=false,bookmarksnumbered=true,
 urlcolor=blue,linkcolor=blue,citecolor=blue,pdfborder={0 0 0},
 linktocpage=true,colorlinks=true,breaklinks=true]{hyperref}

%% plain TeX code for using pictures in different formats
%% you may use the package "ifpdf" directly if possible
\newif\ifpdf
\ifx\pdfoutput\undefined
 \pdffalse
\else
 \ifnum\pdfoutput=1
  \pdftrue
 \else
  \pdffalse
 \fi
\fi
\ifpdf
 \RequirePackage[pdftex]{graphicx}
\else
 \RequirePackage[dvips]{graphicx}
\fi
\AtBeginDocument{
 \ifpdf
  \DeclareGraphicsExtensions{.pdf,.jpg,.png}
 \else
  \DeclareGraphicsExtensions{.eps,.jpg,.png}
 \fi
}
\pdftrue
%% path to picture folder
\graphicspath{{figures/}} 

%% style of citations
%\def\@cite#1#2{\textsuperscript{[{#1\if@tempswa, #2\fi}]}}

%% style of bibliography
%\renewcommand\@biblabel[1]{\textsuperscript{[#1]}}
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
 \oldbibliography{#1}\setlength{\itemsep}{0em}}

%% generate indices
\RequirePackage{makeidx}
\makeindex   

%% load the package xeCJK
\RequirePackage{indentfirst}
\setlength{\parindent}{2em}
\RequirePackage[sloped]{fourier}
\RequirePackage[CJKchecksingle,CJKnumber]{xeCJK}
\CJKsetecglue{\hskip 0.15em}
\setmainfont[Mapping=tex-text]{Times New Roman}
\setCJKmainfont{SimSun}
\setCJKsansfont{SimHei}
\setCJKmonofont{KaiTi}
\setCJKfamilyfont{li}{LiSu}
\setCJKfamilyfont{fs}{FangSong}
\setCJKfamilyfont{you}{YouYuan}
\setCJKfamilyfont{xihei}{STXihei}
\punctstyle{CCT}

%% empty page
\newcommand{\emptypage}{%
 \newpage
 \thispagestyle{empty}
}

%% style of chapter and section
\RequirePackage{titlesec}
\renewcommand{\chaptername}{第\CJKnumber{\thechapter}章}
\titleformat{\chapter}{\centering\large\sffamily}{\chaptername}{0.8em}{}
\titleformat{\section}[hang]{\centering\sffamily}{\thesection}{0.6em}{}

%% style of contents
\RequirePackage{titletoc}
\titlecontents{chapter}[0em]{\addvspace{1.2ex}\sffamily}
 {第\CJKnumber{\thecontentslabel}章\hspace{0.8em}}{}
 {\titlerule*[0.72pc]{.}\contentspage}
\titlecontents{section}[3.8em]{\addvspace{0.2ex}}
 {\contentslabel{2em}}{}{\titlerule*[0.72pc]{.}\contentspage}
\titlecontents{figure}[2em]{\addvspace{0.2ex}}
 {\contentslabel{2em}}{}{\titlerule*[0.72pc]{.}\contentspage}
\titlecontents{table}[2em]{\addvspace{0.2ex}}
 {\contentslabel{2em}}{}{\titlerule*[0.72pc]{.}\contentspage}

%% style of head
\RequirePackage{fancyhdr}
\setlength{\headheight}{1.5em}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\chaptername\quad #1}{}}
\fancyfoot{}
\fancyfoot[C]{\thepage}
\newcommand{\clearhead}{%
 \fancyhead{}
 \renewcommand{\headrulewidth}{0pt}
}

%% chinese relevant commands
\renewcommand{\baselinestretch}{1.2}
\renewcommand{\figureautorefname}{图\!\!}
\renewcommand{\tableautorefname}{表\!\!}
\renewcommand{\figurename}{图\!}
\renewcommand{\tablename}{表\!}
\renewcommand{\bibname}{参\ 考\ 文\ 献}
\renewcommand{\contentsname}{目\ 录}
\renewcommand\listfigurename{插\ 图}
\renewcommand\listtablename{表\ 格}
\renewcommand{\indexname}{索\ 引}

%% cover
\newcommand{\confidential}[1]{%
 \newcommand\@confidential{#1}
}
\renewcommand{\title}[1]{%
 \renewcommand\@title{#1}
}
\renewcommand{\author}[1]{%
 \renewcommand\@author{#1}
}
\newcommand{\advisor}[1]{%
 \newcommand\@advisor{#1}
}
\newcommand{\advisorinstitute}[1]{%
 \newcommand\@advisorinstitute{#1}
}
\newcommand{\degree}[1]{%
 \newcommand\@degree{#1}
}
\newcommand{\majordegree}[1]{%
 \newcommand\@majordegree{#1}
}
\newcommand{\major}[1]{%
 \newcommand\@major{#1}
}
\newcommand{\institute}[1]{%
 \newcommand\@institute{#1}
}
\newcommand{\submitdate}[1]{%
 \newcommand\@submitdate{#1}
}
\newcommand{\uline}[1]{\underline{\makebox[0.8\textwidth]{#1}}}
\renewcommand{\maketitle}[1]{%
 \begin{titlepage}
  \vspace*{1cm}
  \begin{flushright}
   密级：\ \underline{\makebox[0.2\textwidth]{\@confidential}}
  \end{flushright}
  \vspace*{0.8cm}
  \begin{center}
   \includegraphics[width=0.85\textwidth]{ucas-logo.pdf}
   \\[0.6cm]
   \huge{\textsf{\@degree 学位论文}}
   \\[1.6cm]
   \Large{\CJKfamily{xihei}{\underline{\@title}}}
   \\[1.6cm]
   \begin{minipage}{0.85\textwidth}
    \large
    作者姓名：\ \uline{\@author} \\[0.6cm]
    指导教师：\ \uline{\@advisor} \\[0.6cm]
    \phantom{研究单位：}\ \uline{\@advisorinstitute} \\[0.6cm]
    学位类别：\ \uline{\@majordegree} \\[0.6cm]
    学科专业：\ \uline{\@major} \\[0.6cm]
    培养单位：\ \uline{\@institute}
   \end{minipage}
   \\[2cm]
   \large{\@submitdate}
  \end{center}
 \end{titlepage}
 \emptypage
 \cleardoublepage
}

%% english cover
\newcommand{\englishtitle}[1]{%
 \newcommand\@englishtitle{#1}
}
\newcommand{\englishauthor}[1]{%
 \newcommand\@englishauthor{#1}
}
\newcommand{\englishadvisor}[1]{%
 \newcommand\@englishadvisor{#1}
}
\newcommand{\englishinstitute}[1]{%
 \newcommand\@englishinstitute{#1}
}
\newcommand{\englishdegree}[1]{%
 \newcommand\@englishdegree{#1}
}
\newcommand{\englishmajordegree}[1]{%
 \newcommand\@englishmajordegree{#1}
}
\newcommand{\englishsubmitdate}[1]{%
 \newcommand\@englishsubmitdate{#1}
}
\newcommand{\makeenglishtitle}{
 \thispagestyle{empty}
 \begin{center}
  \vspace*{2cm}
  \Large{\textsf{\@englishtitle}}
  \\[1cm]
  \begin{minipage}{0.85\textwidth}
   \large
   \centering{\textbf{\@englishauthor}}
   \\[1cm]
   \centering{Directed by} \\
   \centering{\textbf{\@englishadvisor}}
   \\[2cm]
   \centering{A Dissertation Submitted to} \\
   \centering{University of Chinese Academy of Sciences} \\
   \centering{In partial fulfillment of the requirement} \\
   \centering{For the degree of} \\
   \centering{\@englishdegree\ of \@englishmajordegree}
   \\[2cm]
   \centering{\@englishinstitute}
   \\[2cm]
   \centering{\@englishsubmitdate}
  \end{minipage}
 \end{center}
 \emptypage
 \cleardoublepage
}

%% abstract
\newenvironment{abstract}{%
 \clearpage
 \phantomsection
 \addcontentsline{toc}{chapter}{摘要}
 \chapter*{摘\ 要}
}{}
\newenvironment{englishabstract}{%
 \clearpage
 \phantomsection
 \addcontentsline{toc}{chapter}{Abstract}
 \chapter*{Abstract}
}{}

%% keywords
\newcommand{\keywords}[1]{\bigskip\textsf{关键词：} #1}
\newcommand{\englishkeywords}[1]{\bigskip\textbf{Keywords:} #1}

%% contents
\newcommand{\contents}{%
 \tableofcontents
 \listoffigures
 \addcontentsline{toc}{chapter}{插图}
 \listoftables
 \addcontentsline{toc}{chapter}{表格}
}

%% chapters
\newcommand{\chapters}[1]{%
 \renewcommand{\headrulewidth}{0.5pt}
 \fancyhead[RE]{\small \@title}
 \fancyhead[LO]{\small \leftmark}
 \fancyhead[LE,RO]{\small ~\thepage~}
}

%% references
\newcommand{\references}{%
 \clearpage
 \phantomsection
 \addcontentsline{toc}{chapter}{参考文献}
}

%% publications
\newcommand{\publications}{%
 \clearpage
 \phantomsection
 \addcontentsline{toc}{chapter}{发表文章目录}
 \chapter*{发\ 表\ 文\ 章\ 目\ 录}
}

%% acknowledgements
\newcommand{\acknowledgements}{%
 \clearpage
 \phantomsection
 \addcontentsline{toc}{chapter}{致谢}
 \chapter*{致\ 谢}
}

%% enumeration
\RequirePackage{enumitem}
\setenumerate[1]{leftmargin=3.3em,topsep=0.4em,itemsep=0.4em,parsep=0em}

%% mathematics
\numberwithin{equation}{chapter}
\theoremstyle{plain}
\newtheorem{theorem}{定理}
\newtheorem{definition}[theorem]{定义}
\newtheorem{proposition}[theorem]{命题}
\renewcommand{\proofname}{\textbf{证明}}
\renewcommand{\qedsymbol}{\ensuremath{\blacksquare}}

%% style of table
\setlength{\tabcolsep}{3mm}
\setlength{\arrayrulewidth}{0.05mm}
\setlength{\doublerulesep}{1.0mm}
