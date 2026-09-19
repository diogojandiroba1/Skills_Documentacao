---
name: doc-plano-testes
description: Guia o agente na elaboração do Plano e Especificação de Testes de Software (STP / STD), cobrindo pirâmide de testes, casos de teste tabulados com cabeçalho bege, matriz de rastreabilidade, critérios de aceite e geração de modelos em sugests_diagrams/.
---

# Skill: Elaboração de Plano e Especificação de Testes de Software (STP / STD)

Esta skill orienta o agente na construção do **Plano e Especificação de Testes de Software (STP - Software Test Plan / STD - Software Test Description)**, fundamentando a arquitetura da pirâmide de testes, casos de teste e o ciclo de vida de defeitos.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as normas de testes à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar ISO 29119 ou IEEE 829 no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de produzir o Plano e Especificação de Testes (STP/STD) em LaTeX ou sugerir diagramas, o agente **NÃO deve assumir estratégias de teste sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação da Estratégia de Testes)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após o Design Detalhado) do projeto atual?
2. **Distribuição da Pirâmide e Escopo de Testes:**
   - Qual a proporção visada entre testes Unitários, de Integração e E2E (ex.: recomendação padrão 70% Unitários / 20% Integração / 10% E2E)?
   - Haverá testes não-funcionais automatizados (carga/estresse com k6/JMeter, testes de vulnerabilidade SAST/DAST)?
3. **Frameworks e Ferramental de Teste:**
   - Quais ferramentas e bibliotecas de teste serão adotadas (ex.: Pytest / Jest / Vitest para unitários; HTTPX / Supertest para integração; Playwright / Cypress para E2E)?
   - Como será gerenciada a massa de dados de teste (factories, fixtures, bancos em memória ou containers Docker efêmeros)?
4. **Critérios de Cobertura e Qualidade (Quality Gate):**
   - Qual a meta percentual de cobertura de código exigida para aprovação (ex.: $\ge 80\%$ de linhas/ramos de negócio)?
   - Qual a política para defeitos abertos em releases (ex.: zero bugs Blocker/Alta permitidos)?
5. **Ciclo de Vida e Gestão de Defeitos:**
   - Qual é o fluxo de triagem e reteste de defeitos adotado pela equipe?
   - Quais severidades são empregadas (Crítica/Blocker, Alta, Média, Baixa)?
6. **Cenários Críticos de Teste:**
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
> *"Você aprova esta estratégia de testes, métricas de cobertura e os diagramas sugeridos para prosseguirmos com a elaboração formal do STP/STD em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento é puramente técnico da qualidade do produto de software. Não cite no texto expressões como *"segundo a ISO/IEC/IEEE 29119"*, *"conforme IEEE 829"*, etc. Aplique a terminologia correta (defeito, erro, falha, testes caixa-branca e caixa-preta) diretamente na especificação.
- **GRADE NÍTIDA EM TABELAS:** Todas as especificações de casos de teste e matrizes de rastreabilidade devem ter linhas verticais e horizontais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem ser salvas em `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Estratégia e Abordagem de Testes**
   - Fundamentação da qualidade baseada na Pirâmide de Testes (Unitários, Integração, E2E e Não Funcionais).

2. **Ambientes e Ferramentas de Teste**
   - Ferramental técnico para cada nível de teste e isolamento de ambientes (containers efêmeros).

3. **Critérios de Entrada, Suspensão e Aceite de Versão**
   - Critérios formais de entrada, suspensão e aceite (cobertura $\ge 80\%$, zero bugs Blocker).

4. **Especificação dos Casos de Teste (CT)**
   - Todo Caso de Teste tabulado com ID, Título, Requisito Vinculado, Pré-condições, Procedimento passo a passo, Dados de Entrada, Resultado Esperado e Status.

5. **Matriz de Rastreabilidade (Requisitos $\times$ Casos de Teste)**
   - Cruzamento formal garantindo que nenhum requisito crítico fique sem cobertura de teste.

6. **Gerenciamento de Defeitos e Severidade**
   - Classificação de severidade e fluxo do ciclo de vida do defeito.

---

## 4. Modelos de Tabelas em LaTeX (Grade Nítida e Cabeçalho Bege)

### Template do Caso de Teste
```latex
\begin{table}[htbp]
\caption{Caso de Teste CT-AGE-01 -- Agendamento com Conflito de Horário}
\label{tab:ct_age_01}
\centering
\small
\renewcommand{\arraystretch}{1.25}
\begin{tabularx}{\textwidth}{|l|Y|}
\hline
\rowcolor{tableheaderbeige}
\multicolumn{2}{|l|}{\textbf{CT-AGE-01 -- Validação de Conflito em Reserva Simultânea}} \\ \hline
\textbf{Requisito / UC} & RF02 (Agendamento) / UC01 (Realizar Agendamento) \\ \hline
\textbf{Nível / Tipo} & Teste de Integração / Caixa-Preta na API REST. \\ \hline
\textbf{Pré-condições} & O profissional `P10` possui consulta confirmada para o dia `2026-10-15` às `14:00`. \\ \hline
\textbf{Procedimento} & 
1. Disparar requisição `POST /api/v1/consultas` com token de recepcionista autenticada. \newline
2. Fornecer payload JSON com `profissional_id = P10`, `data_hora = 2026-10-15T14:00:00Z` e `paciente_id = PAC20`. \newline
3. Inspecionar o código de status HTTP e o corpo da resposta. \\ \hline
\textbf{Dados de Entrada} & \texttt{\{"profissional\_id": "P10", "data\_hora": "2026-10-15T14:00:00Z", "paciente\_id": "PAC20"\}} \\ \hline
\textbf{Resultado Esperado} & Status HTTP 409 Conflict. Mensagem: \texttt{"Horário já ocupado para este profissional."} Nenhuma nova linha inserida na tabela `tb_consulta`. \\ \hline
\textbf{Status Atual} & \badgeconcluido \\ \hline
\end{tabularx}
\end{table}
```

### Matriz de Rastreabilidade Requisitos x Testes
```latex
\begin{table}[htbp]
\caption{Matriz de Rastreabilidade entre Requisitos e Casos de Teste}
\label{tab:rastreabilidade_testes}
\centering
\small
\renewcommand{\arraystretch}{1.25}
\begin{tabularx}{\textwidth}{|l|l|Y|c|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Requisito} & \textbf{Descrição do Requisito} & \textbf{Casos de Teste Vinculados} & \textbf{Status} \\ \hline
RF01 & Autenticação e Gestão de Sessão & CT-AUTH-01, CT-AUTH-02, CT-AUTH-03 & \badgeconcluido \\ \hline
RF02 & Agendamento de Consultas & CT-AGE-01, CT-AGE-02, CT-AGE-03 & \badgeconcluido \\ \hline
RF03 & Registro de Prontuário Clínico & CT-PEP-01, CT-PEP-02 & \badgeemprogresso \\ \hline
RNF01 & Tempo de resposta $P95 \le 2{,}0$s & CT-PERF-01 (Carga via k6) & \badgeconcluido \\ \hline
\end{tabularx}
\end{table}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para cada diagrama deste capítulo, o agente deve gerar uma subpasta dedicada em `sugests_diagrams/`:
- `sugests_diagrams/test_piramide_estrategia/`
- `sugests_diagrams/test_ciclo_defeito/`

Cada subpasta conterá obrigatoriamente três arquivos:
1. `<nome_diagrama>.puml`: Código PlantUML do modelo de teste;
2. `<nome_diagrama>.png`: Imagem da prévia do PlantUML;
3. `<nome_diagrama>.md`: Roteiro textual detalhado para modelar no StarUML v7.0 (Camadas da Pirâmide, Estados do Defeito, transições com triggers/guards e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (ISO 29119, IEEE 829)?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] Todos os casos de teste possuem dados de entrada concretos e resultado esperado verificável?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] Os critérios de aceite estabelecem porcentagem de cobertura de código objetiva ($\ge 80\%$)?
- [ ] A matriz de rastreabilidade cobre requisitos funcionais e requisitos não funcionais?
