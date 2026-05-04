\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common/resume}[2026/05/03 Lightweight resume class]
\LoadClass[10pt]{article}

\RequirePackage[a4paper,margin=0.62in,nohead]{geometry}
\RequirePackage{fontspec}
\RequirePackage{hyperref}
\RequirePackage{enumitem}
\RequirePackage{titlesec}
\RequirePackage{xifthen}
\RequirePackage{xcolor}

\hypersetup{hidelinks}
\setmainfont{Latin Modern Roman}
\pagestyle{empty}
\setlength{\parindent}{0pt}
\setlength{\parskip}{0pt}
\setlist[itemize]{leftmargin=1.15em,itemsep=0.18em,topsep=0.2em}

\definecolor{Accent}{HTML}{1F4E79}
\titleformat{\section}{\large\bfseries\color{Accent}}{}{0em}{}[\vspace{-0.35em}\titlerule]
\titlespacing*{\section}{0pt}{0.8em}{0.45em}

\newcommand{\resumeName}[1]{\centerline{\LARGE\bfseries #1}\vspace{0.35em}}
\newcommand{\resumeContact}[1]{\centerline{\small #1}\vspace{0.5em}}
\newcommand{\resumeSection}[1]{\section*{#1}}
\newcommand{\datedEntry}[2]{\textbf{#1}\hfill #2\\}
\newcommand{\roleLine}[2]{\textit{#1}\hfill #2\\}
\newcommand{\resumeLink}[2][]{\ifthenelse{\isempty{#1}}{\href{#2}{#2}}{\href{#2}{#1}}}
\newcommand{\placeholder}[1]{\textcolor{gray}{\texttt{#1}}}
