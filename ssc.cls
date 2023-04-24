%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Slovak scientific conference Class.
%%
%% Class for writing Slovak Scientific Conference in latex
%% at Faculty of of Mining, Ecology, Process Control and Geotechnologies and Technical University
%% of Košice.
%%
%% department homepage: http://fberg.tuke.sk
%% project homepage: https://github.com/ajandera/ssc
%%
%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ssc}[2023/22/04 Student Scientific Conference Class, v2023.1]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Using report class as base.
%%
%%%%%
\PassOptionsToClass{a4paper,12pt,oneside}{report}
\LoadClass{report}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Additional packages, and their options.
%%
%%%%%

\RequirePackage{pdfpages}

% titlesec for modification of chapters and sections
\RequirePackage{titlesec}
\titleformat{\chapter}
    {\huge}{\textbf\thechapter}{20pt}{\huge\textbf}[{\titlerule[0.8pt]}]

% sets the document geometry
\RequirePackage[
    a4paper,
    %width=150mm,
    top=25mm,
    bottom=25mm,
    left=30mm,
    right=25mm,
    bindingoffset=6mm
]{geometry}

\RequirePackage{graphicx}
\DeclareGraphicsExtensions{.pdf,.png,.jpg,.eps}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage[
    figure,
    table]{totalcount}

%% Numeric citations and sorting by citation order
\RequirePackage{csquotes}
\RequirePackage[
    bibencoding=auto,
    style=iso-numeric,      % numeric citations according for ISO 690
    autolang=other,
    sorting=none,           % sort by order of citation
    backend=biber           % different backend
]{biblatex}

\RequirePackage[
   unicode,
   %backref,
   pdfusetitle,
   %pdfusekeywords,
   pdftoolbar=true,
   pdfmenubar=true,
   pdfwindowui=true,
   bookmarksopenlevel={0},
   bookmarksnumbered,
   bookmarksopen,
   pdfhighlight={/P},
   colorlinks=false, % TODO draft vs publish ready?
   %hidelinks, % disable color links completly
   citecolor=magenta,
   baseurl={https://fberg.tuke.sk/}
]{hyperref}

% PDF metadata based on macro values
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title@en},
    pdfauthor = {\@author},
    pdfkeywords = {\@keywords@en},
    pdfsubject = {\@thesis}
  }
}

% description for images and tables
\RequirePackage[small]{caption}
\setlength{\captionmargin}{25pt}

%% own header
\RequirePackage{fancyhdr}
\setlength{\headheight}{15pt}

% main header for work
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{
    \markboth{\ifnum\value{chapter}>0 \chaptername\ \thechapter.\ \fi #1}{}
}
\fancyhf{}
\rhead{\itshape \nouppercase{\leftmark}}
\rfoot{\thepage}


% štýl pre prvú stranu kapitoly (plain s číslom strany v päte zarovnaný vpravo)
\fancypagestyle{chapterpage}{
    \fancyhf{}
    \renewcommand\headrulewidth{0pt}
    \rfoot{\thepage}
}


% zmena štýlu prvej stránke kapitoly
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{chapterpage}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}

\renewcommand{\headrulewidth}{0.7pt}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Variable definitions and default values: these variables should be defined by
%% the user (somewhere in the preamble). For example, to put the abstract into
%% the thesis, the thesis writer should type the following somewhere in the
%% preamble (before the `\begin{document}` or `\frontmatter` commands are
%% called):
%%
%%      \abstract{This is my abstract.}
%%
%% See below (in the comments starting with 'DOCVAR: ') for a list of all
% variables
%% the thesis writer is expected to use.
%%
%%%%%

\def\br{\\}


% Command for author's name in the form of: [affil]{Name}{Surname}[affil]
% Second optional argument using https://texfaq.org/FAQ-twooptarg
\newcommand{\@author@prefix}{}
\newcommand{\@author@firstname}{}
\newcommand{\@author@lastname}{}
\newcommand{\@author@postfix}{}
\renewcommand\author[3][]{
    \renewcommand{\@author@prefix}{#1}
    \renewcommand{\@author@firstname}{#2}
    \renewcommand{\@author@lastname}{#3}
    \authorpostfix
}
\newcommand\authorpostfix[1][]{
    \renewcommand{\@author@postfix}{#1}
}


% DOCVAR: college (The name of the thesis writer's college)
\newcommand{\@college@en}{Technical University of Košice}
\newcommand{\@college@sk}{Technical University of Košice}
\newcommand{\@college}{\@college@en}
\newcommand{\college}[2]{
    \renewcommand{\@college@en}{#1}
    \renewcommand{\@college@sk}{#2}
}

\newcommand{\@college@city}{Košice}

% DOCVAR: faculty (The name of the thesis writer's faculty)
\newcommand{\@faculty@sk}{Faculty of Mining, Ecology, Process Control\\ and Geotechnologies}
\newcommand{\@faculty@en}{Faculty of Mining, Ecology, Process Control\\ and Geotechnologies}
\newcommand{\@faculty}{\@faculty@en}
\newcommand{\faculty}[2]{
    \renewcommand{\@faculty@en}{#1}
    \renewcommand{\@faculty@sk}{#2}
}


% DOCVAR: department (name of the thesis writer's department)
\newcommand{\@department@sk}{Institute of Control and Informatization of Production Processes}
\newcommand{\@department@en}{Institute of Control and Informatization of Production Processes}
\newcommand{\@department}{\@department@en}
\newcommand{\department}[2]{
    \renewcommand{\@department@en}{#1}
    \renewcommand{\@department@sk}{#2}
}

% DOCVAR: department's shortcut
\newcommand{\@departmentacr@en}{FBERG}
\newcommand{\@departmentacr@sk}{FBERG}
\newcommand{\@departmentacr}{\@departmentacr@en}
\newcommand{\departmentacr}[2]{
    \renewcommand{\@departmentacr@en}{#1}
    \renewcommand{\@departmentacr@sk}{#2}
}


% DOCVAR: supervisor (name of the thesis writer's supervisor)
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}}

% DOCVAR: study programme
\newcommand{\@studyprogramme}{Process control of raw materials and material extraction and processing}
\newcommand{\studyprogramme}[1]{\renewcommand{\@studyprogramme}{#1}}


% DOCVAR: level of study
\newcommand{\@levelstudy}{I. - Bachelor degree / II. - Master degree} % I. - Bachelor degree, II. - Master degree
\newcommand{\levelstudy}[1]{\renewcommand{\@levelstudy}{#1}}

% DOCVAR: year os study
\newcommand{\@yearstudy}{3. / 2.} % 3. / 2.
\newcommand{\yearstudy}[1]{\renewcommand{\@yearstudy}{#1}}

% DOCVAR: thesis (type of the thesis)
\newcommand{\@thesis@en}{Student Scientific Conference}
\newcommand{\@thesis@sk}{Student Scientific Conference}
\newcommand{\@thesis}{\@thesis@en}
\newcommand{\thesis}[2]{
    \renewcommand{\@thesis@en}{#1}
    \renewcommand{\@thesis@sk}{#2}
}

% DOCVAR: section (type of the ssc)
\newcommand{\@sscsection@en}{Section S2A Control and Logistics}
\newcommand{\@sscsection@sk}{Section S2A Control and Logistics}
\newcommand{\@sscsection}{\@sscsection@en}
\newcommand{\sscsection}[2]{
    \renewcommand{\@sscsection@en}{#1}
    \renewcommand{\@sscsection@sk}{#2}
}

% DOCVAR: date (declaration date)
\newcommand{\@submissiondate}{}
\newcommand{\submissiondate}[3]{
    \newcommand{\@submissionday}{#1}
    \newcommand{\@submissionmonth}{#2}
    \newcommand{\@submissionyear}{#3}
}

% DOCVAR: abstract of the thesis
\renewcommand{\abstract}[2]{%
    \newcommand{\@abstract@en}{#1}%
    \newcommand{\@abstract@sk}{#2}%
}
\newcommand{\@abstract}{\@abstract@en}

% DOCVAR: thesis keywords
\newcommand{\keywords}[2]{%
    \newcommand{\@keywords@en}{#1}%
    \newcommand{\@keywords@sk}{#2}%
}
\newcommand{\@keywords}{\@keywords@en}

% DOCVAR: thesis title
\renewcommand{\title}[2]{%
    \newcommand{\@title@en}{#1}%
    \newcommand{\@title@sk}{#2}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Translations of strings used in the thesis
%%

% Default empty declarations
\newcommand{\declarationname}{No Language Selected}
\newcommand{\signaturename}{No Language Selected}
\newcommand{\lstlistingname}{No Language Selected}
\newcommand{\studyprogrammename}{No Language Selected}
\newcommand{\name}{No Language Selected}
\newcommand{\supervisorname}{No Language Selected}
\newcommand{\keywordsname}{No Language Selected}
\newcommand{\secondabstractname}{No Language Selected}
\newcommand{\secondkeywordsname}{No Language Selected}
\newcommand{\supervisorcitationname}{No Language Selected}
\newcommand{\levelname}{No Language Selected}
\newcommand{\yearname}{No Language Selected}

\AtBeginDocument{
    \addto\captionsenglish{
        \renewcommand{\@title}{\@title@en}
        \renewcommand{\@abstract}{\@abstract@en}
        \renewcommand{\@keywords}{\@keywords@en}
        \renewcommand{\@college}{\@college@en}
        \renewcommand{\@department}{\@department@en}
        \renewcommand{\@departmentacr}{\@departmentacr@en}
        \renewcommand{\@faculty}{\@faculty@en}
        \renewcommand{\@thesis}{\@thesis@en}
        \renewcommand{\declarationname}{Declaration}
        \renewcommand{\signaturename}{Signature}
        \renewcommand{\studyprogrammename}{Study Programme}
        \renewcommand{\name}{Name:}
        \renewcommand{\supervisorname}{Supervisor}
        \renewcommand{\abstractname}{Abstract in English}
        \renewcommand{\keywordsname}{Keywords in English}
        \renewcommand{\secondabstractname}{Abstract in Slovak}
        \renewcommand{\secondkeywordsname}{Keywords in Slovak}
        \renewcommand{\supervisorcitationname}{Supervisor}
        \renewcommand{\lstlistingname}{Listing}
        \renewcommand{\levelname}{Level of study}
        \renewcommand{\yearname}{Year of study}
    }
    \addto\captionsslovak{
        \renewcommand{\@title}{\@title@sk}
        \renewcommand{\@abstract}{\@abstract@sk}
        \renewcommand{\@keywords}{\@keywords@sk}
        \renewcommand{\@college}{\@college@sk}
        \renewcommand{\@faculty}{\@faculty@sk}
        \renewcommand{\@thesis}{\@thesis@sk}
        \renewcommand{\signaturename}{Vlastnoručný podpis}
        \renewcommand{\studyprogrammename}{Študijný program}
        \renewcommand{\name}{Meno}
        \renewcommand{\supervisorname}{Školiteľ}
        \renewcommand{\abstractname}{Abstrakt v SJ}
        \renewcommand{\keywordsname}{Kľúčové slová v SJ}
        \renewcommand{\secondabstractname}{Abstrakt v AJ}
        \renewcommand{\secondkeywordsname}{Kľúčové slová v AJ}
        \renewcommand{\supervisorcitationname}{Vedúci práce}
        \renewcommand{\lstlistingname}{Zdrojový kód}
        \renewcommand{\levelname}{Stupeň štúdia}
        \renewcommand{\yearname}{Rok štúdia}
    }
}

% right page number aligment from 2nd page in table of content
\fancypagestyle{plain}{%
    \renewcommand{\footrulewidth}{0pt}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Front matter
%%
%% - outside and inside front cover
%% - title leaf
%% Do not include the date of make!
%% Institution + department.
%% Names of referees. (optional)
%% Degree.
%% Date of submission and defense. (optional)
%% Place and date of publication and publishers (and other info by them).
%
\newcommand{\frontmatter}{
    \pagenumbering{roman}
    \pagestyle{empty}  % no page numbers until TOC
    \titlepage
    \abstractpage

    \pagestyle{plain}
    \tableofcontents
    \newpage

    % show list of figures only if there are some
    \iftotalfigures%
        \listoffigures%
        \newpage%
    \fi

    % show list of tables only if there are some
    \iftotaltables%
        \listoftables%
        \newpage%
    \fi

    \pagestyle{fancy}
    \pagenumbering{arabic}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Abstract component
%%
%%%%%

\newcommand{\abstractpage}{
    \def\br{}

    \noindent
    \subsection*{\abstractname}

    \@abstract
    
    \subsection*{\keywordsname}

    \@keywords

    \iflanguage{slovak}{
        \subsection*{\secondabstractname}

        \begin{otherlanguage}{english}
            \@abstract
        \end{otherlanguage}
        
        \subsection*{\secondkeywordsname}

        \begin{otherlanguage}{english}
            \@keywords
        \end{otherlanguage}
    }{
        \subsection*{\secondabstractname}

        \begin{otherlanguage}{slovak}
            \@abstract
        \end{otherlanguage}
        
        \subsection*{\secondkeywordsname}

        \begin{otherlanguage}{slovak}
            \@keywords
        \end{otherlanguage}
    }

    \newpage

    \def\br{\\}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Title page component
%%
%%%%%
\renewcommand{\titlepage}{
    \begin{center}
        {\Large \textbf{\@college}}

        {\Large \textbf{\@faculty}}

        \bigskip

        {\Large \textbf{\@thesis}}

        \vfill


        {\large \textbf{\@sscsection}}

        \bigskip

        \bigskip

        \iflanguage{slovak}{
            \begin{otherlanguage}{english}
                {\LARGE \textbf{\@title} \par}
            \end{otherlanguage}
        }{
            \begin{otherlanguage}{slovak}
                {\LARGE \textbf{\@title} \par}
            \end{otherlanguage}
        }

        \bigskip

        {\LARGE \textbf{\@title} \par}
        
    \end{center}

    \vfill

    \noindent
    \begin{tabular}{@{}p{.26\textwidth}p{.7\textwidth}}
        \name:& \@author@prefix~\@author@firstname~\@author@lastname~\@author@postfix \\
        \levelname:& \@levelstudy \\
        \yearname:& \@yearstudy \\
        \studyprogrammename:& \@studyprogramme \\
        \supervisorname:& \@supervisor
    \end{tabular}

    \newpage
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Fonts
%%
%%%%%

% Font for some math characters to work with TeX Gyre Pagella font

\RequirePackage{textcomp}

% Font used for thesis is TeX Gyre Pagella.
% Note: You might need to install it first.

\RequirePackage{tgpagella}

% Use TXTT as a typewriter font. It supports bold and matches Pagella in style.
\renewcommand*\ttdefault{txtt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%% Line spacing and paragraph indentation
%%
%%%%%

\linespread{1.3}
\setlength{\parindent}{1.5em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\blindtext}{Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Etiam lobortis facilisissem. Nullam nec mi et neque pharetra sollicitudin. Praesent imperdiet mi necante. Donec ullamcorper, felis non sodales commodo, lectus velit ultrices augue, a dignissim nibh lectus placerat pede. Vivamus nunc nunc, molestie ut, ultriciesvel, semper in, velit. Ut porttitor. Praesent in sapien. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Duis fringilla tristique neque. Sed interdum libero utmetus. Pellentesque placerat. Nam rutrum augue a leo. Morbi sed elit sit ametante lobortis sollicitudin. Praesent blandit blandit mauris. Praesent lectus tellus, aliquet aliquam, luctus a, egestas a, turpis. Mauris lacinia lorem sit amet ipsum. Nunc quis urna dictum turpis accumsan semper.}
