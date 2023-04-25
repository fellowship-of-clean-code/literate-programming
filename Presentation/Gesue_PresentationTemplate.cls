\def\fileversion{1.0}
\def\filedate{01/03/2023}%dd/mm/yyyy

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Gesue_Template}[\filedate\space Version \fileversion\space by
  Riccardo Maria Gesuè]

\LoadClass[12pt,aspectratio=169]{beamer}

\usepackage{bookmark}

%% Fonts %%
\usepackage{amsmath,amssymb,txfonts}
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usefonttheme[onlylarge]{structurebold}

%% Captions %%
\usepackage[font=small,textfont=it,labelfont=bf,format=hang]{caption}
\usepackage{subcaption}

%% Bibliography %%
% Enable if needed
\usepackage{url}
\usepackage{hyperref}
\usepackage{biblatex}
\addbibresource{bibliography.bib}

%% Geometry %%
\usepackage{geometry}

%% Tables %%
\usepackage{booktabs}
\usepackage{multirow}

%% Slide layout %%
\usepackage{multicol}

%% Figures %%
\usepackage{fancyhdr}
\usepackage{setspace}
\usepackage{pstricks}

\usepackage{tikz}
\usetikzlibrary{calc,positioning}

%% Theme %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% TOC %%%
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{1}

%%% navigation symbols %%%
\setbeamertemplate{navigation symbols}{}

%%% slide styling %%%
\usetheme{Boadilla}

%%%% Transparent blocks %%%%
\setbeamercovered{transparent}

%%%% colors %%%%
\RequirePackage{xcolor}

\definecolor{azure}{rgb}{0.0, 0.5, 1.0}
\definecolor{internationalorange}{rgb}{1.0, 0.31, 0.0}

\setbeamercolor*{structure}{bg=white, fg=internationalorange!95!black} %qui cambio colore titolo e pallini principali, nello specifico nella variabile fg.
\setbeamercolor*{palette primary}{use=structure,bg=structure.bg,fg=structure.fg} %qui cambio colore della scritta del titolo e del foot a dx
\setbeamercolor*{palette secondary}{use=structure,fg=structure.fg,bg=structure.bg}
\setbeamercolor*{palette tertiary}{use=structure,fg=black,bg=structure.bg}
% \setbeamercolor*{palette quaternary}{use structure,fg=structure.fg,bg=structure.bg}%qui cambia colore scritte sopra e sotto

%%%% title %%%%
\newcommand{\institutionlogo}[1]{\includegraphics[width=2cm]{#1}}
\setbeamercolor{title}{use=structure,fg=white,bg=structure.fg}
\setbeamertemplate{title page}{
  % no header or footer
  \thispagestyle{empty}
  % don't count this as slide 1
  \setcounter{framenumber}{0}
  % place title and logo
	\vskip0em plus 1filll
	\begin{tikzpicture}[remember picture, overlay]
        \node[text = structure.fg] (title) at (.5\linewidth,0){
			\textbf{\huge\inserttitle}};
        \draw (0,-0.09\paperheight) -- (.85\linewidth,-0.09\paperheight);
		\node[inner sep=0pt] (mylogo) at (.75\linewidth,-.28\paperheight)
		    {\institutionlogo{\mylogo}};
	\end{tikzpicture}

	\vskip0em plus 1filll
	\insertauthor\linebreak
	\textit{\small \insertinstitute}
	\vskip0em plus 1filll
	\begin{center}
		\scriptsize
		\textbf{\insertdate}
	\end{center}
}
%%%% frame title %%%%
\setbeamertemplate{frame title}{\vskip.3em \insertframetitle\nolinebreak}

%%%% alert text %%%%
\setbeamercolor{alerted text}{fg=azure}

%%%% items %%%%
\setbeamertemplate{items}[circle]
\setbeamertemplate{enumerate item}[default]
\setbeamertemplate{section in toc}{\leavevmode\leftskip=1.75ex%
  \llap{%
    \usebeamerfont*{section number projected}%
    \usebeamercolor[bg]{section number projected}%
    {\small .}% or whatever
    \hskip-2.6ex%
    \hbox to2.25ex{\small\hfil\color{fg}\inserttocsectionnumber\hfil}}%
  \kern1.25ex\inserttocsection\par}
\setbeamercolor*{item projected}{use=structure,fg=structure.fg,
bg=structure.bg}
% description items on two lines
\usepackage[usestackEOL]{stackengine}
\renewcommand\stackalignment{r}
\renewcommand\stacktype{L}% Make stacks obey fixed baselineskip
\strutlongstacks{T}% Get proper spacing for singleline items

%%%% footer %%%%
\setbeamertemplate{footline}
{%
  \ifbeamer@inappendix
  \else
    \leavevmode
        \begin{tikzpicture}[remember picture, overlay]
            \node[text = black] (author) at (0.1\linewidth,.02\paperheight){
                \scriptsize\insertshortauthor};
            \node[text = structure.fg] (title) at (0.55\linewidth,.02\paperheight){
                \scriptsize\inserttitle};
            \node[text = black] (pagenumber) at (\linewidth,.02\paperheight){
                \scriptsize\insertframenumber/\insertmainframenumber};
        \end{tikzpicture}
    \fi
}

%%%% TOC %%%%
% Show TOC at each section
\AtBeginSection[]
{
    \begin{frame}
        \frametitle{Table of Contents}
        \thispagestyle{empty}
        % don't count this slide
        \addtocounter{framenumber}{-1}
        % highlight current section
        \tableofcontents[currentsection]
    \end{frame}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
