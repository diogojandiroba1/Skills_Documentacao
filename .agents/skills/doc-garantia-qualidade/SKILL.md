---
name: doc-garantia-qualidade
description: Orienta o agente na elaboração do Plano de Garantia da Qualidade de Software (SQAP) conforme IEEE Std 730, cobrindo auditorias de processo, revisões por pares, análise estática de código, métricas de qualidade e Definition of Done (DoD).
---

# Skill: Plano de Garantia da Qualidade de Software (SQAP)

Esta skill orienta o agente na redação do **Plano de Garantia da Qualidade de Software (SQAP - Software Quality Assurance Plan)**, estruturado com base na norma **IEEE Std 730**. Enquanto o Plano de Testes foca na verificação do *produto*, o SQAP estabelece a governança dos *processos* de engenharia para assegurar que a qualidade seja construída continuamente ao longo de todo o ciclo de vida.

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

Esta skill está fundamentada nos preceitos formais da Engenharia de Software:
- **SWEBOK v4 -- Capítulo 5 (Software Quality KA):**
  - *1. Software Quality Fundamentals:* Cultura de qualidade, valor e custos da qualidade (custos de prevenção, avaliação, falhas internas e falhas externas), modelos de atributos de qualidade, prevenção de defeitos.
  - *2. Software Quality Management Processes:* Garantia da Qualidade de Software (SQA), Verificação e Validação (V&V), Revisões por Pares (*Peer Reviews* e *Walkthroughs*), Auditorias de Processo e Conformidade.
  - *3. Practical Considerations:* Medição e métricas de qualidade de software, classificação e rastreamento de defeitos, identificação de requisitos críticos de confiabilidade.
  - *4. Software Quality Tools:* Ferramentas de análise estática de código (SAST, Linters), analisadores de complexidade ciclomática e rastreamento de cobertura.
- **IEEE Std 730-2014 (*IEEE Standard for Software Quality Assurance Processes*):** Norma internacional que estipula os requisitos formais para o planejamento, execução, controle e governança dos processos de SQA em sistemas críticos e empresariais.
- **ISO/IEC 25010:2023 (*Systems and software engineering -- SQuaRE -- Product quality model*):** Modelo de 8 características de qualidade de software (Adequação Funcional, Eficiência de Performance, Compatibilidade, Usabilidade, Confiabilidade, Segurança, Manutenibilidade e Portabilidade).
- **ISO/IEC/IEEE 12207:2017 (Clause 6.3.8 -- Quality Assurance Process):** Processo do ciclo de vida que provê garantia independente de que produtos e processos aderem aos requisitos e planos.

---

## 2. Estrutura Obrigatória do Documento

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

## 3. Modelos de Tabelas e Checklists em LaTeX

### Definition of Done (DoD) Padronizada
> **Diretriz:** NÃO utilize caixas gráficas de destaque (`destaque`, `tcolorbox`). Apresente a Definition of Done como subseção editorial limpa:

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

## 4. Checklist de Qualidade do Agente

- [ ] O plano estabelece critérios claros de Definition of Done (DoD) mensuráveis?
- [ ] O processo de Code Review possui checklist estruturado para os revisores?
- [ ] As ferramentas de análise estática e segurança (SAST) estão integradas à esteira automatizada?
- [ ] As métricas de qualidade cobrem tanto a qualidade do produto quanto a estabilidade dos processos de entrega?
