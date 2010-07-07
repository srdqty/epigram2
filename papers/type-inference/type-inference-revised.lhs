\documentclass[authoryear,preprint]{sigplanconf}

%options ghci

%include lhs2TeX.fmt
%include lhs2TeX.sty

%format <-  = "\leftarrow "
%format :-> = "\arrow "
%format <>< = "<\!>\!< "
%format <>> = "<\!>\!> "
%format <+> = "\oplus "
%format <*> = "\varoast "
%format <$> = "<\!\!\$\!\!> "
%format :$  = ":\!\!\$\ "
%format ::: = "\asc "
%format >=> = "\genarrow "
%format <?  = "\in "
%format ... = "\ldots "
%format >-  = "\Yright "
%format .   = "\,\circ\, "

%format F0  = "\emptycontext"
%format B0  = "\emptycontext"

%format Lam (x) (b) = "\lambda" x "." b
%format Let (x) (s) (t) = "\letIn{" x "}{" s "}{" t "} "
%format LetGoal = "\letGoal "

%format Hole = "? "
%format Some = "!\!"

%format alpha  = "\alpha"
%format alpha0
%format alpha1
%format alpha'
%format alphaD = "\alpha\!D"
%format beta   = "\beta"
%format beta0
%format beta1
%format gamma  = "\gamma"
%format _Gamma  = "\Gamma"
%format _Gamma0
%format _Gamma1
%format delta  = "\delta"
%format delta0
%format delta1
%format nu     = "\nu"
%format sigma  = "\sigma"
%format sigma0
%format sigma1
%format sigma'
%format tau    = "\tau"
%format tau0
%format tau1
%format tau'
%format rho = "\rho"
%format upsilon = "\upsilon"
%format upsilon0
%format upsilon1
%format chi = "\chi"
%format _Xi = "\Xi"
%format _Xi0
%format _Xi1

\usepackage{color}
\definecolor{red}{rgb}{1.0,0.0,0.0}
\newcommand{\TODO}[1]{\NotForPublication{\textcolor{red}{#1}}}
\newcommand{\NotForPublication}[1]{#1}

\newcommand{\eqsubst}{\equiv}
\newcommand{\compose}{\cdot}
\newcommand{\subst}[3]{[#1/#2]#3}

\newcommand{\extend}{\ensuremath{\wedge}}
\newcommand{\yields}{\ensuremath{\dashv}}
\newcommand{\entails}{\ensuremath{\vdash}}
\newcommand{\entailsN}{\ensuremath{\Vdash}}
% \newcommand{\var}{\ensuremath{\defn \_}}
\newcommand{\type}{\ensuremath{~\mathbf{type}}}
\newcommand{\scheme}{\ensuremath{~\mathbf{scheme}}}
\newcommand{\valid}{\ensuremath{\mathbf{valid}}}
\newcommand{\ok}{\ensuremath{~\mathbf{ok}}}
\newcommand{\emptycontext}{\ensuremath{\varepsilon}}
\newcommand{\letGoal}{\ensuremath{\fatsemi}}
\newcommand{\letIn}[3]{\ensuremath{\mathrm{let}~ #1 \!:=\! #2 ~\mathrm{in}~ #3}}
\newcommand{\letS}[3]{\ensuremath{(!#1 \!:=\! #2 ~\mathrm{in}~ #3)}}
\newcommand{\boxrule}[1]{\begin{center}\framebox{\ensuremath{#1}}\end{center}}
\newcommand{\boxrules}[2]{\begin{center}\framebox{\ensuremath{#1}}\quad\framebox{\ensuremath{#2}}\end{center}}

\newcommand{\tmvars}[1]{\ensuremath{tmvars(#1)}}
\newcommand{\tyvars}[1]{\ensuremath{\V_\TY(#1)}}
\newcommand{\types}[1]{\ensuremath{\T_\TY(#1)}}
\newcommand{\FTV}[1]{\ensuremath{\mathit{FTV}(#1)}}
\newcommand{\Type}{\ensuremath{\mathit{Type}}}
\newcommand{\Term}{\ensuremath{\mathit{Term}}}
% \newcommand{\Scheme}{\ensuremath{\mathit{Scheme}}}

\newcommand{\lei}{\ensuremath{\preceq}}
\newcommand{\LEI}{\ensuremath{~\hat\lei~}}
\newcommand{\leiR}{\ensuremath{\sqsubseteq}}
\newcommand{\LEIR}{\ensuremath{~\hat\sqsubseteq~}}

\newcommand{\arrow}{\ensuremath{\triangleright}}
\newcommand{\defn}{\ensuremath{\!:=\!}}
\newcommand{\asc}{\ensuremath{\hasc}}
\newcommand{\hasc}{\ensuremath{~\hat{::}~}}
\newcommand{\hole}[1]{\ensuremath{#1 \!:= ?}}
\newcommand{\contains}{\ensuremath{\ni}}

\newcommand{\Judge}[3]{\ensuremath{#1 \lei #3 \vdash #2}}
\newcommand{\JudgeR}[3]{\ensuremath{#1 \leiR #3 \vdash #2}}
\newcommand{\Jmin}[3]{\ensuremath{#1 \LEI #3 \vdash #2}}
\newcommand{\Junify}[4]{\Judge{#1}{\Puni{#2}{#3}}{#4}}
\newcommand{\JunifyR}[4]{\JudgeR{#1}{\Puni{#2}{#3}}{#4}}
\newcommand{\Jinstantiate}[5]{\Judge{#1 ~||~ #4}{\Puni{#2}{#3}}{#5}}
\newcommand{\JinstantiateMin}[5]{\Jmin{#1 ~||~ #4}{\Puni{#2}{#3}}{#5}}
\newcommand{\Jspec}[4]{\Judge{#1}{#2 \succ #3}{#4}}
\newcommand{\Jtype}[4]{\Judge{#1}{\Pinf{#2}{#3}}{#4}}
\newcommand{\JtypeR}[4]{\JudgeR{#1}{\Pinf{#2}{#3}}{#4}}
\newcommand{\Jhast}[5]{\Judge{#1}{#2 ~\hat:_{#3}~ #4}{#5}}

\newcommand{\JminR}[3]{\ensuremath{#1 \LEIR #3 \vdash #2}}

\newcommand{\InParam}[1]{(#1)}
\newcommand{\OutParam}[1]{#1}
\newcommand{\Prob}[3]{#1 \InParam{#2} \OutParam{#3}}
\newcommand{\Pinf}[2]{#1 : \OutParam{#2}}
\newcommand{\Puni}[2]{#1 \equiv #2}
\newcommand{\Pspec}[2]{\Prob{S}{#1}{#2}}

\newcommand{\name}[1]{\ensuremath{\mathrm{\textsc{#1}} \;}}
\newcommand{\side}[1]{\ensuremath{\; #1}}

\newcommand{\br}[2]{\genfrac{}{}{0pt}{0}{#1}{#2}}
\newcommand{\BigRule}[3]{\ensuremath{\Rule{\br{#1}{#2}}{#3}}}

% \newcommand{\sym}{\ensuremath{^\vee}}
\newcommand{\sem}[1]{\ensuremath{\llbracket #1 \rrbracket}}

\newcommand{\W}{\ensuremath{\mathcal{W}}}
\newcommand{\AlgorithmW}{Algorithm~\W}

\newcommand{\genarrow}{\ensuremath{\Uparrow}}
\newcommand{\gen}[2]{\ensuremath{(#1 \genarrow #2)}}
\newcommand{\forget}[1]{\ensuremath{\lfloor #1 \rfloor}}
\newcommand{\hasscheme}{\ensuremath{::}}
\newcommand{\subcontext}{\ensuremath{\subset}}
\newcommand{\semidrop}{\downharpoonright}
\newcommand{\Sbind}[2]{(#1 \Yright #2)}
\newcommand{\spec}{\ensuremath{\succ}}

\newcommand{\define}[1]{\emph{#1}}
\newcommand{\scare}[1]{`#1'}

\newcommand{\V}{\mathcal{V}}
\newcommand{\D}{\mathcal{D}}
\newcommand{\Ss}{\mathcal{S}}
\newcommand{\K}{\mathcal{K}}
\newcommand{\T}{\mathcal{T}}
\newcommand{\TY}{\mathrm{\textsc{TY}}}
\newcommand{\TM}{\mathrm{\textsc{TM}}}

\newcommand{\decl}[2]{#1 #2}

\newcommand{\In}[1]{\ensuremath{\mathit{In}_{#1}}}
\newcommand{\Out}[1]{\ensuremath{\mathit{Out}_{#1}}}
\newcommand{\Pre}[2]{\ensuremath{\mathit{Pre}_{#1} \InParam{#2}}}
\newcommand{\Post}[3]{#1 \InParam{#2} \OutParam{#3}}
\newcommand{\R}[3]{\ensuremath{\mathit{R}_{#1} \OutParam{#2} \OutParam{#3}}}

\usepackage{amsthm}
\usepackage{amsmath}
\usepackage{enumerate}
\usepackage{eucal}
\usepackage{natbib}
\usepackage[T1]{fontenc}
\usepackage[colorlinks,draft=false]{hyperref}

\setlength{\parskip}{5pt}
\setlength{\parindent}{0pt}

\newtheorem{lemma}{Lemma}

\include{macros}
\setlength{\rulevgap}{0.05in}

\hyphenpenalty=5000
\tolerance=1000


%if showCode

> {-# LANGUAGE  DeriveFunctor, DeriveFoldable,
>               FlexibleInstances, TypeSynonymInstances,
>               TypeFamilies, StandaloneDeriving, TypeOperators #-}

> import Prelude hiding (any)
> import Control.Applicative ((<$>))
> import Control.Monad.State (StateT, get, gets, put, runStateT)
> import Data.Foldable (Foldable, any, foldMap)
> import Data.Monoid (Monoid, mappend, mempty)

%endif



\begin{document}

\conferenceinfo{MSFP '10}{September 25, Baltimore, Maryland, USA.} 
\copyrightyear{2010} 
\copyrightdata{\NotForPublication{[to be supplied]}} 

\titlebanner{\NotForPublication{REVISED DRAFT}}

\title{Type inference in context}
\authorinfo{Adam Gundry \and Conor McBride}
           {University of Strathclyde, Glasgow}
           {\{adam.gundry,conor.mcbride\} at cis.strath.ac.uk}
\authorinfo{James McKinna}
           {Radboud University, Nijmegen}
           {james.mckinna at cs.ru.nl}

\maketitle

\begin{abstract}
\input{abstract.ltx}
\end{abstract}


\section{Introduction}

\subsection{\AlgorithmW}

\AlgorithmW\ is a well-known type inference algorithm for the Hindley-Milner type
system \citep{milner_theory_1978, damas_principal_1982}, based on
\citeauthor{robinson_machine-oriented_1965}'s Unification Algorithm
\citeyearpar{robinson_machine-oriented_1965}. The system consists of
simply-typed $\lambda$-calculus with \scare{let-expressions} for polymorphic
definitions.
For example, the term
$$\letIn{i}{\lambda x . x}{i i}$$
is well-typed: $i$ is given a polymorphic type that is instantiated in two
different ways. The syntax of types is
$$\tau ::= \alpha ~||~ \tau \arrow \tau.$$
For simplicity, the function arrow $\arrow$ is our only type constructor.
We let $\alpha$ and $\beta$ range over type variables and $\tau$ and $\upsilon$
over types.

Most presentations of \AlgorithmW\ have treated the underlying unification
algorithm as a \scare{black box}, but by considering both together we can give a
more elegant type inference algorithm.  In particular, the generalisation step
(used when inferring the type of a let-expression) becomes straightforward
(section ??).

Why revisit \AlgorithmW? This is a first step towards a longer-term objective:
explaining the elaboration of high-level \emph{dependently typed} programs into
fully explicit calculi. Elaboration involves inferring \emph{implicit arguments}
by solving constraints, just as \W\ specialises polymorphic type schemes, but
with fewer algorithmic guarantees. Pragmatically, we need to account for
stepwise progress in problem solving from states of partial knowledge.
We wish to identify local correctness criteria for type inference that
guarantee global correctness.

\TODO{More crunchiness: forward pointers to claims and contributions}

This paper is literate Haskell, with full source code available at
\footnotesize\url{http://personal.cis.strath.ac.uk/~adam/type-inference/}\normalsize.

\subsection{Related work} \TODO{Later?}

The idea of assertions producing a resulting context goes back at least to
\citet{pollack_implicit_1990}. An interesting point of comparison is with the
work of Nipkow and co-workers. \citet{Nipkow-Prehofer-JFP95} use (unordered)
input and output contexts to pass information about \scare{sorts} for Haskell
typeclass inference, alongside a conventional substitution-based presentation
of unification.
\citet{NaraschewskiN-JAR} formally prove correctness of \AlgorithmW\ in
Isabelle/HOL using a counter for fresh variable generation and a monad to
silently propagate failure; we have used similar techniques in our
implementation, though we do not consider these issues in the main text.

We are grateful to an anonymous referee for pointing out the work of
\citet{dunfield_polymorphism_2009} on polymorphism in a bidirectional typesystem.
Dunfield uses well-founded contexts that contain existential type variables
(amongst other things). These variables can be solved, and there is an informal
notion of information increase between input and output contexts, though this is
used for different purposes. \TODO{More?}

Imposing order restrictions on context entries 
is similar to the \emph{ordered hypotheses} of deduction
systems for non-commutative logic \citep{polakow_natural_1999}.

In contrast to other presentations of unification and Hindley-Milner type
inference, our algorithm uses explicit definitions to avoid the need for a 
substitution operation.
(We do use substitution in reasoning about the system.) Many implementations
of (variations on) the Robinson unification algorithm are incorrect because they
do not handle substitutions correctly \citep{norvig_correctingwidespread_1991}.

This paper has been brewing for a long time. Its origins lie in a constraint
engine cannibalised by McBride from an implementation of
\citeauthor{miller:mixed}'s \scare{mixed prefix}
unification~\citeyearpar{miller:mixed}, mutating the quantifier prefix into a
context. \citeauthor{mcbride:thesis}'s thesis~\citeyearpar{mcbride:thesis} gives
an early account of using typing contexts to represent the state of an
interactive construction system, the \scare{holes} in programs and proofs being 
specially designated variables. Contexts carry an information order: increase of
information preserves typing and equality judgments; proof tactics are
admissible context validity rules which increase information; unification is
specified as a tactic which increases information to make an equation hold, but
its imple-mentation is not discussed. This view of construction underpinned the
implementation of Epigram~\citep{mcbride.mckinna:view-from-the-left} and informed
\citeauthor{norell:agda}'s implementation of Agda~\citeyearpar{norell:agda}.
It is high time we began to explain how it works and perhaps to understand it.

\subsection{The occur-check}

Testing whether a variable occurs in a term is used by both Robinson unification
and \AlgorithmW. In unification, the check is (usually)
necessary to ensure termination, let alone correctness: the equation
$\alpha \equiv \alpha \arrow \beta$ has no (finite) solution because the
right-hand side depends on the left, so it does not make a good definition.

In \AlgorithmW, the occur-check is used to discover type dependencies just in
time for generalisation. When inferring the type of the let-expression
$\letIn{x}{w}{t}$, the type $w$ must first be inferred, then
quantified over \scare{generic} type variables, i.e.\ those that occur in $w$
but not the enclosing bindings. This is the only real complexity in \AlgorithmW,
and as \citet{milner_theory_1978} wrote, ``the
reader may still feel that our rules are arbitrarily chosen and only partly
supported by intuition.'' Experience has shown that the rules are well-chosen
indeed; perhaps we can now discover the intuition.

\TODO{Present classical \AlgorithmW in more detail?}

In both cases, the occur-check is used to detect dependencies between variables.
Type variables are traditionally left floating in space and given definitions by
substitutions, but by imposing structure we can manage definitions and
dependencies as we go. Recording type variables in the context is natural when
dealing with dependent types, since there is no distinction between type and term
variables. Even in a simply-typed setting, however, this approach has advantages.


\section{Unification over a context}

We postpone formal definitions until later, but for the moment we regard a
context as a left-to-right list of type variables, each of which may be unknown
(written $\hole{\alpha}$) or defined (written $\alpha \defn \tau$). A context
is valid if types in definitions must make sense over the preceding contexts.
For example, the context
$$\hole{\alpha}, \hole{\beta}, \gamma \defn \alpha \arrow \beta$$
is valid, but the context
$$\alpha \defn \beta, \hole{\beta}$$
is not, because $\beta$ is not in scope for the definition of $\alpha$.
This topological sorting of the dependency graph means that we should keep context
entries as far to the right as possible to retain maximum generality.

The definitions in the context induce an equational theory on types, starting
with $\alpha \equiv \tau$ for every definition $\alpha \defn \tau$ in the
context, then taking the structural and equivalence closure as shown in
Figure~\ref{fig:equivRules}. 

\begin{figure}[ht]
\boxrule{\Gamma \entails \tau \equiv \upsilon}
% \Rule{\alpha \defn \tau}
%      {\alpha \equiv \tau}
$$
\Rule{\tau \type}
     {\tau \equiv \tau}
\qquad
\Rule{\upsilon \equiv \tau}
     {\tau \equiv \upsilon}
$$
$$
\Rule{\tau_0 \equiv \upsilon_0
      \quad
      \tau_1 \equiv \upsilon_1}
     {\tau_0 \arrow \tau_1 \equiv \upsilon_0 \arrow \upsilon_1}
\qquad
\Rule{\tau_0 \equiv \tau_1
      \quad
      \tau_1 \equiv \tau_2}
     {\tau_0 \equiv \tau_2}
$$
\caption{Rules for type equivalence}
\label{fig:equivRules}
\end{figure}

For example, we have
$$\hole{\alpha}, \beta \defn \alpha, \gamma \defn \alpha \arrow \beta \entails \beta \arrow \alpha \equiv \gamma.$$

Unification is the problem of increasing information in the context (making
variables more defined) to make a particular equation hold. For example, we
might start in the context $\hole{\alpha}, \hole{\beta}, \gamma \defn \alpha \arrow \beta$ and aim to solve the equation $\beta \arrow \alpha \equiv \gamma$.

The idea is that we decompose constraints on the syntactic structure of types
until we reach variables, then move through the context and update it to solve
the equation. In the example, the definition of $\gamma$ tells us that we must
solve $\beta \arrow \alpha \equiv \alpha \arrow \beta$ over the context
$\hole{\alpha}, \hole{\beta}$. This constraint decomposes to
$\alpha \equiv \beta$ and $\beta \equiv \alpha$, which are easily solved by
defining $\beta \defn \alpha$.


\subsection{Implementation of unification}

> data Ty a  =  V a |  Ty a :-> Ty a
>     deriving (Functor, Foldable)

%if showCode

> infixr 5 :->

%endif

> type TyName  = Integer
> type Type    = Ty TyName


> class FTV a where
>     (<?) :: TyName -> a -> Bool

> instance FTV TyName where
>     (<?) = (==)

> instance  (Foldable t, FTV a) => FTV (t a) where
>     alpha <? t = any (alpha <?) t



> data TyDecl   =  Some Type | {-"\;"-} Hole
> data TyEntry  =  TyName := TyDecl

> instance FTV TyEntry where
>    alpha <? (_ := Some tau)  = alpha <? tau
>    alpha <? (_ := Hole)      = False

< data Entry    = TY TyEntry | ...
< type Context  = Bwd Entry

%if False

> type Context  = Bwd Entry -- so we can line up the two previous lines

%endif

> type Contextual  = StateT (TyName, Context) Maybe

> fresh :: TyDecl -> Contextual TyName
> fresh d = do   (beta, _Gamma) <- get
>                put (succ beta, _Gamma :< TY (beta := d))
>                return beta

> getContext :: Contextual Context
> getContext = gets snd
>
> putContext :: Context -> Contextual ()
> putContext _Gamma = do  beta <- gets fst
>                         put (beta, _Gamma)
>
> modifyContext :: (Context -> Context) -> Contextual ()
> modifyContext f = getContext >>= putContext . f

> type Suffix      = Fwd TyEntry

> (<><) :: Context -> Suffix -> Context
> _Gamma <>< F0                   = _Gamma
> _Gamma <>< (alpha := d :> _Xi)  = _Gamma :< TY (alpha := d) <>< _Xi

%if False

> infixl 8 <><

%endif

> onTop ::  (TyEntry -> Contextual (Maybe Suffix)) 
>             -> Contextual ()
> onTop f = do
>     _Gamma :< vD <- getContext
>     putContext _Gamma
>     case vD of
>         TY alphaD    -> do  m <- f alphaD
>                             case m of
>                                 Just _Xi  -> modifyContext (<>< _Xi)
>                                 Nothing   -> modifyContext (:< vD)
>         _            -> onTop f >> modifyContext (:< vD)

> restore :: Contextual (Maybe Suffix)
> restore = return Nothing

> replace :: Suffix -> Contextual (Maybe Suffix)
> replace = return . Just

> unify :: Type -> Type -> Contextual ()
> unify (V alpha) (V beta) = onTop $
>   \ (gamma := d) -> case
>           (gamma == alpha,  gamma == beta,  d         ) of
>           (True,            True,           _         )  ->  restore                                 
>           (True,            False,          Hole      )  ->  replace (alpha := Some (V beta) :> F0)  
>           (False,           True,           Hole      )  ->  replace (beta := Some (V alpha) :> F0)  
>           (True,            False,          Some tau  )  ->  unify (V beta)   tau       >> restore   
>           (False,           True,           Some tau  )  ->  unify (V alpha)  tau       >> restore   
>           (False,           False,          _         )  ->  unify (V alpha)  (V beta)  >> restore   
> unify (V alpha)        tau                               =   solve alpha F0 tau
> unify tau              (V alpha)                         =   solve alpha F0 tau    
> unify (tau0 :-> tau1)  (upsilon0 :-> upsilon1)           =   unify tau0 upsilon0 >> unify tau1 upsilon1

> solve :: TyName -> Suffix -> Type -> Contextual ()
> solve alpha _Xi tau = onTop $
>   \ (gamma := d) -> 
>     let occurs = gamma <? tau || gamma <? _Xi in case
>     (gamma == alpha,  occurs,  d             ) of
>     (True,            True,    _             )  ->  fail "Occur check failed"
>     (True,            False,   Hole          )  ->  replace (_Xi <+> (alpha := Some tau :> F0))
>     (True,            False,   Some upsilon  )  ->  modifyContext (<>< _Xi)
>                                                 >>  unify upsilon tau
>                                                 >>  restore
>     (False,           True,    _             )  ->  solve alpha (gamma := d :> _Xi) tau
>                                                 >>  replace F0   
>     (False,           False,   _             )  ->  solve alpha _Xi tau
>                                                 >>  restore



\section{Modelling contexts and statements}

Having seen an implementation of unification, let us try to understand it.
Let $\K$ be a set of \define{sorts}, and for each $K \in \K$ let $\V_K$ be a
set of variables and $\D_K$ a set of \define{properties}.
(We frequently index by $\K$ and omit the subscript if it is obvious from the
context.)
We have already seen the sort $\TY$, where
$\V_\TY$ is some set of type variables and $\D_\TY$ contains
the \scare{unknown variable} property $~\hole{}$ and \scare{defined variable}
properties $~\defn{\tau}$ for each type $\tau$.

A \define{context} is a list of \define{declarations} $\decl{x}{D}$, with
$x \in \V_K$ and $D \in \D_K$.
The empty context is written $\emptycontext$. 
We let $\Gamma, \Delta, \Theta$ range over contexts.
We write $\V_K(\Gamma)$ for the set of variables of $\Gamma$ with sort $K$.

We will build a set $\Ss$ of \define{statements}, assertions which can be judged
in contexts. For now, the grammar of statements will be
$$S ::=~ \valid
    ~||~ \tau \type
    ~||~ \tau \equiv \upsilon
    ~||~ S \wedge S
    ~||~ \cdots$$
meaning, respectively, that the context is valid, $\tau$ is a type, the types
$\tau$ and $\upsilon$ are equivalent, and both conjuncts hold. \TODO{Tabulate?}

A statement has zero or more
\define{parameters}, each of which has an associated \define{sanity condition}, 
a statement that must hold for the original statement to make
sense. We have already seen the type equivalence statement
$\tau \equiv \upsilon$: the sanity
condition for $\tau$ is $\tau \type$ and for $\upsilon$ it is $\upsilon \type$.
Sanity conditions capture what must be true of the context in order to be able
to ask the question ``does this statement hold?''

Each declaration in the context causes some statement to hold. For each
$K \in \K$, we maintain a map $\sem{\cdot}_K : \V_K \times \D_K \rightarrow \Ss$
from declarations to statements.
The idea is that $\sem{\decl{x}{D}}$ is the statement that holds by virtue of the
declaration $\decl{x}{D}$ in the context. For type variables, we define
\begin{align*}
\sem{\hole{\alpha}} &= \alpha \type \\
\sem{\alpha \defn \tau} &= \alpha \type \wedge \alpha \equiv \tau
\end{align*}

We can inspect the context in derivations using the inference rule
$$\name{Lookup}
  \Rule{\decl{x}{D} \in \Gamma}
       {\Gamma \entailsN \sem{\decl{x}{D}}}.$$
Note the unusual turnstile symbol in the conclusion of this rule.
We write the \define{normal judgment} $\Gamma \entails S$
to mean that the declarations in $\Gamma$ support the statement $S \in
\Ss$.  We write the \define{neutral judgment} $\Gamma \entailsN S$ to
mean that $S$ follows directly from applying a fact in $\Gamma$.
Neutral judgments capture exactly the legitimate appeals to assumptions
in the context, just as \scare{neutral terms} in $\lambda$-calculus are
applied variables. We embed neutral into normal: 
$$\name{Neutral}
  \Rule{\entailsN S}
       {\entails S}.$$
As the context is constant throughout, it is omitted here and elsewhere.

\subsection{Validity of contexts}

It is not enough for contexts to be lists of declarations: they must
be well-founded, that is, each declaration should make sense in
\emph{its} context.  A context is valid if it declares each variable
at most once, and each property is meaningful in the
preceding context.

We maintain a map $\ok_K : \D_K \rightarrow \Ss$ for every $K \in \K$, which 
embeds properties in statements. For type properties:
\begin{align*}
\ok_\TY (\hole{}) &= \valid \\
\ok_\TY (\defn{\tau}) &= \tau \type
\end{align*}
Now we can define the context validity statement
$\valid$ as shown in Figure~\ref{fig:contextValidityRules}.
From now on we will implicitly assume that all contexts we work with are valid,
and will ensure that we only construct valid contexts. Mostly we will ignore the
issue of fresh names, since a simple counter suffices for our purposes.

\begin{figure}[ht]
\boxrule{\Gamma \entails \valid}
$$
\Axiom{\emptycontext \entails \valid}
\qquad
\Rule{\Gamma \entails \valid    \quad    \Gamma \entails \ok_K D}
     {\Gamma, \decl{x}{D} \entails \valid}
\side{x \in \V_K \setminus \V_K(\Gamma)}
$$
\caption{Rules for context validity}
\label{fig:contextValidityRules}
\end{figure}

\TODO{Example of a context validity derivation?}


\subsection{Rules for types and conjunctions}

We deduce that variables are types by looking up the context, but we need
a structural rule for the $\arrow$ type constructor:
$$
\Rule{\tau \type   \quad   \upsilon \type}
     {\tau \arrow \upsilon \type}.
$$

The conjunction of statements $S \wedge S'$ allows us to package multiple facts
about a single variable, with a normal introduction rule (pairing) and neutral
elimination rules (projections):
$$\Rule{S \quad S'} {S \wedge S'}
  \qquad
  \Rule{\entailsN S \wedge S'}
       {\entailsN S}
  \qquad
  \Rule{\entailsN S \wedge S'}
       {\entailsN S'}
$$
This is but one instance of a general pattern: we add normal introduction
forms for composite statements, but supply
eliminators only for composite \emph{hypotheses}, in effect forcing
derivations to be cut-free. This facilitates reasoning by induction on
derivations. We shall ensure that the corresponding elimination rules
for \emph{normal} judgments are in any case admissible. This is clearly the
case for conjunction.


\section{Information and stable statements}

\subsection{Information order}

Intuitively, defining a variable cannot make equations cease to hold.
More generally, if we rely on the context to tell us what we may
deduce about variables, then making contexts more informative must preserve
deductions. 

Let $\Gamma$ and $\Delta$ be contexts.
A \define{substitution from $\Gamma$ to $\Delta$} is a map from
$\tyvars{\Gamma}$ to $\{ \tau ~||~ \Delta \entails \tau \type \}$.
Substitutions apply to types and statements in the obvious way.
Composition of substitutions is given by
$(\theta \compose \delta) (\alpha) = \theta (\delta \alpha)$.
We write $\subst{\tau}{\alpha}{}$ for the substitution that maps
$\alpha$ to $\tau$ and other variables to themselves.

Given a substitution $\delta$ from $\Gamma$ to $\Delta$, 
we write the \define{information increase} $\delta : \Gamma \lei \Delta$ and say 
\define{$\Delta$ is more informative than $\Gamma$} if 
for all $\decl{x}{D} \in \Gamma$, we have 
$\Delta \entails \delta \sem{\decl{x}{D}}$. 
We may omit $\delta$ and write $\Gamma \lei \Delta$ if we are only interested
in the existence of a suitable substitution. This relation between contexts
ensures that $\Delta$ supports all the statements corresponding to declarations
in $\Gamma$. 

We write $\delta \eqsubst \theta : \Gamma \lei \Delta$ if
$\delta : \Gamma \lei \Delta$, $\theta : \Gamma \lei \Delta$
and for all $\alpha \in \tyvars{\Gamma}$,
$\Delta \entails \delta\alpha \equiv \theta\alpha$.
We will sometimes just write $\delta \equiv \theta$ if the contexts involved
are obvious.
It is straightforward to verify that $\eqsubst$ is an equivalence relation
for fixed contexts $\Gamma$ and $\Delta$, and that if
$\delta \eqsubst \theta$ then
$\Delta \entails \delta\tau \equiv \theta\tau$ for any $\Gamma$-type $\tau$.

This partial order on contexts is not yet sufficient, because it places no 
constraints on the order of context entries beyond the dependency order of
variables in declarations. We show later how to extend $\lei$ to capture the
order of entries more precisely. 



\subsection{Stability}

We say a statement $S$ is \define{stable} if it is preserved under information
increase, that is, if
$$\Gamma \entails S  \quad \mathrm{and}  \quad  \delta : \Gamma \lei \Delta
    \quad \Rightarrow \quad  \Delta \entails \delta S.$$
This says that we can extend a simultaneous substitution on syntax to a
simultaneous substitution on derivations.
\TODO{Expand on this.}

Since we only consider valid contexts, the statement $\valid$ always holds,
and is invariant under substitution, so it is clearly stable.

We have a standard strategy for proving stability of most statements, which is
effective by construction. In each case we proceed by induction on the structure
of derivations. Where the \textsc{Neutral} rule is applied, stability holds by 
the following lemma. Otherwise, for rules not referring to the context, we verify
that non-recursive hypotheses are stable
and that recursive hypotheses occur in strictly positive positions, so 
are stable by induction. Applying this strategy shows that both 
$\tau \type$ and $\tau \equiv \upsilon$ are stable.

\begin{lemma}[Neutrality]\label{lem:neutrality}
If $\Gamma \entailsN S$ and $\delta : \Gamma \lei \Delta$ then
$\Delta \entails \delta S$.
\end{lemma}
\begin{proof}
By structural induction on derivations. If the proof is by \textsc{Lookup}, then
the result holds by definition of information increase. Otherwise, the proof is
by a neutral elimination rule, so the result follows by induction and
admissibility of the corresponding normal elimination rule.
\end{proof}

\begin{lemma}[Conjunction preserves stability]\label{lem:stab-pres-conj}
If $S$ and $S'$ are stable then $S \wedge S'$ is stable.
\end{lemma}
\begin{proof}
Suppose $\delta : \Gamma \lei \Delta$, the statements $S$ and $S'$ are stable,
and $\Gamma \entails (S \wedge S')$. If the proof is by \textsc{Neutral}
then $\Delta \entails \delta (S \wedge S')$ by Lemma~\ref{lem:neutrality}.
Otherwise $\Gamma \entails S$ and $\Gamma \entails S'$,
so by stability, $\Delta \entails \delta S$ and $\Delta \entails \delta S'$, 
and hence $\Delta \entails \delta (S \wedge S')$.
\end{proof}

\begin{lemma}\label{lei:preorder}
If $\sem{\decl{x}{D}}$ is stable for every declaration $\decl{x}{D}$, then
the $\lei$ relation is a preorder, with reflexivity demonstrated by
the identity substitution
$\iota : \Gamma \lei \Gamma : v \mapsto v$, and transitivity by composition:
$$\delta : \Gamma \lei \Delta  ~~\text{and}~~  \theta : \Delta \lei \Theta
  \quad \Rightarrow \quad  \theta \compose \delta : \Gamma \lei \Theta.$$
\end{lemma}

\begin{proof}
Reflexivity follows immediately by applying the \textsc{Lookup} and
\textsc{Neutral} rules.
For transitivity, suppose $\decl{x}{D} \in \Gamma$,
then $\Delta \entails \delta \sem{\decl{x}{D}}$ since
$\delta : \Gamma \lei \Delta$.
Now by stability applied to $\delta \sem{\decl{x}{D}}$ using $\theta$, we have
$\Theta \entails \theta\delta \sem{\decl{x}{D}}$ as required.
\end{proof}


\begin{lemma}
\label{lem:composePreservesEquivSubst}
If $\delta_0 \eqsubst \delta_1 : \Gamma \lei \Delta$
and $\theta_0 \eqsubst \theta_1 : \Delta \lei \Theta$
then $\theta_0 \compose \delta_0  \eqsubst  \theta_1 \compose \delta_1 :
         \Gamma \lei \Theta$.
\end{lemma}

\begin{proof}
Fix $\alpha \in \tyvars{\Gamma}$. By definition of $\eqsubst$,
$\Delta \entails \delta_0\alpha \equiv \delta_1\alpha$,
so by stability,
$\Theta \entails \theta_0\delta_0\alpha \equiv \theta_0\delta_1\alpha$.
Moreover
$\Theta \entails \theta_0\delta_1\alpha \equiv \theta_1\delta_1\alpha$,
and hence
$\Theta \entails \theta_0\delta_0\alpha \equiv \theta_1\delta_1\alpha$
by transitivity.
\end{proof}


\section{Problems}

\subsection{What is a problem?}

A \define{problem} is a pair of a context $\Gamma$ and a statement $S$, where
the sanity conditions of the parameters of $S$ hold in $\Gamma$, but $S$ itself
does not. We wish to find a \define{solution} (more informative context)
$\Delta$ such that
$\iota : \Gamma \lei \Delta$ and $\Delta \entails S$. Thus unification is given
$\Gamma$, $\tau$ and $\upsilon$ such that
$\Gamma \entails \tau \type \wedge \upsilon \type$, and
must find $\Delta$ such that $\Delta \entails \tau \equiv \upsilon$.

We are interested in finding algorithms to solve problems, preferably in as
general a way as possible (that is, by making the smallest information increase
necessary to find a solution). This corresponds to finding a most general
unifier. The solution $\Delta$ is \define{minimal} if for any
$\theta: \Gamma \lei \Theta$ such that $\Theta \entails \theta S$, there exists a
substitution $\zeta : \Delta \lei \Theta$ such that
$\theta \eqsubst \zeta \compose \iota$.
\TODO{Is this enough?}
We write $\Jmin{\Gamma}{P}{\Delta}$ to mean that $(\Gamma, P)$ is a
problem with minimal solution $\Delta$. \TODO{Better notation for this?}

We can now state the following \scare{greedy} approach to finding minimal
solutions to such composite problems: find a minimal solution of problem $P$,
then extend it to (minimally) solve $Q$:
\begin{lemma}[The Optimist's lemma]
\label{lem:optimist}
The following inference rule is admissible:
$$\Rule{\Jmin{\Gamma}{P}{\Delta}
       \quad  \Jmin{\Delta}{Q}{\Theta}}
       {\Jmin{\Gamma}{P \wedge Q}{\Theta}}.$$
\end{lemma}

\begin{proof} \TODO{Update this!}
We have that $\theta \compose \delta : \Gamma \lei \Theta$ by 
Lemma~\ref{lei:preorder}. 

To show $\Theta \entails \Prob{P \wedge Q}{a, b}{\theta r, s}$, it
suffices to show $\Theta \entails \Prob{P}{a}{\theta r}$ and
$\Theta \entails \Prob{Q}{b}{s}$. The latter holds by assumption. For the
former, note that $\Delta \entails \Prob{P}{a}{r}$ and hence
$\Theta \entails \theta (\Prob{P}{a}{r})$ by stability of $\Prob{P}{a}{r}$.
But $\theta (\Prob{P}{a}{r}) = \Prob{P}{a}{\theta r}$ by definition. 

Finally, suppose there is some $\phi : \Gamma \lei \Phi$ 
and outputs $t, u$ such that
$\Phi \entails \Prob{P \wedge Q}{a, b}{t, u}$, so
$\Phi \entails \Prob{P}{a}{t}$ and
$\Phi \entails \Prob{Q}{b}{u}$.
Since $\delta : \Jmin{\Gamma}{\Prob{P}{a}{r}}{\Delta}$, there exists
$\zeta_1 : \Delta \lei \Phi$ such that
$\phi \eqsubst \zeta_1 \compose \delta$
and $\Phi \entails \R{P}{\zeta_1 r}{t}$.
But then $\theta : \Jmin{\Delta}{\Prob{Q}{b}{s}}{\Theta}$, so there exists
$\zeta_2 : \Theta \lei \Phi$ such that
$\zeta_1 \eqsubst \zeta_2 \compose \theta$
and $\Phi \entails \R{Q}{\zeta_2 s}{u}$.
Hence $\phi \eqsubst \zeta_2 \compose (\theta \compose \delta)$
and $\Phi \entails \R{P \wedge Q}{\zeta_2 (\theta r), \zeta_2 s}{t, u}$.
\end{proof}

This sequential approach to problem solving is not the only decomposition
justified by stability. \citeauthor{mcadam_unification_1998}'s account of
unification \citeyearpar{mcadam_unification_1998} amounts to a concurrent,
transactional decomposition of problems. The same context is extended via
multiple different substitutions, which are then unified to produce a single
substitution.



\section{The unification algorithm, formally}

Now we can see why the algorithm works. The structural rule means that
whenever we have rigid $\arrow$ symbols on each side, we decompose the problem
into two subproblems, and thanks to the Optimist's Lemma we can solve these
sequentially. Otherwise, we either have variables on both sides, or a variable
on one side and a type on the other. In each case, we look at the next type
variable in the context to see what information it gives us, and either solve
the problem or update our constraint and continue processing the context.
When solving a variable with a type, we need to accumulate
the type's dependencies as we encounter them, performing the occur check to
ensure a solution exists.

It is possible that a context entry may have no bearing on the unification
problem being solved, and hence can be ignored.
We define the orthogonality relation $\decl{x}{D} \perp X$ (the set of type
variables $X$ does not depend on the declaration $\decl{x}{D}$) 
to capture this idea: 
\begin{align*}
\alpha D \perp X
    &\mathrm{~if~} \alpha \in \V_\TY \setminus X  \\
\decl{x}{D} \perp X
    &\mathrm{~if~} x \in \V_K, D \in \D_K \mathrm{~for~} K \neq \TY
\end{align*}

The rules in Figure~\ref{fig:unifyRules} define our unification algorithm. The
assertion $\Junify{\Gamma}{\tau}{\upsilon}{\Delta}$ means that 
unification of $\tau$ with $\upsilon$ 
succeeds, producing output context $\Delta$, 
given inputs
$\Gamma$, $\tau$ and $\upsilon$ satisfying 
$\Gamma \entails \tau \type \wedge \upsilon \type$. 

The assertion
$\Jinstantiate{\Gamma}{\alpha}{\tau}{\Xi}{\Delta}$
means that 
solving $\alpha$ with $\tau$ succeeds,  
yielding output $\Delta$,
given inputs $\Gamma$, $\Xi$, $\alpha$ and $\tau$
satisfying 
\begin{itemize}
\item $\alpha \in \tyvars{\Gamma}$,
\item $\Gamma, \Xi \entails \tau \type$,
\item $\tau$ is not a variable,
\item $\Xi$ contains only type variable declarations and
\item $\beta \in \tyvars{\Xi} \Rightarrow \beta \in \FTV{\tau, \Xi}$.
\end{itemize}

\TODO{Need different notation for algorithm and problem solution}

The rules \textsc{Define}, \textsc{Expand} and \textsc{Ignore} have
symmetric counterparts, identical apart from interchanging the equated
terms in the conclusion. Usually we will ignore these without loss of generality.

\begin{figure}[ht]
\boxrule{\Junify{\Gamma}{\tau}{\upsilon}{\Delta}}

$$
\name{Idle}
% \Rule{\Gamma \entails \alpha \type}
\Axiom{\Junify{\Gamma_0, \alpha D}{\alpha}{\alpha}{\Gamma_0, \alpha D}}
$$

$$
\name{Define}
%\Rule{\Gamma_0 \entails \beta \type}
\Axiom{\Junify{\Gamma_0, \hole{\alpha}}{\alpha}{\beta}{\Gamma_0, \alpha \defn \beta}}
\side{\alpha \neq \beta}
$$

$$
\name{Expand}
\Rule{\Junify{\Gamma_0}{\tau}{\beta}{\Delta_0}}
     {\Junify{\Gamma_0, \alpha \defn \tau}{\alpha}{\beta}{\Delta_0, \alpha \defn \tau}}
\side{\alpha \neq \beta}
$$

$$
\name{Ignore}
\Rule{\Junify{\Gamma_0}{\alpha}{\beta}{\Delta_0}}
     {\Junify{\Gamma_0, \decl{x}{D}}{\alpha}{\beta}{\Delta_0, \decl{x}{D}}}
\side{\decl{x}{D} \perp \{\alpha, \beta\} }
$$

$$
\name{Solve}
\Rule{\Jinstantiate{\Gamma}{\alpha}{\tau}{\emptycontext}{\Delta}}
     {\Junify{\Gamma}{\alpha}{\tau}{\Delta}}
%% \side{\tau \neq \alpha}
\side{\tau \mathrm{~not~variable}}
$$

$$
\name{Decompose}
\Rule{\Junify{\Gamma}{\tau_0}{\upsilon_0}{\Delta_0}
      \quad
      \Junify{\Delta_0}{\tau_1}{\upsilon_1}{\Delta}}
    {\Junify{\Gamma}{\tau_0 \arrow \tau_1}{\upsilon_0 \arrow \upsilon_1}{\Delta}}
$$

\bigskip

\boxrule{\Jinstantiate{\Gamma}{\alpha}{\tau}{\Xi}{\Delta}}

$$
\name{DefineS}
% \Rule{\Gamma_0, \Xi \entails \tau \type}
\Axiom{\Jinstantiate{\Gamma_0, \hole{\alpha}}{\alpha}{\tau}{\Xi}
                   {\Gamma_0, \Xi, \alpha \defn \tau}}
\side{\alpha \notin \FTV{\tau, \Xi}}
$$

$$
\name{ExpandS}
\Rule{\Junify{\Gamma_0, \Xi}{\upsilon}{\tau}{\Delta_0}}
     {\Jinstantiate{\Gamma_0, \alpha \defn \upsilon}{\alpha}{\tau}{\Xi}
                   {\Delta_0, \alpha \defn \upsilon}}
\side{\alpha \notin \FTV{\tau, \Xi}}
$$

$$
\name{DependS}
\Rule{\Jinstantiate{\Gamma_0}{\alpha}{\tau}{\beta D, \Xi}{\Delta}}
     {\Jinstantiate{\Gamma_0, \beta D}{\alpha}{\tau}{\Xi}{\Delta}}
\side{\alpha \neq \beta, \beta \in \FTV{\tau, \Xi}}
$$

$$
\name{IgnoreS}
\Rule{\Jinstantiate{\Gamma_0}{\alpha}{\tau}{\Xi}{\Delta_0}}
     {\Jinstantiate{\Gamma_0, \decl{x}{D}}{\alpha}{\tau}{\Xi}{\Delta_0, \decl{x}{D}}}
\side{\decl{x}{D} \perp \FTV{\alpha, \tau, \Xi}}
$$

\caption{Algorithmic rules for unification}
\label{fig:unifyRules}
\end{figure}

Observe that we have no rule in the situation where 
$$\Jinstantiate{\Gamma_0, \alpha D}{\alpha}{\tau}{\Xi}{\Delta}
\mathrm{~with~} \alpha \in \FTV{\tau, \Xi}$$
so the algorithm fails in this case. 
This is an occur check failure: $\alpha$ and $\tau$ cannot unify 
if $\alpha$ occurs in
$\tau$ or in an entry that $\tau$ depends on, and $\tau$ is not a variable.
Given the single type constructor symbol (the function arrow $\arrow$),
there are no failures due to rigid-rigid mismatch. 
To add these would not significantly complicate matters.

By exposing the contextual structure underlying unification we make
termination of the algorithm evident. Each recursive appeal to
unification (directly or via the solving process) either shortens the
context or preserves the context and decomposes
types~\citep{mcbride:unification}. We are correspondingly entitled to
reason about the total correctness of unification by induction on the
algorithmic rules.



\subsection{Soundness and completeness}

\begin{lemma}[Soundness of unification]
\label{lem:unifySound}
\begin{enumerate}[(a)]
\item If $\Junify{\Gamma}{\tau}{\upsilon}{\Delta}$, then
$\tyvars{\Gamma} = \tyvars{\Delta}$,
% and we have $\iota : \Jmin{\Gamma}{\Puni{\tau}{\upsilon}}{\Delta}$,
$\Delta \entails \tau \equiv \upsilon$ and
$\iota : \Gamma \lei \Delta$
where $\iota$
% $$\iota: \tyvars{\Gamma} \rightarrow \types{\Delta} : \alpha \mapsto \alpha$$
is the identity substitution.

\item If
$\Jinstantiate{\Gamma}{\alpha}{\tau}{\Xi}{\Delta}$, then
$\tyvars{\Gamma, \Xi} = \tyvars{\Delta}$,
$\Delta \entails \alpha \equiv \tau$ and
$\iota : \Gamma, \Xi \lei \Delta$.
% $\iota : \Jmin{\Gamma, \Xi}{\Puni{\alpha}{\tau}}{\Delta}$.
\end{enumerate}
\end{lemma}

\begin{proof}
By induction on the structure of derivations.
\end{proof}


\begin{lemma}[Occur check]
\label{lem:occurCheck}
Let $\alpha$ be a variable and $\tau$ a non-variable type such that
$\alpha \in \FTV{\tau}$. For every context $\Gamma$ and substitution
$\theta$, $\Gamma \nvdash \theta\alpha \equiv \theta\tau$ and
$\Gamma \nvdash \theta\tau \equiv \theta\alpha$.
\end{lemma}

\begin{proof}
It suffices to prove $\Gamma \nvdash \alpha \equiv \tau$ and
$\Gamma \nvdash \tau \equiv \alpha$, because
$\theta\alpha$ must contain a variable $\beta \in \FTV{\theta\tau}$ 
and $\theta\tau$ is not a variable.

Since $\alpha$ is a variable but $\tau$ is not, neither reflexivity nor the
structural rule apply. Symmetry and transitivity do not apply because their
hypotheses cannot be satisfied.

By the well-formedness conditions for contexts, if
$\alpha \defn \upsilon \in \Gamma$ then $\alpha \notin \FTV{\upsilon}$, so
the \textsc{Lookup} rule does not apply.
\end{proof}


\begin{lemma}[Completeness and generality of unification]
\label{lem:unifyComplete}
\begin{enumerate}[(a)]
\item If $\theta : \Gamma \lei \Theta$,
$\Gamma \entails \upsilon \type \wedge \tau \type$ and
$\Theta \entails \theta\upsilon \equiv \theta\tau$, then
there is some context $\Delta$ such that
$\Jmin{\Gamma}{\Puni{\upsilon}{\tau}}{\Delta}$.

% with
% $\theta : \Delta \lei \Theta$. That is, if a unifier for $\tau$ and $\upsilon$
% exists, then the algorithm succeeds and delivers a most general unifier.

\item Moreover, if $\theta : \Gamma, \Xi \lei \Theta$ is such that
$\Theta \entails \theta\alpha \equiv \theta\tau$ and
\begin{itemize}
\item $\alpha \in \tyvars{\Gamma}$,
\item $\Gamma, \Xi \entails \tau \type$,
\item $\tau$ is not a variable,
\item $\Xi$ contains only type variable declarations and
\item $\beta \in \tyvars{\Xi}  \Rightarrow  \beta \in \FTV{\tau, \Xi}$,
\end{itemize}
then there is some context $\Delta$ such that
$\JinstantiateMin{\Gamma}{\alpha}{\tau}{\Xi}{\Delta}$.
\end{enumerate}
\end{lemma}

\begin{proof}[Sketch] Each step preserves all solutions. The
Optimist's Lemma justifies problem decomposition. The algorithm
terminates, and the only case not covered by the rules is the case
where the occur check fails, indicating no unifier exists.  For
details, see Appendix.  \end{proof}



\section{What?}

\subsection{Binding statements}

If $S$ is a statement and $\decl{x}{D}$ is a declaration, then we define the
binding statement $\Sbind{\decl{x}{D}}{S}$ with the introduction rule
$$
\Rule{\Gamma \entails \ok_K D    \quad    \Gamma, \decl{x}{D} \entails S}
     {\Gamma \entails \Sbind{\decl{x}{D}}{S}}
\side{v \in \V_K \setminus \V_K(\Gamma)}.
$$
and neutral elimination rule
$$
\Rule{\entailsN \Sbind{\alpha D}{S}
      \quad
      \entails \subst{\tau}{\alpha}{\sem{\decl{\alpha}{D}}}}
     {\entailsN \subst{\tau}{\alpha}{S}}
\side{D \in \D_\TY}
.$$
The corresponding normal rule is admissible: if
$\Gamma \entails \Sbind{\decl{\alpha}{D}}{S}$ by the introduction rule, then
$\Gamma, \decl{\alpha}{D} \entails S$.
But $\Gamma \entails \subst{\tau}{\alpha}{\sem{\decl{\alpha}{D}}}$
implies $\subst{\tau}{\alpha} : \Gamma, \alpha D \lei \Gamma$
and hence $\Gamma \entails \subst{\tau}{\alpha} S$ by stability.
As a consequence, Lemma~\ref{lem:neutrality} still holds.

\begin{lemma}[Binding preserves stability]\label{lem:stab-pres-bind}
If $\decl{x}{D}$ is a declaration and both $\ok_K D$ and $S$ are stable, then
$\Sbind{\decl{x}{D}}{S}$ is stable.
\end{lemma}
\begin{proof}
Suppose $\delta : \Gamma \lei \Delta$, the statement $S$ is stable and
$\Gamma \entails \Sbind{\decl{x}{D}}{S}$.  If the proof is by \textsc{Neutral}
then the result follows by Lemma~\ref{lem:neutrality}.
Otherwise, $\Gamma \entails \ok_K D$ and
$\Gamma, \decl{x}{D} \entails S$, so by stability, $\Delta \entails \delta (\ok_K D)$.
% Let $\delta' = \subst{x}{x}{\delta}$, then
Now $\delta : \Gamma, \decl{x}{D} \lei \Delta, \decl{x}{(\delta D)}$
so by stability of $S$ we have $\Delta, \decl{x}{(\delta D)} \entails \delta S$.
Hence $\Delta \entails \Sbind{\decl{x}{(\delta D)}}{\delta S}$
and so $\Delta \entails \delta \Sbind{\decl{x}{D}}{S}$.
\TODO{We should at least mention freshness here.}
\end{proof}

\subsection{Type schemes}

To handle polymorphism, term variable properties must
be type schemes rather than monomorphic types.

A \define{type scheme} $\sigma$ is a type wrapped in one or more $\forall$
quantifiers or let bindings, with the syntax
$$\sigma ::= .\tau ~||~ \forall\alpha~\sigma ~||~ \letS{\alpha}{\tau}{\sigma}.$$
We use explicit definitions in type schemes to avoid the need for substitution
in the type inference algorithm. 

We define a new statement $\sigma \scheme$
by the rules in Figure~\ref{fig:schemeValidityRules}.
The sanity condition on $\sigma$ is just $\valid$.

\begin{figure}[ht]
\boxrule{\Gamma \entails \sigma \scheme}

$$
\Rule{\tau \type}
     {.\tau \scheme}
\qquad
\Rule{\Sbind{\hole{\alpha}}{\sigma \scheme}}
     {\forall\alpha~\sigma \scheme}
$$

$$
\Rule{\upsilon \type   \quad  \Sbind{\alpha \defn \upsilon}{\sigma \scheme}}
     {\letS{\alpha}{\upsilon}{\sigma} \scheme}
$$

\caption{Rules for scheme validity}
\label{fig:schemeValidityRules}
\end{figure}


The structure of these rules strongly suggests that schemes arise by discharging
a list of type variable declarations over a type. In fact, any scheme can be
viewed in this way. We write $\gen{\Xi}{\sigma}$ for the generalisation of
the type scheme $\sigma$ over the prefix of type variable declarations $\Xi$,
defined by
\begin{align*}
\emptycontext         &\genarrow \sigma = \sigma  \\
\Xi, \hole{\alpha}    &\genarrow \sigma = \Xi \genarrow \forall\alpha~\sigma  \\
\Xi, \alpha \defn \nu &\genarrow \sigma = \Xi \genarrow \letS{\alpha}{\nu}{\sigma}
\end{align*}
We will usually be interested in the case $\sigma = .\tau$ for some type $\tau$.

When we infer the specialised type of a variable, we rely on the
ability to invert this operation, extending the contex with a
\emph{fresh} copy of a scheme's prefix. As shown above, we follow
\citet{NaraschewskiN-JAR} in achieving freshness with a simple
counter, built into the |Contextual| monad.

\begin{lemma}
\label{lem:specialise}
If $\Gamma \entails \sigma \scheme$ then $\sigma = \Xi\genarrow.\tau$
for some $\Xi$ and $\tau$ such that $\Gamma,\Xi\entails \tau \type$
\end{lemma}
\begin{proof}
By induction on the structure of $\sigma$, given that it is possible to choose
fresh variable names.
\end{proof}

\TODO{Can we replace $\sigma \scheme$ with $\Sbind{\Xi}{\tau \type}$?}


\section{Applying these ideas to type inference}

Having implemented unification and defined type schemes, we now turn to the
problem of type inference for terms. We will reuse the framework already
introduced, defining a new sort $\TM$.
Let $\V_\TM$ be some set of term variables and let $x$ range over $\V_\TM$.
Term variable declarations $\D_\TM$ are scheme assignments of the form
$\asc \sigma$, with
$\ok_\TM (\asc \sigma) = \sigma \scheme$.

Let $\Term$ be the set of terms, with syntax 
$$t ::= x ~||~ t~t ~||~ \lambda x . t ~||~ \letIn{x}{t}{t}.$$

We define the type assignability statement $t : \tau$ by the declarative 
rules in Figure~\ref{fig:typeAssignmentRules}. This has two parameters,
with sanity conditions $\valid$ and $\tau \type$ respectively.

We can then define scheme assignability $t \hasscheme \sigma$ as a map from
terms $t$ and schemes $\sigma$ to statements:
\begin{align*}
t \hasscheme .\tau   &\mapsto    t : \tau  \\
t \hasscheme \forall \alpha \sigma  &\mapsto 
    \Sbind{\hole{\alpha}}{t \hasscheme \sigma}   \\
t \hasscheme \letS{\alpha}{\tau}{\sigma}  &\mapsto
    \Sbind{\alpha \defn \tau}{t \hasscheme \sigma}
\end{align*}
Let $\sem{x \asc \sigma}_\TM = x \hasscheme \sigma$.

\begin{figure}[ht]
\boxrule{\Gamma \entails t : \tau}

$$
\Rule{\Sbind{x \asc .\upsilon}{t : \tau}}
     {\lambda x.t : \upsilon \arrow \tau}
\qquad
\Rule{f : \upsilon \arrow \tau
      \quad
      a : \upsilon}
     {f a : \tau}
$$

%      \forall \upsilon . (\Gamma \entails \sigma \succ \upsilon
%              \Rightarrow \Gamma \entails s : \upsilon)

$$
\Rule{
      s \hasscheme \sigma
      \quad
      \Sbind{x \asc \sigma}{w : \tau}
     }
     {\letIn{x}{s}{w} : \tau}
\qquad
\Rule{t : \tau
      \quad
      \tau \equiv \upsilon}
     {t : \upsilon}
$$

\caption{Declarative rules for type assignment}
\label{fig:typeAssignmentRules}
\end{figure}


\subsection{Problems with outputs}

Type inference involves making the statement $t : \tau$ hold. However,
a crucial difference from the unification problem is that the type should
be an \emph{output} of problem-solving, along with the solution context. We need
a more liberal definition of problems. We associate a \define{mode}
with each parameter, either \scare{input} or \scare{output}. A \define{problem}
is then a pair $(\Gamma, S)$ where $\Gamma$ is a context and $S$ is a statement
whose input parameters are specified and satisfy their sanity conditions.

A \define{solution} consists of an information increase
$\delta : \Gamma \lei \Delta$ and values for the output parameters $\vec{p}$ 
such that $\delta S$ and the sanity conditions for the output parameters hold
in $\Delta$.
This solution is \define{minimal} if, for every other solution
$(\theta : \Gamma \lei \Theta, \vec{q})$ there is a substitution
$\zeta : \Delta \lei \Theta$ such that $\theta \eqsubst \zeta \compose \delta$
and $\Theta \entails \zeta\vec{p} \equiv \vec{q}$.
\TODO{Define equivalence for vectors of output parameters.}

Thus the type inference problem is given by a context $\Gamma$ and the
statement $t : ~?$ where $t$ is a term and $?$ represents the output parameter.
A solution is then an information increase $\delta : \Gamma \lei \Delta$ and a
type $\tau$ such that $\Delta \entails \tau \type \wedge t : \tau$.

\TODO{Optimist's lemma a la mode}


\subsection{Preserving order in the context}

We have previously observed, but not yet exploited, the importance of
declaration order in the context, and that we move declarations left as
little as possible. Thus rightmost entries are those most local to the problem
we are solving. This will be useful when we come to implement type inference
for the |Let| construct, as we want to generalise over \scare{local} type
variables but not \scare{global} variables.

In order to keep track of locality in the context, we need another kind of
context entry: the $\fatsemi$ separator. We add a new validity rule 
$$
\Rule{\Gamma \entails \valid}
     {\Gamma \fatsemi \entails \valid}.
$$

We also refine the $\lei$ relation.
Let $\semidrop$ be the partial function from contexts and natural numbers to
contexts taking $\Gamma \semidrop n$ to $\Gamma$ truncated after $n$
$\fatsemi$ separators, provided $\Gamma$ contains at least $n$ such: 
\begin{align*}
\Xi \semidrop 0 &= \Xi  \\
\Xi \fatsemi \Gamma \semidrop 0 &= \Xi  \\
\Xi \fatsemi \Gamma \semidrop n+1 &= \Xi \fatsemi (\Gamma \semidrop n)  \\
\Xi \semidrop n+1 &~\mathrm{undefined}
\end{align*}

We write $\delta : \Gamma \lei \Delta$ if $\delta$ is a
substitution from $\Gamma$ to $\Delta$ such that, for all 
$\decl{x}{D} \in \Gamma \semidrop n$, we have that
$\Delta \semidrop n$ is defined and 
$\Delta \semidrop n \entails \delta \sem{\decl{x}{D}}$.

This definition of $\Gamma \lei \Delta$ is stronger than the previous one, 
because it requires the $\fatsemi$-separated sections of $\Gamma$ and $\Delta$ 
to correspond in such a way that 
declarations in the first $n$ sections of
$\Gamma$ can be interpreted over the first $n$ sections of $\Delta$.
However, it is fairly straightforward to verify that the previous results 
hold for the new definition.

Note that if $\delta : \Gamma \fatsemi \Gamma' \lei \Delta \fatsemi \Delta'$,
where $\Gamma$ and $\Delta$ contain the same number of $\fatsemi$ separators,
then $\delta||_{\tyvars{\Gamma}} : \Gamma \lei \Delta$.
\TODO{Is this what we want for the generalist's lemma?}


\subsection{Fixing the unification algorithm}

The only place where changing the $\lei$ relation requires extra work is in the
unification algorithm,
because it acts structurally over the context, so we need to specify what happens
when it finds a $\fatsemi$ separator. 
In fact it suffices to add the following algorithmic rules:
$$
\name{Skip}
\Rule{\Junify{\Gamma_0}{\alpha}{\beta}{\Delta_0}}
     {\Junify{\Gamma_0 \fatsemi}{\alpha}{\beta}{\Delta_0 \fatsemi}}
$$
$$
\name{Repossess}
\Rule{\Jinstantiate{\Gamma_0}{\alpha}{\tau}{\Xi}{\Delta_0}}
     {\Jinstantiate{\Gamma_0 \fatsemi}{\alpha}{\tau}{\Xi}{\Delta_0 \fatsemi}}
$$
Proving correctness of the \textsc{Skip} rule is relatively straightforward,
thanks to the following lemma.

\begin{lemma}
\TODO{Update this.}
If $\delta : \Jmin{\Gamma}{\Prob{P}{a}{b}}{\Delta}$ then
$\delta : \Jmin{\Gamma \fatsemi}{\Prob{P}{a}{b}}{\Delta \fatsemi}$.
\end{lemma}

The \textsc{Repossess} rule is so named because it moves
declarations in $\Xi$ to the left of the $\fatsemi$ separator,
thereby \scare{repossessing} them. Despite such complications, 
unification still yields a most general solution:

\begin{lemma}[Soundness and generality of \textsc{Repossess} rule]
\TODO{Update this.}
If $\Jinstantiate{\Gamma \fatsemi}{\alpha}{\tau}{\Xi}{\Delta \fatsemi}$
then $\tyvars{\Gamma \fatsemi \Xi} = \tyvars{\Delta \fatsemi}$ and
$\iota : \Jmin{\Gamma \fatsemi \Xi}{\Puni{\alpha}{\tau}}{\Delta \fatsemi}$.
\end{lemma}
\begin{proof}
Suppose $\Jinstantiate{\Gamma \fatsemi}{\alpha}{\tau}{\Xi}{\Delta \fatsemi}$,
so $\Jinstantiate{\Gamma}{\alpha}{\tau}{\Xi}{\Delta}$ as only the
\textsc{Repossess} rule applies.
By induction and lemma~\ref{lem:unifySound},
$\tyvars{\Gamma, \Xi} = \tyvars{\Delta}$ and
$\iota : \Jmin{\Gamma, \Xi}{\Puni{\alpha}{\tau}}{\Delta}$.
\TODO{Explain the induction and use of Lemma~\ref{lem:unifyComplete} for minimality.}

For the first part, we have
$$\tyvars{\Gamma \fatsemi \Xi} = \tyvars{\Gamma, \Xi} = \tyvars{\Delta}
    = \tyvars{\Delta \fatsemi}.$$

For the second part, since $\iota : \Gamma, \Xi \lei \Delta$ we have
$\iota : \Gamma \fatsemi \Xi \lei \Delta \fatsemi$,
and $\Delta \entails \alpha \equiv \tau$ so
$\Delta \fatsemi \entails \alpha \equiv \tau$.

For minimality, suppose
$\theta : \Gamma \fatsemi \Xi \lei \Theta \fatsemi \Phi$
and $\Theta \fatsemi \Phi \entails \theta\alpha \equiv \theta\tau$.
Observe that  $\alpha \in \tyvars{\Gamma}$ and
$\beta \in \tyvars{\Xi}  \Rightarrow  \beta \in \FTV{\tau, \Xi}$
by the sanity conditions.
Now $\theta\alpha$ is a $\Theta$-type and $\theta\tau$ is equal to it,
so the only declarations in $\Phi$ that $\theta\tau$ (hereditarily) depends on
must be definitions over $\Theta$. But all the variables declared in $\Xi$ are
used in $\tau$, so there is a substitution
$\psi : \Gamma \fatsemi \Xi \lei \Theta \fatsemi$
that agrees with $\theta$ on $\Gamma$ and maps variables in $\Xi$ to their
definitions in $\Theta$.
Note that $\psi \eqsubst \theta : \Gamma \fatsemi \Xi \lei \Theta \fatsemi \Phi$.

% Now we can filter $\Phi$ to give $\Psi$ consisting only of definitions
% such that $\Theta \fatsemi \Psi \entails \theta\alpha \equiv \theta\tau$.
% Let $\psi = \lfloor \Psi \rfloor \compose \theta$, then
% $\psi : \Gamma \fatsemi \Xi \lei \Theta \fatsemi$
% and $\Theta \fatsemi \entails \psi\alpha \equiv \psi\tau$.

Hence $\psi : \Gamma, \Xi \lei \Theta$ and
$\Theta \entails \psi\alpha \equiv \psi\tau$, so by hypothesis there exists
$\zeta : \Delta \lei \Theta$ such that
$\psi \eqsubst \zeta \compose \iota : \Gamma, \Xi \lei \Theta$.
Then $\zeta : \Delta \fatsemi \lei \Theta \fatsemi \Phi$
and
$\psi \eqsubst \zeta \compose \iota :
    \Gamma \fatsemi \Xi \lei \Theta \fatsemi \Phi$,
so
$\theta \eqsubst \zeta \compose \iota :
    \Gamma \fatsemi \Xi \lei \Theta \fatsemi \Phi$.
\end{proof}




\begin{lemma}[The Generalist's lemma]
\label{lem:generalist}
If $\Jmin{\Gamma \fatsemi \Gamma'}{S}{\Delta \fatsemi \Delta'}$, where
$\forget{\Gamma} = \forget{\Delta}$ and $\forget{\Gamma'} = \forget{\Delta'}$,
then $\Jmin{\Gamma}{\Sbind{\Delta'}{S}}{\Delta}$.
\TODO{Define $\forget{\cdot}$.}
\TODO{It's not quite clear what this means for problem outputs. Is $\Delta'$ an
output? It cannot contain any semicolons.}
\end{lemma}
\begin{proof}
\TODO{Prove this.}
\end{proof}


\subsection{Transforming the rule system for type assignment}

To transform a rule into an algorithmic form, we proceed clockwise starting from
the conclusion. For each hypothesis, we must ensure that the problem is fully
specified, inserting variables to stand for unknown problem inputs. Moreover, we
cannot pattern match on problem outputs, so we ensure there are schematic
variables in output positions, fixing things up with appeals to unification. 

Consider the rule for application:
$$\Rule{\Pinf{f}{\upsilon \arrow \tau}  \quad  \Pinf{a}{\upsilon}}
       {\Pinf{f a}{\tau}}.$$
Since we cannot match on the output of the first subproblem, we use a
metavariable instead and add a unification constraint, giving
$$\Rule{\Pinf{f}{\chi}  \quad \Pinf{a}{\upsilon}
            \quad  \Puni{\chi}{\upsilon \arrow \tau}}
       {\Pinf{f a}{\tau}}.$$
Furthermore, $\tau$ is an input to the unification problem, but it is not
determined by the previous inputs or outputs, so we have to bind a fresh variable
$\beta$ instead to give the algorithmic version
$$\Rule{\Pinf{f}{\chi}
        \quad
        \Pinf{a}{\upsilon}
        \quad
        \Sbind{\beta \defn \tau}{\Puni{\chi}{\upsilon \arrow \beta}}
       }
       {\Sbind{\beta \defn \tau}{\Pinf{f a}{\beta}}}.$$


%if False
assuming $\beta$ is a fresh variable. Now the algorithmic version uses input and
output contexts, with $\beta$ initially unknown:
$$
\Rule{\Jtype{\Gamma_0}{f}{\chi}{\Gamma_1}
         \quad
         \Jtype{\Gamma_1}{a}{\upsilon}{\Gamma_2}
         \quad
         \Junify{\Gamma_2, \hole{\beta}}{\chi}{\upsilon \arrow \beta}{\Gamma_3}}
        {\Jtype{\Gamma_0}{f a}{\beta}{\Gamma_3}}
$$
%endif


The rule for abstraction is
$$\Rule{\Sbind{x \asc .\upsilon}{\Pinf{t}{\tau}}}
       {\Pinf{\lambda x . t}{\upsilon \arrow \tau}}$$
which has unknown input $\upsilon$, so we bind a fresh variable $\beta$
to give
$$\Rule{\Sbind{\beta \defn \upsilon}{\Sbind{x \asc .\beta}{\Pinf{t}{\tau}}}}
       {\Sbind{\beta \defn \upsilon}{\Pinf{\lambda x . t}{\beta \arrow \tau}}}.$$

% and hence
% $$
% \Rule{\Jtype{\Gamma_0, \hole{\beta}, x \asc .\beta}{t}{\tau}
%           {\Gamma_1, x \asc .\beta, \Xi}}
%      {\Jtype{\Gamma_0}{\lambda x.t}{\beta \arrow \tau}{\Gamma_1, \Xi}}
% $$


The let rule is
$$
\Rule{
      s \hasscheme \OutParam{\sigma}
      \quad
      \Sbind{x \asc \sigma}{\Pinf{w}{\tau}}
     }
     {\Pinf{\letIn{x}{s}{w}}{\tau}}.
$$
Writing $\sigma = \gen{\Xi}{.\upsilon}$ and expanding the definition of
$\hasscheme$, we obtain
$$
\Rule{
      \Sbind{\Xi}{\Pinf{s}{\upsilon}}
      \quad
      \Sbind{x \asc \gen{\Xi}{.\upsilon}}{\Pinf{w}{\tau}}
     }
     {\Pinf{\letIn{x}{s}{w}}{\tau}}.
$$
where we let $\Sbind{\emptycontext}{S} = S$ and
$\Sbind{(\Xi, \decl{x}{D})}{S} = \Sbind{\Xi}{\Sbind{\decl{x}{D}}{S}}$.


But how can we find $\Xi$?
This is where 
   we use 
the $\fatsemi$ separator.  
%%%becomes necessary. 
Instead of an
unknown list of type variables, we just add a $\fatsemi$ to the context, 
infer the type of $s$, then generalise its type 
by \scare{skimming off} type
variables from the top of the context until the $\fatsemi$ is reached.


We define the type inference assertion $\Jtype{\Gamma}{t}{\tau}{\Delta}$
% (inferring the type of $t$ in $\Gamma_0$ yields $\tau$ in the more informative
% context $\Gamma_1$)
by the rules in Figure~\ref{fig:inferRules}.
These rules are clearly structural on terms, so yield a terminating
algorithm, leading naturally to an implementation, given in
subsection~\ref{sec:inferImplementation}.

%%%\TODO{Say something about freshness of $\Xi$ in \textsc{Var} rule.}
We use Lemma~\ref{lem:specialise} to ensure in rule \textsc{Var} that
we compute a suffix \(\Xi\) consisting of fresh names, such that the
output \ensuremath{\Gamma, \Xi} is well-formed.

\begin{figure}[ht]
\boxrule{\Jtype{\Gamma}{t}{\tau}{\Delta}}

$$
\name{Var}
\Rule{x \asc \gen{\Xi}{.\upsilon} \in \Gamma}
     {\Jtype{\Gamma}{x}{\upsilon}{\Gamma, \Xi}}
$$

$$
\name{Abs}
\Rule{\Jtype{\Gamma, \hole{\alpha}, x \asc .\alpha}{w}{\upsilon}
          {\Delta_0, x \asc .\alpha, \Xi}}
     {\Jtype{\Gamma}{\lambda x.w}{\alpha \arrow \upsilon}{\Delta_0, \Xi}}
\side{\alpha \notin \tyvars{\Gamma}}
$$

$$
\name{App}
\BigRule{\Jtype{\Gamma}{f}{\chi}{\Delta_0}
         \quad
         \Jtype{\Delta_0}{a}{\upsilon}{\Delta_1}}
        {\Junify{\Delta_1, \hole{\beta}}{\chi}{\upsilon \arrow \beta}{\Delta}}
        {\Jtype{\Gamma}{f a}{\beta}{\Delta}}
\side{\beta \notin \tyvars{\Delta_1}}
$$

$$
\name{Let}
\BigRule{\Jtype{\Gamma \fatsemi}{s}{\upsilon}{\Delta_0 \fatsemi \Xi_0}}
        {\Jtype{\Delta_0, x \asc \gen{\Xi_0}{.\upsilon}}{w}{\chi}
               {\Delta_1, x \asc \gen{\Xi_0}{.\upsilon}, \Xi_1}}
        {\Jtype{\Gamma}{\letIn{x}{s}{w}}{\chi}{\Delta_1, \Xi_1}}
$$

\caption{Algorithmic rules for type inference}
\label{fig:inferRules}
\end{figure}


\subsection{Soundness and completeness}

% We say $\Theta$ is a \define{subcontext} of $\Gamma$, written
% $\Theta \subcontext \Gamma$, if $\Gamma = \Theta; \Gamma'$ for some context
% extension $\Gamma'$.

Recall that we defined $\sem{x \asc \sigma}_\TM = x \hasscheme \sigma$, so
$\Gamma \lei \Delta$ requires $\Delta$ to assign a term variable all the types
that $\Gamma$ assigns it, but allows $x$ to become more polymorphic
and acquire new types.  This notion certainly retains stability:
every variable lookup can be simulated in the more general context.
However, it allows arbitrary generalisation of the schemes assigned to term
variables which are incompatible with the known and intended value of
those variables.

As \citet{wells_principal_typings_2002} points out, Hindley-Milner
type inference is not in this respect compositional. He carefully
distinguishes principal \emph{typings}, given the right to demand more
polymorphism, from Milner's principal \emph{type schemes} and analyses
how the language of types must be extended to express principal
typings.

We, too, note this distinction. We cannot hope to find principal types
with respect to $\lei$, so we capture Milner's compromise by defining
a sub-relation $\leiR$, by $\delta : \Gamma \leiR \Delta$ if $\delta :
\Gamma \lei \Delta$ and $$x \asc \sigma \in \Gamma ~\Rightarrow~ x
\asc \delta\sigma \in \Delta.$$ Thus, if $\Gamma \leiR \Delta$, then
$\Delta$ assigns the \emph{same} type schemes to term variables as $\Gamma$
does (modulo substitution). Since the unification algorithm ignores term
variables, it is easy to see that all the previous results hold if we
replace $\lei$ with $\leiR$ throughout.


\begin{lemma}[Soundness of type inference]
\label{lem:inferSound}
If $\Jtype{\Gamma}{t}{\upsilon}{\Delta}$ then
$\iota : \Gamma \leiR \Delta$ and $\Delta \entails \Pinf{t}{\upsilon}$.
\end{lemma}

\begin{proof}
% Suppose $\Jtype{\Gamma}{t}{\upsilon}{\Delta}$.
By induction on the structure of derivations.
% It is straightforward to verify that $\iota : \Gamma \leiR \Delta$ and
% $\Delta \entails \upsilon \type \wedge t : \upsilon$.
\end{proof}


\begin{lemma}[Completeness and generality of type inference]
\label{lem:inferComplete}
If $\theta : \Gamma \leiR \Theta$ and $\Theta \entails t : \tau$ then
$\JminR{\Gamma}{\Pinf{t}{\upsilon}}{\Delta}$
for some type $\upsilon$ and context $\Delta$.
\end{lemma}


\begin{proof}[Sketch]
The algorithm is structurally recursive over terms, failing only when
unification fails. Each step locally preserves all possible solutions.
For let-expressions, observe that any type specialising any scheme
for $s$ must certainly specialise the type we infer for $s$, and
\emph{ipso facto}, the principal type scheme we assign to $x$.
For details, see Appendix.
\end{proof}


\subsection{Implementing type inference}
\label{sec:inferImplementation}


> data Index a = Z | S a
>     deriving (Functor, Foldable)

> data Schm a  =  Type (Ty a) 
>              |  All (Schm (Index a))
>              |  LetS (Ty a) (Schm (Index a))
>     deriving (Functor, Foldable)

> type Scheme = Schm TyName

> type Prefix      = Bwd TyEntry 

> (>=>) :: Prefix -> Scheme -> Scheme
> B0                      >=> sigma = sigma
> (_Xi :< alpha :=   d)  >=> sigma = case d of
>                    Hole     -> _Xi >=> All sigma'
>                    Some nu  -> _Xi >=> LetS nu sigma'
>   where 
>     sigma' = fmap bind sigma
>     bind beta  | alpha == beta  = Z
>                | otherwise      = S beta

> specialise :: Scheme -> Contextual Type
> specialise (Type tau) = return tau
> specialise sigma = do
>     let (d, sigma') = unpack sigma
>     beta <- fresh d
>     specialise (fmap (fromS beta) sigma')
>   where
>     unpack (All sigma') = (Hole, sigma')
>     unpack (LetS tau sigma') = (Some tau, sigma')
>     fromS beta Z          = beta
>     fromS beta (S alpha)  = alpha




> type TmName   = String
> data TmEntry  = TmName ::: Scheme

> data Tm a  =  X a
>            |  Tm a :$ Tm a 
>            |  Lam a (Tm a)
>            |  Let a (Tm a) (Tm a)
>     deriving (Functor, Foldable)

> type Term      = Tm TmName

> data Entry = TY TyEntry | TM TmEntry | LetGoal


> infer :: Term -> Contextual Type

> infer (X x) = getContext >>= find >>= specialise
>   where
>     find :: Context -> Contextual Scheme
>     find (_Gamma :< TM (y ::: sigma))
>         | x == y                        = return sigma
>     find (_Gamma :< _)                  = find _Gamma
>     find B0                             = fail "Missing variable"

> infer (Lam x w) = do
>     alpha    <- fresh Hole
>     upsilon  <- x ::: Type (V alpha) >- infer w
>     return (V alpha :-> upsilon)

> infer (f :$ a) = do
>     chi      <- infer f
>     upsilon  <- infer a
>     beta     <- fresh Hole
>     unify chi (upsilon :-> V beta)
>     return (V beta)

> infer (Let x s w) = do
>     sigma <- generaliseOver (infer s)
>     x ::: sigma >- infer w


> generaliseOver ::  Contextual Type -> Contextual Scheme
> generaliseOver mt = do
>     modifyContext (:< LetGoal)
>     tau <- mt
>     _Xi <- skimContext
>     return (_Xi >=> Type tau)
>   where
>     skimContext :: Contextual Prefix
>     skimContext = do
>         _Gamma :< vD <- getContext
>         putContext _Gamma
>         case vD of
>             LetGoal    -> return B0
>             TY alphaD  -> (:< alphaD) <$> skimContext
>             TM _       -> error "Unexpected TM variable!"


> (>-) :: TmEntry -> Contextual a -> Contextual a
> x ::: sigma >- ma = do
>     modifyContext (:< TM (x ::: sigma))
>     a <- ma
>     modifyContext extract
>     return a 
>   where          
>     extract ::  Context -> Context
>     extract (_Gamma :< TM (y ::: _))
>         | x == y               = _Gamma
>     extract (_Gamma :< TY xD)  = (extract _Gamma) :< TY xD
>     extract (_Gamma :< _)  = error "Bad context entry!"
>     extract B0             = error "Missing TM variable!"


\section{Discussion}  %%% Concussion?

We have arrived at an implementation of Hindley-Milner type inference
which involves all the same steps as \AlgorithmW, but not
necessarily in the same order. In particular, the dependency analysis
which \W\ performs all of a sudden in the let-rule is here pushed
down to a requirement that the underlying unification algorithm
maintain the well-foundedness of the context.

Our algorithm is presented as a system of problem transformation
locally preserving all possibile solutions, hence finding a most
general global solution if any at all. Accumulating solutions to
decomposed problems is justified simply by the stability of solutions
with respect to information increase. We have established a discipline
of problem solving which happens to be complete for Hindley-Milner
type inference but in any case maintains a coupling of soundness with
generality.

Maintain context validity, make definitions anywhere and only where
there is no choice, so the solutions you find will be general and
generalisable locally: this is a key design principle for
elaboration of high-level code in systems like Epigram and Agda; bugs
arise from its transgression. By giving a disciplined account of
\scare{current information} in terms of contexts and their information
ordering, we provide a means to investigate these problems and justify
the steps we take to repair them.

We are, however, missing yet more context. Our task was greatly
simplified by studying a structural type inference process for
\scare{finished} expressions in a setting where unification is
complete. Each subproblem is either solved or rejected on first
inspection---there is never a need for a \scare{later, perhaps} outcome. As
a result, the conventional control discipline of \scare{direct style} 
recursive programming is adequate to the task. If problems could get
stuck, how might we abandon them and return to them later? By storing
their \emph{context}, of course!

Here, we have combined the linguistic contexts for the various sorts
of variable involved in problems; our next acquisition is the
syntactic context of the target term, interspersing variable
declarations with components of its
\emph{zipper}~\citep{huet:zipper}. We thus become free to abandon
fixed recursion strategies and refocus wherever progress is to be
made. The tree-like proof states of McBride's thesis evolved into
exactly such \scare{zippers with binding} in the implementation of Epigram.

As we have seen, an information increase is nothing other than the
extension of a simultaneous substitution from variables and terms to
declarations and derivations. Our generic analysis of the role of
declarations in derivations shows that stability is endemic, amounting
to the action of hereditary substitution on \scare{cut-free} derivations.
And that is exactly what it should be. We have rationalised
Hindley-Milner type inference by adapting a discipline for
interactively constructing inhabitants of dependent types as the means
to manage unknowns when incrementally constructing solutions to
problems. The analysis can only become clearer, the technology
simpler, as we bring these two kinds of construction together,
mediating \emph{problems as types}.




\phantomsection
\addcontentsline{toc}{section}{References}
\bibliographystyle{plainnat}
\bibliography{lib}

\section{Acknowledgments}

The first author is supported by Microsoft Research through its PhD Scholarship
Programme.



\appendix

\section{Appendix}




%if showCode

\subsection{Lists}

We define our own types of forward (|Fwd|) and backward (|Bwd|) lists,
which are foldable functors and monoids.

> data Fwd a = F0 | a :> Fwd a
>     deriving (Eq, Functor, Foldable, Show)

> data Bwd a = B0 | Bwd a :< a
>     deriving (Eq, Functor, Foldable, Show)

> infixr 8 :>
> infixl 8 :<

> instance Monoid (Fwd a) where
>     mempty = F0
>     F0         `mappend` ys = ys
>     (x :> xs)  `mappend` ys = x :> (xs `mappend` ys)

> (<+>) :: Monoid a => a -> a -> a
> (<+>) = mappend

The fish operator |(<><)| combines a backward and a forward list to
produce a backward list. Similarly, the |(<>>)| operator (chips?)
produces a forward list.

% > (<><) :: Context -> Suffix -> Context
% > infixl 8 <><
% > xs <>< F0 = xs
% > xs <>< (alpha := d :> ys) = (xs :< TY (alpha := d) ) <>< ys

> (<>>) :: Bwd a -> Fwd a -> Fwd a
> infixl 8 <>>
> B0 <>> ys         = ys
> (xs :< x) <>> ys  = xs <>> (x :> ys)


\section{Tests}

The |findType| function looks up a type variable in the context and returns its binding,
or |Nothing| if it is unbound or missing from the context.

> findType :: Context -> TyName -> Maybe Type
> findType B0              _                      = Nothing
> findType (_ :< TY (y := Some tau))  x | x == y  = Just tau
> findType (_ :< TY (y := Hole))      x | x == y  = Nothing
> findType (c :< _)        x                      = findType c x


The |normalise| function returns the normal form (i.e.\ with all type variables expanded as far
as possible) of the given type within the given context. Laziness means that every
variable in the context is normalised at most once and only if necessary.

> normalise :: Context -> Type -> Type
> normalise _Gamma tau = normalStep (normaliseContext B0 (_Gamma <>> F0)) tau
>     where
>         normalStep :: Context -> Type -> Type
>         normalStep c (s :-> t) = (normalStep c s) :-> (normalStep c t)
>         normalStep c (V x) = case findType c x of
>             Just t   -> t
>             Nothing  -> (V x)
>
>         normaliseContext :: Context -> Fwd Entry -> Context
>         normaliseContext c F0 = c
>         normaliseContext c (TY (x := Some t) :> es) = 
>             normaliseContext (c :< TY (x := Some (normalStep c t))) es
>         normaliseContext c (e :> es) = normaliseContext (c :< e) es


|inferType| is a convenience method for inferring the type of a term in the empty context.

> inferType :: Term -> Maybe (Type, (TyName, Context))
> inferType t = runStateT (infer t) (0, B0)


A collection of very simple unit tests follows. These allow the unifier and
type inference algorithm to be tested with

< main

Note that equality of types is syntactic (it does not perform renaming) so
changing the algorithm may sometimes cause spurious failures as the fresh
variable numbers may be different.

> main :: IO ()
> main = unifyTest unifyTests >> inferTest inferTests

> alpha *= d = TY (alpha := d)

> unifyTests :: [(Type, Type, Context, Maybe Context)]
> unifyTests = [
>     (V 0, V 1,
>         B0 :< 0 *= Hole :< 1 *= Hole,
>         Just (B0 :< 0 *= Hole :< 1 *= Some (V 0))),
>     (V 0, V 1 :-> V 2, 
>         B0 :< 0 *= Hole :< 1 *= Hole :< 2 *= Hole,
>         Just (B0 :< 1 *= Hole :< 2 *= Hole :< 0 *= Some (V 1 :-> V 2))),
>     (V 0, V 1 :-> V 2,
>         B0 :< 0 *= Hole :< 2 *= Some (V 0) :< 1 *= Some (V 0),
>         Nothing),
>     (V 0 :-> V 0, V 1 :-> V 1,
>         B0 :< 1 *= Hole :< 0 *= Hole,
>         Just (B0 :< 1 *= Hole :< 0 *= Some (V 1))),
>     (V 0, V 1 :-> V 2,
>        B0 :< 1 *= Hole :< 0 *= Some (V 1 :-> V 1) :< 2 *= Hole,
>        Just (B0 :< 1 *= Hole :< 2 *= Some (V 1) :< 0 *= Some (V 1 :-> V 1))),
>     (V 0 :-> V 1, V 1 :-> V 0,
>        B0 :< 0 *= Hole :< 1 *= Hole,
>        Just (B0 :< 0 *= Hole :< 1 *= Some (V 0))),
>     (V 0 :-> V 1 :-> V 2, V 1 :-> V 0 :-> V 0,
>        B0 :< 2 *= Hole :< 0 *= Hole :< 1 *= Hole,
>        Just (B0 :< 2 *= Hole :< 0 *= Some (V 2) :< 1 *= Some (V 0)))
>     ]

> unifyTest :: [(Type, Type, Context, Maybe Context)] -> IO ()
> unifyTest [] = return ()
> unifyTest ((sigma, tau, c0, mc):xs) =
>     do case runStateT (unify sigma tau) (0, c0) of
>          Just ((), (_, c1)) ->
>              if Just c1 == mc
>              then putStrLn "OKAY" -- ++ (show sigma) ++ " == " ++ (show tau) ++ " in " ++ (show c1))
>              else putStrLn ("\nFAIL: " ++ (show sigma) ++ " == " 
>                                 ++ (show tau) ++ " in " ++ (show c1))
>          Nothing -> 
>              if mc == Nothing
>              then putStrLn "OKAY" -- ++ show sigma ++ " /= " ++ show tau)
>              else putStrLn ("\nFAIL: " ++ show sigma ++ " /= " ++ show tau)
>        unifyTest xs


> inferTests :: [(Term, Maybe Type)]
> inferTests = [
>     (X "u", 
>          Nothing),
>     (Lam "x" (X "x"),
>          Just (V 0 :-> V 0)),
>     (Lam "x" (X "x" :$ X "x"),
>          Nothing),
>     (Lam "x" (Lam "y" (X "y")),
>          Just (V 0 :-> V 1 :-> V 1)),
>     (Lam "x" (Lam "y" (X "x")),
>          Just (V 0 :-> V 1 :-> V 0)),
>     (Lam "x" ((Lam "y" (X "y")) :$ X "x"),
>          Just (V 0 :-> V 0)),
>     (Lam "x" ((Lam "y" (X "x")) :$ X "x"),
>          Just (V 0 :-> V 0)),
>     (Let "m" (Lam "a" (X "a")) (X "m" :$ X "m"),
>          Just (V 2 :-> V 2)),
>     (Let "s" (Let "m" (Lam "a" (X "a")) (X "m" :$ X "m")) (X "s"), 
>          Just (V 4 :-> V 4)),
>     (Lam "x" (Lam "y" (X "x")),
>          Just (V 0 :-> (V 1 :-> V 0))),
>     (Lam "x" (Lam "y" (X "x" :$ X "y")),
>          Just ((V 1 :-> V 2) :-> (V 1 :-> V 2))),
>     (Let "I" (Lam "x" (X "x")) (X "I"),
>          Just (V 1 :-> V 1))
>   ]

> inferTest :: [(Term, Maybe Type)] -> IO ()
> inferTest [] = return ()
> inferTest ((t, expected):tes) =
>     do case inferType t of
>          Just (tau, (_, c)) ->
>              let tau' = normalise c tau
>              in
>                  if Just tau' == expected
>                  then putStrLn "OKAY" -- ++ (show t) ++ " : " ++ (show tau') ++ " in " ++ (show c))
>                  else putStrLn ("\nFAIL: " ++ (show t) ++ " : " 
>                                 ++ (show tau') ++ " /= " ++ (show expected)
>                                 ++ " in " ++ (show c))
>          Nothing -> 
>              if expected == Nothing
>              then putStrLn "OKAY" -- ++ (show t) ++ " does not type")
>              else putStrLn ("\nFAIL: " ++ (show t) ++ " should type to " ++ (show expected))
>        inferTest tes


We need some |Eq| and |Show| instances for testing purposes:

> deriving instance Eq a => Eq (Ty a)
> deriving instance Show a => Show (Ty a)
> deriving instance Eq Entry
> deriving instance Show Entry
> deriving instance Show Term
> deriving instance Eq a => Eq (Schm a)
> deriving instance Show a => Show (Schm a)
> deriving instance Eq a => Eq (Index a)
> deriving instance Show a => Show (Index a)

> deriving instance Eq TyDecl
> deriving instance Show TyDecl

> deriving instance Eq TyEntry
> deriving instance Show TyEntry
> deriving instance Eq TmEntry
> deriving instance Show TmEntry

%endif



\end{document}