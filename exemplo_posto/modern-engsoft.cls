%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% modern-engsoft.cls
%% Classe LaTeX Corporativa e Minimalista para Engenharia de Software
%% Padrão de Mercado (Enterprise Tech Spec & Architecture Whitepaper)
%% Autor: Diogo Santos Pires Jandiroba
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{modern-engsoft}[2026/09/14 v2.5 Classe Corporativa de Engenharia de Software]

% Opções de Modo de Compilação
\newif\if@modoconsolidado\@modoconsolidadotrue
\DeclareOption{individual}{\@modoconsolidadofalse}
\DeclareOption{consolidado}{\@modoconsolidadotrue}

% Passa opções restantes para report
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\LoadClass[11pt,a4paper,oneside]{report}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PACOTES FUNDAMENTAIS E CODIFICAÇÃO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
\RequirePackage[brazil]{babel}
\RequirePackage{csquotes}

% Geometria da Página
\RequirePackage[
    a4paper,
    top=2.8cm,
    bottom=2.5cm,
    left=2.5cm,
    right=2.5cm,
    headheight=22pt
]{geometry}

% Tipografia e Espaçamento
\RequirePackage{microtype}
\RequirePackage{setspace}
\setstretch{1.15} % Espaçamento executivo limpo

% Paleta Corporativa Neutra e Sóbria (Big Tech Standard)
\RequirePackage{xcolor}
\definecolor{primary}{RGB}{17, 24, 39}       % Preto Corporativo Profundo (#111827)
\definecolor{secondary}{RGB}{55, 65, 81}     % Cinza Escuro Grafite (#374151)
\definecolor{textmuted}{RGB}{107, 114, 128}  % Cinza Médio (#6B7280)
\definecolor{borderline}{RGB}{229, 231, 235} % Linha Divisória Fina (#E5E7EB)
\definecolor{bgneutral}{RGB}{249, 250, 251}  % Fundo Neutro Sutil (#F9FAFB)
\definecolor{darkbar}{RGB}{31, 41, 55}       % Barra de Destaque Grafite (#1F2937)

% Títulos e Seções Estilo Mercado
\RequirePackage{titlesec}
\titleformat{\chapter}[display]
  {\normalfont\bfseries\color{primary}}
  {\small\scshape\bfseries\color{textmuted}\chaptertitlename\ \thechapter}
  {0.5ex}
  {\huge\color{primary}}
  [\vspace{0.5ex}{\color{borderline}\hrule height 1pt}]

\titleformat{\section}
  {\normalfont\Large\bfseries\color{primary}}
  {\thesection}{0.8em}{}

\titleformat{\subsection}
  {\normalfont\large\bfseries\color{secondary}}
  {\thesubsection}{0.8em}{}

\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\color{primary}}
  {\thesubsubsection}{0.8em}{}

\titlespacing*{\chapter}{0pt}{-10pt}{18pt}
\titlespacing*{\section}{0pt}{16pt}{6pt}
\titlespacing*{\subsection}{0pt}{12pt}{4pt}
\titlespacing*{\subsubsection}{0pt}{10pt}{3pt}

% Cabeçalhos e Rodapés Minimalistas
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\small\color{textmuted}\nouppercase{\leftmark}}
\fancyhead[R]{\small\color{secondary}\bfseries\@titulocurto}
\fancyfoot[L]{\footnotesize\color{textmuted}\@classificacao}
\fancyfoot[R]{\small\color{secondary}\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\headrule}{\hbox to\headwidth{\color{borderline}\leaders\hrule height \headrulewidth\hfill}}
\renewcommand{\footrulewidth}{0.5pt}
\renewcommand{\footrule}{\hbox to\headwidth{\color{borderline}\leaders\hrule height \footrulewidth\hfill}}

\fancypagestyle{plain}{%
  \fancyhf{}
  \fancyfoot[L]{\footnotesize\color{textmuted}\@classificacao}
  \fancyfoot[R]{\small\color{secondary}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0.5pt}
  \renewcommand{\footrule}{\hbox to\headwidth{\color{borderline}\leaders\hrule height \footrulewidth\hfill}}
}

% Hiperlinks Discretos (Monocromático Corporativo)
\RequirePackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=primary,
    citecolor=secondary,
    urlcolor=secondary,
    pdfborder={0 0 0}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% METADADOS CORPORATIVOS DO DOCUMENTO
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@subtitulo{}
\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}

\def\@titulocurto{Especificação Técnica}
\newcommand{\titulocurto}[1]{\def\@titulocurto{#1}}

\def\@documentotipo{Especificação Técnica de Engenharia de Software}
\newcommand{\documentotipo}[1]{\def\@documentotipo{#1}}

\def\@projeto{Software Enterprise Architecture}
\newcommand{\projeto}[1]{\def\@projeto{#1}}

\def\@empresa{Engenharia de Software}
\newcommand{\empresa}[1]{\def\@empresa{#1}}

\def\@versao{v1.0.0}
\newcommand{\versao}[1]{\def\@versao{#1}}

\def\@statusdoc{Aprovado para Implementação}
\newcommand{\statusdoc}[1]{\def\@statusdoc{#1}}

\def\@classificacao{Confidencial -- Uso Interno}
\newcommand{\classificacao}[1]{\def\@classificacao{#1}}

\def\@autor{Diogo Santos Pires Jandiroba}
\newcommand{\autor}[1]{\def\@autor{#1}}

\def\@funcao{Lead Software Engineer \& Solutions Architect}
\newcommand{\funcao}[1]{\def\@funcao{#1}}

\def\@local{Brasil}
\newcommand{\local}[1]{\def\@local{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% CAPA CORPORATIVA (ENTERPRISE WHITE-PAPER & TECH SPEC)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\imprimircapa}{%
  \begin{titlepage}
    \newgeometry{top=3cm,bottom=2.5cm,left=2.5cm,right=2.5cm}
    
    % Barra de Topo com Empresa e Classificação
    \noindent
    {\small\scshape\bfseries\color{secondary}\@empresa}
    \hfill
    {\footnotesize\bfseries\color{primary}\MakeUppercase{\@classificacao}}
    \vspace{0.3cm}
    \hrule height 1.5pt\relax
    
    \vspace{3.0cm}
    
    % Identificação do Produto / Projeto
    \noindent
    {\normalsize\scshape\bfseries\color{textmuted}\@projeto}\par
    \vspace{0.4cm}
    
    % Tipo de Documento
    \noindent
    {\small\bfseries\color{secondary}\MakeUppercase{\@documentotipo}}\par
    \vspace{0.6cm}
    
    % Título Principal de Alto Impacto
    \noindent
    {\Huge\bfseries\color{primary}\@title}\par
    
    \ifx\@subtitulo\@empty
    \else
      \vspace{0.5cm}
      \noindent
      {\LARGE\color{secondary}\@subtitulo}\par
    \fi
    
    \vspace{1.5cm}
    \hrule height 0.5pt\relax
    
    \vfill
    
    % Tabela de Metadados Corporativos
    \noindent
    \begin{minipage}{0.95\textwidth}
      \small
      \begin{tabular}{@{}ll@{}}
        \textbf{Autor Principal:} & \@autor \\
        \textbf{Função / Cargo:} & \@funcao \\
        \textbf{Versão do Documento:} & \@versao \\
        \textbf{Status de Homologação:} & \@statusdoc \\
        \textbf{Data de Emissão:} & \@date \\
        \textbf{Localidade:} & \@local \\
      \end{tabular}
    \end{minipage}
    
    \vspace{1.5cm}
    
    % Nota de Confidencialidade / Governança
    \noindent
    {\scriptsize\color{textmuted}
    Este documento técnico contém especificações proprietárias e arquiteturais da solução de software. 
    A distribuição e implementação devem seguir as diretrizes de governança e controle de versão estabelecidas.
    }
    
    \restoregeometry
  \end{titlepage}
  \newpage
}

\endinput
