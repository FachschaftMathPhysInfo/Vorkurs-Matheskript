% ====================================================================
%                                                                 
%                           ST1-book.cls
%
%
% %%ts latex start%%[2018-08-03 Fri 15:31]%%ts latex end%%
% ====================================================================
\NeedsTeXFormat{LaTeX2e}[1998/06/01]
%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{ST1-book}
               [2018/02/06 v1.0 %
                 ST1-book Class]
%%%%%%%%%%%%%%%%%%%%    
\RequirePackage{aliascnt,ifthen}
\RequirePackage{graphicx}
\RequirePackage{color,calc}
\RequirePackage{./_src/BeamerColor}
\RequirePackage{times}
\RequirePackage{ifpdf}
\ifpdf
\DeclareGraphicsRule{*}{mps}{*}{}
\else
% Recent LaTeX versions dont require the next line
% \DeclareGraphicsRule{*}{eps}{*}{}
\fi


%% Mathe
\RequirePackage{amsthm,amsmath}
\RequirePackage{mathtools} 
\RequirePackage{amssymb,amstext}
\RequirePackage{amsfonts,stmaryrd}
\RequirePackage{amsbsy} 
\RequirePackage{mathrsfs}
\RequirePackage{bm}
\RequirePackage{bbm}


\RequirePackage{gauss} % für elementare Matrizenumformungen
\RequirePackage{polynom} % für Polynomdivision mit Rest

%% General
\RequirePackage{url}
\RequirePackage{verbatim}

%% Sprache Und Codierung
\RequirePackage[german]{babel}
\RequirePackage{ucs}
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrbook}}
\ProcessOptions
\LoadClass{scrbook}

% Koma-Fancy-Headers
% \RequirePackage{scrpage2}
\RequirePackage{scrlayer-scrpage}
\RequirePackage{scrdate}
\RequirePackage{scrtime}

\RequirePackage{booktabs}
\RequirePackage{tikz} %used in abrev-package
\usetikzlibrary{backgrounds} % Erweiterung von tikZ
\usetikzlibrary{patterns} % z.B. um Bilder zu schattieren
\usetikzlibrary{arrows}
\usetikzlibrary{arrows.meta}
\usetikzlibrary{calc, through}
\usetikzlibrary{automata}
\usetikzlibrary{decorations.pathreplacing} % für geschweifte Klammern
\usetikzlibrary{matrix,decorations.pathmorphing} % für das Schema der Matrix-Multiplikation
\usetikzlibrary{decorations.markings}
\usetikzlibrary{fit,positioning}
\usetikzlibrary{tikzmark}
\RequirePackage{pgfplots} % für Koordinatensysteme
\usepgfplotslibrary{fillbetween} % um Fläche unter einer Kurve farblich zu markieren
\RequirePackage{mathtools}
\RequirePackage[singlelinecheck=false]{caption} % Bild- und Tabellenbeschriftungen linksbündig, lokal änderbar
\pgfplotsset{width=\textwidth,compat=1.5.1}
\RequirePackage{ctable}
\RequirePackage{array}
\RequirePackage{colortbl}
\RequirePackage{multirow}
\RequirePackage{bigdelim} % für Matrizen mit zusätzlicher geschweifter Klammer rechts oder links
\RequirePackage{paralist}
\RequirePackage[all]{xy} % für kommutative Diagramme
\RequirePackage{arydshln} % für den Befehl cdashline, der gestrichelte Linien in einer Matrix erlaubt


% Fonts

\providecommand{\cmrfamily}{\usefont{T1}{cmr}{m}{n}}
\providecommand{\cmssfamily}{\usefont{T1}{cmss}{m}{n}}
\providecommand{\cmttfamily}{\usefont{T1}{cmtt}{m}{n}}
\font\geant=cmssbx10 at 16pt
\font\nain=cmss4 at 12pt



%==========================================
% Farbenspiele
% <<Def-Farben>>
%==========================================
\definecolor{darkred}{rgb}{0.5,0.0,0.1} 
\definecolor{darkgreen}{rgb}{0,0.4,0} 
\definecolor{darkblue}{rgb}{0,0,0.6} 

\definecolor{dgreen}{rgb}{0,0.4,0}
\definecolor{dblue}{rgb}{0,0,0.6}
\definecolor{dred}{rgb}{0.6,0.0,0.1}
\definecolor{dgold}{rgb}{0.60,0.48,0.19}
\definecolor{dvio}{rgb}{0.6,0.3,0.5}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{dbraun}{rgb}{0.54,0.27,0.07} %SaddleBrown

\newcommand{\dr}{\color{dred}}
\newcommand{\db}{\color{dblue}}
\newcommand{\dg}{\color{dgreen}}
\newcommand{\dy}{\color{dgold}}
\newcommand{\dv}{\color{dvio}}
\newcommand{\dgrau}{\color{gray}}
\newcommand{\dw}{\color{white}}
\newcommand{\ds}{\color{black}}
\newcommand{\dbraun}{\color{dbraun}}


%% Definitionen
\newcommand{\colorde}{dblue}
\newcommand{\colde}{\color{\colorde}}
\newcommand{\kwdde}[1]{{\colorbox{\colorde!80}{\textcolor{white}{#1}}}}
\newcommand{\swdde}[1]{\emph{\textcolor{\colorde}{#1}}} 
\newcommand{\deEnd}{{\scriptsize\textcolor{\colorde}{\qed}}}
%% Resultate
\newcommand{\colorres}{dred}
\newcommand{\colres}{\color{\colorres}}
\newcommand{\kwdres}[1]{{\colorbox{\colorres!80}{\textcolor{white}{#1}}}}
\newcommand{\swdres}[1]{\textit{\textcolor{\colorres}{#1}}} 
\newcommand{\resEnd}{{\scriptsize\textcolor{\colorres}{\qed}}}
%% Beispiele
\newcommand{\colorbsp}{dgreen}
\newcommand{\colbsp}{\color{\colorbsp}}
\newcommand{\kwdbsp}[1]{{\colorbox{\colorbsp!80}{\textcolor{white}{#1}}}}
\newcommand{\swdbsp}[1]{\emph{\textcolor{\colorbsp}{#1}}} 
\newcommand{\bspEnd}{{\scriptsize\textcolor{\colorbsp}{\qed}}}
%% Bemerkungen/Anmerkungen
\newcommand{\colorbem}{dbraun}
\newcommand{\colbem}{\color{\colorbem}}
\newcommand{\coloraufg}{dgreen}
\newcommand{\colaufg}{\color{\coloraufg}}
\newcommand{\kwdbem}[1]{{\colorbox{\colorbem!80}{\textcolor{white}{#1}}}}
\newcommand{\swdbem}[1]{\emph{\textcolor{\colorbem}{#1}}} 
\newcommand{\bemEnd}{{\scriptsize\textcolor{\colorbem}{\qed}}}
\newcommand{\kwdanm}[1]{{\colorbox{\colorbem!80}{\textcolor{white}{#1}}}}
\newcommand{\swdanm}[1]{\emph{\textcolor{\colorbem}{#1}}} 
\newcommand{\anmEnd}{{\scriptsize\textcolor{\colorbem}{\qed}}}
%% Schreib/Sprechweisen
\newcommand{\colorsch}{dgold}
\newcommand{\colsch}{\color{\colorsch}}
\newcommand{\kwdsch}[1]{{\colorbox{\colorsch!80}{\textcolor{white}{#1}}}}
\newcommand{\swdsch}[1]{\emph{\textcolor{\colorsch}{#1}}} 
\newcommand{\schEnd}{{\scriptsize\textcolor{\colorsch}{\qed}}}
\newcommand{\colspr}{\color{\colorsch}}
\newcommand{\kwdspr}[1]{{\colorbox{\colorsch!80}{\textcolor{white}{#1}}}}
\newcommand{\swdspr}[1]{\emph{\textcolor{\colorsch}{#1}}} 
\newcommand{\sprEnd}{{\scriptsize\textcolor{\colorsch}{\qed}}}
\newcommand{\kwdschspr}[1]{{\colorbox{\colorsch!80}{\textcolor{white}{#1}}}}
\newcommand{\swdschspr}[1]{\emph{\textcolor{\colorsch}{#1}}} 
\newcommand{\schsprEnd}{{\scriptsize\textcolor{\colorsch}{\qed}}}
%% Beweise
\newcommand{\colbew}{\color{\colorres}}
\newcommand{\kwdbew}[1]{{\colorbox{\colbew!80}{\textcolor{white}{#1}}}}
\newcommand{\swdbew}[1]{\textit{\textcolor{\colbew}{#1}}} 
\newcommand{\bewEnd}{{\scriptsize\textcolor{\colorres}{\qed}}}


%% Illustrationen
\newcommand{\illEnd}{{\scriptsize\textcolor{\colorbem}{\qed}}}

%% Skizze
\newcommand{\skiEnd}{{\scriptsize\textcolor{\colorbem}{\qed}}}

%% Vereinbarte Terminologie
\newcommand{\kwdvt}[1]{{\colorbox{\colorde!80}{\textcolor{white}{#1}}}}
\newcommand{\swdvt}[1]{\emph{\textcolor{\colorde}{#1}}} 
\newcommand{\vtEnd}{{\scriptsize\textcolor{\colorde}{\qed}}}

%% Algorithmus
\newcommand{\kwdalg}[1]{{\colorbox{\colorbem!80}{\textcolor{white}{#1}}}}
\newcommand{\swdalg}[1]{\emph{\textcolor{\colorbem}{#1}}} 
\newcommand{\algEnd}{{\scriptsize\textcolor{\colorbem}{\qed}}}

%==========================================
% Theorem Definition
% <<Def-Theorem>>
%==========================================
\newtheoremstyle{styres}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\itshape}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorres}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{#1}}\thmnote{\xspace\textit{\small(#3)}}}%         Thm head spec (can be left empty, meaning `normal')

\newtheoremstyle{styores}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\itshape}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorres}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmnote{\textbf{#3}}}%         Thm head spec (can be left empty, meaning `normal')

\newtheoremstyle{styde}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorde}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{\xspace\textit{\small(#3)}}}%         Thm head spec (can be left empty, meaning `normal')

\newtheoremstyle{styode}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorde}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmnote{\textbf{#3}}}%         Thm head spec (can be left empty, meaning `normal')

\newtheoremstyle{stybsp}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorbsp}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau \S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{\xspace\textit{\small(#3)}}}%         Thm head spec (can be left empty, meaning `normal')

\newtheoremstyle{styobsp}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorbsp}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmnote{\textbf{#3}}}%         Thm head spec (can be left empty, meaning `normal')



\newtheoremstyle{stysch}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorsch}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{\xspace\textit{\small(#3)}}}%         Thm head spec (can be left empty, meaning `normal')


\newtheoremstyle{styosch}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorsch}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmnote{\textbf{#3}}}%         Thm head spec (can be left empty, meaning `normal')



\newtheoremstyle{stybem}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorbem}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{\xspace\textit{\small(#3)}}}%         Thm head spec (can be left empty, meaning `normal')
  
  
\newtheoremstyle{styaufg}% name
  {1.1\topsep}%      Space above
  {2.0\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\coloraufg}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{\xspace\textit{\small(#3)}}}%         Thm head spec (can be left empty, meaning `normal')


\newtheoremstyle{styobem}% name
  {1.1\topsep}%      Space above
  {\topsep}%      Space below
  {\normalfont\rmfamily}%         Body font
  {}%         Indent amount (empty = no indent, \parindent = para indent)
  {\color{\colorbem}}% Thm head font
  {.}%        Punctuation after thm head
  {.5em}%     Space after thm head: " " = normal interword space;
        %       \newline = linebreak
  {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmnote{\textbf{#3}}}%         Thm head spec (can be left empty, meaning `normal')


\newtheoremstyle{stybew}%
	{0.5\topsep}%space above
	{1.1\topsep}%space below
	{\upshape}%		body font
	{}%				indent amount
	{\dgrau}%	theorem head font
	{.}%			punctuation after theorem head
	{.5em}%			space after theorem head
	{\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{#1}}\thmnote{\xspace #3}}%         Thm head spec (can be left empty, meaning `normal')


\newtheoremstyle{stybewe}%
	{0.5\topsep}%space above
	{1.1\topsep}%space below
	{\upshape}%		body font
	{}%				indent amount
	{\color{\colorres}}%	theorem head font
	{}%			punctuation after theorem head
	{.5em}%			space after theorem head
	{\thmnote{\textit{#3}}}%         Thm head spec (can be left empty, meaning `normal')

\newtheoremstyle{styte}% name
        {}%      Space above
        {}%      Space below
        {\normalfont}%         Body font
        {}%         Indent amount (empty = no indent, \parindent = para indent)
        {}% Thm head font
        {}%        Punctuation after thm head
        {0ex}%     Space after thm head: " " = normal interword space;
        {}%         Thm head spec (can be left empty, meaning `normal')

\theoremstyle{styres}\newtheorem{pro}{Proposition}[section]
\newaliascnt{kor}{pro}

\theoremstyle{styres}\newtheorem{kor}[kor]{Korollar}
\aliascntresetthe{kor} 
\newaliascnt{sat}{pro}

\theoremstyle{styres}\newtheorem{sat}[sat]{Satz}
\aliascntresetthe{sat}
\newaliascnt{lem}{pro}

\theoremstyle{styres}\newtheorem{lem}[lem]{Lemma}
\aliascntresetthe{lem}
\newaliascnt{eig}{pro}

\theoremstyle{styres}\newtheorem{eig}[eig]{Eigenschaft}
\aliascntresetthe{eig}
\newaliascnt{eign}{pro}

\theoremstyle{styres}\newtheorem{eign}[eign]{Eigenschaften}
\aliascntresetthe{eign}
\newaliascnt{de}{pro}

\theoremstyle{styde}\newtheorem{de}[de]{Definition}
\aliascntresetthe{de}
\newaliascnt{sch}{pro}  

\theoremstyle{stysch}\newtheorem{sch}[sch]{Schreibweise}
\aliascntresetthe{sch}
\newaliascnt{schn}{pro}   

\theoremstyle{stysch}\newtheorem{schn}[schn]{Schreibweisen}
\aliascntresetthe{schn}
\newaliascnt{spr}{pro}  

\theoremstyle{stysch}\newtheorem{spr}[spr]{Sprechweise}
\aliascntresetthe{spr}
\newaliascnt{sprn}{pro}  

\theoremstyle{stysch}\newtheorem{sprn}[sprn]{Sprechweisen}
\aliascntresetthe{sprn}
\newaliascnt{sch-spr}{pro}  

\theoremstyle{stysch}\newtheorem{sch-spr}[sch-spr]{Schreib- und Sprechweise}
\aliascntresetthe{sch-spr}
\newaliascnt{schn-sprn}{pro}  

\theoremstyle{stysch}\newtheorem{schn-sprn}[schn-sprn]{Schreib- und Sprechweisen}
\aliascntresetthe{schn-sprn}
\newaliascnt{bem}{pro}

\theoremstyle{stybem}\newtheorem{bem}[bem]{Bemerkung}
\aliascntresetthe{bem}
\newaliascnt{obem}{pro}

\theoremstyle{styobem}\newtheorem{obem}[obem]{}
\aliascntresetthe{obem}
\newaliascnt{anm}{pro}

\theoremstyle{stybem}\newtheorem{anm}[anm]{Anmerkung}
\aliascntresetthe{anm}
\newaliascnt{alg}{pro}

\theoremstyle{stybem}\newtheorem{alg}[alg]{Algorithmus}
\aliascntresetthe{alg}
\newaliascnt{bsp}{pro}

\theoremstyle{stybsp}\newtheorem{bsp}[bsp]{Beispiel}
\aliascntresetthe{bsp}
\newaliascnt{bspe}{pro}

\theoremstyle{stybsp}\newtheorem{bspe}[bspe]{Beispiele}
\aliascntresetthe{bspe}
\newaliascnt{obsp}{pro}

\theoremstyle{styobsp}\newtheorem{obsp}[obsp]{}
\aliascntresetthe{obsp}
\newaliascnt{ill}{pro}

\theoremstyle{stybsp}\newtheorem{ill}[ill]{Illustration}
\aliascntresetthe{ill}

% hinzugefügt
\newaliascnt{vt}{pro} 
\theoremstyle{styde}\newtheorem{vt}[vt]{Vereinbarte Terminologie}
\aliascntresetthe{vt}

\newaliascnt{ski}{pro}
\theoremstyle{stybem}\newtheorem{ski}[ski]{Skizze}
\aliascntresetthe{ski}

\newaliascnt{bew}{pro}
\theoremstyle{stybew}\newtheorem{bew}[bew]{Beweis}
\aliascntresetthe{bew}


\newaliascnt{aufg}{pro}
\theoremstyle{styaufg}\newtheorem{aufg}[aufg]{Aufgabe}
\aliascntresetthe{aufg}


% von Janne
\newaliascnt{thr}{pro}
\theoremstyle{styres}\newtheorem{thr}[thr]{Theorem}
\aliascntresetthe{thr}

\newaliascnt{axi}{pro}
\theoremstyle{styres}\newtheorem{axi}[axi]{Axiom}
\aliascntresetthe{axi}

%von Luka_
\newaliascnt{sprache}{pro}
\theoremstyle{styres}\newtheorem{sprache}[sprache]{Sprache}
\aliascntresetthe{sprache}

\newaliascnt{notion}{pro}
\theoremstyle{stysch}\newtheorem{notion}[notion]{Notation}
\aliascntresetthe{notion}



\theoremstyle{styte}\newtheorem*{te}{}


\theoremstyle{styores}\newtheorem{ores}[sat]{}
\theoremstyle{styores}\newtheorem{osat}[sat]{}
\theoremstyle{styores}\newtheorem{olem}[lem]{}
\theoremstyle{styores}\newtheorem{okor}[kor]{}
\theoremstyle{styode}\newtheorem{ode}[de]{}
\theoremstyle{styde}\newtheorem*{ode*}{}
\theoremstyle{styosch}\newtheorem{osch}[pro]{}
\theoremstyle{stybew}\newtheorem{obew}{}
\theoremstyle{stybewe}\newtheorem*{obew*}{}


%==========================================
% Listen Definition
% <<Def-Listen>>
%==========================================
\newcommand{\setListe}[5][3ex]{\setlength{\itemsep}{#2}\setlength{\topsep}{#3}\setlength{\leftmargin}{#4}\setlength{\rightmargin}{#5}\setlength{\labelwidth}{#1}}
\newcommand{\setListeStandard}{\setListe{0ex}{.5ex}{4ex}{0ex}}
\newcommand{\setitemsep}[1]{\setlength{\itemsep}{#1}}
\newcommand{\setleftmargin}[1]{\setlength{\leftmargin}{#1}}
\newcommand{\settopsep}[1]{\setlength{\topsep}{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{Liste}[1][~]%
{\begin{list}{}%
{\setListeStandard #1}}
{\end{list}}
\newcounter{ListeNi}
\renewcommand{\theListeNi}{\dgrau\normalfont\rmfamily(\roman{ListeNi})}
\newenvironment{ListeNi}[1][~]%
{\begin{list}{\dgrau\theListeNi}%
{\usecounter{ListeNi}\setListeStandard #1}}
{\end{list}}
\newcounter{ListeNii}
\renewcommand{\theListeNii}{\dgrau\normalfont\rmfamily(\roman{ListeNii})}
\newenvironment{ListeNii}[1][~]%
{\begin{list}{\dgrau\theListeNii}%
{\usecounter{ListeNii}\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Zähler Listen
\newcounter{ListeN}
\renewcommand{\theListeN}{(\roman{ListeN})}
\newenvironment{ListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\dgrau(\roman{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{deListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colde(\alph{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{resListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colres(\roman{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{bewListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colbew(\roman{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{bspListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colbsp(\alph{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{bemListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colbem(\alph{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{anmListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colbem(\roman{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{algListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colalg(\roman{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{schListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colsch(\roman{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
\newenvironment{sch-sprListeN}[1][~]%
{\setcounter{ListeN}{0}\renewcommand{\theListeN}{\normalfont\rmfamily\colsch(\roman{ListeN})}\begin{list}{\theListeN}%
{\usecounter{ListeN}\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition Listen
\newenvironment{deListeS}[1][~]%
{\begin{list}{\colde\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{deListeB}[1][~]%
{\begin{list}{\colde\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{deListeT}[1][~]%
{\begin{list}{\colde\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{deListeM}[1][~]
{\begin{list}{\colde\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bemerkungen/Anmerkungen Listen
\newenvironment{bemListeS}[1][~]%
{\begin{list}{\colbem\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bemListeB}[1][~]%
{\begin{list}{\colbem\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bemListeT}[1][~]%
{\begin{list}{\colbem\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bemListeM}[1][~]
{\begin{list}{\colbem\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{anmListeS}[1][~]%
{\begin{list}{\colanm\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{anmListeB}[1][~]%
{\begin{list}{\colanm\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{anmListeT}[1][~]%
{\begin{list}{\colanm\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{anmListeM}[1][~]
{\begin{list}{\colanm\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Resultate (Satz, Lemma, Proposition, Korollar) Listen
\newenvironment{resListeS}[1][~]%
{\begin{list}{\colres\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{resListeB}[1][~]%
{\begin{list}{\colres\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{resListeT}[1][~]%
{\begin{list}{\colres\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{resListeM}[1][~]
{\begin{list}{\colres\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beispiel Listen
\newenvironment{bspListeS}[1][~]%
{\begin{list}{\colbsp\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bspListeB}[1][~]%
{\begin{list}{\colbsp\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bspListeT}[1][~]%
{\begin{list}{\colbsp\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bspListeM}[1][~]
{\begin{list}{\colbsp\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Schreib/Sprechweise Listen
\newenvironment{schListeS}[1][~]%
{\begin{list}{\colsch\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{schListeB}[1][~]%
{\begin{list}{\colsch\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{schListeT}[1][~]%
{\begin{list}{\colsch\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{schListeM}[1][~]
{\begin{list}{\colsch\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{sprListeS}[1][~]%
{\begin{list}{\colspr\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{sprListeB}[1][~]%
{\begin{list}{\colspr\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{sprListeT}[1][~]%
{\begin{list}{\colspr\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{sprListeM}[1][~]
{\begin{list}{\colspr\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%Schreib- und Sprechweise
\newenvironment{sch-sprListeS}[1][~]%
{\begin{list}{\colsch\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{sch-sprListeB}[1][~]%
{\begin{list}{\colsch\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{sch-sprListeT}[1][~]%
{\begin{list}{\colsch\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{sch-sprListeM}[1][~]
{\begin{list}{\colsch\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Beweis Listen
\newenvironment{bewListeS}[1][~]%
{\begin{list}{\colbew\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bewListeB}[1][~]%
{\begin{list}{\colbew\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bewListeT}[1][~]%
{\begin{list}{\colbew\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{bewListeM}[1][~]
{\begin{list}{\colbew\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Schwarze Listen
\newenvironment{dsListeS}[1][~]%
{\begin{list}{\ds\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dsListeB}[1][~]%
{\begin{list}{\ds\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dsListeT}[1][~]%
{\begin{list}{\ds\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dsListeM}[1][~]
{\begin{list}{\ds\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Graue Listen
\newenvironment{dgrauListeS}[1][~]%
{\begin{list}{\dshadow\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dgrauListeB}[1][~]%
{\begin{list}{\dshadow\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dgrauListeT}[1][~]%
{\begin{list}{\dgrau\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dgrauListeM}[1][~]
{\begin{list}{\dgrau\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%%%%%%%%%%%%%%%%%%%%%%%%%%
% Braune Listen
\newenvironment{dbraunListeS}[1][~]%
{\begin{list}{\dbraun\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dbraunListeB}[1][~]%
{\begin{list}{\dbraun\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dbraunListeT}[1][~]%
{\begin{list}{\dbraun\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dbraunListeM}[1][~]
{\begin{list}{\dbraun\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%==========================================
% Blaue Listen
\newenvironment{dbListeS}[1][~]%
{\begin{list}{\db\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dbListeB}[1][~]%
{\begin{list}{\db\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dbListeT}[1][~]%
{\begin{list}{\db\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dbListeM}[1][~]
{\begin{list}{\db\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%==========================================
% Grüne Listen
\newenvironment{dgListeS}[1][~]%
{\begin{list}{\dg\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dgListeB}[1][~]%
{\begin{list}{\dg\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dgListeT}[1][~]%
{\begin{list}{\dg\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{dgListeM}[1][~]
{\begin{list}{\dg\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%==========================================
% Rote Listen
\newenvironment{drListeS}[1][~]%
{\begin{list}{\dr\raisebox{0.3ex}{\scriptsize$\blacksquare$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{drListeB}[1][~]%
{\begin{list}{\dr\raisebox{0.3ex}{$\bullet$}}%
{\setListeStandard #1}}
{\end{list}}
\newenvironment{drListeT}[1][~]%
{\begin{list}{\dr\raisebox{0.3ex}{\scriptsize$\blacktriangleright$}}
{\setListeStandard #1}}
{\end{list}}
\newenvironment{drListeM}[1][~]
{\begin{list}{\dr\raisebox{0.3ex}{\small$-$}}
{\setListeStandard #1}}
{\end{list}}
%==========================================
% Definition Randnotizen
% <<Def-Notes>>
%==========================================
% NOTES
% mit (!)-Marke
\newcommand{\note}[1]
{\ensuremath{{}^{\color{red}(!)}}\marginpar[{\hfill\tiny{{#1}}}]{\tiny{{{\color{red}(!)} #1}}}}
% Durchnumeriert
\newcounter{nc}
\setcounter{nc}{1}
\newcommand{\notex}[1]
{\ensuremath{{}^{\,{\color{red}(\arabic{nc})}}}\marginpar[{\hfill\tiny{{(\arabic{nc})}}}]{\tiny{{{\color{red}(\arabic{nc})}
#1}}}\addtocounter{nc}{1}}
% nur ein "Hä?"-Zeichen in den Text setzen
\newcommand{\hae}{\ensuremath{{}^{(?)}\;}}
