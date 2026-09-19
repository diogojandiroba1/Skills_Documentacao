---
name: doc-casos-de-uso
description: Guia o agente na modelagem de casos de uso (UML Use Case) e análise conceitual de domínio, incluindo especificação textual detalhada em tabelas padronizadas com cabeçalho bege, matriz de rastreabilidade (RF x UC) e geração de modelos em sugests_diagrams/.
---

# Skill: Modelagem de Casos de Uso e Análise Conceitual

Esta skill orienta o agente na especificação, detalhamento e geração de modelos de apoio para os **Casos de Uso (UML Use Cases)** e o **Modelo Conceitual de Domínio (Classes de Análise)**.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as normas de modelagem à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar UML 2.5.1, SWEBOK ou Cockburn no texto gerado);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de gerar qualquer especificação de Casos de Uso ou sugerir diagramas, o agente **NÃO deve assumir fluxos ou relacionamentos sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Modelagem de Casos de Uso e Domínio)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após a Especificação de Requisitos) do projeto atual?
2. **Atores e Fronteiras:**
   - Quem são os atores humanos primários (que disparam os fluxos) e secundários (que apenas recebem notificações)?
   - Há atores de sistemas externos ou APIs (ex.: Gateway de Pagamento, SMS/E-mail, Sistema Governamental)?
   - Há especialização entre atores (ex.: `Médico` especializa `Profissional de Saúde`)?
3. **Mapeamento RF $\rightarrow$ Casos de Uso:**
   - Quais requisitos funcionais viram Casos de Uso diretos?
   - Há casos de uso compartilhados ou reutilizáveis que justificam `<<include>>` (ex.: `UC_Autenticar`, `UC_RegistrarAuditoria`)?
   - Há fluxos opcionais ou condicionais que justificam `<<extend>>` com extension points claros?
4. **Fluxos Críticos e Exceções:**
   - Para os casos de uso vitais do sistema: qual é o fluxo principal (passo a passo da interação Ator $\leftrightarrow$ Sistema)?
   - Quais são os principais fluxos de exceção e regras de validação que o sistema deve tratar?
5. **Modelo Conceitual de Domínio:**
   - Quais são as entidades centrais do negócio (ex.: `Paciente`, `Consulta`, `Prontuario`, `Medicamento`)?
   - Quais são as cardinalidades/multiplicidades reais entre elas (`1..1`, `1..*`, `0..*`)?
   - Existem composições fortes (onde a entidade-filho deixa de existir se o pai for removido)?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Catálogo Preliminar de Casos de Uso por Módulo** com atores e relacionamentos `<<include>>`/`<<extend>>`;
- **Relação de Diagramas para Modelagem no StarUML v7.0:**
  1. `Imagens/uc_geral.png`: Diagrama Geral de Casos de Uso com fronteira do sistema e atores;
  2. `Imagens/uc_<modulo>.png`: Diagramas de Casos de Uso modulares (4 a 6 UCs por pacote para legibilidade);
  3. `Imagens/cls_conceitual_dominio.png`: Modelo Conceitual de Classes de Análise com associações e multiplicidades.

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova esta lista de Casos de Uso, divisão por pacotes e entidades do Modelo Conceitual para prosseguirmos com a especificação textual em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento técnico é focado puramente no sistema. Não cite no texto termos como *"conforme a OMG UML 2.5.1"*, *"segundo Cockburn"*, etc. Siga a semântica formal diretamente na redação e estrutura.
- **GRADE NÍTIDA EM TABELAS:** Todas as especificações textuais de Casos de Uso e matrizes de rastreabilidade devem ter linhas verticais e horizontais explícitas (`|l|Y|` e `\hline`), com cabeçalho bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O PDF final contém apenas as figuras incluídas via `\incluirdiagrama{...}`. O passo a passo para desenhar no StarUML v7.0 **NÃO deve ir para o PDF**. Ele deve ser gerado na subpasta `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Atores do Sistema**
   - Identificação de atores humanos e sistemas externos, com responsabilidades e hierarquia de papéis.

2. **Diagrama Geral e Particionamento por Pacotes Funcionais**
   - **Diagrama Geral de Casos de Uso:** Visão macro delimitando as fronteiras do sistema;
   - **Diagramas de Casos de Uso por Módulo Funcional:** Cada pacote contendo entre **4 e 6 casos de uso**.

3. **Especificação Textual Detalhada dos Casos de Uso**
   - Todo caso de uso prioritário deve ser detalhado segundo o template tabular.

4. **Matrizes de Rastreabilidade**
   - Matriz Requisitos Funcionais $\times$ Casos de Uso ($RF \leftrightarrow UC$);
   - Matriz Casos de Uso $\times$ Classes de Análise ($UC \leftrightarrow Entidades$).

5. **Modelo Conceitual de Domínio (Diagrama de Classes de Análise)**
   - Representação orientada ao problema, sem tipos de banco de dados ou métodos técnicos;
   - Multiplicidades explícitas em ambas as pontas (`1..1`, `1..*`, `0..*`), além de Agregações e Composições.

---

## 4. Template de Especificação Textual em LaTeX (Grade Nítida e Cabeçalho Bege)

```latex
\begin{table}[htbp]
\caption{Especificação Textual do Caso de Uso UC01}
\label{tab:uc01_detalhado}
\centering
\small
\begin{tabularx}{\textwidth}{|l|Y|}
\hline
\rowcolor{tableheaderbeige}
\multicolumn{2}{|l|}{\textbf{UC01 -- Realizar Agendamento de Consulta}} \\ \hline
\textbf{Atores} & Recepcionista (ator primário), Paciente, Profissional de Saúde. \\ \hline
\textbf{Objetivo} & Reservar um horário na agenda de um profissional para um paciente específico. \\ \hline
\textbf{Pré-condições} & O paciente e o profissional devem estar cadastrados e com status ativo. \\ \hline
\textbf{Pós-condições} & O horário é reservado na agenda e notificação é despachada. \\ \hline
\rowcolor{tableheaderbeige}
\multicolumn{2}{|l|}{\textbf{Fluxo Principal dos Eventos}} \\ \hline
\multicolumn{2}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth}|}{
1. A recepcionista acessa o módulo de agendamentos no sistema. \newline
2. O sistema solicita a identificação do paciente (CPF ou código). \newline
3. A recepcionista insere os dados do paciente. \newline
4. O sistema valida o paciente e solicita a escolha da especialidade ou profissional. \newline
5. A recepcionista seleciona o profissional desejado e o intervalo de datas. \newline
6. O sistema exibe o calendário com os horários disponíveis. \newline
7. A recepcionista escolhe a data e horário pretendidos. \newline
8. O sistema valida a inexistência de sobreposição de horários (RN01). \newline
9. O sistema solicita a confirmação dos dados e o tipo de convênio/particular. \newline
10. A recepcionista confirma o agendamento. \newline
11. O sistema persiste a reserva com status ``Agendado'' e exibe mensagem de confirmação.
} \\ \hline
\rowcolor{tableheaderbeige}
\multicolumn{2}{|l|}{\textbf{Fluxos Alternativos e de Exceção}} \\ \hline
\multicolumn{2}{|p{\dimexpr\textwidth-2\tabcolsep-2\arrayrulewidth}|}{
\textbf{FA01 -- Paciente Não Cadastrado (Passo 4):} O sistema oferece opção de cadastro rápido. A recepcionista realiza o cadastro básico e retorna imediatamente ao Passo 5. \newline
\textbf{FE01 -- Conflito Simultâneo de Horário (Passo 8):} Se o horário selecionado foi reservado por outro operador no mesmo instante, o sistema emite alerta, atualiza a grade e retorna ao Passo 6.
} \\ \hline
\textbf{Rastreabilidade} & Atende ao requisito \textbf{RF02} e cumpre as regras \textbf{RN01} e \textbf{RN03}. \\ \hline
\end{tabularx}
\end{table}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para cada diagrama deste capítulo, o agente deve gerar uma subpasta dedicada em `sugests_diagrams/`:
- `sugests_diagrams/uc_geral/`
- `sugests_diagrams/uc_<modulo>/`
- `sugests_diagrams/cls_conceitual_dominio/`

Cada subpasta conterá obrigatoriamente três arquivos:
1. `<nome_diagrama>.puml`: Código PlantUML do modelo;
2. `<nome_diagrama>.png`: Renderização prévia do PlantUML;
3. `<nome_diagrama>.md`: Roteiro passo a passo formal instruindo o usuário a modelar no StarUML v7.0 (System Boundary, Actors, UseCases, `<<include>>`, `<<extend>>`, multiplicidades, visibilidades e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (UML 2.5.1, Cockburn, SWEBOK)?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] Todos os casos de uso possuem nome no infinitivo descrevendo o objetivo do ator?
- [ ] Todo caso de uso prioritário possui pré-condições, pós-condições e fluxos de exceção?
- [ ] Os modelos de apoio foram criados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] As classes conceituais possuem atributos sem tipos de implementação e com multiplicidades explícitas em todas as extremidades?
