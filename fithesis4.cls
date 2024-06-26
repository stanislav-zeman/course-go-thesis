%%
%% This is file `fithesis4.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fithesis.dtx  (with options: `class')
%% 
%% Copyright 1998--2024  Daniel Marek (DM), Jan Pavlovič (JP),
%%                       Petr Sojka (PS), Vít Starý Novotný (VN),
%%                       Tereza Vrabcová (TV)
%% http://www.fi.muni.cz/tech/unix/tex/fithesis.xhtml
%% Faculty of Informatics, Masaryk University (Brno, Czech Republic)
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version
%% 1.3 of this license or (at your option) any later version.
%% The latest version of this license is available at
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 
%% This work has the LPPL maintenance status `maintained'.
%% 
%% The Current Maintainer of this work is Vít Starý Novotný (VN).
%% Send bug reports, requests for additions and questions
%% either to the fithesis discussion forum at
%% 
%%   http://is.muni.cz/auth/df/fithesis-sazba/
%% 
%% or to the e-mail address <witiko@mail.muni.cz>.
%% 
%% 
%% MODIFICATION ADVICE:
%% 
%% If you want to customize this file, it is best to make a copy of
%% the source file(s) from which it was produced.  Use a different
%% name for your copy(ies) and modify the copy(ies); this will ensure
%% that your modifications do not get overwritten when you install a
%% new release of the standard system.  You should also ensure that
%% your modified source file does not generate any modified file with
%% the same name as a standard file.
%% 
%% You will also need to produce your own, suitably named, .ins file to
%% control the generation of files from your source file; this file
%% should contain your own preambles for the files it generates, not
%% those in the standard .ins files.
%% 
%% The names of the source files used are shown above.
%% 
\NeedsTeXFormat{LaTeX2e}
{\def\thesis@versiondef#1#2{
  \gdef\thesis@version@number{#1}
  \gdef\thesis@version@date{#2}
  \gdef\thesis@version{#2 #1 fithesis4 MU thesis class}}
\thesis@versiondef{v1.1.1}{2024/03/06}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{fithesis4}[\thesis@version]
\ifx\thesis@backend\undefined
  \def\thesis@backend{[a4paper]{rapport3}}
\fi\expandafter\LoadClass\thesis@backend
\RequirePackage{keyval}
\RequirePackage{etoolbox}
\RequirePackage{ltxcmds}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}
\ifxetex\else\ifluatex\else
  \RequirePackage[utf8]{inputenc}
\fi\fi
\RequirePackage{xpatch}
\long\def\thesissetup#1{%
  \setkeys{thesis}{#1}}
\def\thesis@basepath{fithesis/}
\define@key{thesis}{basePath}{%
  \ifx\thesis@empty#1\thesis@empty
    \def\thesis@basepath{}%
  \else
    \def\thesis@basepath{#1/}%
  \fi}
\def\thesis@logopath{\thesis@basepath logo/\thesis@university/}
\define@key{thesis}{logoPath}{%
  \def\thesis@logopath{\thesis@subdir#1%
    \empty\empty\empty\empty}}
\def\thesis@stylepath{\thesis@basepath style/}
\define@key{thesis}{stylePath}{%
  \def\thesis@stylepath{\thesis@subdir#1%
    \empty\empty\empty\empty}}
\def\thesis@localepath{\thesis@basepath locale/}
\define@key{thesis}{localePath}{%
  \def\thesis@localepath{\thesis@subdir#1%
    \empty\empty\empty\empty}}
\def\thesis@subdir#1#2#3#4\empty{%
  \ifx#1\empty%           <empty> -> <basepath>
    \thesis@basepath
  \else
    \if#1/%
      \ifx#2\empty%             / -> /
        /%
      \else%              /<path> -> /<path>/
        #1#2#3#4/%
      \fi
    \else
      \if#1.%
        \ifx#2\empty%           . -> ./
          ./%
        \else
          \if#2.%
            \ifx#3\empty%      .. -> ../
              ../%
            \else
              \if#3/%   ../<path> -> ../<path>/
                ../#4/%
              \else
                \thesis@basepath#1#2#3#4/%
              \fi
            \fi
          \else
            \if#2/%      ./<path> -> ./<path>/
              ./#3#4/%
            \else
              \thesis@basepath#1#2#3#4/%
            \fi
          \fi
        \fi
      \else
        \thesis@basepath#1#2#3#4/%
      \fi
    \fi
  \fi}
\newcommand{\thesis@def}[2][]{%
  \expandafter\def\csname thesis@#2\endcsname{%
    <<\ifx\thesis@empty#1\thesis@empty#2\else#1\fi>>}}
\def\thesis@declaration{\thesis@@{declaration}}
\long\def\KV@thesis@declaration#1{%
  \long\def\thesis@declaration{#1}}
\newif\ifthesis@woman\thesis@womanfalse
\define@key{thesis}{gender}{%
  \def\thesis@male{m}%
  \def\thesis@arg{#1}%
  \ifx\thesis@male\thesis@arg
    \thesis@womanfalse
  \else
    \thesis@womantrue
  \fi}
\def\thesis@parseAuthor#1{%
  \def\thesis@author{#1}%
  \def\thesis@author@head{\expandafter\expandafter\expandafter
    \@gobble\thesis@head#1 \relax}%
  \def\thesis@author@tail{\thesis@tail#1 \relax}}
\thesis@def{author}%
\thesis@def[author]{author@head}%
\thesis@def[author]{author@tail}%
\define@key{thesis}{author}{%
  \thesis@parseAuthor{#1}}
\let\author\thesis@parseAuthor
\thesis@def{id}
\define@key{thesis}{id}{%
  \def\thesis@id{#1}}
\def\thesis@sempaper{sem}
\def\thesis@bachelors{bc}
\def\thesis@masters{mgr}
\def\thesis@proposal{prop}
\def\thesis@doctoral{d}
\def\thesis@rigorous{r}
\let\thesis@type\thesis@bachelors
\define@key{thesis}{type}{%
  \def\thesis@type{#1}}
\def\thesis@university{mu}
\define@key{thesis}{university}{%
  \def\thesis@university{#1}}
\def\thesis@faculty{fi}
\define@key{thesis}{faculty}{%
  \def\thesis@faculty{#1}}
\thesis@def{department}
\define@key{thesis}{department}{%
  \def\thesis@department{#1}}
\thesis@def{departmentEn}
\define@key{thesis}{departmentEn}{%
  \def\thesis@departmentEn{#1}}
\thesis@def{programme}
\define@key{thesis}{programme}{%
  \def\thesis@programme{#1}}
\thesis@def{programmeEn}
\define@key{thesis}{programmeEn}{%
  \def\thesis@programmeEn{#1}}
\thesis@def{field}
\define@key{thesis}{field}{%
  \def\thesis@field{#1}}
\thesis@def{fieldEn}
\define@key{thesis}{fieldEn}{%
  \def\thesis@fieldEn{#1}}
\def\thesis@universityLogo{fithesis-base-\thesis@locale}
\define@key{thesis}{universityLogo}{%
  \def\thesis@universityLogo{#1}}
\def\thesis@facultyLogo{fithesis-\thesis@faculty-\thesis@locale}
\define@key{thesis}{facultyLogo}{%
  \def\thesis@facultyLogo{#1}}
\def\thesis@style{\thesis@university/fithesis-\thesis@university-\thesis@faculty}
\define@key{thesis}{style}{%
  \def\thesis@style{#1}}
\newif\ifthesis@style@inheritance\thesis@style@inheritancetrue
\define@key{thesis}{styleInheritance}[true]{%
  \begingroup
  \def\@true{true}%
  \def\@arg{#1}%
  \ifx\@true\@arg
    \endgroup\thesis@style@inheritancetrue
  \else
    \endgroup\thesis@style@inheritancefalse
  \fi}
\def\thesis@locale{%
  % Babel / polyglossia detection
  \ifx\languagename\undefined
  english\else\languagename\fi}
\define@key{thesis}{locale}{%
  \def\thesis@locale{#1}}
\def\ifthesis@english{
  \expandafter\def\expandafter\@english\expandafter{\string
  \english}%
  \expandafter\expandafter\expandafter\def\expandafter
  \expandafter\expandafter\@locale\expandafter\expandafter
  \expandafter{\expandafter\string\csname\thesis@locale\endcsname}%
  \expandafter\csname\expandafter i\expandafter f\ifx\@locale
  \@english
    true%
  \else
    false%
  \fi\endcsname}
\newif\ifthesis@locale@inheritance\thesis@locale@inheritancetrue
\define@key{thesis}{localeInheritance}[true]{%
  \begingroup
  \def\@true{true}%
  \def\@arg{#1}%
  \ifx\@true\@arg
    \endgroup\thesis@locale@inheritancetrue
  \else
    \endgroup\thesis@locale@inheritancefalse
  \fi}
\def\thesis@parseDate#1/#2/#3|{{
  % Set the basic macros
  \gdef\thesis@date{#1/#2/#3}%
  \gdef\thesis@year{#1}%
  \gdef\thesis@month{#2}%
  \gdef\thesis@day{#3}%

  % Set the season
  \newcount\@month\expandafter\@month\thesis@month\relax
       \ifnum\@month>8\gdef\thesis@season{fall}
  \else\ifnum\@month<3\gdef\thesis@season{fall}
  \else               \gdef\thesis@season{spring}
  \fi\fi

  % Set the academic year
  \newcount\@year\expandafter\@year\thesis@year\relax
  \ifnum\@month>8%
                    \edef\@yearA{\the\@year}%
    \advance\@year 1\edef\@yearB{\the\@year}%
    \advance\@year-1
  \else
    \advance\@year-1\edef\@yearA{\the\@year}%
    \advance\@year 1\edef\@yearB{\the\@year}%
  \fi
  \global\edef\thesis@academicYear{\@yearA/\@yearB}

  % Set the season year
  \ifnum\@month>2\else
    \advance\@year-1
  \fi
  \global\edef\thesis@seasonYear{\the\@year}}}

\edef\thesis@date{\the\year/\the\month/\the\day}%
\expandafter\thesis@parseDate\thesis@date|%

\define@key{thesis}{date}{{%
  \edef\@date{#1}%
  \expandafter\thesis@parseDate\@date|}}
\def\thesis@place{Brno}
\define@key{thesis}{place}{%
  \def\thesis@place{#1}}
\thesis@def{title}
\define@key{thesis}{title}{%
  \def\thesis@title{#1}}
\def\title#1{\def\thesis@title{#1}}
\let\maketitle\relax
\def\thesis@TeXtitle{\thesis@title}
\define@key{thesis}{TeXtitle}{%
  \def\thesis@TeXtitle{#1}}
\thesis@def{titleEn}
\define@key{thesis}{titleEn}{%
  \def\thesis@titleEn{#1}}
\def\thesis@TeXtitleEn{\thesis@titleEn}
\define@key{thesis}{TeXtitleEn}{%
  \def\thesis@TeXtitleEn{#1}}
\thesis@def{keywords}
\define@key{thesis}{keywords}{%
  \def\thesis@keywords{#1}}
\def\thesis@TeXkeywords{\thesis@keywords}
\define@key{thesis}{TeXkeywords}{%
  \def\thesis@TeXkeywords{#1}}
\thesis@def{keywordsEn}
\define@key{thesis}{keywordsEn}{%
  \def\thesis@keywordsEn{#1}}
\def\thesis@TeXkeywordsEn{\thesis@keywordsEn}
\define@key{thesis}{TeXkeywordsEn}{%
  \def\thesis@TeXkeywordsEn{#1}}
\thesis@def{abstract}
\long\def\KV@thesis@abstract#1{%
  \long\def\thesis@abstract{#1}}
\thesis@def{abstractEn}
\long\def\KV@thesis@abstractEn#1{%
  \long\def\thesis@abstractEn{#1}}
\thesis@def{advisor}
\define@key{thesis}{advisor}{\def\thesis@advisor{#1}}
\long\def\KV@thesis@thanks#1{%
  \long\def\thesis@thanks{#1}}
\define@key{thesis}{assignment}{%
  \def\thesis@assignmentFiles{#1}}

\define@key{thesis}{bib}{%
  \def\thesis@bibFiles{#1}}
\newif\ifthesis@auto\thesis@autotrue
\define@key{thesis}{autoLayout}[true]{%
  \def\@true{true}%
  \def\@arg{#1}%
  \ifx\@true\@arg
    \thesis@autotrue
  \else
    \thesis@autofalse
  \fi}
\ifx\thesis@pages@preamble\undefined
  \def\thesis@pages@preamble{??}\fi
\ifx\thesis@pages@postamble\undefined
  \def\thesis@pages@postamble{??}\fi
\def\thesis@preamble{%
  {\thesis@selectLocale{\thesis@locale}%
  \thesis@blocks@preamble
  \gdef\thesis@pages@preamble{\thepage}
  \write\@auxout{\noexpand\gdef\noexpand
    \thesis@pages@preamble{\thepage}}
  \clearpage}
  \thesis@blocks@mainMatter}

\let\thesis@blocks@preamble\relax
\let\thesis@blocks@mainMatter\relax
\def\thesis@postamble{%
  \gdef\thesis@pages@postamble{\thepage}
  \immediate\write\@auxout{\noexpand\gdef\noexpand
    \thesis@pages@postamble{\thepage}}
  {\thesis@selectLocale{\thesis@locale}%
  \thesis@blocks@postamble}}

\let\thesis@blocks@postamble\relax
\def\thesis@extra@KV@prefix{KV@thesis@extra@}
\def\thesis@extra@XKV@fams{thesis@extra}
\long\def\KV@thesis@extra#1{%
  \long\def\XKV@s@tk@ys##1=##2=##3\@nil{%
    \XKV@g@tkeyname##1=\@nil\XKV@tkey
    \expandafter\KV@@sp@def\expandafter\XKV@tkey\expandafter{\XKV@tkey}%
    \ifx\XKV@tkey\@empty
      \XKV@toks{##2}%
      \ifcat$\the\XKV@toks$\else
        \XKV@err{no key specified for value `\the\XKV@toks'}%
      \fi
    \else
      \@expandtwoargs\in@{,\XKV@tkey,}{,\XKV@na,}%
      \ifin@\else
        \XKV@knftrue
        \KV@@sp@def\XKV@tempa{##2}%
        \ifXKV@preset\XKV@s@tk@ys@{##3}\else
          \ifXKV@pl
            \XKV@for@eo\XKV@fams\XKV@tfam{%
              \XKV@makehd\XKV@tfam
              \XKV@s@tk@ys@{##3}%
            }%
          \else
            \XKV@whilist\XKV@fams\XKV@tfam\ifXKV@knf\fi{%
              \XKV@makehd\XKV@tfam
              \XKV@s@tk@ys@{##3}%
            }%
          \fi
        \fi
        \ifXKV@knf
          \ifXKV@inpox
            \ifx\XKV@doxs\relax
              \ifx\@currext\@clsextension\else
                \let\CurrentOption\XKV@tkey\@unknownoptionerror
              \fi
            \else\XKV@doxs\fi
          \else
            \ifXKV@st
              \XKV@addtolist@o\XKV@rm\CurrentOption
            \else
              \ifx\XKV@fams\thesis@extra@XKV@fams
                \expandafter\long\expandafter\def\csname%
                  thesis@extra@\XKV@tkey\endcsname{##2}%
              \else
                \XKV@err{`\XKV@tkey' undefined in families
                         `\XKV@fams'}%
              \fi
            \fi
          \fi
        \else
          \ifXKV@inpox\ifx\XKV@testclass\XKV@documentclass
            \expandafter\XKV@useoption\expandafter{\CurrentOption}%
          \fi\fi
        \fi
      \fi
    \fi
  }%
  \setkeys{thesis@extra}{#1}%
  \def\KV@prefix{KV@thesis@}}
\long\def\KV@split#1=#2=#3\relax{%
  \KV@@sp@def\@tempa{#1}%
  \ifx\@tempa\@empty\else
    \expandafter\let\expandafter\@tempc
      \csname\KV@prefix\@tempa\endcsname
    \ifx\@tempc\relax
      \ifx\KV@prefix\thesis@extra@KV@prefix
        \KV@@sp@def\@tempb{#2}%
        \expandafter\let\csname thesis@extra@\@tempa\endcsname
          \@tempb%
      \else
        \KV@errx
         {\@tempa\space undefined}%
      \fi
    \else
      \ifx\@empty#3\@empty
        \KV@default
      \else
        \KV@@sp@def\@tempb{#2}%
        \expandafter\@tempc\expandafter{\@tempb}\relax
      \fi
    \fi
  \fi}
\newcommand{\thesis@def@extra}[2][]{%
  \expandafter\ifx\csname thesis@extra@#2\endcsname\relax
    \def\thesis@placeholder@extra{<<extra@#2>>}%
    \expandafter\let\csname thesis@placeholder@extra@#2\endcsname
      \thesis@placeholder@extra
    \def\thesis@arg{#1}%
    \ifx\empty\thesis@arg
      \expandafter\let\csname thesis@extra@#2\endcsname
        \thesis@placeholder@extra
    \else
      \expandafter\def\csname thesis@extra@#2\endcsname{#1}%
    \fi
  \fi}
\long\def\thesislong#1#2{%
  \csname KV@thesis@#1\endcsname{#2}}
\newif\ifthesis@loaded\thesis@loadedfalse
\BeforeBeginEnvironment{document}{\thesisload}
\def\thesis@load{\thesisload}
\def\thesisload{%
  \ifthesis@loaded\else
    \thesis@loadedtrue
    \makeatletter
      \ifx\thesis@locale\empty\else
        \edef\thesis@locale{\thesis@locale}
        \thesis@requireLocale{\thesis@locale}
      \fi
    \ifluatex
      \ltx@ifpackageloaded{babel}{}{
        \ltx@ifpackageloaded{polyglossia}{}{
          \thesis@require{babel}}}
    \fi
\ifthesis@english
  \expandafter\expandafter\expandafter\let\expandafter\expandafter
    \csname ifthesis@english\endcsname\csname iftrue\endcsname
\else
  \expandafter\expandafter\expandafter\let\expandafter\expandafter
    \csname ifthesis@english\endcsname\csname iffalse\endcsname
\fi
      \ifx\thesis@style\empty\else
        \thesis@requireStyle{\thesis@style}
      \fi
    \ifx\languagename\empty\else
      \begingroup
      \edef\@doclocale{\languagename}%
      \ifx\@doclocale\thesis@locale
        \endgroup
        \AtBeginDocument{%
          \thesis@selectLocale{\thesis@locale}}%
      \else
        \endgroup
      \fi
    \fi
       \thesis@require{hyperref}
       \hypersetup{
         unicode=true,
         pdfencoding=auto,
         pdftitle=\thesis@title,
         pdfauthor=\thesis@author,
         pdfkeywords=\thesis@keywords,
         pdfcreator=\thesis@version}
      \ifthesis@auto
        \AtBeginDocument{\thesis@preamble}
        \AtEndDocument{%
          \thesis@postamble
          \immediate\write\@auxout{%
            \noexpand\gdef\noexpand\thesis@pages{\thepage}}}
      \else
        \AtEndDocument{%
          \immediate\write\@auxout{%
            \noexpand\gdef\noexpand\thesis@pages{\thepage}}}
      \fi
    \makeatother
  \fi}
\def\thesis@exists#1#2{%
  \IfFileExists{#1}{#2}{%
  \ClassWarning{fithesis4}{File #1 doesn't exist}}}
\def\thesis@input#1{%
  \thesis@exists{#1}{\input{#1}}}
\newcommand\thesis@require[2][]{%
  \@ifpackageloaded{#2}{}{\RequirePackage[#1]{#2}}}
\newcommand\thesis@requireIfExists[2][]{%
  \thesis@exists{#2.sty}{\thesis@require[#1]{#2}}}
\def\thesis@requireStyle#1{%
  \ifthesis@style@inheritance
    \thesis@requireIfExists{\thesis@stylepath fithesis-base}%
    \thesis@requireIfExists{\thesis@stylepath\thesis@university
      /fithesis-\thesis@university-base}
  \fi
  \thesis@requireIfExists{\thesis@stylepath#1}}
\def\thesis@requireLocale#1{%
  % Ignore redundant requests
  \expandafter\ifx\csname thesis@#1@required\endcsname\relax
    \expandafter\def\csname thesis@#1@required\endcsname{}%
    \@ifpackageloaded{polyglossia}{\setotherlanguage{#1}}{}
    \thesis@input{\thesis@localepath fithesis-#1.def}%
    \ifthesis@locale@inheritance
      \thesis@input{\thesis@localepath\thesis@university/%
        fithesis-#1.def}%
      \thesis@input{\thesis@localepath\thesis@university/%
        \thesis@faculty/fithesis-#1.def}%
    \fi
  \fi}
\def\thesis@#1{\csname thesis@#1\endcsname}
\def\thesis@@#1{\thesis@{\thesis@locale @#1}}
\def\thesis@lower#1{{%
  \let\ea\expandafter
  \ea\MakeLowercase\ea{\csname thesis@#1\endcsname}}}
\def\thesis@upper#1{{%
  \let\ea\expandafter
  \ea\MakeUppercase\ea{\csname thesis@#1\endcsname}}}
\def\thesis@@lower#1{\thesis@lower{\thesis@locale @#1}}
\def\thesis@@upper#1{\thesis@upper{\thesis@locale @#1}}
\def\thesis@head#1 #2{%
  \ifx\relax#2%
    \expandafter\@gobbletwo
  \else
    \ #1%
  \fi
  \thesis@head#2}%
\def\thesis@tail#1 #2{%
  \ifx\relax#2%
    #1%
    \expandafter\@gobbletwo
  \fi
  \thesis@tail#2}%
\ifx\thesis@pages\undefined\def\thesis@pages{??}\fi
\def\thesis@selectLocale#1{%
  \edef\thesis@locale{#1}%
  \ltx@ifpackageloaded{csquotes}{%
    \csq@setstyle{\thesis@@{csquotesStyle}}%
  }{}%
  \ltx@ifpackageloaded{polyglossia}{%
    \selectlanguage{\thesis@locale}
  }{%
    \language\csname l@\thesis@locale\endcsname
  }}
\def\thesis@patch#1#2{%
  \def\thesis@patch@versions{#1}%
  \def\thesis@patch@action{#2}%
  \def\thesis@patch@next##1,{%
    \def\thesis@patch@arg{##1}%
    \def\thesis@patch@relax{\relax}%
    \ifx\thesis@patch@arg\thesis@version@number
      \def\thesis@patch@next####1\relax,{}%
      \expandafter\thesis@patch@action
      \expandafter\thesis@patch@next
    \else\ifx\thesis@patch@arg\thesis@patch@relax\else
      \expandafter\expandafter\expandafter\thesis@patch@next
    \fi\fi}%
  \expandafter\expandafter\expandafter\thesis@patch@next
  \expandafter\thesis@patch@versions\expandafter,\relax,}
\long\def\thesis@xpatch#1#2#3{%
  \xpatchcmd{#1}{#2}{#3}{}%
    {\ClassError{fithesis4}{%
       Command \string#1 does not contain the searched text}{}}}
\endinput
%%
%% End of file `fithesis4.cls'.
