\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VK-Skript}[2022/08/06 Vorkurs-Skript class]

% ====================================================================
% <<KOMA-Klasse scrbook als Basis>>
% ====================================================================

\PassOptionsToClass{
    fontsize=11pt,
    titlepage=off,
    headings=openany, % Kapitelanfänge auch auf geradzahligen Seiten zulassen
    headings=normal, % Dezentere Kapitelanfänge
    chapterprefix=true, % Kapiteltitel mit „Kapitel ...“ beginnen
    numbers=noenddot % Abschnittsnummerierungen ohne Punkt am Ende
}{scrbook}
\ProcessOptions
\LoadClass{scrbook}

\RedeclareSectionCommand[beforeskip=0pt]{chapter} % Kapitalanfänge nach oben setzen


% ====================================================================
% <<Pakete>>
% ====================================================================

\RequirePackage{iftex} % Kompatibilität für LuaLaTeX und PdfLaTeX regeln


% Sprache und Kodierung
\RequirePackage[ngerman]{babel}
\ifpdftex\RequirePackage[utf8]{inputenc}\fi


% Mathe
\RequirePackage[fleqn]{amsmath} % fleqn für linksbündigen displaymath
\RequirePackage{mathtools}
    \mathtoolsset{centercolon}
\RequirePackage{amsthm}
\RequirePackage{thmtools}


% Zeichenbibliotheken
\RequirePackage{amssymb}
\RequirePackage{stmaryrd}
% Gestalt der \implies- und \iff-Pfeile fixen https://tex.stackexchange.com/a/137514
\makeatletter
    \input{ot1lmr.fd}
    \DeclareFontShape{OT1}{lmr}{m}{n}{
        <-5.5>    rm-lmr5  <5.5-6.5> rm-lmr6
        <6.5-7.5> rm-lmr7  <7.5-8.5> rm-lmr8
        <8.5-9.5> rm-lmr9  <9.5->    rm-lmr10
    }{}
\makeatother


% Schriftarten
\ifpdftex
    \RequirePackage[T1]{fontenc}
    \RequirePackage{newtxtext} % Tex Gyre Termes für den textmode
    \RequirePackage{lmodern} % Latin Modern für den mathmode
\fi
\ifluatex
    \RequirePackage{fontspec}
    \setmainfont{Stix Two Text}
    \setsansfont{Libertinus Sans}
    \setmathrm{Latin Modern Math}
    \setmathsf{Latin Modern Sans}
    \DeclareMathAlphabet{\mathcal}{OMS}{cmsy}{m}{n} % legacy mathcal
    \let\mathbb\relax\DeclareMathAlphabet{\mathbb}{U}{msb}{m}{n} % legacy mathbb
    \DeclareMathSizes{10.95}{12}{8}{8} % Alle Matheschriften ein klein wenig größer machen
\fi


% Seitenlayout
\RequirePackage{scrlayer-scrpage} % Für Kopf- und Fußzeilen
\RequirePackage{geometry} % Wird in der Formatierung von Titel- und Rückseite eingesetzt


% Listen und Tabellen
\RequirePackage[shortlabels]{enumitem} % Zusätzliche Konfigurationsmöglichkeiten für Listen
\RequirePackage{longtable} % Seitenumspannende Tabellen
\RequirePackage{booktabs} % Werkzeuge für schönere Tabellen
    \setlength{\cmidrulekern}{0.25em} % Default-Länge beim Trimmen von cmidrules


% Entwicklertools
\RequirePackage{verbatim} % Wörtliche Wiedergabe von Code und \begin{comment}-Umgebung für längere Kommentare im Code
\RequirePackage{calc} % Rechnen mit LaTeX-Größen
\RequirePackage{etoolbox} % Nützliche Zusatzbefehle
\RequirePackage{eqparbox} % Wird für den Labeling-Listen-Tweak eingesetzt


% Mikrotypographie
\RequirePackage[babel, verbose=silent]{microtype} % Warnungen umstellen, die bislang aus einem Bug resultierten https://tex.stackexchange.com/q/373594
\ifluatex\RequirePackage[ngerman]{selnolig}\fi % Korrekte Ligaturen


% Sonstiges
\RequirePackage{xcolor} % Umgang mit Farben
\RequirePackage{graphicx} % Zum Laden von Bildern
\RequirePackage{tikz} % Zeichnen von Vektorgrafiken
    \usetikzlibrary{babel}
    \usetikzlibrary{cd} % Kommutative Diagramme
\RequirePackage[autostyle]{csquotes} % Zitate und Anführungszeichen


% Literaturverzeichnis
\RequirePackage[style=alphabetic]{biblatex}
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
        bookmarksdepth=1,
        breaklinks,
        colorlinks,
        linkcolor=gray,
        urlcolor=dblue,
        citecolor=black
    }
\RequirePackage[all]{hypcap} % Korrektes Verlinken auf floating environments
\RequirePackage{footnotebackref} % Fußnoten zum Text zurückverlinken
    \deffootnote[1em]{1.5em}{1em}{\textsuperscript{\hyperref[\BackrefFootnoteTag]{\thefootnotemark}}} % Verfügbarkeit für KOMA fixen https://tex.stackexchange.com/a/492925
    \makeatletter
    % Ebenso footnotemarks zurückverlinken https://tex.stackexchange.com/a/78438
    \LetLtxMacro{\BHFN@Old@footnotemark}{\@footnotemark}
    \renewcommand*{\@footnotemark}{%
        \refstepcounter{BackrefHyperFootnoteCounter}%
        \xdef\BackrefFootnoteTag{bhfn:\theBackrefHyperFootnoteCounter}%
        \label{\BackrefFootnoteTag}%
        \BHFN@Old@footnotemark
    }
    \makeatother
\RequirePackage{bookmark} % Verwaltung der Pdf-bookmarks
\RequirePackage[ngerman, nameinlink]{cleveref}


% ====================================================================
% <<Makros für Einleitung, Hauptteil, Anhang und Schlussteil>>
% ====================================================================

\let\oldfrontmatter\frontmatter
\renewcommand{\frontmatter}{
    \oldfrontmatter
    \addtocontents{toc}{\protecting{
        \KOMAoptions{toc=chapterentrywithoutdots} % Trennpunkte verbergen
        \DeclareTOCStyleEntries[pagenumberformat=\phantom]{tocline}{chapter, section} % Seitenzahlen verbergen
    }}
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
    \renewcommand{\chapterpagestyle}{onlypagenumber}
    \pagestyle{scrheadings}
    \addtocontents{toc}{\protecting{
        \RedeclareSectionCommand[toclinefill=\color{gray}\TOCLineLeaderFill]{section} % Trennpunkte für sections aktivieren
        \DeclareTOCStyleEntry[
            numwidth=3em,
            pagenumberformat=\color{gray} % Seitenzahlen für sections reaktivieren
        ]{tocline}{section}
    }}
    \renewcommand{\thesection}{\S\arabic{chapter}.\arabic{section}}
}

\let\oldappendix\appendix
\renewcommand{\appendix}{
    \oldappendix
    \cleardoublepage
    \pagestyle{nosection}
    \addtocontents{toc}{\protecting{
        \setcounter{tocdepth}{0} % Keine sections anzeigen
        \RedeclareSectionCommand[toclinefill=\color{gray}\TOCLineLeaderFill]{chapter} % Trennpunkte für chapters reaktivieren
        \DeclareTOCStyleEntry[
            entrynumberformat={Anhang\ },
            numwidth=6em,
            pagenumberformat=\color{gray} % Seitenzahlen für Kapitel reaktivieren
        ]{tocline}{chapter}
    }}
    \renewcommand{\thesection}{\Alph{chapter}.\arabic{section}}
    \hypersetup{bookmarksdepth=0} % Keine sections in den Pdf-bookmarks
    \pdfbookmark[-1]{Anhang}{anhang} % Eintrag im Pdf-Inhaltsverzeichnis hinzufügen
    \switchtoappendixthms % Nummerierung der theorems umstellen
}

\let\oldbackmatter\backmatter
\renewcommand{\backmatter}{
    \glsaddall % Einträge dem Symbolverzeichnis hinzufügen
    \KOMAoptions{open=right} % Letzte Abschnitte stets auf ungeraden Seiten beginnen
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
\definecolor{lbrown}{rgb}{0.60,0.48,0.19} % hellbraun
\definecolor{dbrown}{rgb}{0.54,0.27,0.07} % dunkelbraun

% Trennlinien grau färben
\addtokomafont{headsepline}{\color{gray}}
\addtokomafont{footnoterule}{\color{gray}}

% Abschnittsangaben grau färben
\addtokomafont{chapter}{\color{gray}}
\addtokomafont{section}{\color{gray}}
\addtokomafont{subsection}{\color{gray}}
\addtokomafont{subsubsection}{\color{gray}}


% ====================================================================
% <<Kopf- und Fußzeilen>>
% ====================================================================

% Kopf- und Fußzeile für scrheadings
\ohead[]{\color{gray}\upshape\small\rightmark}
\ihead[]{\color{gray}\upshape\small\leftmark}
\ofoot[]{\normalfont\large\thepage}
\KOMAoptions{headsepline=0.5pt}

% Nur Kapitelname in der Kopfzeile, kein section-Name
\newpagestyle{nosection}{
    {\color{gray}\upshape\small\leftmark\hfill}
    {\hfill\color{gray}\upshape\small\leftmark}
    {}
}{
    {\upshape\large\thepage\hfill}
    {\upshape\hfill\large\thepage}
    {\upshape\hfill\large\thepage\hfill}
}

% Keine Kopfzeile, nur Seitenzahl in der Fußzeile
\newpagestyle{onlypagenumber}{
    {}
    {}
    {}
    (\textwidth, 0pt)
}{
    {\upshape\large\thepage\hfill}
    {\upshape\hfill\large\thepage}
    {\upshape\hfill\large\thepage\hfill}
}


% ====================================================================
% <<Einstellungen für die theoremstyles>>
% ====================================================================

\renewenvironment{proof}{\begin{bew}}{\end{bew}} % Beweis-Umgebung aus der theoremstyles.tex verwenden
\renewcommand{\qedsymbol}{\scriptsize{\ensuremath{\blacksquare}}} % Schwarzes QED-Quadrat

% Farben für die verschiedenen theorem-Sorten
\newcommand{\colorres}{\color{dred}} % für Resultate
\newcommand{\colorbew}{\color{gray}} % für Beweise
\newcommand{\colordefin}{\color{dblue}} % für Definitionen
\newcommand{\colorsch}{\color{lbrown}} % für Schreib- und Sprechweisen
\newcommand{\coloraxiom}{\color{dblue}} % für Axiome
\newcommand{\colorbem}{\color{dbrown}} % für Bemerkungen und Anmerkungen
\newcommand{\colorbsp}{\color{dgreen}} % für Beispiele
\newcommand{\coloraufg}{\color{dgreen}} % für Aufgaben


\input{theoremstyles} % Import der amsthm-Umgebungen


% Standard-Listen für die amsthm-Umgebungen
\AtBeginEnvironment{satz}{\setlist*[enumerate]{label={\textup{\alph*)}}}} % a),b),c),...
\AtBeginEnvironment{lem}{\setlist*[enumerate]{label={\textup{\alph*)}}}} % a),b),c),...
\AtBeginEnvironment{kor}{\setlist*[enumerate]{label={\textup{\alph*)}}}} % a),b),c),...
\AtBeginEnvironment{bsp}{\setlist*[enumerate]{label={(\arabic*)}}} % (1),(2),(3),...
\AtBeginEnvironment{aufg}{\setlist*[enumerate]{label={\alph*)}}} % a),b),c),...
\AtBeginEnvironment{appendixaufg}{\setlist*[enumerate]{label={\alph*)}}} % a),b),c),...
\AtBeginEnvironment{bew}{\setlist*[enumerate]{label={\alph*)}}} % a),b),c),...
\AtBeginEnvironment{appendixbew}{\setlist*[enumerate]{label={\alph*)}}} % a),b),c),...


% ====================================================================
% <<Listen>>
% ====================================================================

% Überschreiben der KOMA-Liste \begin{labeling} https://tex.stackexchange.com/a/547398
\newlist{patchedlabeling}{enumerate}{3}
\newcommand{\labelinglisttweak}[2][r]{\eqmakebox[listlabel@\EnumitemId][#1]{#2}}
\setlist[patchedlabeling]{
    label=\textbullet,
    labelindent=0pt,
    labelwidth=\eqboxwidth{listlabel@\EnumitemId},
    format=\rmfamily\normalfont\labelinglisttweak,
    leftmargin=!,
    listparindent=\parindent,
    itemsep=\itemsep+\parsep-\parskip,
    parsep=\parskip
}
\renewenvironment{labeling}{\begin{patchedlabeling}}{\end{patchedlabeling}}

% Einzüge in Listen an den Rest des Dokuments anpassen
\setlist[itemize,enumerate,description]{
    listparindent=\parindent,
    itemsep=\itemsep+\parsep-\parskip,
    parsep=\parskip
}

% Behelfslösung, um Seitenumbrüche an mit Listen beginnenden theorems zu vermeiden
\AtBeginEnvironment{bem}{\setlist[itemize]{beginpenalty=10000}}
\AtBeginEnvironment{appendixbem}{\setlist[itemize]{beginpenalty=10000}}
\AtBeginEnvironment{bsp}{\setlist*[enumerate,patchedlabeling]{beginpenalty=10000}}
\AtBeginEnvironment{bew}{\setlist*[enumerate,patchedlabeling]{beginpenalty=10000}}
