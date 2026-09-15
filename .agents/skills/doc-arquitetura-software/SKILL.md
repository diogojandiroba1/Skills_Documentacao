---
name: doc-arquitetura-software
description: Orienta o agente na elaboração formal do Documento de Arquitetura de Software (SAD) em estrita conformidade com as normas ISO/IEC/IEEE 42010:2022 e 42020:2019, framework ArchCaMo, modelo de visões 4+1 de Kruchten estendido com Segurança/LGPD, catálogo de ADRs e guia de modelagem no StarUML v7.0.
---

# Skill: Elaboração de Documento de Arquitetura de Software (SAD)

Esta skill orienta o agente na concepção, fundamentação técnica e documentação formal da **Arquitetura de Software (SAD - Software Architecture Document)**, em estrita conformidade com as normas internacionais **ISO/IEC/IEEE 42010:2022** e **ISO/IEC/IEEE 42020:2019**, embasada na Área de Conhecimento de Arquitetura de Software do **SWEBOK v4** (Capítulo 2) e no framework de completude **ArchCaMo**.

O agente desempenha o papel duplo de **Arquiteto Chefe Documentador** e **Copiloto de Modelagem no StarUML v7.0**, fornecendo a especificação arquitetural textual, fundamentação das decisões (ADRs) e orientações determinísticas para desenhar os diagramas das visões 4+1 no StarUML v7.0.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas ISO/IEC/IEEE)

O trabalho do arquiteto deve apoiar-se nos pilares teóricos formais da disciplina:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 2 -- Software Architecture (Área de Conhecimento Dedicada no SWEBOK v4):**
    * *Architecture Fundamentals:* Requisitos Arquiteturalmente Significantes (ASRs), táticas e padrões arquiteturais (Clean, Hexagonal, Microservices, Event-Driven), estruturas estáticas e dinâmicas;
    * *Architecture Description:* Uso formal de pontos de vista (Viewpoints), visões (Views), regras de correspondência e modelos conforme a ISO 42010;
    * *Architecture Synthesis and Design:* Tomada de decisões fundamentadas, balanceamento de trade-offs de atributos de qualidade (desempenho vs. manutenibilidade vs. segurança);
    * *Architecture Decisions & Rationale Management:* Registro e versionamento de Architecture Decision Records (ADRs) como artefatos contratuais de ciclo de vida;
    * *Architecture Evaluation:* Verificação formal de completude frente às preocupações (Concerns) dos stakeholders.
* **Normas Internacionais:**
  * **ISO/IEC/IEEE 42010:2022:** *Systems and software engineering -- Architecture description* (Padrão de referência global para entidades arquiteturais: Stakeholder, Concern, Viewpoint, View, Architecture Decision, Rationale);
  * **ISO/IEC/IEEE 42020:2019:** *Software, systems and enterprise -- Architecture processes*;
  * **Modelo de Visões 4+1 de Kruchten (Estendido):** Visões Lógica, de Processos, de Desenvolvimento e Física unificadas pela Visão de Cenários, estendidas com a Visão Transversal de Segurança e Privacidade (LGPD / ISO 27001);
  * **Framework ArchCaMo:** Modelo de catálogo para garantia de completude descritiva de sistemas de interesse.

---

## 2. Estrutura Obrigatória do Documento

1. **Abordagem de Descrição Arquitetural**
   - Fundamentação metodológica com base na ISO/IEC/IEEE 42010:2022;
   - Explicação do framework de completude **ArchCaMo** e critérios de rastreabilidade.

2. **Sistema de Interesse, Ambiente e Escopo Arquitetural**
   - **Sistema de Interesse:** Definição formal do software arquitetado;
   - **Ambiente:** Contexto organizacional, perfil dos usuários e ecossistema operacional;
   - **Escopo Arquitetural:** Tabela explícita delimitando o que está *Dentro do Escopo (In-Scope)* e o que está *Fora do Escopo (Out-of-Scope)*.

3. **Stakeholders e Concerns Arquiteturais**
   - **Stakeholders Atômicos:** Identificação de cada parte interessada com responsabilidade e impacto arquitetural direto (ex.: Dev Front, Dev Back, DevOps/SRE, DPO/Conformidade, Operadores de Negócio);
   - **Concerns (Preocupações Arquiteturais):** Requisitos arquiteturais não-funcionais e restrições catalogados como `C1`, `C2`, ... (ex.: Controle de Acesso e Segurança, Desempenho e Latência, Integridade e Concorrência, Resiliência e Recuperação);
   - **Matriz Concern $\times$ Stakeholder:** Cruzamento formal demonstrando qual preocupação afeta cada parte interessada.

4. **Viewpoints e Views Arquiteturais (Modelo 4+1 Estendido com Segurança)**
   1. **Visão de Cenários:** Casos de uso arquiteturalmente significantes (ASRs) que impõem desafios aos atributos de qualidade;
   2. **Visão Lógica:** Decomposição em subsistemas, módulos e componentes (Bounded Contexts), explicitando contratos de interface;
   3. **Visão de Processos:** Modelo de execução, concorrência, controle de transações (ACID / Saga), comunicação síncrona (REST) vs assíncrona (filas/eventos), latência e escalabilidade;
   4. **Visão de Desenvolvimento:** Padrão arquitetural adotado (Clean Architecture / Hexagonal / Camadas MVC), convenções de organização física de pacotes e dependências de build;
   5. **Visão Física / Implantação:** Topologia de rede, contêineres Docker, orquestração, nós computacionais e instâncias de persistência gerenciada em nuvem;
   6. **Visão de Segurança e Conformidade (LGPD):** Modelo de autenticação (JWT stateless), autorização granular (RBAC), criptografia em repouso (AES-256) e em trânsito (TLS 1.3), rastreabilidade de acessos e auditoria de logs imutáveis.

5. **Decisões Arquiteturais e Rationale (Catálogo de ADRs)**
   - Todo projeto deve conter ao menos 3 a 5 **ADRs (Architecture Decision Records)** detalhadas:
     - Título e Identificador (`ADR-01`, `ADR-02`, ...);
     - Contexto e Problema motivador;
     - Decisão adotada;
     - Consequências positivas e negativas (trade-offs assumidos).

6. **Matriz de Rastreabilidade Arquitetural**
   - Matriz cruzando: **Concern (C) $\rightarrow$ Visão $\rightarrow$ Modelo / Diagrama $\rightarrow$ Decisão (ADR)**.

---

## 3. Modelos de Tabelas e ADRs em LaTeX

### Matriz Concern x Stakeholder (Padrão Booktabs)
```latex
\begin{table}[htbp]
\caption{Matriz de Preocupações Arquiteturais por Stakeholder}
\label{tab:concern_stakeholder}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l l Y l @{}}
\toprule
\textbf{ID} & \textbf{Stakeholder} & \textbf{Responsabilidade Arquitetural} & \textbf{Concerns Vinculados} \\
\midrule
S1 & Desenvolvedor Front-end & Consumo de APIs REST e estado de interface assíncrono. & C2, C3, C6 \\
S2 & Desenvolvedor Back-end & Regras de negócio, concorrência e persistência transacional. & C1, C2, C4, C5 \\
S3 & Encarregado de Dados (DPO) & Governança, auditoria de acessos e conformidade com LGPD. & C1, C4 \\
S4 & Engenheiro de DevOps & Orquestração Docker, pipelines CI/CD e monitoramento de nós. & C3, C5, C7 \\
\bottomrule
\end{tabularx}
\end{table}
```

### Registro de Decisão Arquitetural (ADR)
```latex
\subsection{ADR-01: Arquitetura em Camadas com Separação de Domínio}
\textbf{Status:} Aprovado \quad|\quad \textbf{Data:} 2026-09-14 \quad|\quad \textbf{Decisores:} Diogo Santos Pires Jandiroba

\paragraph{Contexto e Definição do Problema:}
A clínica manipula regras complexas de faturamento e prescrições médicas. O acoplamento entre o framework web (FastAPI) e as regras de negócio dificultaria a execução de testes automatizados independentes.

\paragraph{Decisão Arquitetural Adotada:}
Adotar arquitetura em 4 camadas bem delimitadas: Apresentação (API/Controllers), Aplicação (Casos de Uso), Domínio (Entidades e Regras Puras) e Infraestrutura (Repositórios SQLAlchemy e adaptadores).

\paragraph{Consequências Positivas:}
Desacoplamento total do framework web, facilidade de mockagem nos testes unitários e facilidade de substituição ou evolução do banco de dados.

\paragraph{Trade-offs e Impactos Negativos:}
Maior quantidade inicial de arquivos e necessidade de conversores de DTOs para entidades de domínio.
```

---

## 4. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

O agente deve guiar o arquiteto na construção de cada visão no **StarUML v7.0**:

### 4.1. Visão Lógica (Component Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Component Diagram` e nomeie como `arch_visao_logica`;
2. **Componentes:** Arraste **`Component`** para cada subsistema (ex.: `Interface Web React`, `API Gateway / Nginx`, `Serviço de Agendamento`, `Serviço de Prontuário`, `Serviço de Notificações`);
3. **Interfaces:** Use **`Interface`** com notação Lollipop/Socket (*Provided / Required Interfaces*):
   - Arraste a interface fornecida (círculo com haste) pelo backend (ex.: `IAgendamentoAPI`);
   - Conecte o componente consumidor via **`Dependency`** (seta tracejada) ao soquete;
4. **Persistência:** Represente o banco de dados como componente com estereótipo `<<database>>` (ex.: `PostgreSQL 16`).

### 4.2. Visão de Desenvolvimento (Package Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Package Diagram` e nomeie como `arch_visao_desenvolvimento`;
2. **Pacotes em Camadas:** Arraste **`Package`** da Toolbox e posicione em camadas verticais:
   - Topo: `Camada de Apresentação` (Controllers, Schemas DTO);
   - Intermediário 1: `Camada de Aplicação` (Casos de Uso, Portas de Entrada);
   - Centro: `Camada de Domínio` (Entidades Puras, Regras de Negócio, Interfaces de Repositório);
   - Base/Lateral: `Camada de Infraestrutura` (Implementações SQLAlchemy, Clientes HTTP, Adaptadores de Email);
3. **Dependências Estritas:** Arraste **`Dependency`** mostrando o fluxo unidirecional de chamadas (Apresentação $\rightarrow$ Aplicação $\rightarrow$ Domínio $\leftarrow$ Infraestrutura), assegurando que o Domínio seja agnóstico a frameworks.

### 4.3. Visão de Processos (Sequence / Activity Diagram)
1. **No Model Explorer:** Selecione `Add Diagram -> Sequence Diagram` ou `Activity Diagram` e nomeie como `arch_visao_processos`;
2. **Concorrência e Assincronismo:**
   - Lifelines representando processos concorrentes: `Worker Assíncrono`, `Fila de Mensagens / RabbitMQ`, `Serviço de Cache / Redis`, `Serviço de Banco de Dados`;
   - Destaque chamadas assíncronas via **`AsyncMessage`** e tratamentos de transações distribuídas (Saga ou commit em duas fases).

### 4.4. Visão Física / de Implantação (Deployment Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Deployment Diagram` e nomeie como `arch_visao_implantacao`;
2. **Nós de Hardware e Nuvem:** Arraste **`Node`** (cubo 3D) para cada servidor ou serviço de infraestrutura (ex.: `Servidor de Borda Cloud`, `Instância EC2 / VPS`, `Cluster RDS Gerenciado`);
3. **Ambientes de Execução:** Dentro dos nós, insira **`ExecutionEnvironment`** (ex.: `Docker Engine v26`, `Node.js Runtime`, `Python 3.12 Runtime`);
4. **Artefatos Implantados:** Dentro dos ambientes de execução, insira **`Artifact`** representando contêineres e imagens (ex.: `api-service:latest.tar`, `nginx-proxy.conf`);
5. **Caminhos de Comunicação:** Use **`CommunicationPath`** conectando os nós com os protocolos estereotipados: `<<HTTPS / TLS 1.3>>`, `<<TCP / Porta 5432>>`, `<<gRPC>>`.

### 4.5. Visão de Segurança e Conformidade (LGPD)
1. **No Model Explorer:** Selecione `Add Diagram -> Component Diagram` e nomeie como `arch_visao_seguranca`;
2. **Zonas Perimetrais:** Utilize retângulos de fronteira delimitando **Zona Desmilitarizada (DMZ / Borda Pública)**, **Zona de Aplicação Privada (VPC)** e **Zona Segura de Dados Sensíveis**;
3. **Mecanismos de Segurança:** Modele componentes com estereótipos explícitos: `<<WAF / Cloudflare>>`, `<<OAuth2 / JWT Provider>>`, `<<AES-256 Volume Criptografado>>`, `<<Audit Log Imutável>>`.

---

### 4.6. Exportação e Inclusão no Template LaTeX

1. **Exportação no StarUML v7.0:**
   - Acesse **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
   - Configuração: Fundo branco, resolução **2x ou 3x (300 DPI)**;
   - Salvar em `Template_Unificado_LATEX/Imagens/` com os seguintes nomes:
     - `Imagens/arch_visao_logica.png`
     - `Imagens/arch_visao_processos.png`
     - `Imagens/arch_visao_desenvolvimento.png`
     - `Imagens/arch_visao_implantacao.png`
     - `Imagens/arch_visao_seguranca.png`

2. **Ativação no LaTeX (`Capitulos/04_Arquitetura_Software.tex`):**
   ```latex
   \incluirdiagrama{Imagens/arch_visao_logica.png}{Visão Lógica da Arquitetura (Componentes)}{fig:arch_visao_logica}
   \incluirdiagrama{Imagens/arch_visao_processos.png}{Visão de Processos e Concorrência}{fig:arch_visao_processos}
   \incluirdiagrama{Imagens/arch_visao_desenvolvimento.png}{Visão de Desenvolvimento (Pacotes)}{fig:arch_visao_desenvolvimento}
   \incluirdiagrama{Imagens/arch_visao_implantacao.png}{Visão Física e de Implantação (Nós e Docker)}{fig:arch_visao_implantacao}
   \incluirdiagrama{Imagens/arch_visao_seguranca.png}{Visão de Segurança e Conformidade LGPD}{fig:arch_visao_seguranca}
   ```

---

## 5. Checklist de Qualidade e Conformidade ArchCaMo

- [ ] Todos os 11 a 12 concerns arquiteturais estão justificados da perspectiva de cada stakeholder?
- [ ] A visão de segurança cobre autenticação, autorização RBAC, criptografia e conformidade com LGPD?
- [ ] As ADRs registram tanto os benefícios quanto as desvantagens e trade-offs assumidos?
- [ ] Há matriz de rastreabilidade completa conectando Concerns $\rightarrow$ Visões $\rightarrow$ Modelos $\rightarrow$ Decisões?
- [ ] O modelo 4+1 cobre Cenários, Lógica, Processos, Desenvolvimento e Implantação com diagramas formais no StarUML v7.0?
- [ ] Todos os diagramas foram exportados com alta resolução e nomes padronizados em `Imagens/`?
