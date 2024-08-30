pdflatex Vorkursskript.tex # pdf und auxiliary-files anlegen
biber Vorkursskript.bcf # Kompilation des Literaturverzeichnisses
makeglossaries Vorkursskript.glo # Kompilation des Symbolverzeichnisses
pdflatex Vorkursskript.tex # Aufnahme von Literatur- und Symbolverzeichnis in die pdf
pdflatex Vorkursskript.tex # Erneute Kompilation, um Literatur- und Symbolverzeichnis im Inhaltsverzeichnis anzuzeigen
