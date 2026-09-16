---
name: doc-garantia-qualidade
description: Orienta o agente na elaboração do Plano de Garantia da Qualidade de Software (SQAP) conforme IEEE Std 730, cobrindo auditorias de processo, revisões por pares, análise estática de código, métricas de qualidade, DoD e modelagem no StarUML v7.0.
---

# Skill: Plano de Garantia da Qualidade de Software (SQAP)

Esta skill orienta o agente na redação do **Plano de Garantia da Qualidade de Software (SQAP - Software Quality Assurance Plan)**, estruturado com base na norma **IEEE Std 730**. Enquanto o Plano de Testes foca na verificação do *produto*, o SQAP estabelece a governança dos *processos* de engenharia para assegurar que a qualidade seja construída continuamente ao longo de todo o ciclo de vida.

O agente atua como **engenheiro de garantia da qualidade** e **copiloto de modelagem no StarUML v7.0**, instruindo a criação do fluxograma de revisão por pares e auditoria de qualidade.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de produzir o Plano de Garantia da Qualidade de Software (SQAP) em LaTeX ou orientar diagramas no StarUML v7.0, o agente **NÃO deve assumir processos ou métricas de qualidade sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de SQA)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Padrões de Código e Análise Estática (SAST/Linters):**
   - Quais ferramentas de análise estática e linters serão adotadas (SonarQube, Ruff, ESLint, Trivy)?
   - Quais regras e métricas serão bloqueantes no Quality Gate (ex.: complexidade ciclomática máxima $\le 10$, duplicação $< 3\%$, zero vulnerabilidades críticas/altas)?
2. **Processo de Revisão por Pares (Code Review):**
   - Quais são as regras para submissão de Pull Requests (tamanho máximo de linhas, templates de PR, linters passando)?
   - Quantas aprovações técnicas são necessárias e quem tem autoridade para aprovar o merge?
3. **Definition of Ready (DoR) e Definition of Done (DoD):**
   - Quais critérios definem que um requisito está pronto para ser desenvolvido (DoR)?
   - Quais critérios rigorosos definem que uma funcionalidade está finalizada e pronta para release (DoD: testes, review, documentação, migração de banco)?
4. **Métricas de Qualidade de Produto e Processo:**
   - Quais métricas DORA serão acompanhadas (Deployment Frequency, Lead Time for Changes, Change Failure Rate, MTTR)?
   - Qual a meta de cobertura de testes automatizados exigida no DoD (ex.: $\ge 80\%$)?
5. **Auditorias e Melhoria Contínua:**
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
> *"Você aprova estas políticas de garantia de qualidade, critérios de DoD/DoR e o fluxo de revisão sugeridos para prosseguirmos com a elaboração formal do SQAP em LaTeX e o guia do StarUML v7.0?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

Esta skill está fundamentada nos preceitos formais da Engenharia de Software:
- **SWEBOK v4 -- Capítulo 5 (Software Quality KA):**
  - *1. Software Quality Fundamentals:* Cultura de qualidade, valor e custos da qualidade (prevenção, avaliação, falhas internas e externas), modelos de atributos de qualidade, prevenção de defeitos.
  - *2. Software Quality Management Processes:* Garantia da Qualidade de Software (SQA), Verificação e Validação (V&V), Revisões por Pares (*Peer Reviews* e *Walkthroughs*), Auditorias de Processo e Conformidade.
  - *3. Practical Considerations:* Medição e métricas de qualidade de software, classificação e rastreamento de defeitos, identificação de requisitos críticos de confiabilidade.
  - *4. Software Quality Tools:* Ferramentas de análise estática de código (SAST, Linters), analisadores de complexidade ciclomática e rastreamento de cobertura.
- **IEEE Std 730-2014 (*IEEE Standard for Software Quality Assurance Processes*):** Norma internacional que estipula os requisitos formais para o planejamento, execução, controle e governança dos processos de SQA em sistemas críticos e empresariais.
- **ISO/IEC 25010:2023 (*Systems and software engineering -- SQuaRE -- Product quality model*):** Modelo de 8 características de qualidade de software (Adequação Funcional, Eficiência de Performance, Compatibilidade, Usabilidade, Confiabilidade, Segurança, Manutenibilidade e Portabilidade).
- **ISO/IEC/IEEE 12207:2017 (Clause 6.3.8 -- Quality Assurance Process):** Processo do ciclo de vida que provê garantia independente de que produtos e processos aderem aos requisitos e planos.

---

## 3. Estrutura Obrigatória do Documento

1. **Propósito e Escopo da Garantia da Qualidade**
   - Papel da SQA independente no projeto;
   - Alinhamento entre os objetivos de negócio e as metas de qualidade técnica.

2. **Padrões, Convenções e Conformidade de Código**
   - **Guias de Estilo e Convenções de Nomenclatura:** PEP 8 (Python), Airbnb / Clean TypeScript, convenções de arquitetura limpa;
   - **Análise Estática Automatizada (Linters e SAST):** Regras de SonarQube, Ruff, ESLint, verificação de segredos expostos (TruffleHog / GitGuardian) e análise de vulnerabilidades de dependências (Dependabot / Snyk).

3. **Processo de Revisão por Pares (Code Review)**
   - Diretrizes obrigatórias para Pull Requests:
     - Tamanho máximo recomendado por PR ($\le 300$ linhas de alteração para garantir revisão minuciosa);
     - Checklist formal do revisor (cobertura de testes, ausência de code smells, aderência ao princípio de responsabilidade única, tratamento adequado de exceções e segurança).

4. **Critérios de Conclusão: Definition of Ready (DoR) e Definition of Done (DoD)**
   - **Definition of Ready (DoR):** Requisitos com critérios de aceite claros, wireframes aprovados e dependências técnicas resolvidas antes do início do desenvolvimento;
   - **Definition of Done (DoD):** Critérios rigorosos para que uma tarefa seja considerada finalizada:
     1. Código aprovado por ao menos 2 revisores seniores;
     2. Cobertura de testes unitários e de integração $\ge 80\%$;
     3. Análise do SonarQube sem vulnerabilidades críticas ou novos bugs;
     4. Migração de banco de dados executada e testada com rollback;
     5. Documentação técnica e Swagger/OpenAPI atualizados.

5. **Métricas de Qualidade e Processo**
   - Indicadores de Qualidade do Produto:
     - Densidade de Defeitos (defeitos encontrados por 1.000 linhas de código);
     - Cobertura de Código de Testes (Line Coverage e Branch Coverage);
     - Dívida Técnica estimada (dias de esforço para refatoração).
   - Indicadores de Processo (Métricas DORA / Ágeis):
     - Lead Time for Changes (tempo entre commit e produção);
     - Change Failure Rate (porcentagem de deploys que exigem hotfix/rollback);
     - Mean Time to Recovery (MTTR - tempo médio para restabelecer o serviço).

6. **Auditorias de Processo e Melhoria Contínua**
   - Calendário de auditorias periódicas de conformidade arquitetural e de segurança;
   - Realização de Retrospectivas Técnicas para análise de causas-raiz de falhas em produção (Post-Mortem sem culpados).

---

## 4. Modelos de Tabelas e Checklists em LaTeX

### Definition of Done (DoD) Padronizada
```latex
\subsection{Definition of Done (DoD) -- Critérios Obrigatórios}
Uma história de usuário ou funcionalidade só é promovida para Homologação se satisfizer cumulativamente:
\begin{enumerate}
    \item \textbf{Testes Automatizados:} Cobertura mínima de 80\% atingida na esteira de CI;
    \item \textbf{Code Review:} Aprovado formalmente por 2 engenheiros seniores;
    \item \textbf{Segurança SAST:} Zero vulnerabilidades de severidade Alta ou Crítica no escaneamento de dependências e código;
    \item \textbf{Contratos de API:} Documentação OpenAPI atualizada e refletindo o payload de produção;
    \item \textbf{Integridade de Banco:} Script de migração e script de reversão devidamente testados.
\end{enumerate}
```

### Quadro de Métricas de Qualidade (Padrão Booktabs)
```latex
\begin{table}[htbp]
\caption{Quadro de Métricas e Metas de Qualidade de Software}
\label{tab:metricas_qualidade}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l l Y l @{}}
\toprule
\textbf{Métrica} & \textbf{Instrumento de Coleta} & \textbf{Objetivo / Meta Estabelecida} & \textbf{Ação Corretiva} \\
\midrule
Cobertura de Testes & Pytest-cov / Vitest & Mínimo de 80\% das linhas de negócio. & PR bloqueado na esteira se $< 80\%$. \\
Complexidade Ciclomática & Radon / SonarQube & Complexidade por método $\le 10$. & Refatoração obrigatória do método. \\
Change Failure Rate & Logs do GitHub Actions & Menor que 5\% de falhas pós-deploy. & Análise imediata de causa-raiz e melhoria de testes. \\
MTTR (Recuperação) & Alertas do Datadog/Cloud & Média inferior a 30 minutos em incidentes. & Acionamento de rollback automatizado. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 5. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

### 4.1. Fluxo de Revisão de Código e Verificação de DoD (Activity Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Activity Diagram` e nomeie como `sqa_processo_revisao`;
2. **Raias de Responsabilidade (Swimlanes):** Crie raias horizontais para:
   - `Desenvolvedor Autor`;
   - `Esteira Automatizada de CI (Linters, Testes e SAST)`;
   - `Revisores Técnicos Seniores (Code Review)`;
   - `Tech Lead / Auditor SQA`.
3. **Ações:** Modele o fluxo determinístico:
   - `Submeter Pull Request`;
   - `Executar Análise Estática e Testes`;
   - `Verificar Cobertura >= 80% e Zero Vulnerabilidades`;
   - `Inspecionar Legibilidade e Padrões Arquiteturais`;
   - `Aprovar / Solicitar Ajustes (Decision Node)`;
   - `Validar Definition of Done (DoD)`;
   - `Liberar Merge para Main`.
4. **Exportação:** Exporte via **`File` -> `Export Diagram as` -> `PNG...`** (300 DPI, fundo branco) para `Template_Unificado_LATEX/Imagens/sqa_processo_revisao.png`.

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa de perguntas técnicas foi realizada com o usuário e a proposta foi formalmente aprovada antes da redação?
- [ ] Os critérios de Definition of Done (DoD) e Definition of Ready (DoR) são objetivos e verificáveis?
- [ ] O processo formal de revisão de código e auditoria foi modelado no StarUML v7.0?
- [ ] As ferramentas de análise estática e linters estão configuradas com limites bloqueantes?
- [ ] As métricas de processo abrangem tanto métricas DORA quanto métricas clássicas de produto?
