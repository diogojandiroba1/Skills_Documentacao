---
name: doc-plano-manutencao
description: Guia o agente na elaboração do Plano de Manutenção e Suporte de Software, cobrindo tipologia de manutenção, SLAs, suporte N1/N2/N3, triagem de defeitos, hotfixes, tabelas com cabeçalho bege e geração de modelos em sugests_diagrams/.
---

# Skill: Plano de Manutenção e Suporte de Software

Esta skill orienta o agente na formulação do **Plano de Manutenção e Suporte de Software (Software Maintenance & Support Plan)**, estabelecendo regras, níveis de atendimento N1/N2/N3, matriz de SLAs e ritos de hotfix emergencial.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as melhores práticas de manutenção e suporte à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar ISO 14764, SWEBOK ou ITIL no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de redigir o Plano de Manutenção e Suporte de Software em LaTeX ou sugerir diagramas, o agente **NÃO deve assumir modelos de suporte ou SLAs sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de Manutenção e Suporte)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após a Garantia da Qualidade) do projeto atual?
2. **Níveis de Atendimento e Estrutura de Suporte:**
   - Como será estruturado o suporte operacional (Helpdesk N1, Suporte Técnico N2, Engenharia N3)?
   - Quem atende o N1 e quais ferramentas de chamados serão usadas?
3. **Matriz de SLAs e Prazos de Resolução:**
   - Quais são os tempos máximos aceitáveis para primeira resposta e resolução definitiva em cada severidade (P1 a P4)?
4. **Tipologia de Manutenção:**
   - Quais são as prioridades de manutenção esperadas após o go-live (Corretiva, Adaptativa, Perfectiva, Preventiva)?
   - Haverá janelas programadas de manutenção preventiva?
5. **Procedimento de Hotfixes Emergenciais:**
   - Qual é o rito para aplicação de correções urgentes em produção (aprovações mínimas, testes acelerados, merge reverso)?
6. **Política de Descontinuação e EOL (End-of-Life):**
   - Com quanto tempo de antecedência versões antigas de APIs e componentes serão avisadas e descontinuadas?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Matriz de SLAs Contratuais** e papéis de suporte N1/N2/N3;
- **Procedimento Padronizado de Hotfix Emergencial**;
- **Sugestão de Diagramas para Construção no StarUML v7.0:**
  1. `Imagens/manut_ciclo_incidente.png`: Fluxo de Triagem e Escalonamento N1/N2/N3 (Activity Diagram com Swimlanes);
  2. `Imagens/manut_fluxo_hotfix.png`: Fluxo de Hotfix Emergencial em Produção (Activity Diagram).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova esta matriz de SLAs, estrutura de níveis de suporte e os diagramas de incidentes sugeridos para prosseguirmos com a elaboração formal do Plano de Manutenção em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento é puramente técnico de operação e manutenção pós-entrega. Não cite no texto termos como *"conforme a ISO 14764"*, *"segundo o SWEBOK"*. Aplique as definições de manutenção corretiva, adaptativa, perfectiva e preventiva diretamente no contexto da sustentação do sistema.
- **GRADE NÍTIDA EM TABELAS:** Todas as matrizes de SLAs e fluxos de atendimento devem possuir linhas verticais e horizontais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem ser geradas em `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Introdução e Escopo da Manutenção**
   - Transição formal para operação e premissas de sustentação.

2. **Categorias de Manutenção de Software**
   - Manutenção Corretiva, Adaptativa, Perfectiva e Preventiva.

3. **Estrutura de Atendimento e Níveis de Suporte**
   - Definição clara dos papéis e atribuições de N1 (Helpdesk), N2 (Sustentação) e N3 (Engenharia).

4. **Acordos de Nível de Serviço (SLA) e Prazos de Resposta/Solução**
   - Tabela formal de severidades (P1 a P4), tempos de primeira resposta e prazos máximos de resolução.

5. **Fluxo de Solicitação de Mudança e Triagem de Defeitos**
   - Ciclo de vida do chamado e procedimento padronizado de hotfix emergencial.

6. **Política de Descontinuação e Fim de Vida (Deprecation & EOL)**
   - Prazos e regras de notificação para desativação de versões de APIs.

---

## 4. Modelos de Tabelas e Ritos em LaTeX (Grade Nítida e Cabeçalho Bege)

### Tabela de Acordos de Nível de Serviço (SLA)
```latex
\begin{table}[htbp]
\caption{Matriz de Acordos de Nível de Serviço (SLA) de Manutenção}
\label{tab:sla_manutencao}
\centering
\small
\begin{tabularx}{\textwidth}{|l|Y|c|c|l|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Severidade} & \textbf{Critério de Classificação} & \textbf{Resposta Inicial} & \textbf{Resolução Máxima} & \textbf{Equipe Responsável} \\ \hline
Crítica (P1) & Sistema inoperante ou falha de segurança que interrompe as operações. & $\le 15$ minutos & $\le 2$ horas & Engenharia N3 / SRE de plantão \\ \hline
Alta (P2) & Funcionalidade essencial com falha, mas com contorno operacional viável. & $\le 1$ hora & $\le 8$ horas & Suporte N2 / Engenharia N3 \\ \hline
Média (P3) & Erro secundário de interface ou relatório sem impacto no atendimento. & $\le 4$ horas & $\le 48$ horas & Equipe de Sustentação N2 \\ \hline
Baixa (P4) & Dúvidas operacionais de uso ou sugestão de melhoria estética. & $\le 8$ horas & Próxima release & Helpdesk N1 \\ \hline
\end{tabularx}
\end{table}
```

### Rito de Hotfix Emergencial
```latex
\subsection{Procedimento Padronizado para Hotfix em Produção}
Para qualquer incidente classificado como Severidade Crítica (P1):
\begin{enumerate}
    \item O Tech Lead cria a branch temporária \texttt{hotfix/descricao-do-problema} a partir da tag de produção atual;
    \item O engenheiro N3 implementa a correção pontual acompanhada de teste unitário/integrado que reproduza e valide o conserto;
    \item A esteira de CI executa automaticamente os testes automatizados;
    \item Após aprovação expressa do Tech Lead e Arquiteto, o deploy é disparado diretamente para produção;
    \item O merge de retorno é realizado imediatamente para a branch \texttt{main} e \texttt{staging} para evitar regressões futuras.
\end{enumerate}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para cada diagrama deste capítulo, o agente deve gerar uma subpasta dedicada em `sugests_diagrams/`:
- `sugests_diagrams/manut_ciclo_incidente/`
- `sugests_diagrams/manut_fluxo_hotfix/`

Cada subpasta conterá obrigatoriamente três arquivos:
1. `<nome_diagrama>.puml`: Código PlantUML do fluxo de manutenção/incidente;
2. `<nome_diagrama>.png`: Imagem da prévia do PlantUML;
3. `<nome_diagrama>.md`: Roteiro textual detalhado para modelar no StarUML v7.0 (Raias de suporte, actions, decisões de escalonamento e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (ISO 14764, SWEBOK, ITIL)?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] A matriz de SLA especifica tempos máximos contratuais de resposta e resolução definitiva?
- [ ] Há clara distinção entre as 4 categorias de manutenção?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] A política de fim de vida (EOL) estipula prazos prévios para desativação de versões de API?
