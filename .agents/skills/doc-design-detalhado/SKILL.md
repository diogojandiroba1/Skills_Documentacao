---
name: doc-design-detalhado
description: Orienta o agente na especificação técnica detalhada de software (SDD), abrangendo Mapeamento Objeto-Relacional (ORM / DDL SQL), Diagrama de Classes em Nível de Projeto, Diagramas Dinâmicos (Sequência, Estados e Atividades) e guia formal de modelagem no StarUML v7.0.
---

# Skill: Design Técnico e Modelagem Detalhada de Software (SDD)

Esta skill orienta o agente na construção do **Documento de Design de Software (SDD - Software Design Description)** em estrita conformidade com a norma **IEEE Std 1016-2009** e os processos de design detalhado da **ISO/IEC/IEEE 12207:2017**, fundamentada na Área de Conhecimento de Design de Software do **SWEBOK v4** (Capítulo 3).

O agente atua simultaneamente como **especificador técnico das estruturas de dados e contratos** e **copiloto de modelagem visual no StarUML v7.0**, fornecendo descrições atômicas, estruturadas e prescritivas para que o usuário construa os diagramas técnicos na ferramenta com máxima precisão de engenharia.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO/OMG)

O design de software detalhado conecta a arquitetura conceitual ao código-fonte executável:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 3 -- Software Design:**
    * *Design Fundamentals & Principles:* Aplicação rigorosa de alta coesão e baixo acoplamento (*Coupling and Cohesion*), encapsulamento, ocultamento de informação (*Information Hiding*) e separação de conceitos;
    * *Key Issues in Software Design:* Tratamento transacional de concorrência, persistência e integridade relacional (chaves primárias, estrangeiras e restrições ACID), manuseio padronizado de exceções e tolerância a falhas;
    * *Detailed Design & Component Level:* Especificação atômica de classes de projeto (visibilidade $+,-,\#$, tipagem rigorosa, métodos, atributos, multiplicidade e estereótipos de design patterns);
    * *Dynamic & Behavioral Modeling:* Modelagem temporal de mensagens (Diagramas de Sequência), ciclo de vida de entidades centrais (Diagramas de Máquina de Estados) e fluxos paralelos com raias de responsabilidade (Diagramas de Atividades);
    * *Software Design Quality Analysis:* Revisões formais de design e rastreabilidade para prevenção de dívida técnica.
* **Normas Internacionais:**
  * **IEEE Std 1016-2009:** *Standard for Information Technology -- Systems Design -- Software Design Descriptions (SDD)* (Padrão de referência para design de dados, componentes e interfaces);
  * **ISO/IEC/IEEE 12207:2017:** Cláusula 6.4.5 -- *Detailed Design Process*;
  * **OMG UML Specification v2.5.1:** *Unified Modeling Language Superstructure* (Class, Sequence, State Machine e Activity Diagrams).

---

## 2. Estrutura Obrigatória do Documento

1. **Mapeamento Objeto-Relacional (ORM / Esquema Físico de Banco de Dados)**
   - Definição textual estruturada de todas as tabelas do banco de dados relacional (PostgreSQL);
   - Para cada tabela: Chave Primária (PK), Chaves Estrangeiras (FK) com integridade referencial (`ON DELETE RESTRICT/CASCADE`), tipos de colunas, tamanhos máximos, nulabilidade e índices de performance;
   - Script SQL DDL executável ou esquemas de ORM (SQLAlchemy / Prisma / Hibernate).

2. **Diagrama de Classes em Nível de Projeto (Design Class Diagram)**
   - Decomposto obrigatoriamente por **Módulos / Pacotes Funcionais** (ex.: Módulo Pessoas, Módulo Agenda, Módulo Prontuário, Módulo Farmácia, Módulo Faturamento);
   - Para cada classe representada:
     - **Atributos:** Nome, visibilidade (`+` público, `-` privado, `#` protegido) e tipo de dado na linguagem de implementação (ex.: `UUID`, `String`, `datetime`);
     - **Métodos:** Assinatura completa com visibilidade, parâmetros tipados e tipo de retorno explícito (ex.: `+ agendarConsulta(dto: AgendamentoDTO): UUID`);
     - **Relacionamentos:** Multiplicidades nas extremidades (`1..1`, `0..*`, `1..*`), navegabilidade com setas direcionais, dependências (`<<use>>`) e realização de interfaces.
   - **Catálogo Sintético das Classes:** Tabela explicativa resumindo a responsabilidade de cada classe no módulo.

3. **Diagramas Dinâmicos**
   - **Diagramas de Sequência (UML Sequence):** Modela os cenários críticos e transações ACID. Apresenta lifelines, chamadas síncronas/assíncronas, blocos condicionais (`alt`), repetições (`loop`) e persistência;
   - **Diagramas de Máquinas de Estados (UML State Machine):** Obrigatório para qualquer entidade que possua ciclo de vida ou máquina de estados (ex.: Consulta: Solicitada $\rightarrow$ Confirmada $\rightarrow$ Em Atendimento $\rightarrow$ Finalizada ou Cancelada);
   - **Diagramas de Atividades (UML Activity):** Modela fluxos de processos com nós de decisão (`decisions`), divisões paralelas (`fork/join`) e raias de responsabilidade (`swimlanes`).

4. **Contratos de Integração e Status dos Casos de Uso**
   - Tabela catalogando quais Casos de Uso estão aptos à implementação e seu status no ciclo (Não Iniciado, Em Progresso, Concluído).

---

## 3. Modelos de Código e Tabelas em LaTeX

### DDL do Esquema Relacional
```latex
\subsection{Mapeamento Físico -- Módulo de Agendamento}

\begin{lstlisting}[language=SQL, caption={DDL para Criação das Tabelas de Agendamento e Grade}]
CREATE TABLE tb_grade_horario (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    profissional_id UUID NOT NULL REFERENCES tb_profissional(id),
    dia_semana SMALLINT NOT NULL CHECK (dia_semana BETWEEN 1 AND 7),
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    ativo BOOLEAN DEFAULT TRUE,
    CONSTRAINT chk_horario_valido CHECK (hora_fim > hora_inicio)
);

CREATE TABLE tb_consulta (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    paciente_id UUID NOT NULL REFERENCES tb_paciente(id),
    profissional_id UUID NOT NULL REFERENCES tb_profissional(id),
    data_hora TIMESTAMP WITH TIME ZONE NOT NULL,
    status VARCHAR(25) NOT NULL DEFAULT 'AGENDADA',
    motivo_cancelamento TEXT,
    CONSTRAINT unq_profissional_horario UNIQUE (profissional_id, data_hora)
);
CREATE INDEX idx_consulta_paciente ON tb_consulta(paciente_id);
\end{lstlisting}
```

### Tabela Sintética de Classes de Projeto
```latex
\begin{table}[htbp]
\caption{Catálogo de Classes de Projeto -- Módulo Agenda}
\label{tab:classes_agenda}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l l Y @{}}
\toprule
\textbf{Classe} & \textbf{Camada / Papel} & \textbf{Responsabilidade Central} \\
\midrule
\texttt{AgendamentoController} & Apresentação & Recebe requisições HTTP, valida schema DTO e retorna JSON. \\
\texttt{AgendarConsultaUseCase} & Aplicação & Orquestra a validação de regras de negócio e transação ACID. \\
\texttt{Consulta} & Domínio & Entidade rica que encapsula as regras de transição de estado. \\
\texttt{ConsultaRepository} & Infraestrutura & Interface de persistência executando queries assíncronas no PostgreSQL. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 4. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

O agente deve prescrever ao desenvolvedor o roteiro de criação de cada modelo no **StarUML v7.0**:

### 4.1. Diagrama de Classes em Nível de Projeto

1. **Criação do Diagrama:**
   - No *Model Explorer*, dentro do pacote do módulo, clique com o botão direito e selecione **`Add Diagram` -> `Class Diagram`**;
   - Nomeie como `cls_projeto_<modulo>` (ex.: `cls_projeto_agendamento`).

2. **Construção das Classes e Interfaces:**
   - Arraste **`Class`** ou **`Interface`** da Toolbox;
   - Atribua o estereótipo correspondente no painel de propriedades (*Stereotype*): `<<controller>>`, `<<usecase>>`, `<<repository>>`, `<<entity>>`, `<<dto>>`;
   - **Atributos:** Clique com o botão direito na classe -> **`Add` -> `Attribute`**. Configure:
     - Visibilidade: `-` (private) ou `#` (protected);
     - Nome e tipo: ex.: `- id: UUID`, `- dataHora: datetime`, `- status: StatusConsulta`.
   - **Métodos (Operations):** Clique com o botão direito -> **`Add` -> `Operation`**. Configure:
     - Visibilidade: `+` (public);
     - Assinatura completa com parâmetros e retorno tipado: ex.: `+ executar(dto: CriarAgendamentoDTO): AgendamentoResponseDTO`.

3. **Relacionamentos e Conectores:**
   - **Realização de Interface:** Selecione **`InterfaceRealization`** da classe concreta para a interface do repositório;
   - **Dependência:** Selecione **`Dependency`** com estereótipo `<<use>>` entre use cases e DTOs;
   - **Associação / Composição:** Use **`Association`** direcionada ou **`Composition`** para agregados de domínio;
   - Limite a visualização a **5 a 8 classes por diagrama** para evitar cruzamento de linhas.

---

### 4.2. Diagrama de Sequência Dinâmico

1. **Criação do Diagrama:**
   - No *Model Explorer*, selecione o caso de uso ou pacote -> **`Add Diagram` -> `Sequence Diagram`**;
   - Nomeie como `seq_<caso_uso>` (ex.: `seq_agendamento`).

2. **Configuração de Participantes (Lifelines):**
   - Arraste **`Lifeline`** da Toolbox para cada participante do fluxo:
     - Ator (ex.: `Recepcionista`);
     - Controller (ex.: `AgendamentoController`);
     - Use Case / Service (ex.: `AgendamentoService`);
     - Repository (ex.: `ConsultaRepository`);
     - SGBD (ex.: `PostgreSQL`).
   - Mantenha no máximo **5 a 6 lifelines** horizontais alinhadas no topo.

3. **Mensagens e Sincronismo:**
   - **Chamada Síncrona:** Selecione **`Message`** (seta cheia preenchida) indicando a invocação do método com parâmetros resumidos;
   - **Retorno:** Selecione **`ReplyMessage`** (linha tracejada com seta aberta) indicando o objeto retornado (ex.: `201 Created`, `ID`);
   - **Chamada Assíncrona:** Selecione **`AsyncMessage`** (linha contínua com ponta aberta) para disparos de eventos/filas;
   - **Ativação:** Assegure que as barras de ativação verticais reflitam com exatidão o período de processamento do componente.

4. **Fragmentos Combinados (Controle de Fluxo):**
   - Na Toolbox (*Sequence*), selecione **`CombinedFragment`** e envolva a área condicional;
   - No painel de propriedades, defina o operador (*InteractionOperator*):
     - `alt` para bifurcações condicionais (Sucesso vs Conflito);
     - `loop` para iterações sobre coleções;
     - `opt` para execuções opcionais;
   - Clique com o botão direito no fragmento para adicionar operandos com condições de guarda (`[horario livre]`, `[conflito simultaneo]`).

---

### 4.3. Diagrama de Máquinas de Estados (Statechart Diagram)

1. **Criação do Diagrama:**
   - No *Model Explorer*, clique na entidade de domínio (ex.: `Consulta`) -> **`Add Diagram` -> `Statechart Diagram`**;
   - Nomeie como `dsm_<entidade>` (ex.: `dsm_agendamento`).

2. **Estados e Ciclo de Vida:**
   - **Estado Inicial:** Arraste **`Initial State`** (círculo preenchido);
   - **Estados da Entidade:** Arraste **`State`** e nomeie no particípio/adjetivo (ex.: `Solicitado`, `Agendado`, `Em Atendimento`, `Concluído`, `Cancelado`);
   - **Estado Final:** Arraste **`Final State`** (círculo duplo com centro preenchido).

3. **Transições e Condições de Guarda:**
   - Selecione **`Transition`** ligando o estado de origem ao estado de destino;
   - Configure a sintaxe formal da transição no painel de propriedades:
     - `Trigger` (Evento disparador): ex.: `confirmarPresenca()`;
     - `Guard` (Condição de guarda): ex.: `[pacientePresente]`;
     - `Action` (Efeito/Ação executada): ex.: `/atualizarHorarioInicio()`;
   - Formato resultante no canvas: `evento [guarda] / acao`.

---

### 4.4. Diagrama de Atividades com Raias (Activity Diagram)

1. **Criação do Diagrama:**
   - No *Model Explorer*, clique no processo -> **`Add Diagram` -> `Activity Diagram`**;
   - Nomeie como `act_<processo>` (ex.: `act_fluxo_agendamento`).

2. **Configuração das Raias de Responsabilidade (Swimlanes / Partitions):**
   - Selecione **`Swimlane (Horizontal ou Vertical)`** na Toolbox;
   - Crie raias para os participantes operacionais (ex.: `Recepcionista`, `Sistema / API`, `Gateway Financeiro`);

3. **Fluxo de Ações e Decisões:**
   - **Nó Inicial:** Arraste **`Initial Node`**;
   - **Ações:** Arraste **`Action`** para cada passo procedural;
   - **Nós de Decisão / Mesclagem:** Utilize **`Decision Node`** (losango) com rótulos de condição de guarda nas setas de saída (`[Sim]`, `[Não]`);
   - **Sincronização Paralela:** Utilize **`Fork Node`** (para dividir em fluxos concorrentes) e **`Join Node`** (para sincronizar o término dos fluxos paralelos);
   - **Nó Final:** Arraste **`Activity Final Node`**.

---

### 4.5. Exportação e Inclusão no Template LaTeX

1. **Exportação no StarUML v7.0:**
   - Acesse **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
   - Selecione resolução **2x ou 3x (300 DPI)** com **fundo branco**;
   - Salve os arquivos em `Template_Unificado_LATEX/Imagens/` conforme a convenção:
     - `Imagens/cls_projeto_agendamento.png`
     - `Imagens/seq_agendamento.png`
     - `Imagens/dsm_agendamento.png`
     - `Imagens/act_fluxo_agendamento.png`

2. **Ativação no LaTeX (`Capitulos/05_Design_Tecnico.tex`):**
   ```latex
   \incluirdiagrama{Imagens/cls_projeto_agendamento.png}{Classes de Projeto -- Módulo Agendamento}{fig:cls_projeto_agendamento}
   \incluirdiagrama{Imagens/seq_agendamento.png}{Diagrama de Sequência -- UC01 Realizar Agendamento}{fig:seq_agendamento}
   \incluirdiagrama{Imagens/dsm_agendamento.png}{Máquina de Estados da Entidade Agendamento}{fig:dsm_agendamento}
   \incluirdiagrama{Imagens/act_fluxo_agendamento.png}{Diagrama de Atividades do Fluxo de Agendamento}{fig:act_agendamento}
   ```

---

## 5. Checklist de Qualidade do Agente

- [ ] Todas as classes de projeto possuem visibilidade explícita (`+`, `-`, `#`), atributos tipados e métodos com parâmetros e retornos?
- [ ] O esquema de banco relacional define chaves primárias, estrangeiras e constraints de integridade referencial?
- [ ] O guia StarUML v7.0 especifica o tipo exato de cada diagrama (Class, Sequence, Statechart, Activity) e suas ferramentas da Toolbox?
- [ ] Os diagramas de classe de projeto foram particionados por módulo com no máximo 5 a 8 classes por diagrama?
- [ ] Os diagramas de sequência possuem lifelines claras, ativações corretas e blocos combinados (`alt`, `loop`) quando há bifurcações?
- [ ] Todas as entidades que possuem ciclo de vida foram modeladas com Diagrama de Máquinas de Estados no StarUML?
- [ ] Os diagramas de atividades utilizam raias de responsabilidade (swimlanes) delimitando atores e subsistemas?
