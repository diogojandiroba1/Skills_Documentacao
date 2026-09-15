---
name: doc-manual-usuario
description: Guia o agente na elaboração do Manual do Usuário Final e Guia Operacional do Sistema, com linguagem clara, fluxos passo a passo com telas, FAQ, guia de suporte e diagramas de processos operacionais no StarUML v7.0.
---

# Skill: Elaboração de Manual do Usuário Final e Guia Operacional

Esta skill orienta o agente na construção do **Manual do Usuário Final e Guia Operacional (End-User Manual & Operations Guide)**, em estrita conformidade com as normas internacionais **ISO/IEC/IEEE 26514:2022** e **IEEE Std 1063-2001**, fundamentada nas disciplinas de Comunicação Técnica e Operações do **SWEBOK v4**.

O agente atua simultaneamente como **comunicador técnico e redator de manuais** e **copiloto de modelagem visual**, instruindo a captura correta de telas e a elaboração de fluxogramas de navegação do usuário no **StarUML v7.0**.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas ISO/IEC/IEEE)

A documentação voltada ao usuário final é um artefato crítico para usabilidade, transição e adoção do software:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 10 -- Software Engineering Operations & Chapter 12 -- Professional Practice:**
    * *Technical Communication for End-Users:* Transmissão de conceitos complexos de software através de linguagem natural simplificada, acessível e focada exclusivamente no domínio do problema;
    * *Task-Oriented Instructional Design:* Decomposição de funcionalidades sistêmicas em procedimentos operacionais orientados a tarefas e objetivos do usuário (*Action-Feedback Loops*);
    * *Operational Transition & Error Recovery:* Fornecimento de mecanismos imediatos de diagnóstico e recuperação operacional (*Troubleshooting*) para redução de chamados e garantia da continuidade dos processos de negócio.
* **Normas Internacionais:**
  * **ISO/IEC/IEEE 26514:2022:** *Systems and software engineering -- Requirements for designers and developers of information for users* (Padrão de referência global para informação do usuário: legibilidade, instruções acionáveis, consistência terminológica, navegabilidade e validação com usuários);
  * **IEEE Std 1063-2001:** *Standard for Software User Documentation* (Estrutura de manual do usuário: instruções preliminares de acesso, guias de procedimentos passo a passo, matriz de erros e suporte).

---

## 2. Princípios de Redação e Tom de Voz

- **Linguagem Orientada a Tarefas:** Concentre-se no que o usuário deseja alcançar (ex.: *"Como agendar uma nova consulta"* em vez de *"Endpoint POST de inserção na tabela tb_consulta"*);
- **Zero Jargões Técnicos:** **Proibido** citar termos de desenvolvedor como endpoints, JSON, SQL, Docker, DTOs, classes ou bancos de dados;
- **Instruções Acionáveis e Numeradas:** Cada ação deve ser descrita em passos cronológicos com verbos no imperativo (*"1. Clique em...", "2. Digite...", "3. Selecione..."*);
- **Padronização de Imagens e Telas:** Todas as telas reais do sistema e fluxos de navegação devem residir na pasta `Template_Unificado_LATEX/Imagens/`.

---

## 3. Estrutura Obrigatória do Manual

1. **Apresentação e Primeiros Passos**
   - **Boas-vindas ao Sistema:** Visão geral amigável das funcionalidades disponíveis;
   - **Requisitos Mínimos do Usuário:** Navegadores web homologados (Chrome, Edge, Firefox), resolução de tela e conexão;
   - **Como Acessar o Sistema:** URL de acesso, tela de login, primeiro acesso e procedimento de recuperação de senha segura.

2. **Perfis de Usuário e Níveis de Acesso**
   - Tabela explicativa detalhando o que cada papel operacional pode ver e executar (ex.: Administrador, Atendente, Especialista).

3. **Guias Operacionais Passo a Passo por Funcionalidade**
   - Para cada funcionalidade de negócio do sistema:
     - **Objetivo da Operação:** O que a funcionalidade faz;
     - **Pré-requisitos Operacionais:** O que deve estar pronto antes (ex.: *"O cliente já deve ter cadastro"*);
     - **Passo a Passo Ilustrado:** Roteiro numerado de cliques e preenchimentos;
     - **Dicas de Produtividade:** Atalhos de teclado, filtros de busca rápida e boas práticas operacionais;
     - **Mensagens de Confirmação:** O que aparece na tela quando a operação dá certo.

4. **Tratamento de Dúvidas Frequentes (FAQ)**
   - Respostas diretas para as 8 a 12 perguntas mais comuns dos operadores.

5. **Guia de Resolução de Problemas (Troubleshooting)**
   - Tabela sintetizando mensagens de erro comuns exibidas na tela, suas causas operacionais e a solução imediata (sem necessidade de acionar o suporte técnico).

6. **Canais de Suporte e Atendimento**
   - Telefones, e-mails, horários de atendimento da equipe de Helpdesk e níveis de prioridade de chamados.

---

## 4. Modelos de Tabelas e Seções em LaTeX

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
    \item No calendário interativo, clique sobre o \textbf{Horário Livre} pretendido (identificado pela cor verde);
    \item Confirme os dados na janela de resumo que será exibida;
    \item Clique em \textbf{Salvar Agendamento}.
\end{enumerate}

\paragraph{Confirmação de Sucesso:}
O sistema exibirá a notificação verde \textbf{``Agendamento realizado com sucesso!''} e enviará automaticamente uma mensagem de confirmação para o WhatsApp do cliente.
```

### Tabela de Resolução de Problemas (Troubleshooting - Padrão Booktabs)
```latex
\begin{table}[htbp]
\caption{Guia Rápido de Resolução de Problemas Operacionais}
\label{tab:faq_troubleshooting}
\centering
\small
\begin{tabularx}{\textwidth}{@{} Y Y Y @{}}
\toprule
\textbf{Mensagem / Sintoma na Tela} & \textbf{Causa Provável} & \textbf{O que Fazer} \\
\midrule
``Horário Indisponível'' & Outro operador reservou o horário simultaneamente. & Clique em Atualizar Agenda e escolha o próximo horário livre disponível. \\
``Sessão Expirada'' & O sistema ficou inativo por mais de 30 minutos por segurança. & Clique em OK, digite novamente seu e-mail e senha na tela de login. \\
``CPF Não Localizado'' & O cliente ainda não possui cadastro na clínica. & Clique no botão ``+ Novo Cliente'' e preencha os dados básicos antes de agendar. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 5. Diretrizes para Telas e Fluxos Operacionais no StarUML v7.0

1. **Capturas de Tela da Interface Real:**
   - Salve as capturas limpas de tela no formato `.png` diretamente em `Template_Unificado_LATEX/Imagens/`;
   - Padrão de nomenclatura: `ui_<funcionalidade>.png` (ex.: `ui_login.png`, `ui_agenda_grade.png`, `ui_prontuario.png`).
2. **Diagramas de Fluxo de Navegação do Usuário (StarUML v7.0):**
   - Quando for necessário ilustrar a jornada do usuário entre telas:
     - No StarUML v7.0, crie um **`Activity Diagram`** nomeado `act_jornada_<perfil>`;
     - Use linguagem puramente do usuário (ex.: `Acessar Tela de Login` $\rightarrow$ `Digitar Credenciais` $\rightarrow$ `Visualizar Dashboard Inicial`);
     - Exporte em PNG (300 DPI, fundo branco) para `Imagens/act_jornada_<perfil>.png`.

---

## 6. Checklist de Qualidade do Agente

- [ ] A linguagem está 100% livre de jargões técnicos de programação (sem SQL, JSON, Docker, etc.)?
- [ ] Todos os procedimentos possuem instruções numeradas, tela associada e mensagem de validação?
- [ ] O guia de resolução de problemas (troubleshooting) fornece ações concretas para o operador resolver sozinho?
- [ ] As capturas de tela e eventuais fluxos no StarUML v7.0 estão com nomes padronizados em `Imagens/`?
