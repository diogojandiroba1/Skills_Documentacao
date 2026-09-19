---
name: doc-plano-projeto
description: Orienta o agente na elaboração do Documento de Plano de Projeto e Viabilidade (SPMP / Project Charter), cobrindo escopo preliminar, trade-offs técnicos, WBS no StarUML v7.0, Gantt nativo via pgfgantt, matriz de riscos, infraestrutura, equipe, custos e geração de modelos em sugests_diagrams/.
---

# Skill: Elaboração de Plano de Projeto e Viabilidade de Software

Esta skill orienta o agente na concepção, estruturação e redação formal do **Plano de Gerenciamento de Projeto de Software (SPMP - Software Project Management Plan)** e **Estudo de Viabilidade Técnica e Econômica (Project Charter / Business Case)**. O documento gerado fundamenta a justificativa estratégica do software, sua viabilidade de engenharia e os parâmetros rigorosos de governança, cronograma, custos, infraestrutura e riscos.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as normas à risca na estrutura e critérios, mas **sem citar nominalmente as normas no texto**;
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera o **Diagrama de Gantt nativo em LaTeX** via `pgfgantt` (com destaque CPM);
5. Para a WBS, gera os modelos de apoio em `sugests_diagrams/proj_wbs_escopo/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de gerar qualquer conteúdo LaTeX para o Plano de Projeto ou sugerir diagramas, o agente **NUNCA deve assumir premissas arbitrárias**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação Técnica)
O agente deve formular perguntas claras, agrupadas por tópicos essenciais, apresentando opções técnicas com prós, contras e recomendação:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** (documento isolado, sem reaproveitar dados de projetos anteriores) ou do **Próximo Capítulo Lógico** de um projeto já iniciado?
2. **Visão Estratégica e Dores Centrais:**
   - Qual é a dor de negócio central que o software visa sanar? Como a operação funciona atualmente (planilhas, papel, sistema legado falho)?
   - Qual é a proposta de valor única (declaração de posicionamento / Elevator Pitch)?
3. **Escopo, Objetivos e Trade-offs:**
   - O que está expressamente **dentro** do escopo e o que fica **fora** do escopo nesta release?
   - Quais são os objetivos gerais e metas específicas (SMART) mensuráveis?
   - Existe preferência ou pré-disposição para desenvolvimento próprio vs SaaS vs open-source?
4. **Stakeholders e Governança:**
   - Quem são os atores envolvidos, operadores e patrocinadores (para mapeamento na Matriz Poder $\times$ Interesse de Mendelow)?
   - Qual é o modelo de ciclo de vida de desenvolvimento adotado (Scrum, Kanban, Iterativo/Incremental)?
5. **Prazos, Orçamento e Equipe:**
   - Qual é a estimativa de prazo total (em semanas) e marcos formais?
   - Qual é o perfil e quantidade de desenvolvedores/engenheiros disponíveis?
   - Premissas de infraestrutura: nuvem pública (CAPEX reduzido, OPEX mensal) ou servidores dedicados/on-premise?
6. **Mapeamento de Riscos:**
   - Quais ameaças técnicas, humanas ou externas são mais temidas no projeto?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza o escopo e apresenta formalmente:
- **Resumo do Escopo e Marcos (Milestones)**;
- **Diagramas e Cronograma do Capítulo:**
  1. `Imagens/proj_wbs_escopo.png`: Estrutura Analítica do Projeto (WBS/EAP) a ser modelada no StarUML v7.0 (com apoio em `sugests_diagrams/proj_wbs_escopo/`);
  2. `pgfgantt`: Diagrama de Gantt vetorial nativo em LaTeX com fases, marcos e destaque do Caminho Crítico (CPM).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova esta estrutura de escopo, cronograma preliminar e a estratégia de diagramas para prosseguirmos com a redação formal do capítulo LaTeX e a geração dos modelos de apoio?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

O conteúdo gerado deve seguir com máximo rigor os preceitos do **SWEBOK v4 (Cap. 7, 8 e 11)**, **IEEE Std 1058** e **ISO/IEC/IEEE 12207**:
- **PROIBIÇÃO DE METACITAÇÕES:** Não incluir no corpo do texto citações como *"conforme a norma IEEE 1058"*, *"segundo o SWEBOK"*, etc. O texto é puramente executivo e corporativo do produto. As normas orientam o rigor, mas não devem ser citadas.
- **GRADE NÍTIDA EM TABELAS:** Todas as tabelas devem possuir linhas horizontais e verticais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho destacada em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O PDF final contém apenas a figura `\incluirdiagrama{Imagens/proj_wbs_escopo.png}{...}{fig:proj_wbs}` e o código nativo `pgfgantt`. As instruções de como desenhar no StarUML v7.0 não devem ir para o PDF; devem ser salvas na pasta de apoio `sugests_diagrams/proj_wbs_escopo/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Termo de Abertura e Concepção do Projeto (Project Charter)**
   - **Termo de Abertura Formal:** Propósito executivo, justificativa estratégica de mercado e autorização de início do projeto;
   - **Visão do Produto e Declaração de Posicionamento (Elevator Pitch):**
     - *Para* [público-alvo / cliente], *cujo* [problema / necessidade], *o* [nome do software] *é um* [categoria do produto] *que* [benefício-chave / diferencial], *diferente de* [alternativas existentes / concorrentes], *nosso produto* [proposta de valor única];
   - **Análise e Mapeamento de Stakeholders (Matriz Poder $\times$ Interesse de Mendelow):**
     - Classificação dos stakeholders em 4 quadrantes operacionais: *Gerenciar de Perto* (Alto Poder, Alto Interesse), *Manter Satisfeito* (Alto Poder, Baixo Interesse), *Manter Informado* (Baixo Poder, Alto Interesse) e *Monitorar com Esforço Mínimo* (Baixo Poder, Baixo Interesse);
   - Contextualização do domínio de negócio e motivação;
   - Descrição objetiva da situação atual (como os processos são executados hoje);
   - Atores do processo atual e gargalos identificados.

2. **Definição do Problema e Dores do Negócio**
   - Lista explícita dos problemas e impactos (inconsistência de dados, riscos de segurança, retrabalho operacional).

3. **Objetivos do Sistema**
   - **Objetivo Geral:** Propósito central da solução em uma única declaração clara;
   - **Objetivos Específicos:** 5 a 8 metas técnicas e de negócio mensuráveis.

4. **Estudo de Viabilidade e Soluções Alternativas (Trade-offs)**
   - Comparação formal entre três abordagens:
     1. *Desenvolvimento Completo Próprio*;
     2. *Contratação de Software as a Service (SaaS)*;
     3. *Customização de Plataforma Open-source*.
   - Tabela comparativa com critérios de Custo, Tempo, Aderência, Dependência de Terceiros e Soberania dos Dados;
   - **Solução Adotada:** Justificativa técnica (Rationale) respaldada nos requisitos de segurança e negócio.

5. **Especificação de Componentes e Infraestrutura**
   - **Hardware de Produção e Desenvolvimento:** Especificações mínimas para estações de trabalho, nós de servidor e periféricos;
   - **Stack Tecnológico:** Linguagens, frameworks, bibliotecas e SGBD justificados;
   - **Redes e Comunicação:** Topologia LAN, redundância de link externo;
   - **Hospedagem em Nuvem:** Provedor selecionado, instâncias, banco gerenciado e armazenamento de objetos.

6. **Equipe de Desenvolvimento e Topologia**
   - Perfis técnicos necessários e papéis (Arquiteto, Tech Lead, Engenheiro de Requisitos, Devs, DevOps/QA);
   - Matriz RACI preliminar.

7. **Gerenciamento de Tempo e Cronograma**
   - **WBS / EAP (Estrutura Analítica do Projeto):** Decomposição em pacotes de trabalho numerados com duração estimada;
   - **Cronograma Sintético:** Tabela consolidada com fases, entregáveis, datas e marcos formais;
   - **Marcos de Entrega (Milestones):** Definição das datas-chave de validação de entregas críticas;
   - **Diagrama de Gantt e Caminho Crítico (CPM):** Implementado em código nativo `pgfgantt`, com escala de semanas, diferenciação de CPM em magenta/púrpura e frentes paralelas em lavanda.

8. **Análise e Gerenciamento de Riscos**
   - Identificação sistemática dos riscos (técnicos, organizacionais, de cronograma e de equipe);
   - Matriz Probabilidade $\times$ Impacto;
   - Registro de Riscos tabulado com: ID, Risco, Probabilidade, Impacto, Gatilho, Ação de Mitigação (preventiva), Ação de Contingência (reativa) e Responsável.

9. **Estimativa de Custos e Orçamento (CAPEX e OPEX)**
   - Custo de infraestrutura durante desenvolvimento e pós-lançamento;
   - Custos de hardware, licenças e mão de obra alocada.

---

## 4. Padrão de Código LaTeX para o Capítulo

### 4.1. Tabelas com Grade Nítida e Cabeçalho Bege Claro
```latex
\begin{table}[htbp]
\caption{Matriz Comparativa de Abordagens de Solução}
\label{tab:comparativo_solucoes}
\centering
\small
\begin{tabularx}{\textwidth}{|l|Y|Y|l|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Abordagem} & \textbf{Vantagens} & \textbf{Desvantagens} & \textbf{Veredito} \\ \hline
Desenvolvimento Próprio & Aderência estrita às regras de negócio e governança total dos dados. & Maior tempo e custo inicial de desenvolvimento. & \textbf{Adotada} \\ \hline
SaaS com Integrações & Rápido início de operação e manutenção pelo provedor. & Custo recorrente elevado e dados sensíveis em nuvem de terceiros. & Descartada \\ \hline
Customização Open-source & Custo zero de licença e base pré-existente. & Complexidade de adaptação arquitetural similar a novo desenvolvimento. & Descartada \\ \hline
\end{tabularx}
\end{table}
```

### 4.2. Diagrama de Gantt Nativo (`pgfgantt`) com Caminho Crítico (CPM)
```latex
\begin{figure}[htbp]
    \centering
    \resizebox{\textwidth}{!}{
    \begin{ganttchart}[
        vgrid={*1{draw=gray!25, dashed}},
        hgrid={*1{draw=gray!20}},
        x unit=0.8cm,
        y unit chart=0.60cm,
        y unit title=0.55cm,
        title/.append style={fill=white, draw=black, thick},
        title label font=\bfseries\footnotesize,
        bar/.append style={fill=blue!20!purple!25, draw=blue!50!purple!70, rounded corners=1pt},
        bar height=0.50,
        bar label font=\scriptsize,
        group/.append style={fill=gray!25, draw=black!80, rounded corners=1.5pt},
        group height=0.25,
        group label font=\bfseries\scriptsize,
        milestone/.append style={shape=diamond, fill=black, draw=black, scale=0.9},
        milestone label font=\bfseries\scriptsize
    ]{1}{12}
        \gantttitle{Mês 1}{3} \gantttitle{Mês 2}{5} \gantttitle{Mês 3}{4} \\
        \gantttitle{S1}{1} \gantttitle{S2}{1} \gantttitle{S3}{1}
        \gantttitle{S4}{1} \gantttitle{S5}{1} \gantttitle{S6}{1} \gantttitle{S7}{1} \gantttitle{S8}{1}
        \gantttitle{S9}{1} \gantttitle{S10}{1} \gantttitle{S11}{1} \gantttitle{S12}{1} \\
        
        \ganttgroup{Fase 1: Concepção \& Infraestrutura}{1}{2} \\
        \ganttbar[bar/.append style={fill=magenta!35!purple!55, draw=magenta!70!black}]{1.1 Atividade Crítica A}{1}{2} \\
        \ganttbar{1.2 Atividade Paralela B}{1}{2} \\
        
        \ganttgroup{Fase 2: Serviços Núcleo (MVP)}{2}{6} \\
        \ganttbar[bar/.append style={fill=magenta!35!purple!55, draw=magenta!70!black}]{2.1 Atividade Crítica C}{2}{4} \\
        \ganttbar{2.2 Atividade Paralela D}{3}{4} \\
        \ganttbar[bar/.append style={fill=magenta!35!purple!55, draw=magenta!70!black}]{2.3 Atividade Crítica E}{5}{6} \\
        \ganttmilestone{Parte 1: Entrega Parcial}{6} \\
        
        \ganttgroup{Fase 3: Construção \& Integração}{7}{9} \\
        \ganttbar[bar/.append style={fill=magenta!35!purple!55, draw=magenta!70!black}]{3.1 Atividade Crítica F}{7}{8} \\
        \ganttbar{3.2 Atividade Paralela G}{8}{9} \\
        
        \ganttgroup{Fase 4: Homologação \& Entrega}{10}{12} \\
        \ganttbar[bar/.append style={fill=magenta!35!purple!55, draw=magenta!70!black}]{4.1 Testes de Carga e Validação}{10}{11} \\
        \ganttbar{4.2 Documentação Final}{11}{12} \\
        \ganttmilestone{Parte 2: Entrega Final}{12}
    \end{ganttchart}
    }
    \caption{Diagrama de Gantt com mapeamento do Caminho Crítico (em destaque), marcos de entrega e frentes paralelas.}
    \label{fig:proj_gantt}
\end{figure}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/proj_wbs_escopo/`

Para a WBS / EAP, o agente gera na subpasta `sugests_diagrams/proj_wbs_escopo/`:
1. `proj_wbs_escopo.puml`: Modelo conceitual em PlantUML com a decomposição hierárquica das entregas;
2. `proj_wbs_escopo.png`: Renderização prévia do diagrama PlantUML;
3. `proj_wbs_escopo.md`: Roteiro passo a passo instruindo o usuário a construir o diagrama no StarUML v7.0:
   - Menu: `Model -> Add Diagram -> Class Diagram` (ou `Composite Structure Diagram`);
   - Elementos: Classes com nomes das fases e pacotes de trabalho (IDs decimais 1.0, 1.1, 1.2...);
   - Relacionamentos: `Composition` (losango preto preenchido) ligando o pacote pai aos filhos;
   - Exportação: `File -> Export Diagram as -> PNG...` para `Template_Unificado_LATEX/Imagens/proj_wbs_escopo.png`.

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa de perguntas técnicas foi realizada com o usuário e confirmou se é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está completamente livre de metacitações nominais a normas (ex.: IEEE 1058, SWEBOK)?
- [ ] Todas as tabelas foram formatadas com divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] O Diagrama de Gantt foi gerado nativamente em LaTeX via `pgfgantt` com diferenciação de cores do CPM (magenta/púrpura)?
- [ ] Os modelos de apoio da WBS foram gerados em `sugests_diagrams/proj_wbs_escopo/` contendo `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] Os custos apresentam distinção clara entre desenvolvimento (CAPEX) e manutenção recorrente (OPEX)?
- [ ] Os riscos possuem gatilhos objetivos e responsáveis formalmente designados?
