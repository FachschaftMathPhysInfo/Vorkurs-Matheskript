lualatex Vorkursskript.tex # pdf und auxiliary-files anlegen
biber Vorkursskript.bcf # Kompilation des Literaturverzeichnisses
makeglossaries Vorkursskript.glo # Kompilation des Symbolverzeichnisses
lualatex Vorkursskript.tex # Aufnahme von Literatur- und Symbolverzeichnis ins Pdf
lualatex Vorkursskript.tex # Erneute Kompilation, um Literatur- und Symbolverzeichnis ins Inhaltsverzeichnis zu integrieren und die \begin{labeling}-Listen zu berechnen
