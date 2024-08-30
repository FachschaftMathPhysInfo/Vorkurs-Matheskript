
Dieses Readme richtet sich an diejenigen Leute, die das Skript in Zukunft weiter bearbeiten werden. Weitere Readmes für Vorkurs-Dozenten und -Tutoren befinden sich im Readme-Ordner.

Der gesamte LaTeX-Code erstreckt sich über:

    1. Das mainfile "Vorkursskript.tex", das zu kompilieren ist und alle anderen texfiles lädt. Hier sollte möglichst kein Inhalt drinstehen, das mainfile sollte nur Auskunft über das Dokumentskelett geben.
    2. Die einzelnen texfiles zu den Dokumentkapiteln von "_00.Einleitung.tex" bis "_08.Anhang.tex". Hier steht der eigentliche Inhalt des Vorkursskripts drin.
    3. Die "cover.tex", in der Titelei und Rückseite gestaltet werden.
    4. Das classfile "VK-Skript.cls", in dem die Paktete geladen und alle globalen Einstellungen zum Dokumentdesign geregelt werden. Das classfile sollte keine dokumentspezifischen Inhalte enthalten und prinzipiell auch für andere Skripte verwendbar bleiben.
    5. Die "theoremstyles.tex", in der die amsthm-Umgebungen (Definition, Satz, Beispiel, etc.) definiert und konfiguriert werden.
    6. Die "operators.tex", die ausschließlich Definitionen mathematischer Operatoren und anderer Kürzel enthält.
    7. Die "Symbolverzeichnis.tex", in der die Einträge fürs Symbolverzeichnis definiert werden.
    8. Das BibLaTeX-file "Literaturverzeichnis.bib", in dem die Einträge des Literaturverzeichnisses definiert werden.
    9. Die Shell-Datei "make.sh", die eine Prozedur enthält, um das Skript in einem Rutsch zu kompilieren, sofern noch keine auxiliary-files angelegt wurden.

*************************************************************************************

Tipps zum guten TeXen:

    (1) Seid sparsam mit dem Erstellen neuer Befehle und verwendet soweit es geht die gewöhnliche LaTeX-Syntax. So bleibt der Code auch für diejenigen, die nach euch dran arbeiten, gut verständlich. Solltet ihr rein kosmetische Änderungen vornehmen wollen, zieht in Betracht, die Standard-Syntax per renewcommand zu überschreiben. Dies sollte aber nur kosmetische, nicht semantische Änderungen betreffen.
    
    (2) Mathematische Kürzel und Operatoren werden definiert in der operators.tex, verschafft euch dort einmal einen Überblick über die bereits definierten Befehle. Nutzt diese Befehle soweit es geht, damit bei einer eventuellen globalen Änderung nur ein paar Zeilen in der operators.tex geändert werden müssen und nicht der ganze restliche Code durchforstet werden muss. Dies betrifft insbesondere die in der operators.tex definierten Kürzel für die \mathbb- und \mathcal-Alphabete und die Abkürzungen \N,\Z,\Q,\R,\C für die Zahlbereiche.
    
    (3) Wenn ihr neue Operatoren definiert, sollte der Befehl so „sprechend“ und selbsterklärend wie möglich sein. Am besten sollte er genau aus denselben Zeichen wie der Operator selbst bestehen, also etwa \Abb für die Menge der Abbildungen und \kgV fürs kleinste gemeinsame Vielfache. Die Befehle sollten auch für eure Nachfolger unmittelbar einsichtig und gut zu merken sein.
    
        In einer älteren Version war beispielsweise jemand mit dem üblichen \lim-Befehl nicht einverstanden und hatte sich per
            \newcommand{\limm}[1]{\lim\limits_{#1}}
        einen eigenen Limes-Befehl definiert, der sich vom Standard-Limes lediglich dadurch unterschied, dass auch im inline-mathmode die Zeile "n \to infty" nicht neben das Limes-Zeichen, sondern darunter platziert wird. Hierdurch wurde
            1. ein unnötiger Befehl für einen Operator, der eigentlich standardmäßig schon definiert war, erstellt.
            2. Der Befehl war nicht selbsterklärend. Wer rechnet damit, dass „limm“ für einen gewöhnlichen Limes steht? Warum das doppelte m?
            3. Der Befehl durchbricht die durchaus sinnvolle LaTeX-Regelung, im inline-mathmode keine \limits-Indizes zu platzieren. Sollte sowas wirklich einmal erwünscht sein, ist es vielleicht besser, an der Stelle halt das aufwendigere "\lim\limits_{n\to \infty}" zu texen, auch um anderen Editoren mitzuteilen, dass eine Ausnahme der Regel vorkommt. Ich habe das beispielsweise im Symbolverzeichnis in den Einträgen von \sum und \prod so gehandhabt.
        Bitte vermeidet so etwas! Solltet ihr mit den Standard-Befehlen unzufrieden sein, zieht notfalls in Betracht, sie direkt zu überschreiben, also etwa den Standard-\lim-Befehl durch den Neuen komplett zu ersetzen. Dies sollte aber ausschließlich kosmetische Änderungen betreffen, die Befehle sollten nachwievor das ergeben, was man intuitiv von ihnen erwartet.
    
    (4) In die tex-Files zu den einzelnen Kapiteln gehört ausschließlich mathematischer Inhalt, der keine weiteren Effekte über das Kapitel hinaus bewirkt! Kürzel werden in der operators.tex definiert, andere \renewcommand's, Formatoptionen oder Ähnliches gehören in die Präambel oder ins classfile.
    
  
***********************************************************************************

Erklärungen zur Dokumentstruktur:

    (Zeichnungen im image-Ordner) Die Zeichnungen wurden mit xournal angefertigt. Damit könnt ihr die .xoj-Dateien im _img-Ordner editieren. Bei den jpegs handelt es sich schlicht um Screenshots aus Xournal.
    
    (Makros für Einleitung, Hauptteil, Anhang und Schlussteil) Die Makros \frontmatter, \mainmatter, \appendix und \backmatter wurden im classfile umdefiniert. Dies betrifft ausschließlich kosmetische Einstellung wie das Kapitelformat ("Kapitel 4" aber "Anhang 2"), die Gestaltung des Inhaltsverzeichnisses, das Handling der pdf-bookmarks und der pagestyles. Ebenso wurde \tableofcontents im classfile umdefiniert, um ein pdf-bookmark zu platzieren.
    
    (amsthm-Umgebungen) Die Handhabung der amsthm-Umgebungen geschieht über das Paket thmtools. Die Definition der Umgebungen erfolgt in der "theoremstyles.tex" in zwei Phasen:
        1. Per \declaretheoremstyle werden die Erscheinungsbilder der amsthm-Umgebungen festgelegt. Hier werden Layout, Schriftarten und Farben eingerichtet. Die meisten theoremstyles unterscheiden sich lediglich um ihre Farbe.
        2. Die eigentlichen Umgebungen mitsamt ihrer counter werden per \declaretheorem definiert. Beispielsweise sind \begin{bem} und \begin{vorschau} zwei verschiedene Umgebungen, teilen sich aber denselben theoremstyle "stybem".
        3. Am Ende der Datei werden noch spezielle Umgebungen definiert, die lediglich im Anhang zum Einsatz kommen, und sich von den herkömmlichen Umgebungen nur durch ihre Nummerierung unterscheiden.
    Bisher sind folgende amsthm-Umgebungen definiert:
        \begin{pro} für Propositionen. (Sollte nirgends eingesetzt werden)
        \begin{satz} für Sätze.
        \begin{lem} für Lemmata. (Kommt bislang nicht im Skript zum Einsatz)
        \begin{kor} für Korollare. (Kommt bislang nicht im Skript zum Einsatz)
        \begin{bew} für Beweise. Beachtet, dass bislang kein automatisches qed-Quadrat platziert wird, am Beweisende müsst ihr selbst ein \qed ergänzen. Solltet ihr ein automatisches qed-Quadrat wünschen, könnt ihr dies in der Definition von "stybew" einstellen. Beachtet allerdings, dass dann das gesamte Skript darauf umgeschrieben werden muss.
        \begin{axiom} für Axiome.
        \begin{de} für Definitionen.
        \begin{nota} für Notationssachen.
        \begin{bem} für Bemerkungen.
        \begin{anm} für Anmerkungen. (Kommt bislang nicht im Skript zum Einsatz)
        \begin{vorschau} für Bemerkungen, die fortgeschrittenere Themen betreffen.
        \begin{bsp} für Beispiele.
        \begin{aufg} für Aufgaben.
    Am besten schaut ihr einmal ins classfile, um euch selbst einen Überblick zu verschaffen. Die Umgebung \begin{pro} sollte im Text nicht verwendet werden. Sie dient lediglich als "Dummy-Umgebung", an der sich die Counter der üblichen Umgebungen ausrichten. Die Umgebungen \begin{lem}, \begin{kor} und \begin{anm} werden ebenso an keiner Stelle im Text verwendet, ich habe sie der Vollständigkeit aber hinzu definiert, getreu dem Paradigma, dass das classfile prinzipiell auch für andere Texte verwendbar sein sollte.
    
    (Das Labeling-System) Das Referenzieren innerhalb des Dokuments geschieht durch \cref{...}. Verseht bitte nicht einfach jeden Absatz mit einem Label, sondern nur solche, die ihr auch an anderer Stelle referenziert. Das Labeling im Dokument unterliegt folgendem System:
    
        A) Sätze, Bermerkungen, Notationen, Axiome werden mit einem prägnanten Wort gelabelt, das auf den Inhalt zugeschnitten ist. Bitte auf keinen Fall Nummerierungen innerhalb der Labels ("\label{satz5}") verwenden! - Das führt nur zu Verwirrung, wenn sich später die Textstruktur nochmal verändern sollte. Die labels enthalten keine Großschreibung (also auch kein CamelCase) und keine Getrenntschreibung. Ebenso sollten sie keine Spezialbuchstaben wie ä,ö,ü enthalten.
        
        B) Labels von Definitionen beginnen mit "def:", von Beispielen mit "bsp:" und von Aufgaben mit "aufg:". Zum Beispiel so etwas wie "def:teilmenge". Definitionen und Beispiele treten meist in Paaren auf, in diesem Fall teilen sich Beispiele und Definitionen dieselbe Labelbezeichnung, also beispielsweise "def:disjunkt" bei der Definition disjunkter Mengen und "bsp:disjunkt" bei den Beispielen für disjunkte Mengen.
        
    Der Grund dafür, dass ich nicht auch so etwas wie "satz:" oder "bem:" bei Sätzen und Bemerkungen verwende, liegt darin, dass die Rollen von Bemerkungen und Sätzen stärker austauschbar sind, d.h. im Schreibprozess wird etwas, das vorher ein Satz war, plötzlich zum Axiom erhoben oder zur Bemerkung degradiert. Bedenkt, dass jede Änderung der labels umständlich ist, weil dann ja auch alle über den Code verteilten \cref{}-Instanzen geändert werden müssen. Die labels sollten wirklich "für die Ewigkeit" sein und nach ihrer Definition nicht mehr verändert werden.
    
    (Die Standard-Listen) Im classfile werden mittels "\AtBeginEnvironment" Standard-Listentypen für einzelne amsthm-Umgebungen festgelegt. Wenn ihr beispielsweise in einer \begin{satz}-Umgebung eine enumerate-Liste startet, ist diese automatisch mit "a), b), c), ..." nummeriert. In einer \begin{bsp}-Umgebung dagegen mit "(1), (2), (3), ...". Bitte greift im Text auch auf diese Standard-Listen zurück, damit sich das globale Design leicht verändern lässt. Solltet ihr bspw. irgendwann beschließen, dass Beispiel standardmäßig durch "(a), (b), (c), ..." nummeriert sein sollten,  braucht ihr nur eine Zeile im classfile ändern und müsst nicht jede enumerate-Liste im ganzen Dokument abändern.
    Denkt daran, dass euch das Paket "enumitem" komfortabel Listen nummerieren lässt!
    
    (Symbolverzeichnis) Die Einträge des Symbolverzeichnis werden in der "Symbolverzeichnis.tex" definiert und mit makeglossaries kompiliert. Manche LaTeX-Editoren führen diese Kompilation nicht automatisch durch, denkt also an makeglossaries, falls ihr Änderungen im Symbolverzeichnis vorgenommen habt. Das Labeling im Symbolverzeichnis erfolgt mit dem Präfix "sym:", um Konflikte mit anderen Labels im Text von vornherein zu vermeiden. Die Einträge werden in der Reihenfolge im Text aufgelistet, in der sie auch im texfile stehen und sind gruppiert nach den Vorkurs-Kapiteln, in denen sie definiert werden.

    (Druckbarkeit) Das Skript ist grundsätzlich so geschrieben, dass es sich in doppelseitiger Buchansicht lesen lässt. Dies wird deutlich beispielsweise daran, dass das Layout doppelseitig ist (auf ungeraden Seiten steht der Text weiter links, auf geraden Seiten weiter rechts) neue Kapitel stehts auf einer ungeraden Seite (im Buch rechts) beginnen und das Skript stets auf einer geraden Seite mit dem griechischen Alphabet endet (sodass sich das Alphabet im gedruckten Buch schnell ganz hinten nachschlagen lässt).
    
Ich habe das classfile im August 2022 von Grund auf neugeschrieben und verstehe es dementsprechend gut. Wenn bei der Bearbeitung des Skripts Schwierigkeiten oder Fragen auftreten, wendet euch gerne an mich per Email: lukathome@gmx.net

***********************************************************************************

Bemerkungen zum mathematischen Inhalt:

    (1) Solltet ihr in Zukunft größere Überarbeitungen am Skript-Inhalt vornehmen, ist mein Wunsch, dass ihr mindestens einen erfahrenen, reinen Mathematiker im Masterstudium mit im Team habt. In das Skript gingen Ideen aus intuitionistischer Logik, Beweistheorie, Modelltheorie, Kategorientheorie und Topostheorie ein, die dem Text zwar nicht direkt anzusehen sind, bei denen ich mir aber viel gedacht habe. Für solche Dinge sind nur erfahrene Mathematiker sensibilisiert.

    (2) Das ganze Skript wurde mit der Philosophie verfasst, dass im Vorkurs die Sprache und Weite des Inhalts Vorrang vor inhaltlicher Tiefe hat. Sinn des Vorkurses ist, den Anfis einen Einblick in die mathematische Ideen- und Gedankenwelt zu eröffnen, und nicht, ihnen schon irgendwelche wichtigen Sätze zu beweisen. In den ersten Semestern ist das Sprache-und-Notation-Lernen mindestens ebenso schwierig wie das Mathe-Lernen und im Vorkurs soll es vor allem um die Vermittlung von Sprache und Ideen gehen.
        Sehr gut illustriert wird diese Philosophie durch den Werdegang des Verknüpfungskapitels. In der alten Version von 2020 hieß dieses Kapitel noch "Gruppen" und begann direkt mit der Auflistung der Gruppenaxiome und einer Liste von Beispielen wie (Z,+) und (R\{0},*), die nicht weiter begründet wurden. Später wurden Untergruppen und Kongruenz modulo einer Untergruppe definiert und schließlich der Satz von Lagrange bewiesen (mittels kombinatorischer Argumente, die nirgends fundiert wurden). Dieses alte Kapitel widerspricht so ziemlich allen Ideen, die mich zur Überarbeitung bewogen. Im Corona-Jahr 2020 hatte ich selbst als Tutor beim Vorkurs mitgemacht und dadurch unmittelbar mitbekommen, wie wenig die Anfis aus dem Vortrag mitnahmen. Das neue Verknüpfungs-Kapitel hingegen lässt sich Zeit damit, die einzelnen Bestandteile der Gruppenaxiome zu erklären, und den Anfis eine Intuition dafür aufzubauen, was Assoziativität und ein neutrales Element bedeuten. Außerdem gibt es viel Raum für die Einführung und Illustration von Notation. Das Kapitel würde nicht darunter leiden, ließe man den letzten Abschnitt zu Gruppen sogar weg und dennoch denke ich, dass nach der Lektüre des neuen Kapitels die Anfis besser darauf vorbereitet sind, wenn in der LA1 der Gruppenbegriff eingeführt wird.
    
    (3) Solltet ihr die Aufgabenvorschläge verändern, seid euch darüber im Klaren, dass die Anfis absolut kein Vorwissen haben. Obertutoren neigen dazu, zu schwere Zettelaufgaben zu stellen, weil sie eher Aufgaben stellen, die sie selbst interessant finden (ich spreche da aus eigener Erfahrung und aus meinem Kontakt zu anderen Obertutoren). Die Aufgaben sollten vor allem einen "reality check"-Charakter haben, der den Anfis verdeutlicht, dass die Konzepte aus dem Vortrag auch ganz natürlich auftreten können und alles andere als Hexenwerk sind. Stellt eher Aufgaben mit Beispielen als abstrakte Beweisaufgaben, denn Beispiele erweitern die Gedankenwelt der Anfis am stärksten. Solltet ihr Beweisaufgaben stellen, sollte es sich bei deren Lösungen maximal um Dreizeiler handeln, die sich schon durch Jonglieren mit den Definitionen ergeben. Für mehr ist in den Tutorien ohnehin nicht die Zeit vorhanden. Denkt daran, dass die Aufgaben nicht in Ruhe zuhause, sondern direkt im Tutorium bearbeitet werden. Ihr könnt also auch Aufgaben stellen, die zu Dialog und Diskussion anleiten. Vergesst am Ende nicht, in der Readme-Datei "Für Tutoren.txt" die Anmerkungen anzupassen.
        
    (4) Es war mir ein wichtiges Anliegen, die Rolle der Wahrheitstafeln abzuschwächen. Auch wenn ihr es im ersten Semester oder in der technischen Informatik anders gelernt habt: Die aussagenlogischen Junktoren sind erst einmal unabhängig von den Wahrheitswerten. Letztere stellen nur deren Interpretation dar. Die Anfis bringen auch so schon ein gutes Verständnis für "und" und "oder" mit, das ihr ihnen lassen solltet, die Wahrheitstafeln dienen dabei nur zusätzlicher Erklärung. In schlechten Büchern ist es gängig, die logischen Junktoren allein über ihre Interpretation hinsichtlich "wahr" und "falsch" zu definieren. Nicht nur verwischt diese Vorgehensweise den Unterschied zwischen Syntax und Semantik, sie schränkt die Logik auch von vornherein unnötigerweise auf zweiwertige Interpretationen ein und macht sie damit insbesondere zu nicht-klassischen Interpretationen unfähig. Wer einmal einen Beweis des Gödelschen Vollständigkeitssatzes gesehen hat, weiß, wie unnatürlich es unter Umständen sein kann, eine zweiwertige Interpretation zu konstruieren. Zwar sollten Wahrheitstafeln, vor allem für die Informatik-Anfis, nachwievor im Vorkurs angesprochen werden, sie sollten aber auf keinen Fall zur Definition(!) der Junktoren verwendet werden! Spätestens beim Implikationspfeil erzeugt dieses Vorgehen Verständnisprobleme, da besonders der Implikationspfeil seine Bedeutung nicht durch seine (bei Anfängern immer wieder Fragen aufwerfende) Wahrheitstafel, sondern durch den Umgang mit ihm in Beweisen, der im zweiten Kapitel erläutert wird, gewinnt.
        Ebenso sollten Beweistechniken auf keinen Fall durch Wahrheitstafeln "hergeleitet" werden, wie dies etwa noch 2020 der Fall war! Dieses Vorgehen hat nur zur Folge, dass die Erstis schwieriger lernen, die Junktoren mit ihrer Rolle in Beweisen zu verknüpfen und auf ihren LA1-Zettelabgaben gar meinen, irgendwelche Aussagen über Vektorräume mittels Wahrheitstafeln beweisen zu können (ist mir als LA1-Tutor schon untergekommen). Letztendlich handelt es sich bei den Beweistechniken um Axiome, die die Junktoren mit Bedeutung ausstatten.
    Daher ist mein Wunsch, dass größere Eingriffe ins Logik- und Beweiskapitel nur von Leuten vorgenommen werden, die sich mit Beweiskalkülen, Modelltheorie und intuitionistischer Logik auskennen.
    
    (5) Die größte Schwäche des Skripts (Stand 2022) ist, dass nirgends Induktionsbeweise besprochen werden. Ich habe mich dazu entschlossen, weil Induktionsbeweise im Skript nirgends benötigt werden (außer bei den Potenzgesetzen im Verknüpfungskapitel, die daher nicht bewiesen werden) und es sich um eine eher fortgeschrittene Technik handelt, die für Anfänger weniger wichtig als all die anderen Techniken aus dem Beweiskapitel sind. Das Beweiskapitel hat ohnehin schon erhebliche Überlänge und ich möchte die Dozenten nicht dazu verführen, in ihren Vortrag auch noch Induktionsbeweise aufzunehmen. Auf Vorkurs-Niveau lässt sich die Technik auch nicht durch schöne Beispiele illustrieren, die Standard-Aufgaben zu Induktion, die irgendwelche Summenformeln involvieren, finde ich unglücklich, weil sie den falschen Eindruck vermitteln, Induktionsbeweise kämen vor allem bei arithmetischen Gleichungen zum Tragen. Außerdem gehören Induktion und Rekursion meiner Ansicht nach untrennbar zusammen und ein Skript-Abschnitt, der Induktionsbeweise behandelt, sollte auch rekursive Folgendefinitionen behandeln. Aber für all das sehe ich momentan nirgends ausreichend Platz im Vorkursprogramm.
    
    
Luka, September 2022
