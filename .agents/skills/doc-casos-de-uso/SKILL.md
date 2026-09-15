---
name: doc-casos-de-uso
description: Guia o agente na modelagem de casos de uso (UML Use Case) e análise conceitual de domínio, incluindo especificação textual detalhada, matriz de rastreabilidade (RF x UC), modelo conceitual de classes e instrução formal passo a passo para modelagem no StarUML v7.0.
---

# Skill: Modelagem de Casos de Uso e Análise Conceitual

Esta skill orienta o agente na especificação, detalhamento e auxílio à modelagem dos **Casos de Uso (UML Use Cases)** e do **Modelo Conceitual de Domínio (Classes de Análise)**, fundamentada na Área de Conhecimento de Requisitos e Design do **SWEBOK v4** e no padrão formal **OMG Unified Modeling Language (UML 2.5.1)**.

O agente atua simultaneamente como **especificador formal da documentação técnica** e **copiloto de modelagem visual no StarUML v7.0**, fornecendo descrições prescritivas para que o usuário construa os diagramas visualmente na ferramenta com rigor profissional.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Padrões OMG/Cockburn)

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 1 -- Software Requirements (Subárea 2.3: Conceptual Modeling):** O modelo conceitual traduz os requisitos textuais em representações comportamentais rigorosas de fluxos de tarefas orientadas a objetivos de negócio (*Goal-Oriented Requirements*).
  * **Chapter 3 -- Software Design (Subárea 2.2: Object-Oriented Analysis):** Identificação de entidades de domínio do mundo real, atributos fundamentais e relacionamentos semânticos (associação, agregação, composição e multiplicidade), mantendo independência de implementações técnicas.
* **Normas e Metodologias:**
  * **OMG Unified Modeling Language (UML) Specification v2.5.1:** Semântica formal para Use Cases, Atores, Fronteiras do Sistema (*System Boundary* / *Subject*), estereótipos de relacionamento (`<<include>>`, `<<extend>>`) e generalização de atores;
  * **Metodologia de Casos de Uso de Alistair Cockburn:** Estruturação orientada a objetivos (Garantias Mínimas, Garantias de Sucesso, Triggers, Fluxo Básico e Extensões de Exceção);
  * **ISO/IEC/IEEE 29148:2018:** Rastreabilidade formal bidirecional Requisitos Funcionais $\leftrightarrow$ Casos de Uso ($RF \leftrightarrow UC$).

---

## 2. Estrutura Obrigatória do Documento

1. **Atores do Sistema**
   - Identificação de todos os atores humanos (papéis operacionais) e sistemas externos;
   - Descrição detalhada das responsabilidades de cada ator e relações de generalização/herança de papéis (ex.: `Médico` especializa `Profissional de Saúde`).

2. **Diagrama Geral e Particionamento por Pacotes Funcionais**
   - **Diagrama Geral de Casos de Uso:** Visão macro delimitando as fronteiras do sistema e seus grandes módulos;
   - **Diagramas de Casos de Uso por Módulo Funcional:** Cada pacote (ex.: Agenda, Prontuário, Farmácia, Faturamento) deve possuir seu próprio diagrama isolado, contendo entre **4 e 6 casos de uso** para garantir legibilidade.

3. **Especificação Textual Detalhada dos Casos de Uso**
   - Todo caso de uso prioritário deve ser detalhado segundo o template formal:
     - **ID e Nome:** `UCxx -- Nome no Infinitivo` (ex.: `UC01 -- Realizar Agendamento`);
     - **Atores:** Indicando quem inicia a interação (ator primário) e quem é notificado (ator secundário);
     - **Objetivo / Breve Descrição:** Resumo do valor entregue ao ator;
     - **Pré-condições:** Condições de estado necessárias antes do início do fluxo;
     - **Pós-condições:** Estado garantido do sistema após o sucesso da operação;
     - **Fluxo Principal dos Eventos:** Sequência numerada passo a passo (interação Ator $\rightarrow$ Sistema $\rightarrow$ Ator);
     - **Fluxos Alternativos (FA):** Caminhos secundários de sucesso;
     - **Fluxos de Exceção (FE):** Tratamento de falhas, erros de validação e cancelamentos;
     - **Regras de Negócio e Requisitos Vinculados:** Rastreabilidade direta para as RNs e RFs.

4. **Matrizes de Rastreabilidade**
   - Matriz Requisitos Funcionais $\times$ Casos de Uso ($RF \leftrightarrow UC$);
   - Matriz Casos de Uso $\times$ Classes de Análise ($UC \leftrightarrow Entidades$).

5. **Modelo Conceitual de Domínio (Diagrama de Classes de Análise)**
   - Representação puramente orientada ao problema (entidades de negócio e conceitos do mundo real);
   - Sem tipos de banco de dados (ex.: VARCHAR, INT), chaves primárias artificiais ou métodos técnicos;
   - Relações conceituais com multiplicidades explícitas em ambas as pontas (`1..1`, `1..*`, `0..*`), além de Agregações e Composições.

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

## 4. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

O agente deve fornecer ao usuário instruções formais e determinísticas para construir os diagramas no **StarUML v7.0**, seguindo rigorosamente os passos abaixo:

### 4.1. Modelagem de Casos de Uso (Geral e Modular)

1. **Estruturação no Model Explorer:**
   - No painel lateral direito (*Model Explorer*), clique com o botão direito no modelo raiz (`Model`) e selecione **`Add` -> `Package`**;
   - Nomeie o pacote como `Modelagem_Casos_Uso` e crie subpacotes para cada módulo (ex.: `Modulo_Agendamento`, `Modulo_Atendimento`);
   - Clique com o botão direito no pacote e selecione **`Add Diagram` -> `Use Case Diagram`**.

2. **Criação e Posicionamento dos Elementos:**
   - **Fronteira do Sistema (Subject):** Na Toolbox à esquerda (*Use Case*), clique em **`System Boundary`** (ou `Subject`), arraste um retângulo amplo para o centro do canvas e nomeie com o título do subsistema (ex.: `Sistema VitaCare -- Módulo Agendamento`);
   - **Atores:** Na Toolbox, selecione **`Actor`**. Posicione atores primários (iniciadores) à esquerda da fronteira e atores secundários (sistemas externos ou destinatários de alertas) à direita;
   - **Casos de Uso:** Na Toolbox, selecione **`UseCase`** e insira as elipses dentro da fronteira do sistema. Nomeie sempre com verbo no infinitivo seguido do objeto (ex.: `Realizar Agendamento`, `Confirmar Presença`).

3. **Estabelecimento de Relacionamentos Semânticos:**
   - **Associação Ator-UC:** Utilize a ferramenta **`Association`** ligando o ator ao caso de uso que ele aciona;
   - **Inclusão (`<<include>>`):** Selecione a ferramenta **`Include`**, clique no caso de uso base e arraste até o caso de uso incluído (ex.: de `Realizar Agendamento` para `Validar Conflito de Horário`). O StarUML v7.0 renderizará automaticamente a linha tracejada com ponta aberta e o estereótipo `<<include>>`;
   - **Extensão (`<<extend>>`):** Selecione a ferramenta **`Extend`**, clique no caso de uso extensor/opcional e arraste até o caso de uso base. Configure pontos de extensão (*Extension Points*) no painel de propriedades (*Editors / Properties*);
   - **Generalização de Atores:** Utilize **`Generalization`** ligando o ator especialista ao ator genérico (ex.: `Médico` $\rightarrow$ `Profissional de Saúde`).

4. **Diretrizes de Layout e Alinhamento no Canvas:**
   - Mantenha alinhamento estrito em grade (*Format -> Layout -> Align Left / Distribute Vertically*);
   - Evite absolutamente linhas diagonais longas que atravessem a fronteira do sistema;
   - Mantenha no máximo **4 a 6 Use Cases** por diagrama modular;
   - Conectores devem ser mantidos no estilo **Rectilinear** ou **Oblique limpo** (*Format -> Line Style -> Rectilinear*).

---

### 4.2. Modelagem do Diagrama Conceitual de Classes (Domínio)

1. **Adição do Diagrama:**
   - No *Model Explorer*, clique no pacote de domínio e selecione **`Add Diagram` -> `Class Diagram`**;
   - Nomeie o diagrama como `Diagrama_Conceitual_Dominio`.

2. **Criação de Entidades de Domínio:**
   - Na Toolbox (*Class*), selecione **`Class`** e clique no canvas;
   - Nomeie cada entidade no singular com inicial maiúscula (ex.: `Paciente`, `Agendamento`, `Consulta`, `Profissional`);
   - Clique com o botão direito na classe e escolha **`Add` -> `Attribute`** para inserir os atributos essenciais de negócio com tipos primitivos conceituais (ex.: `nome: String`, `dataNascimento: Date`, `telefone: String`). Não insira detalhes técnicos de banco de dados (ex.: INT UNSIGNED, VARCHAR, sequences).

3. **Definição de Relacionamentos e Multiplicidades:**
   - Utilize **`Association`** entre classes que possuem vínculo semântico;
   - No painel de propriedades de cada extremidade (*End1* e *End2*), preencha:
     - `Multiplicity`: `1`, `0..1`, `1..*`, `*` ou `0..*`;
     - `Aggregation`: configure `shared` para Agregações ou `composite` para Composições (ex.: `Prontuario` composto por `ItemEvolucao`);
     - `Role Name`: rótulo semântico do papel (ex.: `+paciente`, `+horarioReservado`).

---

### 4.3. Exportação e Inclusão no Template LaTeX

1. **Procedimento de Exportação no StarUML v7.0:**
   - Abra o diagrama finalizado no canvas;
   - Acesse o menu: **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
   - No diálogo de exportação:
     - Selecione resolução de **2x** ou **3x (300 DPI)** para máxima qualidade;
     - Assegure que o fundo esteja definido como **branco** (não transparente);
   - Salve os arquivos com a nomenclatura padronizada na pasta `Template_Unificado_LATEX/Imagens/`:
     - Diagrama Geral de Casos de Uso: `Imagens/uc_geral.png`
     - Diagrama Modular de Casos de Uso: `Imagens/uc_<modulo>.png` (ex.: `Imagens/uc_agendamento.png`)
     - Diagrama Conceitual de Classes: `Imagens/cls_conceitual_dominio.png`

2. **Ativação no LaTeX (`Capitulos/03_Modelagem_Casos_Uso.tex`):**
   ```latex
   \incluirdiagrama{Imagens/uc_geral.png}{Diagrama Geral de Casos de Uso do Sistema}{fig:uc_geral}
   \incluirdiagrama{Imagens/uc_agendamento.png}{Diagrama de Casos de Uso -- Módulo Agendamento}{fig:uc_agendamento}
   \incluirdiagrama{Imagens/cls_conceitual_dominio.png}{Modelo Conceitual de Classes de Domínio}{fig:cls_conceitual}
   ```

---

## 5. Checklist de Qualidade do Agente

- [ ] Todos os casos de uso possuem nome no infinitivo descrevendo o objetivo do ator?
- [ ] Todo caso de uso prioritário possui pré-condições, pós-condições e fluxos de exceção?
- [ ] A numeração dos passos do fluxo principal é consistente e lógica?
- [ ] O guia de modelagem no StarUML v7.0 prescreve elementos, relacionamentos e nomes exatos de arquivos?
- [ ] Os diagramas de casos de uso foram particionados por módulo (máximo de 4 a 6 UCs por diagrama)?
- [ ] As classes conceituais possuem atributos sem tipos de implementação e com multiplicidades explícitas em todas as extremidades?
- [ ] A matriz de rastreabilidade cobre 100% dos requisitos funcionais mapeados?
