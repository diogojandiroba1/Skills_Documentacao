---
name: doc-gerencia-configuracao
description: Guia o agente na elaboração do Plano de Gerência de Configuração de Software (SCM Plan), cobrindo estratégia de branching, baselines, SemVer, controle de mudanças (CCB), tabelas com cabeçalho bege e geração de modelos em sugests_diagrams/.
---

# Skill: Plano de Gerência de Configuração de Software (SCM Plan)

Esta skill orienta o agente na formulação do **Plano de Gerência de Configuração de Software (SCM Plan - Software Configuration Management Plan)**, cobrindo o controle de versão, modelo de branching, baselines, SemVer e o fluxo de controle de mudanças.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as melhores práticas de gerência de configuração à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar IEEE 828 ou SWEBOK no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de redigir o Plano de Gerência de Configuração de Software (SCM Plan) em LaTeX ou sugerir diagramas, o agente **NÃO deve assumir políticas de branching ou processos de release sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de SCM)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após o Manual do Usuário) do projeto atual?
2. **Modelo de Branching e Fluxo de Trabalho Git:**
   - Qual estratégia de branches a equipe adotará (GitFlow clássico, Trunk-Based Development, GitHub Flow)?
   - Quais branches serão protegidas (ex.: `main` e `staging` imutáveis contra direct push e force push)?
   - Quantos revisores são exigidos para aprovar um Pull Request?
3. **Convenção de Commits e Rastreabilidade:**
   - Será adotado o padrão *Conventional Commits* (`feat:`, `fix:`, `refactor:`, `chore:`, `docs:`)?
   - Os commits e PRs devem obrigatoriamente referenciar IDs de Issues ou Requisitos?
4. **Versionamento Semântico e Baselines:**
   - Como será calculada a versão (SemVer 2.0.0 manual ou via automação)?
   - Em que momentos são congeladas as *baselines* de versão (fim de sprint, marcos contratuais)?
5. **Comitê de Controle de Mudanças (CCB):**
   - Quem compõe o CCB (ex.: Tech Lead, Arquiteto, Product Owner, QA Lead)?
   - Qual é o limiar de mudança que exige aprovação formal do CCB?
6. **Itens de Configuração (CIs) e Auditorias:**
   - Quais itens de configuração serão controlados e auditados formalmente (código backend, frontend, DDLs, Dockerfiles, IaC, documentos LaTeX)?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Modelo de Branching e Regras de Proteção** acordadas;
- **Fluxo do Comitê de Mudanças (CCB)** e política SemVer;
- **Sugestão de Diagramas para Construção no StarUML v7.0:**
  1. `Imagens/scm_branching_model.png`: Estratégia de Branching no Git com Raias (Activity Diagram com Swimlanes);
  2. `Imagens/scm_fluxo_ccb.png`: Ciclo de Mudança e Aprovação CCB (Statechart Diagram).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova este modelo de branching, regras de proteção de branch e o fluxo do CCB sugeridos para prosseguirmos com a elaboração formal do SCM Plan em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento é puramente técnico de governança de configuração do projeto. Não cite no texto termos como *"conforme o IEEE Std 828"*, *"segundo o SWEBOK"*. Aplique os princípios de rastreabilidade, imutabilidade de baselines e controle de mudanças diretamente nas políticas descritas.
- **GRADE NÍTIDA EM TABELAS:** Todas as matrizes de itens de configuração e regras de controle devem possuir linhas verticais e horizontais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem ser geradas em `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Introdução e Escopo do SCM**
   - Propósito do plano de gerência de configuração e catálogo de Itens de Configuração (CIs).

2. **Estratégia de Controle de Versão e Modelo de Branching**
   - Definição do fluxo no Git (Trunk-Based / GitFlow) e regras de proteção de branches.

3. **Política de Versionamento Semântico e Baselines**
   - Especificação do SemVer 2.0.0 (`MAJOR.MINOR.PATCH`) e critérios de congelamento de baselines.

4. **Gerenciamento de Mudanças e Comitê de Controle (CCB)**
   - Fluxo formal para Solicitações de Mudança (RFC) e composição do comitê.

5. **Auditorias de Configuração e Rastreabilidade**
   - Auditorias Físicas (PCA) e Funcionais (FCA) e geração de Changelog.

---

## 4. Modelos de Tabelas e Políticas em LaTeX (Grade Nítida e Cabeçalho Bege)

### Matriz de Itens de Configuração (CIs)
```latex
\begin{table}[htbp]
\caption{Matriz de Itens de Configuração do Projeto}
\label{tab:itens_configuracao}
\centering
\small
\begin{tabularx}{\textwidth}{|l|l|Y|l|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Identificador} & \textbf{Tipo de Item} & \textbf{Repositório / Localização} & \textbf{Responsável} \\ \hline
CI-CODE-BACK & Código Back-end & \texttt{git:backend/src} & Tech Lead Back-end \\ \hline
CI-CODE-FRONT & Código Front-end & \texttt{git:frontend/src} & Tech Lead Front-end \\ \hline
CI-DB-SCHEMA & Migrações de BD & \texttt{git:backend/alembic/versions} & DBA / Engenheiro de Dados \\ \hline
CI-DOC-TECH & Especificação Técnica & \texttt{git:docs/technical\_spec.pdf} & Arquiteto de Software \\ \hline
CI-INFRA-IAC & Configuração Docker & \texttt{git:deploy/docker-compose.yml} & Engenheiro de DevOps \\ \hline
\end{tabularx}
\end{table}
```

### Regras de Proteção de Branches
```latex
\subsection{Política de Branches Protegidas no Repositório}
A branch principal (\texttt{main}) é estritamente protegida contra \textit{direct push} e \textit{force push}. Toda alteração exige:
\begin{itemize}
    \item Abertura de Pull Request vinculado a uma Issue rastreada;
    \item Aprovação obrigatória de ao menos dois revisores técnicos seniores;
    \item Sucesso absoluto na esteira de CI (100\% dos testes passando e zero falhas de linter);
    \item Histórico linear mantido via merge squash ou rebase.
\end{itemize}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para cada diagrama deste capítulo, o agente deve gerar uma subpasta dedicada em `sugests_diagrams/`:
- `sugests_diagrams/scm_branching_model/`
- `sugests_diagrams/scm_fluxo_ccb/`

Cada subpasta conterá obrigatoriamente três arquivos:
1. `<nome_diagrama>.puml`: Código PlantUML do modelo de SCM;
2. `<nome_diagrama>.png`: Imagem da prévia do PlantUML;
3. `<nome_diagrama>.md`: Roteiro textual detalhado para modelar no StarUML v7.0 (Raias de branches, ações, estados de mudança do CCB e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (IEEE 828, SWEBOK, ISO 12207)?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] A estratégia de branches está explicitada com regras formais de proteção?
- [ ] A política de SemVer 2.0.0 define os critérios objetivos para MAJOR, MINOR e PATCH?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] Os itens de configuração cobrem código, esquemas de banco, Docker e documentação?
