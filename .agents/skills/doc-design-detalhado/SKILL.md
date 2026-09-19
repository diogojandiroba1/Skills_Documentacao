---
name: doc-design-detalhado
description: Orienta o agente na especificação técnica detalhada de software (SDD), abrangendo Mapeamento Objeto-Relacional (ORM / DDL SQL), Diagrama de Classes de Projeto, Diagramas Dinâmicos, tabelas com cabeçalho bege e geração de modelos em sugests_diagrams/.
---

# Skill: Design Técnico e Modelagem Detalhada de Software (SDD)

Esta skill orienta o agente na construção do **Documento de Design de Software (SDD - Software Design Description)**, especificando a arquitetura detalhada de dados, classes de projeto e modelos comportamentais dinâmicos.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as normas de design detalhado à risca, mas **sem citar nominalmente normas no texto** (ex.: sem citar IEEE 1016, ISO 12207 ou SWEBOK no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de produzir a especificação de Design Detalhado (SDD), DDL de banco de dados ou sugerir diagramas, o agente **NÃO deve assumir contratos de classes ou esquemas físicos sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de Design e Modelagem)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após a Arquitetura de Software) do projeto atual?
2. **Esquema Relacional e Persistência (ORM / DDL):**
   - Qual SGBD relacional e ORM serão adotados (ex.: PostgreSQL com Prisma / Hibernate / SQLAlchemy)?
   - Como serão tratadas chaves primárias (UUID v4 vs Bigint sequencial)?
   - Há índices de performance e restrições de integridade referencial (`ON DELETE CASCADE/RESTRICT`) essenciais?
3. **Diagrama de Classes de Projeto (Design Classes):**
   - Quais padrões de projeto (GoF) devem ser aplicados (ex.: Repository Pattern, Service Layer, Factory, Strategy)?
   - Qual a convenção de visibilidade e encapsulamento adotada?
4. **Diagramas Dinâmicos de Sequência:**
   - Quais são os cenários transacionais mais complexos que exigem detalhamento temporal de mensagens?
   - Como são tratados erros e fallbacks nos blocos combinados (`alt`/`opt`)?
5. **Ciclo de Vida de Entidades (Máquinas de Estado):**
   - Quais entidades do domínio possuem estados transitórios complexos (ex.: Pedido, Consulta, Fatura)?
   - Quais eventos e condições de guarda disparam cada transição?
6. **Diagramas de Atividades (Workflows):**
   - Há processos de negócio com bifurcações paralelas (`fork`/`join`) e múltiplos atores que justifiquem raias (`swimlanes`)?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Resumo do Esquema Físico de Banco** e classes de projeto por módulo;
- **Sugestão de Diagramas Técnicos para Construção no StarUML v7.0:**
  1. `Imagens/cls_projeto_<modulo>.png`: Classes de Projeto com visibilidades, tipos e métodos;
  2. `Imagens/seq_<caso_uso>.png`: Diagrama de Sequência detalhando a interação Controller $\leftrightarrow$ Service $\leftrightarrow$ Repository $\leftrightarrow$ Database;
  3. `Imagens/dsm_<entidade>.png`: Máquina de Estados da entidade de ciclo de vida complexo;
  4. `Imagens/act_<processo>.png`: Diagrama de Atividades com raias de responsabilidade (swimlanes).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova estas decisões de design detalhado, a modelagem de classes e a relação de diagramas sugeridos para prosseguirmos com a redação formal em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento é puramente técnico do software em desenvolvimento. Não cite no texto termos como *"conforme o IEEE Std 1016"*, *"segundo o SWEBOK"*, etc. Siga os preceitos de separação de conceitos, coesão e acoplamento diretamente nas especificações técnicas.
- **GRADE NÍTIDA EM TABELAS:** Todas as tabelas de catálogo de classes, contratos e status devem ter linhas verticais e horizontais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. O passo a passo para desenhar no StarUML v7.0 **NÃO deve ir para o PDF**. Ele deve ser gerado na subpasta `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Mapeamento Objeto-Relacional (ORM / DDL SQL)**
   - Definição textual estruturada de todas as tabelas relacionais (PostgreSQL);
   - Para cada tabela: PK, FKs com integridade referencial, tipos de colunas, nulabilidade e índices;
   - Script SQL DDL executável ou esquemas de ORM.

2. **Diagrama de Classes em Nível de Projeto (Design Class Diagram)**
   - Decomposto por Módulos / Pacotes Funcionais;
   - Atributos com visibilidade (`+`, `-`, `#`) e tipos da linguagem;
   - Métodos com assinatura completa, parâmetros tipados e retorno;
   - Relacionamentos com multiplicidades nas extremidades (`1..1`, `0..*`, `1..*`), navegabilidade e dependências (`<<use>>`).

3. **Diagramas Dinâmicos**
   - **Diagramas de Sequência (UML Sequence):** Modela os cenários críticos e transações ACID;
   - **Diagramas de Máquinas de Estados (UML State Machine):** Obrigatório para entidades com ciclo de vida transitório;
   - **Diagramas de Atividades (UML Activity):** Modela processos com bifurcações e raias de responsabilidade (`swimlanes`).

4. **Contratos de Integração e Status dos Casos de Uso**
   - Tabela catalogando o status de cada Caso de Uso no ciclo de desenvolvimento.

---

## 4. Modelos de Código e Tabelas em LaTeX (Grade Nítida e Cabeçalho Bege)

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
\begin{tabularx}{\textwidth}{|l|l|Y|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Classe} & \textbf{Camada / Papel} & \textbf{Responsabilidade Central} \\ \hline
\texttt{AgendamentoController} & Apresentação & Recebe requisições HTTP, valida schema DTO e retorna JSON. \\ \hline
\texttt{AgendarConsultaUseCase} & Aplicação & Orquestra a validação de regras de negócio e transação ACID. \\ \hline
\texttt{Consulta} & Domínio & Entidade rica que encapsula as regras de transição de estado. \\ \hline
\texttt{ConsultaRepository} & Infraestrutura & Interface de persistência executando queries assíncronas no PostgreSQL. \\ \hline
\end{tabularx}
\end{table}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para cada diagrama deste capítulo, o agente deve gerar uma subpasta dedicada em `sugests_diagrams/`:
- `sugests_diagrams/cls_projeto_<modulo>/`
- `sugests_diagrams/seq_<caso_uso>/`
- `sugests_diagrams/dsm_<entidade>/`
- `sugests_diagrams/act_<processo>/`

Cada subpasta conterá obrigatoriamente três arquivos:
1. `<nome_diagrama>.puml`: Código PlantUML do modelo estrutural/comportamental;
2. `<nome_diagrama>.png`: Renderização prévia do PlantUML;
3. `<nome_diagrama>.md`: Roteiro passo a passo formal instruindo o usuário a modelar no StarUML v7.0 (elementos da Toolbox, visibilidades `+`, `-`, `#`, esterótipos, mensagens de sequência, fragmentos combinados `alt`/`loop`, estados e raias de atividades, e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (IEEE 1016, SWEBOK, ISO 12207)?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] Todas as classes de projeto possuem visibilidade explícita (`+`, `-`, `#`), atributos tipados e métodos com parâmetros e retornos?
- [ ] O esquema de banco relacional define chaves primárias, estrangeiras e constraints de integridade referencial?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] Os diagramas de classe de projeto foram particionados por módulo com no máximo 5 a 8 classes por diagrama?
- [ ] Os diagramas de sequência possuem lifelines claras e blocos combinados (`alt`, `loop`) quando há bifurcações?
- [ ] Todas as entidades com ciclo de vida foram modeladas com Diagrama de Máquinas de Estados?
