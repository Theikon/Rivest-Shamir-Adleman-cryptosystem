\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{paper}

\LoadClass[12pt]{article}

\RequirePackage[german]{babel}
\RequirePackage{geometry}
\RequirePackage{bbold}
\RequirePackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{amsthm}
\RequirePackage{enumitem}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{hyperref}

\geometry{a4paper,vmargin=25mm,hmargin={30mm,40mm}}

\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}

\newcommand{\lcd}{\operatorname{kgV}}
\renewcommand{\mod}{\operatorname{mod}}
\renewcommand{\gcd}{\operatorname{ggT}}

\def\baselinestretch{1.3}

\AtBeginDocument{\parskip 3mm}
\AtBeginDocument{\parindent 0mm}
\AtBeginDocument{\def\refname{Referenzen}}

\AtBeginDocument{\setlist[enumerate]{label=\arabic*.,topsep=0mm}}