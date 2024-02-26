\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uri}[2024 URI Thesis Format]

\LoadClass[12pt,letterpaper,notitlepage,openany]{report}

% NOTE: A lot of the difficulty of this formatting is trying to get a article class to act like a report class. The fix is to change the base class which then renders a lot of this formatting obsolete


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Packages Necssary to Run this file %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{setspace}               
\RequirePackage{geometry}               
\RequirePackage{indentfirst}            
\RequirePackage{pgffor,pgf}          
\RequirePackage{changepage}             
\RequirePackage{sectsty}                
\RequirePackage{tocloft}  
\RequirePackage{titletoc}              
\RequirePackage{chngcntr}         
\RequirePackage{longtable}     
\RequirePackage{abstract}
% \RequirePackage{glossaries} 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Options to pass to the Document Class %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%  Choose 1 (ms or phd)
%  ms: (Default) produces the Masters Thesis setup 
%  phd: produces the disseration setup
%
%  Choose 1 (digital or hardcopy)
%  digitial: (Default) Produces library rights and electronic sign pages
%  hardcopy: No library rights and signature page with signature lines
% 
%  Choose 1 (i3e or apa)
%  i3e: (default) citations in ieee format
%  apa: citations in apa format

\newif\if@degree \@degreetrue
\DeclareOption{phd}{\@degreefalse}
\DeclareOption{ms}{\@degreetrue}


\newif\if@paper \@paperfalse % NOTE: this is not used
\DeclareOption{digital}{\@paperfalse}
\DeclareOption{hardcopy}{\@papertrue}

% \newif\if@iTe \@iTetrue
% \DeclareOption{i3e}{\@iTetrue}
% \DeclareOption{apa}{\@iTefalse}
\ProcessOptions\relax
\RequirePackage{notoccite}

% \if@iTe
% 	\RequirePackage{notoccite}
% \else
% 	\RequirePackage{apacite}
% \fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set formatting options Per Uri rules  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\geometry{margin=1in,lmargin=1.5in}
\doublespacing

% set chapter and section headers to 12pt font
\chapterfont{\fontsize{12}{12}\selectfont}
\sectionfont{\fontsize{12}{12}\selectfont}  
\subsectionfont{\fontsize{12}{12}\selectfont}
\subsubsectionfont{\fontsize{12}{12}\selectfont} 

\counterwithin{figure}{section}
\counterwithin{table}{section}


\newcommand{\@hrule}{\rule{3in}{0.5pt}}

% Change rules for titles of intropages
% NOTE: not sure if 
% \renewcommand{\abstractname}{\hfill\bfseries\normalsize ABSTRACT \hfill}
\newenvironment{acknowledgements}
	{\renewcommand{\abstractname}{Acknowledgements}\begin{abstract}}
	{\end{abstract}}

	% TODO: make abstract bold

\renewcommand{\abstractnamefont}{\normalfont\MakeUppercase}
% \renewcommand{\abstracttextfont}{\normalfont\Huge}

\renewcommand{\contentsname}{Table of Contents}
\renewcommand{\cfttoctitlefont}{\hfill\normalfont\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\hfill\hfill}
\renewcommand{\cftloftitlefont}{\hfill\normalfont\MakeUppercase}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\normalfont\MakeUppercase}
\renewcommand{\cftafterlottitle}{\hfill}
% \renewcommand{\cftaftertoctitle}{\hfill}
% \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}    


\def\program#1{\gdef\@program{#1}}
\def\gradyear#1{\gdef\@gradyear{#1}}
\def\committee{\gdef\@committee}


\def\@work{
   \if@degree
       Thesis
   \else
       Dissertation
   \fi
}


\newenvironment{bottompar}{\par\vspace*{\fill}\centering}{\clearpage}                        
\newenvironment{midpar}{\par\vspace*{\fill}\centering}

\newenvironment{midparS}{\vspace*{\fill}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%% Creates the title page %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\titlepage{\thispagestyle{empty}
	\thispagestyle{empty}
    \begin{center}
    \MakeUppercase{\@title} \\
    BY \\
    \MakeUppercase{\@author} \\
    \end{center}

    \begin{midpar}
    	A \MakeUppercase{\@work} SUBMITTED IN PARTIAL FULFILLMENT OF THE \\
    	REQUIREMENTS FOR THE DEGREE OF \\
    	\if@degree
    	    MASTERS OF SCIENCE \\
    	\else
    	    DOCTOR OF PHILOSOPHY \\
    	\fi
    	IN \\
    	\MakeUppercase{\@program}
    \end{midpar}

    \begin{bottompar}
    	UNIVERSITY OF RHODE ISLAND \\
    	\@gradyear
    \end{bottompar}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Creates signature pages %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\signpage{\thispagestyle{empty}
	\begin{center}
		\if@degree
		    MASTERS OF SCIENCE IN \MakeUppercase{\@program} \\
        \else
            DOCTOR OF PHILOSOPHY IN \MakeUppercase{\@program} \\
        \fi
        OF \\
        \MakeUppercase{\@author}
	\end{center}

    \begin{midparS}
    	\hangindent=1.5in
    	\hangafter=1
	    \hspace{0.5in} APPROVED: \\
		\if@degree
			Thesis Committee: \\
		\else
			Dissertation Committee: \\ % FIXME: should depend on thesis or disertation
		\fi
	    \if@paper
		    Major Professor\@hrule \vspace{-.5\baselineskip}
		    \begin{adjustwidth}{2.3in}{0cm}
		    	\centering
			    \foreach \x [count=\ni] in \@committee {% 
			    	\ifnum\ni=1%
			    	    \x \\
			    	\else
			    	    \@hrule \\ \vspace{-.5\baselineskip}
			    	    \x \\
		    	    \fi}
	    	    DEAN OF THE GRADUATE SCHOOL \\ 
	  	    \end{adjustwidth}
		\else
			Major Professor
			\begin{adjustwidth}{2.3in}{0cm}
				\centering \vspace{-.8\baselineskip}
				\foreach \x [count=\ni] in \@committee {
					\x \\ }%
				 DEAN OF THE GRADUATE SCHOOL \\ 
			\end{adjustwidth}
		\fi
    	     
    \end{midparS}
	\begin{bottompar}
		UNIVERSITY OF RHODE ISLAND \\
		\@gradyear
	\end{bottompar}
}




