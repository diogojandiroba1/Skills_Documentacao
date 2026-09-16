---
name: doc-plano-testes
description: Guia o agente na elaboração do Plano e Especificação de Testes de Software (STP / STD) conforme a norma ISO/IEC/IEEE 29119, cobrindo pirâmide de testes, casos de teste tabulados, matriz de rastreabilidade, critérios de aceite e modelagem no StarUML v7.0.
---

# Skill: Elaboração de Plano e Especificação de Testes de Software (STP / STD)

Esta skill orienta o agente na construção do **Plano e Especificação de Testes de Software (STP - Software Test Plan / STD - Software Test Description)** em estrita conformidade com a norma internacional **ISO/IEC/IEEE 29119 (Partes 1 a 4)** e a norma **IEEE Std 829-2008**, fundamentada na Área de Conhecimento de Testes de Software do **SWEBOK v4** (Capítulo 4).

O agente atua simultaneamente como **engenheiro de qualidade e testes** e **copiloto de modelagem visual no StarUML v7.0**, instruindo a estruturação da arquitetura da pirâmide de testes e o ciclo de vida do defeito diretamente na ferramenta de modelagem.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de produzir o Plano e Especificação de Testes (STP/STD) em LaTeX ou orientar diagramas no StarUML v7.0, o agente **NÃO deve assumir estratégias de teste sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação da Estratégia de Testes)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Distribuição da Pirâmide e Escopo de Testes:**
   - Qual a proporção visada entre testes Unitários, de Integração e E2E (ex.: recomendação padrão 70% Unitários / 20% Integração / 10% E2E)?
   - Haverá testes não-funcionais automatizados (carga/estresse com k6/JMeter, testes de vulnerabilidade SAST/DAST)?
2. **Frameworks e Ferramental de Teste:**
   - Quais ferramentas e bibliotecas de teste serão adotadas (ex.: Pytest / Jest / Vitest para unitários; HTTPX / Supertest para integração; Playwright / Cypress para E2E)?
   - Como será gerenciada a massa de dados de teste (factories, fixtures, bancos em memória ou containers Docker efêmeros)?
3. **Critérios de Cobertura e Qualidade (Quality Gate):**
   - Qual a meta percentual de cobertura de código exigida para aprovação (ex.: $\ge 80\%$ de linhas/ramos de negócio)?
   - Qual a política para defeitos abertos em releases (ex.: zero bugs Blocker/Alta permitidos)?
4. **Ciclo de Vida e Gestão de Defeitos:**
   - Qual é o fluxo de triagem e reteste de defeitos adotado pela equipe?
   - Quais severidades são empregadas (Crítica/Blocker, Alta, Média, Baixa)?
5. **Cenários Críticos de Teste:**
   - Quais são os casos de teste prioritários obrigatórios que cobrem os requisitos mais vitais do sistema?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Estratégia da Pirâmide de Testes** com metas de cobertura e ferramentas;
- **Matriz de Casos de Teste (CTs)** prioritários e rastreabilidade com RFs e RNFs;
- **Sugestão de Diagramas para Construção no StarUML v7.0:**
  1. `Imagens/test_piramide_estrategia.png`: Pirâmide e Níveis de Testes Automatizados (Package / Component Diagram);
  2. `Imagens/test_ciclo_defeito.png`: Ciclo de Vida do Defeito e Transições de Estado (Statechart Diagram).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova esta estratégia de testes, métricas de cobertura e os diagramas sugeridos para prosseguirmos com a elaboração formal do STP/STD em LaTeX e o guia do StarUML v7.0?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Fundamentação Teórica (SWEBOK v4 e Normas ISO/IEC/IEEE)

O teste de software é uma disciplina de verificação e validação empírica e sistemática:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 4 -- Software Testing:**
    * *Testing Fundamentals:* Definição rigorosa de Falha (*Fault*), Erro (*Error*) e Quebra (*Failure*); distinção entre Verificação (construir o software corretamente) e Validação (construir o software correto);
    * *Testing Levels & Targets:* Teste Unitário (isolamento de componentes), Teste de Integração (interfaces e protocolos), Teste de Sistema (atendimento global a requisitos funcionais e não-funcionais) e Teste de Aceitação;
    * *Test Techniques:* Técnicas baseadas em especificação (*Black-box*: Particionamento em Classes de Equivalência, Análise de Valor Limite, Tabela de Decisão e Transição de Estados) e técnicas baseadas em código (*White-box*: Cobertura de Instrução, Desvio e Condição);
    * *Test Process & Management:* Planejamento de testes, critérios formais de entrada, suspensão, retomada e aceite de versão (*Entry/Suspension/Exit Criteria*); gerenciamento de suítes de regressão contínua;
    * *Test-Related Measures:* Cobertura de código ($\ge 80\%$), densidade de defeitos e taxa de sucesso de execução de casos de teste.
* **Normas Internacionais:**
  * **ISO/IEC/IEEE 29119:** *Software and systems engineering -- Software testing:*
    * *Part 1 (Concepts and Definitions):* Vocabulário e princípios de teste;
    * *Part 2 (Test Processes):* Processos organizacionais, de gerenciamento e dinâmicos de teste;
    * *Part 3 (Test Documentation):* Templates para Plano de Teste (STP), Especificação de Design de Teste (TDS), Especificação de Caso de Teste (TCS) e Relatório de Execução;
    * *Part 4 (Test Techniques):* Algoritmos de cálculo de casos de teste por partição e valores limite;
  * **IEEE Std 829-2008:** *Standard for Software and System Test Documentation*;
  * **IEEE Std 1044-2009:** *Standard Classification for Software Anomalies* (Classificação de Severidade: Crítica/Blocker, Alta, Média, Baixa).

---

## 3. Estrutura Obrigatória do Documento

1. **Estratégia e Abordagem de Testes**
   - Fundamentação da qualidade baseada na **Pirâmide de Testes**:
     - **Testes Unitários (Base da Pirâmide):** Alta velocidade, baixo custo, foco em funções isoladas e entidades de domínio;
     - **Testes de Integração:** Validação de chamadas entre serviços, rotas da API, transações com banco e serviços externos;
     - **Testes de Sistema e Ponta a Ponta (E2E):** Simulação da jornada real do usuário a partir da interface gráfica;
     - **Testes Não Funcionais:** Testes de carga e estresse (medição de latência e throughput), testes de vulnerabilidade e segurança (OWASP).

2. **Ambientes e Ferramentas de Teste**
   - Ferramental técnico para cada nível de teste (ex.: Pytest, HTTPX, Vitest, React Testing Library, Playwright, k6);
   - Isolamento do ambiente de teste (uso de containers dedicados e bancos de teste descartáveis).

3. **Critérios de Entrada, Suspensão e Aceite de Versão**
   - **Critérios de Entrada:** Código com build limpo, sem erros de linter e migrações aplicadas;
   - **Critérios de Suspensão:** Indisponibilidade de infraestrutura de teste ou defeito bloqueante que impeça a execução da suíte;
   - **Critérios de Aceite:**
     - Cobertura mínima de código $\ge 80\%$ das linhas de negócio;
     - $100\%$ dos testes automatizados de regressão com status de aprovação;
     - Zero defeitos de severidade Crítica (Blocker) ou Alta abertos.

4. **Especificação dos Casos de Teste (CT)**
   - Todo Caso de Teste deve ser documentado em formato tabular padronizado:
     - **ID do Caso de Teste:** `CTxx` ou `CT-MODULO-xx`;
     - **Título:** Objetivo explícito do teste;
     - **Requisito / Caso de Uso Vinculado:** Rastreabilidade formal;
     - **Pré-condições:** Estado inicial necessário do sistema e massa de dados pré-existente;
     - **Procedimento de Teste:** Passos numerados executados pelo testador ou script;
     - **Dados de Entrada (Payload):** Valores exatos fornecidos;
     - **Resultado Esperado:** Código de status HTTP, mensagem retornada e alterações esperadas no banco;
     - **Resultado Obtido e Status:** Concluído com Sucesso / Falha / Bloqueado.

5. **Matriz de Rastreabilidade (Requisitos $\times$ Casos de Teste)**
   - Cruzamento formal garantindo que nenhum requisito funcional ou não-funcional crítico fique sem cobertura de teste.

6. **Gerenciamento de Defeitos e Severidade**
   - Classificação dos bugs (Crítico, Alto, Médio, Baixo) e fluxo do ciclo de vida do defeito (Novo $\rightarrow$ Em Análise $\rightarrow$ Corrigido $\rightarrow$ Re-testado $\rightarrow$ Fechado).

---

## 4. Modelos de Tabelas em LaTeX

### Template do Caso de Teste
```latex
\begin{table}[H]
\caption{Caso de Teste CT-AGE-01 -- Agendamento com Conflito de Horário}
\label{tab:ct_age_01}
\centering
\small
\renewcommand{\arraystretch}{1.25}
\begin{tabularx}{\textwidth}{@{} l Y @{}}
\toprule
\multicolumn{2}{@{}l}{\textbf{CT-AGE-01 -- Validação de Conflito em Reserva Simultânea}} \\
\midrule
\textbf{Requisito / UC} & RF02 (Agendamento) / UC01 (Realizar Agendamento) \\
\textbf{Nível / Tipo} & Teste de Integração / Caixa-Preta na API REST. \\
\textbf{Pré-condições} & O profissional `P10` possui consulta confirmada para o dia `2026-10-15` às `14:00`. \\
\textbf{Procedimento} & 
1. Disparar requisição `POST /api/v1/consultas` com token de recepcionista autenticada. \newline
2. Fornecer payload JSON com `profissional_id = P10`, `data_hora = 2026-10-15T14:00:00Z` e `paciente_id = PAC20`. \newline
3. Inspecionar o código de status HTTP e o corpo da resposta. \\
\textbf{Dados de Entrada} & \texttt{\{"profissional\_id": "P10", "data\_hora": "2026-10-15T14:00:00Z", "paciente\_id": "PAC20"\}} \\
\textbf{Resultado Esperado} & Status HTTP 409 Conflict. Mensagem: \texttt{"Horário já ocupado para este profissional."} Nenhuma nova linha inserida na tabela `tb_consulta`. \\
\textbf{Status Atual} & \badgeconcluido \\
\bottomrule
\end{tabularx}
\end{table}
```

### Matriz de Rastreabilidade Requisitos x Testes (Padrão Booktabs)
```latex
\begin{table}[H]
\caption{Matriz de Rastreabilidade entre Requisitos e Casos de Teste}
\label{tab:rastreabilidade_testes}
\centering
\small
\renewcommand{\arraystretch}{1.25}
\begin{tabularx}{\textwidth}{@{} l l Y c @{}}
\toprule
\textbf{Requisito} & \textbf{Descrição do Requisito} & \textbf{Casos de Teste Vinculados} & \textbf{Status} \\
\midrule
RF01 & Autenticação e Gestão de Sessão & CT-AUTH-01, CT-AUTH-02, CT-AUTH-03 & \badgeconcluido \\
RF02 & Agendamento de Consultas & CT-AGE-01, CT-AGE-02, CT-AGE-03 & \badgeconcluido \\
RF03 & Registro de Prontuário Clínico & CT-PEP-01, CT-PEP-02 & \badgeemprogresso \\
RNF01 & Tempo de resposta $P95 \le 2{,}0$s & CT-PERF-01 (Carga via k6) & \badgeconcluido \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 5. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

### 4.1. Pirâmide e Estratégia de Testes (Component / Package Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Package Diagram` (ou `Component Diagram`) e nomeie como `test_piramide_estrategia`;
2. **Camadas da Pirâmide:**
   - Crie 3 pacotes horizontais empilhados representando os níveis de teste:
     - Topo (Menor volume, maior custo): `Testes de Sistema / E2E (10%)` (Ferramentas: Playwright / Cypress);
     - Centro (Médio volume): `Testes de Integração & API (20%)` (Ferramentas: HTTPX / Pytest / Schemathesis);
     - Base (Maior volume, execução ultrarrápida): `Testes Unitários & Domínio (70%)` (Ferramentas: Pytest / Vitest);
3. **Conexões de Cobertura:** Conecte os níveis via **`Dependency`** (`<<covers>>`) descendo para as entidades de negócio e casos de uso testados.

### 4.2. Ciclo de Vida do Defeito (Statechart Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Statechart Diagram` e nomeie como `test_ciclo_defeito`;
2. **Estados do Defeito:**
   - `Initial State` $\rightarrow$ `Novo (Submetido pelo QA)`;
   - `Em Triagem` (Classificação de severidade);
   - `Em Correção` (Alocado a desenvolvedor);
   - `Corrigido / Em Reteste` (Deploy em staging para validação);
   - `Fechado` (Homologado com sucesso) $\rightarrow$ `Final State`;
   - `Reaberto` (Falha no reteste).
3. **Transições:** Conecte os estados com **`Transition`** definindo triggers explícitos (ex.: `reprovarReteste()`).

---

### 4.3. Exportação e Inclusão no Template LaTeX

1. **Exportação no StarUML v7.0:**
   - Acesse **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
   - Resolução **2x ou 3x (300 DPI)** com **fundo branco**;
   - Salvar em `Template_Unificado_LATEX/Imagens/`:
     - `Imagens/test_piramide_estrategia.png`
     - `Imagens/test_ciclo_defeito.png`

2. **Ativação no LaTeX (`Capitulos/06_Plano_Testes.tex`):**
   ```latex
   \incluirdiagrama{Imagens/test_piramide_estrategia.png}{Pirâmide e Níveis de Testes Automatizados}{fig:test_piramide}
   ```

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa de perguntas técnicas foi realizada com o usuário e a proposta foi formalmente aprovada antes da redação?
- [ ] Todos os casos de teste possuem dados de entrada concretos e resultado esperado verificável?
- [ ] A arquitetura da pirâmide e o ciclo de vida do defeito foram prescritos para modelagem no StarUML v7.0?
- [ ] Os critérios de aceite estabelecem porcentagem de cobertura de código objetiva ($\ge 80\%$)?
- [ ] A matriz de rastreabilidade cobre requisitos funcionais e requisitos não funcionais?
- [ ] Os testes de integração cobrem cenários felizes e cenários de exceção?
