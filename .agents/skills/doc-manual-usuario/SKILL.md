---
name: doc-manual-usuario
description: Guia o agente na elaboração do Manual do Usuário Final e Guia Operacional do Sistema, com linguagem clara, fluxos passo a passo, tabelas com cabeçalho bege, FAQ, suporte e geração de modelos em sugests_diagrams/.
---

# Skill: Elaboração de Manual do Usuário Final e Guia Operacional

Esta skill orienta o agente na construção do **Manual do Usuário Final e Guia Operacional (End-User Manual & Operations Guide)**, focado exclusivamente na experiência do usuário final, usabilidade e suporte operacional.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as normas de comunicação técnica à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar ISO 26514, IEEE 1063 ou SWEBOK no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de redigir o Manual do Usuário e Guia Operacional em LaTeX ou sugerir diagramas de jornada, o agente **NÃO deve assumir perfis ou fluxos sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação Operacional)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após o Guia de Implantação/DevOps) do projeto atual?
2. **Perfis de Usuário Final e Níveis de Acesso:**
   - Quem são os usuários finais que consultarão este manual (ex.: Recepcionistas, Médicos/Especialistas, Farmacêuticos, Gestores, Clientes)?
   - Qual é o nível de familiaridade técnica dessas pessoas (leigo, intermediário, administrativo)?
3. **Jornadas e Rotinas Diárias Mais Frequentes:**
   - Quais são as 3 a 5 tarefas que esses operadores executam com maior frequência no dia a dia?
   - Quais funcionalidades geram mais dúvidas ou retrabalho se executadas incorretamente?
4. **Mapeamento de Telas e Interfaces:**
   - Quais telas principais do sistema devem ser documentadas com roteiro passo a passo?
   - Há capturas reais de tela disponíveis ou devem ser usados esquemas visuais orientados a telas?
5. **Erros Comuns e Recuperação (Troubleshooting):**
   - Quais são as mensagens de erro ou bloqueios operacionais mais frequentes?
   - Qual é a ação imediata recomendada para o próprio operador destravar o fluxo?
6. **Canais e Horários de Suporte:**
   - Quais são os contatos reais ou de referência para suporte técnico (e-mail, telefone, horário, SLA)?

### 1.2. Proposição Estruturada e Sugestão de Artefatos
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Estrutura de Capítulos do Manual** organizada pelas jornadas reais do usuário;
- **Matriz de Resolução de Problemas (Troubleshooting)** e FAQ sugerido;
- **Relação de Telas e Diagramas no StarUML v7.0:**
  1. `Imagens/ui_<funcionalidade>.png`: Capturas de tela limpas das interfaces operacionais;
  2. `Imagens/act_jornada_<perfil>.png`: Diagrama de Atividades representando a jornada de navegação do usuário.

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova esta organização das jornadas operacionais, catálogo de telas/fluxos e FAQ sugeridos para prosseguirmos com a elaboração formal do Manual do Usuário em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O manual destina-se a usuários finais e operadores. **É terminantemente proibido citar normas técnicas (ISO 26514, IEEE 1063, SWEBOK)** no corpo do texto.
- **ZERO JARGÕES TÉCNICOS:** Proibido citar termos como endpoints, JSON, SQL, Docker, DTOs, classes ou bancos de dados. Linguagem estritamente orientada a tarefas do usuário.
- **GRADE NÍTIDA EM TABELAS:** Todas as tabelas de troubleshooting e perfis de acesso devem possuir linhas verticais e horizontais explícitas (`|Y|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem ser geradas em `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Manual

1. **Apresentação e Primeiros Passos**
   - Boas-vindas, requisitos mínimos (navegadores homologados) e procedimento de acesso e recuperação de senha.

2. **Perfis de Usuário e Níveis de Acesso**
   - Tabela explicativa detalhando o que cada papel operacional pode ver e executar.

3. **Guias Operacionais Passo a Passo por Funcionalidade**
   - Roteiros numerados com objetivo da operação, pré-requisitos, passo a passo e mensagem de confirmação de sucesso.

4. **Tratamento de Dúvidas Frequentes (FAQ)**
   - Respostas diretas para as 8 a 12 perguntas mais comuns dos operadores.

5. **Guia de Resolução de Problemas (Troubleshooting)**
   - Tabela sintetizando sintomas/mensagens de erro, causas prováveis e ação corretiva imediata.

6. **Canais de Suporte e Atendimento**
   - Contatos, horários e níveis de atendimento da equipe de Helpdesk.

---

## 4. Modelos de Seções e Tabelas em LaTeX (Grade Nítida e Cabeçalho Bege)

### Template do Roteiro Passo a Passo
```latex
\section{Como Realizar um Novo Agendamento}

\paragraph{Objetivo da Operação:}
Permite reservar um horário na agenda de atendimentos para um cliente existente ou novo.

\subsection*{Passo a Passo da Operação}
\begin{enumerate}
    \item No menu lateral esquerdo, clique em \textbf{Agenda de Atendimentos};
    \item No canto superior direito da tela, clique no botão azul \textbf{+ Novo Agendamento};
    \item No campo de busca, digite o \textbf{CPF ou Nome Completo} do cliente e selecione-o na lista suspensa;
    \item Selecione o \textbf{Profissional} desejado no campo de seleção;
    \item No calendário interativo, clique sobre o \textbf{Horário Livre} pretendido;
    \item Confirme os dados na janela de resumo que será exibida;
    \item Clique em \textbf{Salvar Agendamento}.
\end{enumerate}

\paragraph{Confirmação de Sucesso:}
O sistema exibirá a notificação \textbf{``Agendamento realizado com sucesso!''} e enviará automaticamente a confirmação por mensagem ao cliente.
```

### Tabela de Resolução de Problemas (Troubleshooting)
```latex
\begin{table}[htbp]
\caption{Guia Rápido de Resolução de Problemas Operacionais}
\label{tab:faq_troubleshooting}
\centering
\small
\begin{tabularx}{\textwidth}{|Y|Y|Y|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Mensagem / Sintoma na Tela} & \textbf{Causa Provável} & \textbf{O que Fazer} \\ \hline
``Horário Indisponível'' & Outro operador reservou o horário simultaneamente. & Clique em Atualizar Agenda e escolha o próximo horário livre disponível. \\ \hline
``Sessão Expirada'' & O sistema ficou inativo por mais de 30 minutos por segurança. & Clique em OK, digite novamente seu e-mail e senha na tela de login. \\ \hline
``CPF Não Localizado'' & O cliente ainda não possui cadastro na clínica. & Clique no botão ``+ Novo Cliente'' e preencha os dados básicos antes de agendar. \\ \hline
\end{tabularx}
\end{table}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para fluxos de navegação e jornada do usuário (`act_jornada_<perfil>`), o agente gera a subpasta `sugests_diagrams/act_jornada_<perfil>/` contendo:
1. `act_jornada_<perfil>.puml`: Código PlantUML do fluxo de telas;
2. `act_jornada_<perfil>.png`: Imagem da prévia do PlantUML;
3. `act_jornada_<perfil>.md`: Roteiro passo a passo textual para modelar no StarUML v7.0 (Activity Diagram, Initial/Final Nodes, Actions com linguagem de tela e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está 100% livre de citações a normas (ISO 26514, IEEE 1063) e de jargões técnicos de programação?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] Todos os procedimentos possuem instruções numeradas com verbos de ação claros e mensagem de validação?
- [ ] O guia de troubleshooting fornece ações concretas para o operador resolver sozinho?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
