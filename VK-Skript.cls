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
    chapterprefix,
    numbers=noenddot
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
\RequirePackage{thmtools}


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
\RequirePackage{tocbasic}
    \DeclareTOCStyleEntry[beforeskip=1.5em plus 3pt]{tocline}{chapter} % schlecht platzierten Seitenumbruch im Inhaltsverzeichnis vermeiden

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
\RequirePackage[ngerman, nameinlink]{cleveref}


% ====================================================================
% <<Makros für Einleitung, Hauptteil, Anhang und Schlussteil>>
% ====================================================================

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
    \oldfrontmatter
    \addtocontents{toc}{
        \protect\vspace*{0.5em}
        \protect\KOMAoptions{toc=chapterentrywithoutdots} % Trennpunkte verbergen
        \protect\DeclareTOCStyleEntries[pagenumberformat=\color{white}]{tocline}{chapter, section} % Seitenzahlen verbergen
    }
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
    \addtocontents{toc}{
        \protect\RedeclareSectionCommand[toclinefill=\color{gray}\TOCLineLeaderFill]{section} % Trennpunkte für sections aktivieren
        \protect\DeclareTOCStyleEntry[
            numwidth=3em,
            entrynumberformat=\S, % Vor der Abschnitt-Nummer das Paragraph-Zeichen
            pagenumberformat=\color{gray} % Seitenzahlen aktivieren
        ]{tocline}{section}
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
    \addtocontents{toc}{
        \protect\setcounter{tocdepth}{0} % Keine sections anzeigen
        \protect\DeclareTOCStyleEntry[entrynumberformat={}]{tocline}{section} % Kein Paragraphenzeichen mehr für sections
        % Kapitelformat der Gestalt „Anhang X“ einrichten
        \protect\RedeclareSectionCommand[toclinefill=\color{gray}\TOCLineLeaderFill]{chapter} % Trennpunkte für chapters aktivieren
        \protect\DeclareTOCStyleEntry[
            beforeskip=1em, % Vertikalen Abstand zwischen Kapiteln auf Normalgröße zurücksetzen
            entrynumberformat={Anhang\ },
            numwidth=6em,
            pagenumberformat=\color{gray}
        ]{tocline}{chapter}
    }
    % Kapitel und Abschnitt, wie sie in der Kopfzeile dargestellt werden
    \renewcommand{\chaptermark}[1]{\markleft{Anhang \thechapter\hspace{0.5em}\relax##1}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection\hspace{0.5em}\relax##1}}
    % Kapitel und Abschnitt, wie sie im Text dargestellt werden
    \renewcommand{\chapterformat}{Anhang \thechapter}
    \renewcommand{\sectionformat}{\thesection\quad}
    \hypersetup{bookmarksdepth=0} % Keine sections in den Pdf-bookmarks
    \pdfbookmark[-1]{Anhang}{anhang} % Eintrag im Pdf-Inhaltsverzeichnis hinzufügen
    % Nummerierung der theorems am chapter ausrichten
    \renewenvironment{aufg}{\begin{appendixaufg}}{\end{appendixaufg}}
    \renewenvironment{bem}{\begin{appendixbem}}{\end{appendixbem}}
    \renewenvironment{proof}{\begin{appendixbew}}{\end{appendixbew}}
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
\definecolor{dbrown}{rgb}{0.54,0.27,0.07} % dunkelbraun

% Trennlinien grau färben
\addtokomafont{headsepline}{\color{gray}}
\addtokomafont{footnoterule}{\color{gray}}

% Abschnittsangaben grau färben
\addtokomafont{chapter}{\color{gray}}
\addtokomafont{section}{\color{gray}}
\addtokomafont{subsection}{\color{gray}}
\addtokomafont{subsubsection}{\color{gray}}

\DeclareTOCStyleEntry[pagenumberformat=\color{gray}]{tocline}{section} % Seitenzahlen im Inhaltsverzeichnigs grau färben


% ====================================================================
% <<Kopf- und Fußzeilen>>
% ====================================================================

% Kopf- und Fußzeile für scrheadings
\ohead[]{\color{gray}\upshape\small\rightmark}
\ihead[]{\color{gray}\upshape\small\leftmark}
\ofoot[]{\normalfont\thepage}
\KOMAoption{headsepline}{.5pt}

% Nur Kapitelname in der Kopfzeile, kein section-Name
\newpagestyle{nosection}{
    {\color{gray}\upshape\small\leftmark\hfill}
    {\hfill\color{gray}\upshape\small\leftmark}
    {}
}{
    {\upshape\thepage\hfill}
    {\upshape\hfill\thepage}
    {\upshape\hfill\thepage\hfill}
}

% Keine Kopfzeile, nur Seitenzahl in der Fußzeile
\newpagestyle{onlypagenumber}{
    {}
    {}
    {}
    (\textwidth, 0pt)
}{
    {\upshape\thepage\hfill}
    {\upshape\hfill\thepage}
    {\upshape\hfill\thepage\hfill}
}


% ====================================================================
% <<Einrichten von cleveref-Referenztypen>>
% ====================================================================

\crefname{chapter}{Kapitel}{Kapitel}
\crefformat{chapter}{#2{\rmfamily{\color{gray} Kapitel} {#1}}#3}

\crefname{section}{Abschnitt}{Abschnitte}
\crefformat{section}{#2{\rmfamily{\color{gray} Abschnitt} {\color{gray}\S}{#1}}#3}

\crefname{appendix}{Anhang}{Anhänge}
\crefformat{appendix}{#2{\rmfamily{\color{gray} Anhang} {#1}}#3}


% ====================================================================
% <<Einstellungen für die theoremstyles>>
% ====================================================================

\renewenvironment{proof}{\begin{bew}}{\end{bew}} % Beweis-Umgebung aus der theoremstyles.tex verwenden
\renewcommand{\qedsymbol}{\scriptsize{\ensuremath{\blacksquare}}} % Schwarzes QED-Quadrat

% Farben für die verschiedenen theorem-Sorten
\newcommand{\colorres}{\color{dred}} % für Resultate
\newcommand{\colorbew}{\color{gray}} % für Beweise
\newcommand{\colordefin}{\color{dblue}} % für Definitionen
\newcommand{\colorsch}{\color{dgold}} % für Schreib- und Sprechweisen
\newcommand{\coloraxiom}{\color{dblue}} % für Axiome
\newcommand{\colorbem}{\color{dbrown}} % für Bemerkungen und Anmerkungen
\newcommand{\colorbsp}{\color{dgreen}} % für Beispiele
\newcommand{\coloraufg}{\color{dgreen}} % für Aufgaben


\input{theoremstyles} % Import der amsthm-Umgebungen

% Standard-enumerate-Listentypen für die amsthm-Umgebungen
\AtBeginEnvironment{satz}{\setlist[enumerate]{label={\textup{\alph*)}}}} % a),b),c),...
\AtBeginEnvironment{lem}{\setlist[enumerate]{label={\textup{\alph*)}}}} % a),b),c),...
\AtBeginEnvironment{kor}{\setlist[enumerate]{label={\textup{\alph*)}}}} % a),b),c),...
\AtBeginEnvironment{bew}{\setlist[enumerate]{label={\alph*)}}} % a),b),c),...
\AtBeginEnvironment{bsp}{\setlist[enumerate]{label={(\arabic*)}}} % (1),(2),(3),...
\AtBeginEnvironment{aufg}{\setlist[enumerate]{label={\alph*)}}} % a),b),c),...
