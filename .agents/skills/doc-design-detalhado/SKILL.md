---
name: doc-design-detalhado
description: Orienta o agente na especificação técnica detalhada de software (SDD), abrangendo Mapeamento Objeto-Relacional (ORM / DDL SQL), Diagrama de Classes em Nível de Projeto e Diagramas Dinâmicos (Sequência, Estados e Atividades).
---

# Skill: Design Técnico e Modelagem Detalhada de Software (SDD)

Esta skill orienta o agente na construção do **Documento de Design de Software (SDD - Software Design Description)** em estrita conformidade com a norma **IEEE Std 1016-2009** e os processos de design detalhado da **ISO/IEC/IEEE 12207:2017**, fundamentada na Área de Conhecimento de Design de Software do **SWEBOK v4** (Capítulo 3).

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO/OMG)

O design de software detalhado conecta a arquitetura conceitual ao código-fonte executável:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 3 -- Software Design:**
    * *Design Fundamentals & Principles:* Aplicação rigorosa de alta coesão e baixo acoplamento (*Coupling and Cohesion*), encapsulamento, ocultamento de informação (*Information Hiding*) e separação de conceitos;
    * *Key Issues in Software Design:* Tratamento transacional de concorrência, persistência e integridade relacional (chaves primárias, estrangeiras e restrições ACID), manuseio padronizado de exceções e tolerância a falhas;
    * *Detailed Design & Component Level:* Especificação atômica de classes de projeto (visibilidade $+,-,\#$, tipagem rigorosa, métodos, atributos, multiplicidade e estereótipos GoF);
    * *Dynamic & Behavioral Modeling:* Modelagem temporal de mensagens (Diagramas de Sequência), ciclo de vida de entidades centrais (Diagramas de Máquina de Estados) e fluxos paralelos com raias de responsabilidade (Diagramas de Atividades);
    * *Software Design Quality Analysis:* Revisões formais de design e rastreabilidade para prevenção de dívida técnica.
* **Normas Internacionais:**
  * **IEEE Std 1016-2009:** *Standard for Information Technology -- Systems Design -- Software Design Descriptions (SDD)* (Padrão de referência para design de dados, componentes e interfaces);
  * **ISO/IEC/IEEE 12207:2017:** Cláusula 6.4.5 -- *Detailed Design Process*;
  * **OMG UML Specification v2.5.1:** *Unified Modeling Language Superstructure* (Class, Sequence, State Machine e Activity Diagrams).

---

## 2. Estrutura Obrigatória do Documento

1. **Mapeamento Objeto-Relacional (ORM / Esquema Físico de Banco de Dados)**
   - Definição textual estruturada de todas as tabelas do banco de dados relacional (PostgreSQL/MySQL);
   - Para cada tabela: Chave Primária (PK), Chaves Estrangeiras (FK) com integridade referencial (`ON DELETE RESTRICT/CASCADE`), tipos de colunas, tamanhos máximos, nulabilidade e índices de performance;
   - Script SQL DDL executável ou schemas de ORM (SQLAlchemy / Prisma / Hibernate).

2. **Diagrama de Classes em Nível de Projeto (Design Class Diagram)**
   - Decomposto obrigatoriamente por **Módulos / Pacotes Funcionais** (ex.: Módulo Pessoas, Módulo Agenda, Módulo Prontuário, Módulo Farmácia, Módulo Faturamento);
   - Para cada classe representada:
     - **Atributos:** Nome, visibilidade (`+` público, `-` privado, `#` protegido) e tipo primitivo/objeto;
     - **Métodos:** Assinatura completa com visibilidade, parâmetros tipados e tipo de retorno explícito (ex.: `+ registrarAgendamento(dto: NovoAgendamentoDTO): UUID`);
     - **Relacionamentos:** Multiplicidade nas duas extremidades (`1..1`, `0..*`, `1..*`), navegabilidade com setas direcionais, dependências (`<<use>>`) e realização de interfaces.
   - **Catálogo Sintético das Classes:** Tabela explicativa resumindo a responsabilidade de cada classe no módulo.

3. **Diagramas Dinâmicos**
   - **Diagramas de Sequência (UML Sequence):** Modela os cenários críticos e transações ACID. Mostra lifelines, chamadas síncronas/assíncronas, blocos condicionais (`alt`), repetições (`loop`) e persistência;
   - **Diagramas de Máquinas de Estados (UML State Machine):** Obrigatório para qualquer entidade que possua ciclo de vida ou máquina de estados (ex.: Consulta: Solicitada $\rightarrow$ Confirmada $\rightarrow$ Em Atendimento $\rightarrow$ Finalizada ou Cancelada);
   - **Diagramas de Atividades (UML Activity):** Modela fluxos de processos de negócio com nós de decisão (`decisions`), divisões paralelas (`fork/join`) e raias de responsabilidade (`swimlanes`).

4. **Contratos de Integração e Status dos Casos de Uso**
   - Tabela catalogando quais Casos de Uso estão aptos à implementação e seu status no ciclo (Não Implementado, Em Implementação, Concluído).

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

## 4. Diretrizes de Diagramação (Evitando Falhas e Linhas Tortas)

### Problema Frequente com PlantUML e Diagramas Automáticos:
Quando gerados automaticamente sem particionamento, diagramas de classe em nível de projeto ficam ilegíveis devido a:
- Cruzamento desordenado de linhas de associação;
- Texto de métodos longos que ultrapassa as bordas da caixa;
- Cardinalidades impressas sobre as próprias linhas.

### Diretrizes Rígidas para o Agente:
1. **Regra de Particionamento Estrito:**
   - **JAMAIS** tente desenhar todas as classes do sistema em um único diagrama;
   - Gere **um diagrama de classes para cada módulo funcional** (máximo de 5 a 8 classes por diagrama);
2. **Diagramas de Sequência Focados:**
   - Limite o número de lifelines (participantes) a no máximo 5 ou 6 por diagrama de sequência;
   - Use nomes curtos nas lifelines e assinaturas limpas nas mensagens;
3. **Exemplo de Mermaid Limpo para Diagrama de Sequência:**
   ```mermaid
   sequenceDiagram
       autonumber
       actor Recepcionista
       participant Controller as AgendamentoController
       participant Service as AgendamentoService
       participant Repo as ConsultaRepository
       participant DB as PostgreSQL

       Recepcionista->>Controller: POST /consultas (dados)
       activate Controller
       Controller->>Service: agendarConsulta(dto)
       activate Service
       Service->>Repo: verificarConflito(profId, dataHora)
       activate Repo
       Repo->>DB: SELECT count(*) FROM tb_consulta
       DB-->>Repo: 0 conflitos
       Repo-->>Service: livre
       deactivate Repo
       Service->>Repo: salvar(novaConsulta)
       Repo->>DB: INSERT INTO tb_consulta
       DB-->>Repo: OK (id)
       Service-->>Controller: ConsultaConfirmadaDTO
       deactivate Service
       Controller-->>Recepcionista: 201 Created (JSON)
       deactivate Controller
   ```
4. **Inclusão no LaTeX:**
   Utilize a macro padronizada com o arquivo vetorial correspondente em `Imagens/`:
   `\incluirdiagrama{Imagens/seq_agendamento.pdf}{Diagrama de Sequência -- UC01 Agendamento de Consulta}{fig:seq_agenda}`

---

## 5. Checklist de Qualidade do Agente

- [ ] Todas as classes de projeto possuem visibilidade explícita (`+`, `-`, `#`) e métodos com tipos de retorno?
- [ ] O esquema de banco relacional define chaves primárias, estrangeiras e constraints de unicidade?
- [ ] Os diagramas de classe foram divididos por módulo funcional com tabelas de catálogo acompanhando?
- [ ] Todas as entidades que sofrem mudança de estado possuem Diagrama de Máquinas de Estados associado?
- [ ] Os diagramas de sequência possuem participantes claros com ciclo de ativação correto?
