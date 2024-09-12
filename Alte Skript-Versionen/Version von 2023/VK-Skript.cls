\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VK-Skript}[2022/08/06 Vorkurs-Skript class]

% ====================================================================
% <<KOMA-Klasse scrbook als Basis>>
% ====================================================================

\PassOptionsToClass{12pt}{scrbook} % Schriftgröße
\ProcessOptions
\LoadClass{scrbook}
\KOMAoptions{
    DIV=15,
    BCOR=1cm,
    headings=small,
    chapterprefix
}


% ====================================================================
% <<Pakete>>
% ====================================================================

% Sprache und Kodierung
\RequirePackage[ngerman]{babel} 
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
    
    
% Schriftarten
\RequirePackage{newtxtext} % Times New Roman für den textmode
\RequirePackage{lmodern}
% Gestalt der \implies- und \iff-Pfeile fixen
\makeatletter
    \input{ot1lmr.fd}
    \DeclareFontShape{OT1}{lmr}{m}{n}{
        <-5.5>    rm-lmr5  <5.5-6.5> rm-lmr6
        <6.5-7.5> rm-lmr7  <7.5-8.5> rm-lmr8
        <8.5-9.5> rm-lmr9  <9.5->    rm-lmr10
    }{}
\makeatother
    

% Mathe
\RequirePackage[fleqn]{amsmath}
\RequirePackage{mathtools}
    \mathtoolsset{centercolon}
\RequirePackage{amsthm}


% Zeichenbibliotheken
\RequirePackage{amssymb}
\RequirePackage{stmaryrd}


% Seitenlayout
\RequirePackage{scrlayer-scrpage}
\RequirePackage{geometry}


% Listen und Tabellen
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{longtable}
\RequirePackage{booktabs}


% Sonstiges
\RequirePackage{verbatim} % \begin{comment}-Umgebung für längere Kommentare im Code
\RequirePackage{etoolbox}
\RequirePackage{xcolor} % Umgang mit Farben
\RequirePackage{graphicx} % Zum Laden von Bildern
\RequirePackage{aliascnt} % counter
\RequirePackage{tikz} % Zeichnen von Vektorgrafiken
    \usetikzlibrary{babel}
    \usetikzlibrary{cd} % Kommutative Diagramme
\RequirePackage[babel]{microtype} % Typographisches Feintuning
\RequirePackage[autostyle]{csquotes}


% Inhaltsverzeichnis
\RequirePackage[titles]{tocloft}
    \setlength{\cftbeforechapskip}{1em plus 0.3em minus 0.1em} % Hübscherer Seitenumbruch im Inhaltsverzeichnis

% Literaturverzeichnis
\RequirePackage[backend=biber, style=alphabetic, sorting=ynt]{biblatex}
    \addbibresource{Literaturverzeichnis.bib}
    
% Symbolverzeichnis
\RequirePackage{glossaries}
\setupglossaries{
        sort=def,
        nonumberlist,
        toc,
        section=chapter
    }
    \makeglossaries

% Index
\RequirePackage{imakeidx}
    \indexsetup{
        firstpagestyle={onlypagenumber},
        headers={\indexname}{\indexname}
    }
    \makeindex[intoc]


% Hyperlinks und Referenzen
\RequirePackage{hyperref}
    \hypersetup{
        pdfpagemode=UseOutlines,
        hypertexnames=false,
        bookmarksdepth=1,
        breaklinks,
        colorlinks,
        linkcolor=gray,
        urlcolor=dblue,
        citecolor=black
    }
    % Links für die Seitenzahlen im Index korrigieren
    \makeatletter
        \patchcmd\Hy@EveryPageBoxHook{\Hy@EveryPageAnchor}{\Hy@hypertexnamestrue\Hy@EveryPageAnchor}{}{\fail}
    \makeatother
\RequirePackage{bookmark}
\RequirePackage{cleveref}


% ====================================================================
% <<Steuerung von Abschnittsangaben und Kopfzeilen>>
% ====================================================================

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
    \oldfrontmatter
    \addtocontents{toc}{\protect\cftpagenumbersoff{chapter}} % Keine Seitenzahlen für Kapitel im Inhaltxverzeichnis
    \pagestyle{scrplain}
}

\let\oldtableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
    \cleardoublepage
    \pdfbookmark[0]{Inhaltsverzeichnis}{inhaltsverzeichnis} % Eintrag im Pdf-Inhaltsverzeichnis hinzufügen
    \oldtableofcontents
    \cleardoublepage
}

\let\oldmainmatter\mainmatter
\renewcommand{\mainmatter}{
    \oldmainmatter
    \cleardoublepage
    \renewcommand{\chapterpagestyle}{onlypagenumber}
    \pagestyle{scrheadings}
    % Anpassungen im Inhaltsverzeichnis
    \addtocontents{toc}{
        \protect\renewcommand{\protect\cftsecnumwidth}{3em}
        \protect\renewcommand{\protect\cftsecpresnum}{\S} % Vor der Abschnitt-Nummer das Paragraph-Zeichen
    }
    % Kapitel und Abschnitt, wie sie in der Kopfzeile dargestellt werden
    \renewcommand{\chaptermark}[1]{\markleft{Kapitel \thechapter\hspace{.5em}\relax##1}}
    \renewcommand{\sectionmark}[1]{\markright{\MakeMarkcase {\S\thesection\hspace{0.5em}\relax##1}}}
    % Kapitel und Abschnitt, wie sie im Text dargestellt werden
    \renewcommand{\chapterformat}{Kapitel \thechapter}
    \renewcommand{\sectionformat}{\S\thesection\hspace{0.5em}}
}

\let\oldappendix\appendix
\renewcommand{\appendix}{
    \oldappendix
    \cleardoublepage
    \pagestyle{nosection}
    % Anpassungen im Inhaltsverzeichnis
    \addtocontents{toc}{
        \protect\setcounter{tocdepth}{0} % Keine sections anzeigen
        \protect\cftpagenumberson{chapter} % Seitenzahlen für Kapitel wieder aktivieren
        \protect\renewcommand{\protect\cftsecpresnum}{a} % Kein Paragraphenzeichen mehr für sections
        % Kapitelformat der Gestalt „Anhang X“ einrichten
        \protect\setlength{\protect\cftchapnumwidth}{6em}
        \protect\renewcommand{\protect\cftchappresnum}{Anhang }
    }
    % Kapitel und Abschnitt, wie sie in der Kopfzeile dargestellt werden
    \renewcommand{\chaptermark}[1]{\markleft{Anhang \thechapter\hspace{0.5em}\relax##1}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection\hspace{0.5em}\relax##1}}
    % Kapitel und Abschnitt, wie sie im Text dargestellt werden
    \renewcommand{\chapterformat}{Anhang \thechapter}
    \renewcommand{\sectionformat}{\thesection\quad}
    \hypersetup{bookmarksdepth=0} % Keine sections in den Pdf-bookmarks
    \pdfbookmark[-1]{Anhang}{anhang} % Eintrag im Pdf-Inhaltsverzeichnis hinzufügen
}

\let\oldbackmatter\backmatter
\renewcommand{\backmatter}{
    \glsaddall % Einträge dem Symbolverzeichnis hinzufügen
    \oldbackmatter
    \bookmarksetup{startatroot} % Weitere Kapitel nicht dem Anhang unterordnen
}


% ====================================================================
% <<Farben>>
% ====================================================================

% Farben definieren
\definecolor{dred}{rgb}{0.6,0.0,0.1} % dunkelrot
\definecolor{dgreen}{rgb}{0,0.4,0} % dunkelgrün
\definecolor{dblue}{rgb}{0,0,0.6} % dunkelblau
\definecolor{dgold}{rgb}{0.60,0.48,0.19} % hellbraun
\definecolor{dbraun}{rgb}{0.54,0.27,0.07} % dunkelbraun
\newcommand{\dgrau}{\color{gray}} % dunkelgrau

% Trennlinien einfärben
\addtokomafont{headsepline}{\dgrau}
\addtokomafont{footnoterule}{\dgrau}

% Abschnittsangaben grau einfärben
\addtokomafont{chapter}{\dgrau}
\addtokomafont{section}{\dgrau}
\addtokomafont{subsection}{\dgrau}
\addtokomafont{subsubsection}{\dgrau}

% Objekte im Inhaltsverzeichnis grau färben
\renewcommand{\cftchapleader}{\dgrau\cftdotfill{\cftsecdotsep}} % Kapitelpunkte
\renewcommand{\cftsecleader}{\dgrau\cftdotfill{\cftsecdotsep}} % Sectionpunkte
\renewcommand{\cftsubsecleader}{\dgrau\cftdotfill{\cftsubsecdotsep}} % Subsectionpunkte
\renewcommand{\cftchappagefont}{\dgrau\bfseries} % Kapitel-Seitenzahl
\renewcommand{\cftsecpagefont}{\dgrau} % Section-Seitenzahl
\renewcommand{\cftsubsecpagefont}{\dgrau} % Subsection-Seitenzahl


% ====================================================================
% <<Kopf- und Fußzeilen>>
% ====================================================================

% Kopf- und Fußzeile für scrheadings
\ohead[]{\dgrau\small\normalfont\rightmark}
\ihead[]{\dgrau\small\normalfont\leftmark}
\ofoot[]{\normalfont\thepage}
\KOMAoption{headsepline}{.5pt}

% Nur Kapitelname in der Kopfzeile, kein section-Name
\newpagestyle{nosection}{
    {\dgrau\small\normalfont\leftmark\hfill}
    {\hfill\dgrau\small\normalfont\leftmark}
    {}
}{
    {\normalfont\thepage\hfill}
    {\normalfont\hfill\thepage}
    {\normalfont\hfill\thepage\hfill}
}

% Keine Kopfzeile, nur Seitenzahl in der Fußzeile
\newpagestyle{onlypagenumber}{
    {}
    {}
    {}
    (\textwidth, 0pt)
}{
    {\normalfont\thepage\hfill}
    {\normalfont\hfill\thepage}
    {\normalfont\hfill\thepage\hfill}
}


% ====================================================================
% <<Einrichten von cleveref-Referenztypen>>
% ====================================================================

\crefname{chapter}{Kapitel}{Kapitel}
\crefformat{chapter}{#2{\rmfamily{\dgrau Kapitel} {#1}}#3}

\crefname{section}{Abschnitt}{Abschnitte}
\crefformat{section}{#2{\rmfamily{\dgrau Abschnitt} {\dgrau\S}{#1}}#3}

\crefname{appendix}{Anhang}{Anhänge}
\crefformat{appendix}{#2{\rmfamily{\dgrau Anhang} {#1}}#3}

% Die cleveref-Referenztypen für die amsthm-Umgebungen sind direkt bei der entsprechenden \newtheorem-Definition untergebracht


% ====================================================================
% <<Definitionen der theoremstyles>>
% ====================================================================

% In diesem Abschnitt werden noch nicht die konkreten Umgebungen wie „Definition“ oder „Bemerkung“ eingerichtet, sondern nur die Style-Schablonen, die diese Umgebungen später nutzen werden.

% Für Absätze vom Typ „Resultat“
\newcommand{\colorres}{dred} 
\newtheoremstyle{styres} % name
    {1.1\topsep} % Space above
    {\topsep} % Space below
    {\normalfont\itshape} % Body font
    {} % Indent amount (empty = no indent, \parindent = para indent)
    {\color{\colorres}} % Thm head font
    {.} % Punctuation after thm head
    {.5em} % Space after thm head: " " = normal interword space; \newline = linebreak
    {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{#1}}\thmnote{\textit{ \small(#3)}}} % Thm head spec (can be left empty, meaning `normal')
  
% Für Absätze vom Typ „Beweis“
\renewcommand{\qedsymbol}{\scriptsize{\ensuremath{\blacksquare}}} % Schwarzes QED-Quadrat
\newtheoremstyle{stybew}%
    {0.5\topsep}
    {1.1\topsep}
    {\upshape}
    {}
    {\dgrau}
    {.}
    {.5em}
    {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{#1}}\thmnote{ #3}}
  
% Für Absätze vom Typ „Definition“
\newcommand{\colorde}{dblue}
\newtheoremstyle{styde}
    {1.1\topsep}
    {\topsep}
    {\normalfont\rmfamily}
    {}
    {\color{\colorde}}
    {.}
    {.5em}
    {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{ \textit{\small(#3)}}}

% Für Absätze vom Typ „Schreib- und Sprechweise“
\newcommand{\colorsch}{dgold}
\newtheoremstyle{stysch}
    {1.1\topsep}
    {\topsep}
    {\normalfont\rmfamily}
    {}
    {\color{\colorsch}}
    {.}
    {.5em}
    {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{ \textit{\small(#3)}}}
    
% Für Absätze vom Typ „Axiom“
\newcommand{\coloraxiom}{dblue}
\newtheoremstyle{styaxiom}
    {1.1\topsep}
    {\topsep}
    {\normalfont\rmfamily}
    {}
    {\color{\coloraxiom}}
    {.}
    {.5em}
    {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{ \textit{\small(#3)}}}
  
% Für Absätze vom Typ „Bemerkung“
\newcommand{\colorbem}{dbraun}
\newtheoremstyle{stybem}
    {1.1\topsep}
    {\topsep}
    {\normalfont\rmfamily}
    {}
    {\color{\colorbem}}
    {.}
    {.5em}
    {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{ \textit{\small(#3)}}}
  
% Für Absätze vom Typ „Beispiel“
\newcommand{\colorbsp}{dgreen}
\newtheoremstyle{stybsp}
    {1.1\topsep}
    {\topsep}
    {\normalfont\rmfamily}
    {}
    {\color{\colorbsp}}
    {.}
    {.5em}
    {\llap{\footnotesize\dgrau \S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{ \textit{\small(#3)}}}

% Für Absätze vom Typ „Aufgabe“
\newcommand{\coloraufg}{dgreen}
\newtheoremstyle{styaufg}
    {1.1\topsep}
    {2.0\topsep}
    {\normalfont\rmfamily}
    {}
    {\color{\coloraufg}}
    {.}
    {.5em}
    {\llap{\footnotesize\dgrau\S \thmnumber{#2} }\thmname{\textbf{{#1}}}\thmnote{ \textit{\small(#3)}}}


% ====================================================================
% <<Einrichten der einzelnen amsthm-Umgebungen>>
% ====================================================================

\theoremstyle{styres}\newtheorem{pro}{Proposition}[section]
\crefname{pro}{Proposition}{Propositionen}
\crefformat{pro}{#2{\rmfamily{\color{\colorres} Proposition} {\dgrau\S}{#1}}#3}

\newaliascnt{satz}{pro} % counter einrichten
\theoremstyle{styres}\newtheorem{satz}[satz]{Satz} % \begin{satz}-Umgebung definieren
\aliascntresetthe{satz} % counter auf Anfang setzen
\crefname{satz}{Satz}{Sätze} % Referenzen einrichten
\crefformat{satz}{#2{\rmfamily{\color{\colorres} Satz} {\dgrau\S}{#1}}#3} % Aussehen der Referenzen

\newaliascnt{lem}{pro}
\theoremstyle{styres}\newtheorem{lem}[lem]{Lemma}
\aliascntresetthe{lem}
\crefname{lem}{Lemma}{Lemmata}
\crefformat{lem}{#2{\rmfamily{\color{\colorres} Lemma} {\dgrau\S}{#1}}#3}

\newaliascnt{kor}{pro}
\theoremstyle{styres}\newtheorem{kor}[kor]{Korollar}
\aliascntresetthe{kor}
\crefname{kor}{Korollar}{Korollare}
\crefformat{kor}{#2{\rmfamily{\color{\colorres} Korollar} {\dgrau\S}{#1}}#3}

\newaliascnt{bew}{pro}
\theoremstyle{stybew}\newtheorem{bew}[bew]{Beweis}
\aliascntresetthe{bew}
\crefname{bew}{Beweis}{Beweise}
\crefformat{bew}{#2{\rmfamily{\color{\colorres} Beweis} {\dgrau\S}{#1}}#3}

\newaliascnt{axiom}{pro}
\theoremstyle{styaxiom}\newtheorem{axiom}[axiom]{Axiom}
\aliascntresetthe{axiom}
\crefname{axiom}{Axiom}{Axiome}
\crefformat{axiom}{#2{\rmfamily{\color{\coloraxiom} Axiom} {\dgrau\S}{#1}}#3}

\newaliascnt{de}{pro}
\theoremstyle{styde}\newtheorem{de}[de]{Definition}
\aliascntresetthe{de}
\crefname{de}{Definition}{Definitionen}
\crefformat{de}{#2{\rmfamily{\color{\colorde} Definition} {\dgrau\S}{#1}}#3}

\newaliascnt{nota}{pro}
\theoremstyle{stysch}\newtheorem{nota}[nota]{Notation}
\aliascntresetthe{nota}
\crefname{nota}{Notation}{Notation}
\crefformat{nota}{#2{\rmfamily{\color{\colorsch} Notation} {\dgrau\S}{#1}}#3}

\newaliascnt{bem}{pro}
\theoremstyle{stybem}\newtheorem{bem}[bem]{Bemerkung}
\aliascntresetthe{bem}
\crefname{bem}{Bemerkung}{Bemerkungen}
\crefformat{bem}{#2{\rmfamily{\color{\colorbem} Bemerkung} {\dgrau\S}{#1}}#3} 

\newaliascnt{anm}{pro}
\theoremstyle{stybem}\newtheorem{anm}[anm]{Anmerkung}
\aliascntresetthe{anm}
\crefname{anm}{Anmerkung}{Anmerkungen}
\crefformat{anm}{#2{\rmfamily{\color{\colorbem} Anmerkung} {\dgrau\S}{#1}}#3}

\newaliascnt{vorschau}{pro}
\theoremstyle{stybem}\newtheorem{vorschau}[vorschau]{Vorschau}
\aliascntresetthe{vorschau}
\crefname{vorschau}{Vorschau}{Vorschauen}
\crefformat{vorschau}{#2{\rmfamily{\color{\colorbem} Vorschau} {\dgrau\S}{#1}}#3}

\newaliascnt{bsp}{pro}
\theoremstyle{stybsp}\newtheorem{bsp}[bsp]{Beispiel}
\aliascntresetthe{bsp}
\crefname{bsp}{Beispiel}{Beispiele}
\crefformat{bsp}{#2{\rmfamily{\color{\colorbsp} Beispiel} {\dgrau\S}{#1}}#3}

\newaliascnt{aufg}{pro}
\theoremstyle{styaufg}\newtheorem{aufg}[aufg]{Aufgabe}
\aliascntresetthe{aufg}
\crefname{aufg}{Aufgabe}{Aufgaben}
\crefformat{aufg}{#2{\rmfamily{\color{\coloraufg} Aufgabe} {\dgrau\S}{#1}}#3}


% ====================================================================
% <<Standard-enumerate-Listentypen für die amsthm-Umgebungen>>
% ====================================================================

\AtBeginEnvironment{satz}{\setlist[enumerate]{label={\textnormal{\alph*)}}}}
\AtBeginEnvironment{bew}{\setlist[enumerate]{label={\alph*)}}}
\AtBeginEnvironment{bsp}{\setlist[enumerate]{label={(\arabic*)}}}
\AtBeginEnvironment{aufg}{\setlist[enumerate]{label={\alph*)}}}

