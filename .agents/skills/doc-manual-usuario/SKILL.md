---
name: doc-manual-usuario
description: Guia o agente na elaboração do Manual do Usuário Final e Guia Operacional do Sistema, com linguagem clara, fluxos passo a passo com telas, FAQ e guia de suporte, sem jargões técnicos de programação.
---

# Skill: Elaboração de Manual do Usuário Final e Guia Operacional

Esta skill orienta o agente na construção do **Manual do Usuário Final e Guia Operacional (End-User Manual & Operations Guide)**, em estrita conformidade com as normas internacionais **ISO/IEC/IEEE 26514:2022** e **IEEE Std 1063-2001**, fundamentada nas disciplinas de Comunicação Técnica e Operações do **SWEBOK v4**.

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
- **Riqueza de Capturas de Tela:** Todo procedimento principal deve indicar a imagem da interface correspondente na pasta `Imagens/`.

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

## 3. Modelos de Tabelas e Seções em LaTeX

### Template do Roteiro Passo a Passo
> **Diretriz:** NÃO utilize caixas gráficas de destaque (`destaque`, `tcolorbox`). Use texto fluido com parágrafos nomeados:

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
``Horário Indisponível'' & Outro atendente reservou o horário segundos antes. & Atualize a tela clicando em \textbf{Recarregar} e selecione o próximo horário livre. \\
``CPF já cadastrado no sistema'' & O cliente já possui cadastro anterior na clínica. & Use a barra de busca pelo nome ou localize o cadastro existente para atualizar os dados. \\
``Sessão Expirada por Inatividade'' & O sistema ficou aberto por mais de 30 minutos sem uso. & Digite novamente seu e-mail e senha na tela de login. Nenhuma informação salva será perdida. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 4. Checklist de Qualidade do Agente

- [ ] A linguagem está 100% livre de jargões técnicos de software e banco de dados?
- [ ] Todas as instruções seguem numeração cronológica acionável?
- [ ] As telas e botões citados correspondem exatamente aos nomes visíveis na interface?
- [ ] O FAQ e a tabela de troubleshooting fornecem respostas diretas para os operadores?
- [ ] Há orientações claras sobre como solicitar suporte técnico quando um problema persistir?
