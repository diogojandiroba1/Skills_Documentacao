---
name: doc-gerencia-configuracao
description: Guia o agente na elaboração do Plano de Gerência de Configuração de Software (SCM Plan) em conformidade com a norma IEEE Std 828, abordando estratégia de branching, baselines, SemVer, controle de mudanças (CCB) e modelagem no StarUML v7.0.
---

# Skill: Plano de Gerência de Configuração de Software (SCM Plan)

Esta skill orienta o agente na formulação do **Plano de Gerência de Configuração de Software (SCM Plan - Software Configuration Management Plan)**, estruturado com base na norma internacional **IEEE Std 828** e nas melhores práticas de engenharia de software e DevOps de mercado.

O agente atua simultaneamente como **gerente de configuração de software** e **copiloto de modelagem visual no StarUML v7.0**, prescrevendo como modelar o fluxo de branches e o ciclo de vida de solicitações de mudança (RFC/CCB).

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

Esta skill está fundamentada nos preceitos formais da Engenharia de Software:
- **SWEBOK v4 -- Capítulo 6 (Software Configuration Management KA):**
  - *1. Management of the SCM Process:* Contexto organizacional, plano de SCM, monitoramento e vigilância de processos.
  - *2. Software Configuration Identification:* Identificação de Itens de Configuração (CIs), esquema de nomenclatura de artefatos, linhas de base (*baselines*) e aquisição de CIs.
  - *3. Software Configuration Control:* Fluxo formal de controle de mudanças (submissão, avaliação técnica/financeira, aprovação via CCB, implementação e verificação).
  - *4. Software Configuration Status Accounting:* Registro contínuo, rastreabilidade e relatórios de status dos itens de configuração.
  - *5. Software Configuration Auditing:* Auditorias Funcionais de Configuração (FCA - conformidade com requisitos) e Físicas de Configuração (PCA - completude física da entrega).
  - *6. Software Release Management and Delivery:* Versionamento, compilação de releases, empacotamento, entrega e recuperação de desastres.
- **IEEE Std 828-2012 (*Standard for Configuration Management in Systems and Software Engineering*):** Norma de referência internacional que padroniza o ciclo de vida da gerência de configuração, papéis, responsabilidades e procedimentos de auditoria.
- **ISO/IEC/IEEE 12207:2017 (Clause 6.3.5 -- Configuration Management Process):** Estabelece o processo de gerência de configuração no ciclo de vida de software.
- **Semantic Versioning 2.0.0 (SemVer):** Especificação formal para controle determinístico de evolução de APIs e interfaces de software.
- **Conventional Commits 1.0.0:** Especificação estruturada para histórico de commits legível por humanos e ferramentas de automação.

---

## 2. Estrutura Obrigatória do Documento

1. **Introdução e Escopo do SCM**
   - Propósito do plano de gerência de configuração no ciclo de vida;
   - Itens de Configuração (CIs - Configuration Items) controlados: código-fonte, scripts DDL de banco de dados, arquivos de configuração (`.env.example`, Dockerfiles), documentação técnica e pacotes de release.

2. **Estratégia de Controle de Versão e Modelo de Branching**
   - Definição formal do fluxo de trabalho no Git (Trunk-Based Development ou GitFlow adaptado);
   - Políticas de branches:
     - `main`: Código estável em produção (imutável sem Pull Request aprovado);
     - `staging` / `develop`: Código integrado para homologação;
     - `feature/*`: Desenvolvimento de novas funcionalidades isoladas;
     - `hotfix/*`: Correções emergenciais diretamente para a branch de produção;
     - `release/*`: Estabilização e corte de versão.
   - Padrão de mensagens de commit (Conventional Commits: `feat:`, `fix:`, `refactor:`, `docs:`, `chore:`).

3. **Política de Versionamento Semântico e Baselines**
   - Especificação do padrão **SemVer 2.0.0** (`MAJOR.MINOR.PATCH`):
     - `MAJOR`: Quebras de compatibilidade de API ou arquitetura;
     - `MINOR`: Novas funcionalidades compatíveis com versões anteriores;
     - `PATCH`: Correções de bugs e vulnerabilidades;
   - Definição de **Baselines do Projeto:** Momentos formais em que o estado do software é congelado e etiquetado com Git Tags assinadas (ex.: `v1.0.0`, `v1.1.0`).

4. **Gerenciamento de Mudanças e Comitê de Controle (CCB)**
   - Fluxo formal para Solicitações de Mudança (RFC - Request for Change):
     - Submissão da solicitação $\rightarrow$ Avaliação de impacto técnico e de negócio $\rightarrow$ Aprovação pelo Comitê $\rightarrow$ Implementação em branch $\rightarrow$ Homologação $\rightarrow$ Release;
   - Composição do **Change Control Board (CCB):** Papéis do Arquiteto, Tech Lead, Product Owner e Engenheiro de Operações.

5. **Auditorias de Configuração e Rastreabilidade**
   - **Auditoria Física de Configuração (PCA):** Verifica se todos os itens de configuração especificados foram efetivamente construídos e entregues;
   - **Auditoria Funcional de Configuração (FCA):** Valida se o software atende rigorosamente aos requisitos especificados através dos testes automatizados;
   - Mecanismos de geração automática de **Changelog** a partir dos commits.

---

## 3. Modelos de Tabelas e Fluxos em LaTeX

### Matriz de Itens de Configuração (CIs)
```latex
\begin{table}[htbp]
\caption{Matriz de Itens de Configuração do Projeto}
\label{tab:itens_configuracao}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l l Y l @{}}
\toprule
\textbf{Identificador} & \textbf{Tipo de Item} & \textbf{Repositório / Localização} & \textbf{Responsável} \\
\midrule
CI-CODE-BACK & Código Back-end & \texttt{git:backend/src} & Tech Lead Back-end \\
CI-CODE-FRONT & Código Front-end & \texttt{git:frontend/src} & Tech Lead Front-end \\
CI-DB-SCHEMA & Migrações de BD & \texttt{git:backend/alembic/versions} & DBA / Engenheiro de Dados \\
CI-DOC-TECH & Especificação Técnica & \texttt{git:docs/technical\_spec.pdf} & Arquiteto de Software \\
CI-INFRA-IAC & Configuração Docker & \texttt{git:deploy/docker-compose.yml} & Engenheiro de DevOps \\
\bottomrule
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

## 4. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

### 4.1. Estratégia de Branching no Git (Activity Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Activity Diagram` e nomeie como `scm_branching_model`;
2. **Raias de Branches (Swimlanes):** Crie raias horizontais para: `main (Produção)`, `staging (Homologação)`, `feature/*` e `hotfix/*`;
3. **Ações:** Modele o fluxo desde `Criar Branch a partir de main/staging`, `Commits locais`, `Pull Request`, `Execução de CI`, `Code Review (2 aprovações)` até `Merge Squash` e `Tag SemVer`.

### 4.2. Ciclo de Mudança e Aprovação CCB (Statechart Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Statechart Diagram` e nomeie como `scm_fluxo_ccb`;
2. **Estados da Mudança:** `Proposta` $\rightarrow$ `Em Avaliação de Impacto` $\rightarrow$ `Aprovada pelo CCB` (ou `Rejeitada`) $\rightarrow$ `Em Implementação` $\rightarrow$ `Homologada` $\rightarrow$ `Implantada em Baseline`;
3. **Exportação:** Exporte via **`File` -> `Export Diagram as` -> `PNG...`** (300 DPI, fundo branco) para `Template_Unificado_LATEX/Imagens/scm_branching_model.png` e `Imagens/scm_fluxo_ccb.png`.

---

## 5. Checklist de Qualidade do Agente

- [ ] A estratégia de branches está explicitada com regras formais de proteção?
- [ ] A política de SemVer 2.0.0 define os critérios objetivos para MAJOR, MINOR e PATCH?
- [ ] O fluxo do CCB e o modelo de branches foram orientados para modelagem no StarUML v7.0?
- [ ] Os itens de configuração cobrem código, esquemas de banco, Docker e documentação?
