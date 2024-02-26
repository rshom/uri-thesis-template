# URI Thesis

This repository was created for easy setup of a thesis or Dissertation at the University of Rhode Island. The setup requires the uri.cls file to adjust formating. 

The filler content was generated using ChatGPT.

Modified from: https://github.com/dkowalsky7/URIthesis/

To compile for the first time (on unix) run the following:

```
pdflatex main
makeglossaries main
biber main
pdflatex main
pdflatex main
```

Just run `pdflatex main` if only the text is being updated for most runs.

## Template

Fill out `main.tex` with thesis information. 

Each chapter gets its own folder. The chapters can be compiled individually if desired. Chapters can also be added or removed as needed.

For each chapter, fill out the `body.tex` and `abstract.tex`. Add figures the the `fig/` directory in each chapter.

## Abstract and Acknowledgements

Use the `abstract.tex` and `acknowledgements.tex` files. The default abstract also pulls the abstracts from the chapter folders as well. 

## Glossary and Units

The `glossary.tex` file handles glossary entries for acronyms as well as units.

In the text reference acronyms as `gls{CODE}` or `glspl{CODE}` for plurals. Using the glossary commands ensures the terms are defined at first use.

See the `glossaries` documentation for more information: https://ctan.org/pkg/glossaries?lang=en

Metric units are all defined as part of the `siunitx` package. When referencing just the unit use `\si{\meter\per\second}`. When referencing a number and unit use `\SI{5}{\meter\squared}`. This ensures the value and unit do not get seperated.

Imperial units must be custom defined in the `glossary.tex` file. Then they can be referenced as `\us{\yard\per\second}` and `\US{5}{\yard\squared}`.

See the `siunitx` documentation for more information: https://ctan.org/pkg/siunitx?lang=en

## Bibliography

Add entries to the `ref.bib` file in BibTex format. Reference them in the text as \cite{CODE}. Google Scholar outputs BibTex format for any source.

## Figures

Figures should be placed in the text like this: 

```
\begin{figure}
    \includegraphics[width=\textwidth]{fig/filename.png}
    \caption{Caption here}
    \label{fig:imgcode}
\end{figure}
```

The figure can be referenced as `Fig.~\ref{fig:imgcode}` in the text.

