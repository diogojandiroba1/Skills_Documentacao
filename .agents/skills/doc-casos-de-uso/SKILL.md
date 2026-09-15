---
name: doc-casos-de-uso
description: Guia o agente na modelagem de casos de uso (UML Use Case) e análise conceitual de domínio, incluindo especificação textual detalhada, diagramas por pacotes funcionais, matriz de rastreabilidade (RF x UC) e modelo conceitual de classes.
---

# Skill: Modelagem de Casos de Uso e Análise Conceitual

Esta skill orienta o agente na especificação e modelagem detalhada dos **Casos de Uso (UML Use Cases)** e na construção do **Modelo Conceitual de Domínio (Classes de Análise)**, fundamentada na Área de Conhecimento de Requisitos e Design do **SWEBOK v4** e no padrão formal **OMG Unified Modeling Language (UML 2.5.1)**.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Padrões OMG/Cockburn)

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 1 -- Software Requirements (Subárea 2.3: Conceptual Modeling):** O modelo conceitual traduz os requisitos textuais em representações comportamentais rigorosas de fluxos de tarefas orientadas a objetivos de negócio (*Goal-Oriented Requirements*).
  * **Chapter 3 -- Software Design (Subárea 2.2: Object-Oriented Analysis):** Identificação de entidades de domínio do mundo real, atributos fundamentais e relacionamentos semânticos (associação, agregação, composição e multiplicidade), mantendo independência de implementações técnicas.
* **Normas e Metodologias:**
  * **OMG Unified Modeling Language (UML) Specification v2.5.1:** Semântica formal para Use Cases, Atores, Fronteiras do Sistema (*System Boundary*), estereótipos de relacionamento (`<<include>>`, `<<extend>>`) e generalização de atores;
  * **Metodologia de Casos de Uso de Alistair Cockburn:** Estruturação orientada a objetivos (Garantias Mínimas, Garantias de Sucesso, Triggers, Fluxo Básico e Extensões de Exceção);
  * **ISO/IEC/IEEE 29148:2018:** Rastreabilidade formal bidirecional Requisitos Funcionais $\leftrightarrow$ Casos de Uso ($RF \leftrightarrow UC$).

---

## 2. Estrutura Obrigatória do Documento

1. **Atores do Sistema**
   - Identificação de todos os atores humanos (papéis) e sistemas externos;
   - Descrição das responsabilidades de cada ator e relações de generalização/herança de papéis (ex.: `Médico` herda permissões de `Profissional de Saúde`).

2. **Diagrama Geral e Particionamento por Pacotes**
   - **Diagrama Geral de Casos de Uso:** Visão das fronteiras do sistema delimitando os grandes módulos funcionais;
   - **Diagramas de Casos de Uso por Pacote Funcional:** Cada pacote (ex.: Agenda, Prontuário, Farmácia) deve possuir seu próprio diagrama isolado.

3. **Especificação Textual Detalhada dos Casos de Uso**
   - Todo caso de uso prioritário deve ser detalhado segundo o template rigoroso:
     - **ID e Nome:** `UCxx -- Nome no Infinitivo` (ex.: `UC01 -- Realizar Agendamento`);
     - **Atores:** Indicando quem inicia a interação (ator primário) e quem é notificado (ator secundário);
     - **Objetivo / Breve Descrição:** Resumo do valor entregue ao ator;
     - **Pré-condições:** Condições de estado necessárias antes do início do fluxo;
     - **Pós-condições:** Estado garantido do sistema após o sucesso da operação;
     - **Fluxo Principal:** Sequência numerada passo-a-passo (interação Ator $\rightarrow$ Sistema $\rightarrow$ Ator);
     - **Fluxos Alternativos (FA):** Caminhos secundários de sucesso (ex.: cliente não cadastrado sendo cadastrado durante o fluxo);
     - **Fluxos de Exceção (FE):** Tratamento de falhas, erros de validação e cancelamentos;
     - **Regras de Negócio e Requisitos Vinculados:** Rastreabilidade direta para as RNs e RFs.

4. **Matrizes de Rastreabilidade**
   - Matriz Requisitos Funcionais $\times$ Casos de Uso;
   - Matriz Casos de Uso $\times$ Classes de Análise.

5. **Modelo Conceitual de Domínio (Diagrama de Classes de Análise)**
   - Representação puramente orientada ao problema (entidades de negócio e conceitos do mundo real);
   - Sem tipos técnicos de bancos de dados, chaves primárias artificiais (IDs) ou métodos de controle;
   - Relações conceituais: Associações com multiplicidade nas extremidades (`1..1`, `1..*`, `0..*`), Agregações e Composições.

---

## 3. Template de Especificação Textual em LaTeX

```latex
\begin{table}[htbp]
\caption{Especificação Textual do Caso de Uso UC01}
\label{tab:uc01_detalhado}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l Y @{}}
\toprule
\multicolumn{2}{@{}l}{\textbf{UC01 -- Realizar Agendamento de Consulta}} \\
\midrule
\textbf{Atores} & Recepcionista (ator primário), Paciente, Profissional de Saúde. \\
\textbf{Objetivo} & Reservar um horário na agenda de um profissional para um paciente específico. \\
\textbf{Pré-condições} & O paciente e o profissional devem estar cadastrados e com status ativo. \\
\textbf{Pós-condições} & O horário é reservado na agenda e notificação é despachada. \\
\midrule
\multicolumn{2}{@{}l}{\textbf{Fluxo Principal dos Eventos}} \\
\midrule
\multicolumn{2}{@{}p{\linewidth}@{}}{
1. A recepcionista acessa o módulo de agendamentos no sistema. \newline
2. O sistema solicita a identificação do paciente (CPF ou Cartão SUS). \newline
3. A recepcionista insere os dados do paciente. \newline
4. O sistema valida o paciente e solicita a escolha da especialidade ou profissional. \newline
5. A recepcionista seleciona o profissional desejado e o intervalo de datas. \newline
6. O sistema exibe o calendário com os horários disponíveis. \newline
7. A recepcionista escolhe a data e horário pretendidos. \newline
8. O sistema valida a inexistência de sobreposição de horários (RN01). \newline
9. O sistema solicita a confirmação dos dados e o tipo de convênio/particular. \newline
10. A recepcionista confirma o agendamento. \newline
11. O sistema persiste a reserva com status ``Agendado'' e exibe mensagem de confirmação.
} \\
\midrule
\multicolumn{2}{@{}l}{\textbf{Fluxos Alternativos e de Exceção}} \\
\midrule
\multicolumn{2}{@{}p{\linewidth}@{}}{
\textbf{FA01 -- Paciente Não Cadastrado (Passo 4):} O sistema oferece opção de cadastro rápido. A recepcionista realiza o cadastro básico e retorna imediatamente ao Passo 5. \newline
\textbf{FE01 -- Conflito Simultâneo de Horário (Passo 8):} Se o horário selecionado foi reservado por outro operador no mesmo instante, o sistema emite alerta, atualiza a grade e retorna ao Passo 6.
} \\
\midrule
\textbf{Rastreabilidade} & Atende ao requisito \textbf{RF02} e cumpre as regras \textbf{RN01} e \textbf{RN03}. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 4. Diretrizes de Diagramação (Evitando Diagramas Poluídos)

### Por que diagramas quebram?
Em ferramentas automáticas ou scripts como PlantUML mal configurados, diagramas com muitos casos de uso sofrem com:
- Linhas que cruzam sobre os elipses dos casos de uso;
- Atores com linhas diagonais longas que atravessam todo o diagrama;
- Rótulos `<<include>>` e `<<extend>>` sobrepostos a outras conexões.

### Regras de Boa Prática para o Agente:
1. **Regra de Granularidade por Módulo:**
   - **NUNCA** coloque todos os casos de uso de um sistema grande em uma única imagem.
   - Divida sempre por pacotes funcionais com no máximo **4 a 6 casos de uso por diagrama**.
2. **Código Mermaid Limpo para Pré-visualização:**
   Utilize alinhamento da esquerda para a direita (`direction LR`) e fronteiras de subsistema explícitas:
   ```mermaid
   flowchart LR
       subgraph Sistema [Módulo de Agendamento]
           UC1((UC01: Realizar Agendamento))
           UC2((UC02: Confirmar Presença))
           UC3((UC03: Cancelar Agendamento))
           UC4((UC04: Notificar Paciente))
       end
       Recepcionista --> UC1
       Recepcionista --> UC2
       Recepcionista --> UC3
       UC1 -.->|<<include>>| UC4
   ```
3. **Inclusão no LaTeX:**
   Gere ou exporte os diagramas vetoriais (PDF/SVG) na pasta `Imagens/` e use:
   `\incluirdiagrama{Imagens/uc_agendamento.pdf}{Diagrama de Casos de Uso -- Módulo Agendamento}{fig:uc_agenda}`

---

## 5. Checklist de Qualidade do Agente

- [ ] Todos os casos de uso possuem nome no infinitivo descrevendo o objetivo do ator?
- [ ] Todo caso de uso possui pré-condições, pós-condições e ao menos um fluxo alternativo ou de exceção?
- [ ] A numeração dos passos do fluxo principal é consistente e lógica?
- [ ] Os diagramas foram divididos por módulo para garantir clareza visual absoluta?
- [ ] A matriz de rastreabilidade cobre 100% dos requisitos funcionais mapeados?
