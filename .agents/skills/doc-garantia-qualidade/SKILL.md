---
name: doc-garantia-qualidade
description: Orienta o agente na elaboração do Plano de Garantia da Qualidade de Software (SQAP), cobrindo auditorias de processo, revisões por pares, análise estática de código, métricas de qualidade, DoD, tabelas com cabeçalho bege e geração de modelos em sugests_diagrams/.
---

# Skill: Plano de Garantia da Qualidade de Software (SQAP)

Esta skill orienta o agente na redação do **Plano de Garantia da Qualidade de Software (SQAP - Software Quality Assurance Plan)**, estabelecendo a governança dos processos de engenharia para assegurar que a qualidade seja construída continuamente ao longo de todo o ciclo de vida.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as normas de garantia da qualidade à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar IEEE 730, ISO 25010 ou SWEBOK no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de produzir o Plano de Garantia da Qualidade de Software (SQAP) em LaTeX ou sugerir diagramas, o agente **NÃO deve assumir processos ou métricas de qualidade sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de SQA)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após o Plano de Gerência de Configuração) do projeto atual?
2. **Padrões de Código e Análise Estática (SAST/Linters):**
   - Quais ferramentas de análise estática e linters serão adotadas (SonarQube, Ruff, ESLint, Trivy)?
   - Quais regras e métricas serão bloqueantes no Quality Gate (ex.: complexidade ciclomática $\le 10$, duplicação $< 3\%$, zero vulnerabilidades críticas/altas)?
3. **Processo de Revisão por Pares (Code Review):**
   - Quais são as regras para submissão de Pull Requests (tamanho máximo de linhas, templates de PR)?
   - Quantas aprovações técnicas são necessárias e quem tem autoridade para aprovar o merge?
4. **Definition of Ready (DoR) e Definition of Done (DoD):**
   - Quais critérios definem que um requisito está pronto para ser desenvolvido (DoR)?
   - Quais critérios rigorosos definem que uma funcionalidade está finalizada e pronta para release (DoD)?
5. **Métricas de Qualidade de Produto e Processo:**
   - Quais métricas DORA serão acompanhadas (Deployment Frequency, Lead Time, Change Failure Rate, MTTR)?
   - Qual a meta de cobertura de testes automatizados exigida no DoD (ex.: $\ge 80\%$)?
6. **Auditorias e Melhoria Contínua:**
   - Qual será a periodicidade das auditorias de processo e conformidade arquitetural?
   - Como serão conduzidas as análises de causa-raiz pós-incidente (Post-Mortem sem culpados)?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Catálogo de Padrões e Regras de Quality Gate**;
- **Definition of Done (DoD)** e matriz de métricas de qualidade;
- **Sugestão de Diagramas para Construção no StarUML v7.0:**
  1. `Imagens/sqa_processo_revisao.png`: Fluxo de Revisão de Código e Verificação de DoD com Raias (Activity Diagram com Swimlanes).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova estas políticas de garantia de qualidade, critérios de DoD/DoR e o fluxo de revisão sugeridos para prosseguirmos com a elaboração formal do SQAP em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento é puramente técnico da qualidade de processos do produto. Não cite no texto expressões como *"conforme o IEEE Std 730"*, *"segundo o SWEBOK"*. Aplique o rigor de critérios de entrada/saída, checklists e auditorias diretamente no conteúdo.
- **GRADE NÍTIDA EM TABELAS:** Todas as matrizes de métricas e checklists de qualidade devem possuir linhas verticais e horizontais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem ser geradas em `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Propósito e Escopo da Garantia da Qualidade**
   - Papel da SQA independente e metas de qualidade técnica.

2. **Padrões, Convenções e Conformidade de Código**
   - Guias de estilo e análise estática automatizada (Linters, SAST e análise de dependências).

3. **Processo de Revisão por Pares (Code Review)**
   - Diretrizes de PRs, limites de tamanho e checklist formal do revisor.

4. **Critérios de Conclusão: Definition of Ready (DoR) e Definition of Done (DoD)**
   - Critérios formais para início e conclusão de tarefas.

5. **Métricas de Qualidade e Processo**
   - Indicadores de Qualidade do Produto (densidade de defeitos, cobertura $\ge 80\%$, complexidade);
   - Indicadores de Processo (DORA: Lead Time, MTTR, Change Failure Rate).

6. **Auditorias de Processo e Melhoria Contínua**
   - Calendário de auditorias periódicas e ritos de Post-Mortem.

---

## 4. Modelos de Checklists e Tabelas em LaTeX (Grade Nítida e Cabeçalho Bege)

### Definition of Done (DoD) Padronizada
```latex
\subsection{Definition of Done (DoD) -- Critérios Obrigatórios}
Uma história de usuário ou funcionalidade só é promovida para Homologação se satisfizer cumulativamente:
\begin{enumerate}
    \item \textbf{Testes Automatizados:} Cobertura mínima de 80\% atingida na esteira de CI;
    \item \textbf{Code Review:} Aprovado formalmente por 2 engenheiros seniores;
    \item \textbf{Segurança SAST:} Zero vulnerabilidades de severidade Alta ou Crítica no escaneamento;
    \item \textbf{Contratos de API:} Documentação OpenAPI atualizada e refletindo o payload de produção;
    \item \textbf{Integridade de Banco:} Script de migração e script de reversão devidamente testados.
\end{enumerate}
```

### Quadro de Métricas de Qualidade
```latex
\begin{table}[htbp]
\caption{Quadro de Métricas e Metas de Qualidade de Software}
\label{tab:metricas_qualidade}
\centering
\small
\begin{tabularx}{\textwidth}{|l|l|Y|l|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Métrica} & \textbf{Instrumento de Coleta} & \textbf{Objetivo / Meta Estabelecida} & \textbf{Ação Corretiva} \\ \hline
Cobertura de Testes & Pytest-cov / Vitest & Mínimo de 80\% das linhas de negócio. & PR bloqueado na esteira se $< 80\%$. \\ \hline
Complexidade Ciclomática & Radon / SonarQube & Complexidade por método $\le 10$. & Refatoração obrigatória do método. \\ \hline
Change Failure Rate & Logs do GitHub Actions & Menor que 5\% de falhas pós-deploy. & Análise de causa-raiz e melhoria de testes. \\ \hline
MTTR (Recuperação) & Alertas do Datadog/Cloud & Média inferior a 30 minutos em incidentes. & Acionamento de rollback automatizado. \\ \hline
\end{tabularx}
\end{table}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para o fluxo de revisão de código (`sqa_processo_revisao`), o agente gera a subpasta `sugests_diagrams/sqa_processo_revisao/` contendo:
1. `sqa_processo_revisao.puml`: Código PlantUML do processo de revisão;
2. `sqa_processo_revisao.png`: Imagem da prévia do PlantUML;
3. `sqa_processo_revisao.md`: Roteiro textual detalhado para modelar no StarUML v7.0 (Raias de responsabilidade, actions, decisões de aprovação de DoD e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (IEEE 730, ISO 25010, SWEBOK)?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] Os critérios de Definition of Done (DoD) e Definition of Ready (DoR) são objetivos e verificáveis?
- [ ] As ferramentas de análise estática e linters estão configuradas com limites bloqueantes?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] As métricas de processo abrangem métricas DORA e métricas clássicas de produto?
