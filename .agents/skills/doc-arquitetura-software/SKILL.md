---
name: doc-arquitetura-software
description: Orienta o agente na elaboração formal do Documento de Arquitetura de Software (SAD), cobrindo modelo de visões 4+1 estendido com Segurança/LGPD, catálogo de ADRs, tabelas com cabeçalho bege e geração de modelos em sugests_diagrams/.
---

# Skill: Elaboração de Documento de Arquitetura de Software (SAD)

Esta skill orienta o agente na concepção, fundamentação técnica e documentação formal da **Arquitetura de Software (SAD - Software Architecture Document)**, cobrindo o modelo de visões 4+1 estendido com Segurança/LGPD, catálogo de ADRs e matrizes de rastreabilidade.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as melhores práticas de descrição arquitetural à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar ISO 42010, Kruchten ou SWEBOK no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de produzir a especificação de Arquitetura de Software (SAD) ou instruir diagramas no StarUML v7.0, o agente **NÃO deve assumir decisões arquiteturais ou stacks sem interrogar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação Arquitetural)
O agente deve formular perguntas claras agrupadas por tópicos essenciais, apresentando opções técnicas, prós, contras e recomendações:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após Casos de Uso) do projeto atual?
2. **Estilo Arquitetural e Granularidade:**
   - Qual estilo arquitetural é pretendido: *Monolito Modular*, *Arquitetura em Camadas (Clean/Hexagonal)*, *Microsserviços*, ou *Arquitetura Orientada a Eventos (EDA)*?
   - Qual a justificativa frente à maturidade da equipe e volumetria esperada?
3. **Stack Tecnológico e Decisões Críticas (ADRs):**
   - Quais tecnologias foram selecionadas para Frontend, Backend e Banco de Dados (relacional e/ou cache)?
   - Há decisões técnicas polêmicas que exigem registro em ADR (ex.: escolha de ORM, mensageria assíncrona vs chamadas REST síncronas)?
4. **Concorrência e Processamento (Visão de Processos):**
   - Quais operações exigem processamento assíncrono em segundo plano (jobs, filas de e-mail, relatórios analíticos)?
   - Como será tratada a concorrência em transações críticas (bloqueio otimista via `@Version` ou pessimista)?
5. **Topologia e Nuvem (Visão Física/Implantação):**
   - Onde o sistema será hospedado (AWS, GCP, Azure, Oracle Cloud, On-Premise)?
   - A aplicação rodará em contêineres Docker? Utilizará Kubernetes, Docker Compose ou PaaS gerenciado?
6. **Segurança e Conformidade LGPD:**
   - Qual é o modelo de autenticação e autorização (JWT stateless com refresh token, OAuth2/OIDC, RBAC granular)?
   - Como é garantida a proteção de dados sensíveis (criptografia em repouso AES-256, TLS 1.3 em trânsito, segregação de rede DMZ/VPC, logs imutáveis)?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Síntese das Diretrizes Arquiteturais** e lista preliminar de ADRs;
- **Sugestão de Diagramas do Modelo 4+1 Estendido no StarUML v7.0:**
  1. `Imagens/arch_visao_logica.png`: Visão Lógica da Arquitetura (Component Diagram);
  2. `Imagens/arch_visao_processos.png`: Visão de Processos e Concorrência (Sequence / Activity Diagram);
  3. `Imagens/arch_visao_desenvolvimento.png`: Visão de Desenvolvimento e Estrutura de Pacotes (Package Diagram);
  4. `Imagens/arch_visao_implantacao.png`: Visão Física e Nós de Infraestrutura (Deployment Diagram);
  5. `Imagens/arch_visao_seguranca.png`: Visão de Segurança Perimetral e LGPD (Component Diagram com DMZ e VPC).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova estas decisões de arquitetura, catálogo de ADRs e o conjunto de visões 4+1 sugeridos para iniciarmos a redação formal do SAD em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento gerado é um artefato técnico de arquitetura de produto. **Não cite nominalmente no texto normas ou autores** (ex.: nada de *"conforme a ISO 42010"*, *"segundo Kruchten"*, *"no modelo ArchCaMo"*). Aplique o rigor estrutural de pontos de vista (Viewpoints), visões (Views) e preocupações (Concerns) diretamente no conteúdo.
- **GRADE NÍTIDA EM TABELAS:** Todas as matrizes de rastreabilidade e tabelas arquiteturais devem possuir linhas horizontais e verticais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem ser geradas em `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Abordagem de Descrição Arquitetural**
   - Declaração do escopo arquitetural, princípios de design e critérios de modularidade.

2. **Sistema de Interesse, Ambiente e Escopo Arquitetural**
   - **Sistema de Interesse:** Definição formal do software arquitetado;
   - **Ambiente:** Contexto organizacional, perfil dos usuários e ecossistema operacional;
   - **Escopo Arquitetural:** Tabela delimitando o que está *Dentro do Escopo (In-Scope)* e o que está *Fora do Escopo (Out-of-Scope)*.

3. **Stakeholders e Concerns Arquiteturais**
   - Identificação dos stakeholders e catálogo de preocupações arquiteturais (`C1`, `C2`, ...);
   - Matriz Concern $\times$ Stakeholder.

4. **Visões Arquiteturais (Modelo 4+1 Estendido com Segurança)**
   1. **Visão de Cenários:** Casos de uso arquiteturalmente significantes (ASRs);
   2. **Visão Lógica:** Decomposição em subsistemas, módulos e contratos de interface;
   3. **Visão de Processos:** Concorrência, controle transacional, mensageria e escalabilidade;
   4. **Visão de Desenvolvimento:** Padrão arquitetural (Clean / Hexagonal / Camadas) e estrutura de pacotes;
   5. **Visão Física / Implantação:** Topologia de rede, nós, Docker e persistência em nuvem;
   6. **Visão de Segurança e Conformidade (LGPD):** Autenticação JWT, RBAC, criptografia AES-256 e auditoria.

5. **Decisões Arquiteturais e Rationale (Catálogo de ADRs)**
   - Ao menos 3 a 5 ADRs detalhadas com Contexto, Decisão Adotada, Consequências Positivas e Trade-offs.

6. **Matriz de Rastreabilidade Arquitetural**
   - Matriz: **Concern (C) $\rightarrow$ Visão $\rightarrow$ Modelo / Diagrama $\rightarrow$ Decisão (ADR)**.

---

## 4. Modelos de Tabelas e ADRs em LaTeX (Grade Nítida e Cabeçalho Bege)

### Matriz Concern x Stakeholder
```latex
\begin{table}[htbp]
\caption{Matriz de Preocupações Arquiteturais por Stakeholder}
\label{tab:concern_stakeholder}
\centering
\small
\begin{tabularx}{\textwidth}{|l|l|Y|l|}
\hline
\rowcolor{tableheaderbeige}
\textbf{ID} & \textbf{Stakeholder} & \textbf{Responsabilidade Arquitetural} & \textbf{Concerns Vinculados} \\ \hline
S1 & Desenvolvedor Front-end & Consumo de APIs REST e estado de interface assíncrono. & C2, C3, C6 \\ \hline
S2 & Desenvolvedor Back-end & Regras de negócio, concorrência e persistência transacional. & C1, C2, C4, C5 \\ \hline
S3 & Encarregado de Dados (DPO) & Governança, auditoria de acessos e conformidade com LGPD. & C1, C4 \\ \hline
S4 & Engenheiro de DevOps & Orquestração Docker, pipelines CI/CD e monitoramento de nós. & C3, C5, C7 \\ \hline
\end{tabularx}
\end{table}
```

### Registro de Decisão Arquitetural (ADR)
```latex
\subsection{ADR-01: Arquitetura em Camadas com Separação de Domínio}
\textbf{Status:} Aprovado \quad|\quad \textbf{Data:} 2026-09-14 \quad|\quad \textbf{Decisores:} Equipe de Arquitetura

\paragraph{Contexto e Definição do Problema:}
A clínica manipula regras complexas de faturamento e prescrições médicas. O acoplamento entre o framework web e as regras de negócio dificultaria a execução de testes automatizados independentes.

\paragraph{Decisão Arquitetural Adotada:}
Adotar arquitetura em camadas bem delimitadas: Apresentação (Controllers/APIs), Aplicação (Casos de Uso), Domínio (Entidades e Regras Puras) e Infraestrutura (Repositórios e adaptadores).

\paragraph{Consequências Positivas:}
Desacoplamento total do framework web, facilidade de mockagem nos testes unitários e facilidade de evolução do banco de dados.

\paragraph{Trade-offs e Impactos Negativos:}
Maior quantidade inicial de arquivos e necessidade de mapeamento explícito entre DTOs e entidades de domínio.
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para cada uma das 5 visões, o agente deve gerar uma subpasta dedicada em `sugests_diagrams/`:
- `sugests_diagrams/arch_visao_logica/`
- `sugests_diagrams/arch_visao_processos/`
- `sugests_diagrams/arch_visao_desenvolvimento/`
- `sugests_diagrams/arch_visao_implantacao/`
- `sugests_diagrams/arch_visao_seguranca/`

Cada subpasta conterá obrigatoriamente três arquivos:
1. `<nome_diagrama>.puml`: Código PlantUML do modelo arquitetural;
2. `<nome_diagrama>.png`: Imagem da prévia do PlantUML;
3. `<nome_diagrama>.md`: Roteiro textual detalhado para modelar visualmente no StarUML v7.0 (Componentes, Nós de Implantação, Pacotes, Lifelines, interfaces e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (ISO 42010, Kruchten, ArchCaMo)?
- [ ] Todas as tabelas possuem grade nítida com linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] A visão de segurança cobre autenticação, autorização RBAC, criptografia e conformidade com LGPD?
- [ ] As ADRs registram tanto os benefícios quanto as desvantagens e trade-offs assumidos?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] Há matriz de rastreabilidade completa conectando Concerns $\rightarrow$ Visões $\rightarrow$ Modelos $\rightarrow$ Decisões?
