---
name: doc-integrador-final
description: Orienta o agente na consolidação, harmonização editorial e compilação do Documento Técnico Completo do Ciclo de Vida de Software, cobrindo auditoria de divergências, revisão em PT-BR, humanização contra jargões de IA, tabelas com cabeçalho bege e compilação LaTeX.
---

# Skill: Orquestração, Auditoria e Integração do Documento Técnico Consolidado

Esta skill guia o agente no papel de **Editor Técnico Chefe, Auditor de Consistência e Integrador**, responsável por auditar, harmonizar e unificar os capítulos especializados do ciclo de vida de software em uma única **Especificação Técnica Consolidada**.

O agente desempenha uma tríade de atribuições de alta exigência:
1. **Auditor de Consistência e Divergências Intercapítulos:** Varre ativamente todos os capítulos em busca de contradições técnicas, tecnológicas, de escopo e de modelo de dados, apresentando alternativas de harmonização;
2. **Revisor Ortográfico e "Humanizer" de IA (PT-BR):** Realiza revisão vernácula estrita (Novo Acordo Ortográfico) e expurga cirurgicamente vícios de linguagem, parágrafos genéricos ("fluff") e clichês robóticos típicos de modelos de linguagem;
3. **Auditor Visual do StarUML v7.0 e Mestre de Compilação LaTeX:** Assegura que todos os diagramas foram modelados e exportados em alta resolução (com modelos arquivados em `sugests_diagrams/`), tabelas no padrão com cabeçalho bege e compila o documento completo em 4 passagens sem erros.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de consolidar a compilação final ou reescrever trechos dos capítulos, o agente **NÃO deve assumir decisões unilaterais sobre divergências**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Auditoria e Consolidação Final)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se da consolidação de um projeto em andamento ou da estruturação de um **Novo Projeto do Zero**?
2. **Resolução de Divergências Intercapítulos Mapeadas:**
   - O agente apresenta antecipadamente a tabela de contradições encontradas entre capítulos (ex.: incompatibilidade de SGBDs, divergência entre RFs e Casos de Uso, inconsistência entre modelo conceitual e DDL):
     - *"Identificamos que o Capítulo 1 menciona banco de dados X, enquanto o Capítulo 4 adota Y. Qual decisão deve prevalecer na consolidação final?"*
     - *"O caso de uso UC03 descreve um fluxo com validação Z que não consta na regra de negócio RN04 do Capítulo 2. Deseja unificar mantendo a validação?"*
3. **Diretriz Editorial e Humanização (PT-BR):**
   - *"Autoriza a aplicação do protocolo 'Humanizer' para reescrever parágrafos prolixos e eliminar clichês típicos de IA (como 'é importante ressaltar', 'vale destacar', 'neste contexto'), tornando o texto 100% autoral, direto e técnico?"*
4. **Metadados e Identificação Oficial:**
   - Quais são os dados formais definitivos para a capa e folha de rosto (Instituição, Nome Oficial do Sistema, Subtítulo, Versão SemVer ex.: 1.0.0, Nome dos Autores e Equipe)?
5. **Escopo de Compilação:**
   - Todos os capítulos disponíveis serão consolidados no documento unificado (`main.tex`) ou há necessidade de gerar simultaneamente versões individuais com capa própria (`main_individual.tex`)?
6. **Auditoria de Imagens e Diagramas do StarUML v7.0:**
   - Todos os diagramas prescritos foram devidamente modelados no StarUML v7.0 e exportados para `Template_Unificado_LATEX/Imagens/` em 300 DPI com fundo branco?
   - O Diagrama de Gantt está configurado via `pgfgantt` nativo no Capítulo 1?

### 1.2. Proposição Estruturada e Relatório de Pré-Integração
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Matriz de Divergências e Proposta de Harmonização:** Tabela indicando capítulos conflitantes e a solução adotada;
- **Relatório de Revisão Textual e Humanização:** Amostras de trechos ajustados (removendo clichês de IA e corrigindo regência/concordância);
- **Esboço da Matriz Global de Rastreabilidade** ($RF \leftrightarrow UC \leftrightarrow ADR \leftrightarrow Classe \leftrightarrow Teste$);
- **Configuração Final dos Metadados** de capa e folha de rosto.

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova a resolução das divergências propostas, o plano de humanização textual e os metadados consolidados para iniciarmos a compilação oficial em 4 passagens do documento unificado?"*
> **Nenhuma compilação final ou alteração nos arquivos dos capítulos deve ser executada antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento consolidado é puramente técnico do software corporativo. Não cite no texto expressões como *"conforme o SWEBOK"*, *"segundo a ISO 12207"*, etc. Seguir os critérios normativos na organização e integridade sem poluir o texto com citações a normas.
- **GRADE NÍTIDA EM TABELAS:** Todas as matrizes de rastreabilidade, comparativos e tabelas devem ter linhas verticais e horizontais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}` e `pgfgantt`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem permanecer nas subpastas `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Atribuições Centrais da Skill

### 3.1. Detecção Ativa e Resolução de Divergências Intercapítulos (Cross-Chapter Audit)
O agente deve cruzar sistematicamente as declarações técnicas entre capítulos para eliminar inconsistências:
1. **Stack Tecnológico e Infraestrutura:** Comparar Cap. 1 com Cap. 4, Cap. 5 e Cap. 7;
2. **Escopo e Rastreabilidade:** Verificar se todo `RFxx` do Cap. 2 possui caso de uso (Cap. 3), classe (Cap. 5) e teste (Cap. 6);
3. **Harmonização de Entidades:** Nomes de tabelas, atributos e cardinalidades idênticos no Cap. 3 e Cap. 5;
4. **Metas Não-Funcionais vs Operação:** Comparar metas do Cap. 2 com alertas do Cap. 7 e SLAs do Cap. 11.

```latex
\begin{table}[htbp]
\caption{Matriz de Resolução de Divergências Intercapítulos}
\label{tab:divergencias_resolvidas}
\centering
\small
\begin{tabularx}{\textwidth}{|l|Y|Y|l|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Item Auditado} & \textbf{Divergência Identificada} & \textbf{Solução Harmonizada} & \textbf{Capítulos Ajustados} \\ \hline
Banco de Dados & PostgreSQL no Cap. 4 vs MySQL no Cap. 1 & Padronizado PostgreSQL 16 & Cap. 1 e Cap. 7 \\ \hline
Nomenclatura Entidade & ``Cliente'' no Cap. 5 vs ``Paciente'' no Cap. 3 & Unificado para ``Paciente'' & Cap. 5 \\ \hline
\end{tabularx}
\end{table}
```

---

### 3.2. Revisão Ortográfica e Gramatical Rigorosa (PT-BR)
- **Novo Acordo Ortográfico:** Acentuação e hífen rigorosamente revisados;
- **Regência Verbal e Nominal Técnica:** *"O sistema visa a atender"*, *"A falha implica a suspensão"*, crase correta;
- **Concordância e Paralelismo Sintático:** Listas com marcadores mantendo mesma estrutura gramatical;
- **Padronização Tipográfica:** Uso uniforme de maiúsculas para siglas (SGBD, API, DTO, ORM, SLA, LGPD).

---

### 3.3. Módulo "Humanizer": Desintoxicação de Jargões e Clichês de IA
O agente integrador deve expurgar cirurgicamente muletas robóticas e texto vazio:

#### 🚫 Blacklist de Vícios e Clichês de IA
| Expressão Proibida de IA | Por que remover | Como reescrever / Substituição Recomendada |
|:---|:---|:---|
| *"É importante ressaltar/destacar que..."* | Muleta de transição robótica vazia. | Exclua a frase e inicie diretamente pelo fato técnico. |
| *"No cenário atual...", "No mundo contemporâneo..."* | Introdução genérica e prolixa. | Elimine. Descreva diretamente o contexto operacional do sistema. |
| *"Uma verdadeira tapeçaria de...", "Mosaico de..."* | Metáfora poética incompatível com Engenharia. | Substitua por *"O conjunto integrado de componentes..."*. |
| *"Desempenha um papel crucial/fundamental"* | Hiperbólico e repetitivo em LLMs. | Substitua por *"É responsável por..."*, *"Garante..."*. |
| *"Em suma...", "Em resumo...", "Concluindo..."* | Conclusão burocrática em cada seção. | Elimine o clichê. Finalize de forma assertiva com a implicação técnica. |
| *"Solução robusta, de ponta, revolucionária"* | Adjetivação vazia e sem comprovação técnica. | Remova os adjetivos e apresente métricas concretas (SLA, latência). |
| *"Como mencionado anteriormente..."* | Vício que denota desorganização. | Substitua por referência cruzada formal: `\autoref{sec:...}`. |
| *"Com o intuito de...", "A fim de que se possa..."* | Prolixidade passiva. | Substitua pelo verbo direto: *"Para permitir..."*, *"Para validar..."*. |

---

### 3.4. Auditoria de Modelagem e Diagramas
- **Conformidade StarUML v7.0:** Assegurar que todos os diagramas foram modelados e exportados para `Template_Unificado_LATEX/Imagens/` com fundo branco e resolução de 300 DPI;
- **Gantt Nativo:** Garantir que o Diagrama de Gantt use `pgfgantt` nativo no Capítulo 1;
- **Apoio Arquivado:** Confirmar que as subpastas `sugests_diagrams/<nome_diagrama>/` contêm os arquivos `.puml`, `.png` e `.md` correspondentes para cada modelo;
- **Catálogo de Imagens:** Conferir a presença dos arquivos padronizados em `Imagens/`.

---

## 4. Roteiro de Verificação e Compilação

### Ciclo de Compilação Completo em 4 Passagens
```bash
# 1. Primeira passagem para gerar arquivos auxiliares (.aux)
pdflatex -interaction=nonstopmode main.tex

# 2. Resolução de referências bibliográficas
bibtex main

# 3. Segunda passagem para incorporar a bibliografia
pdflatex -interaction=nonstopmode main.tex

# 4. Terceira passagem para consolidar todas as referências cruzadas
pdflatex -interaction=nonstopmode main.tex
```

---

## 5. Matriz Global de Rastreabilidade do Projeto (Grade Nítida e Cabeçalho Bege)

```latex
\begin{table}[htbp]
\caption{Matriz Global de Rastreabilidade do Ciclo de Vida Completo}
\label{tab:rastreabilidade_global}
\centering
\small
\begin{tabularx}{\textwidth}{|l|l|l|l|l|c|}
\hline
\rowcolor{tableheaderbeige}
\textbf{RF} & \textbf{Caso de Uso} & \textbf{Decisão (ADR)} & \textbf{Entidade / Tabela} & \textbf{Caso de Teste} & \textbf{Status} \\ \hline
RF01 & UC00 (Autenticação) & ADR-01 (RBAC) & \texttt{tb\_usuario} & CT-AUTH-01 & \badgeconcluido \\ \hline
RF02 & UC01 (Agendamento) & ADR-02 (Transação ACID) & \texttt{tb\_consulta} & CT-AGE-01 & \badgeconcluido \\ \hline
RF03 & UC03 (Prontuário) & ADR-03 (Criptografia) & \texttt{tb\_prontuario} & CT-PEP-01 & \badgeemprogresso \\ \hline
RF04 & UC05 (Estoque) & ADR-02 (Estoque) & \texttt{tb\_insumo} & CT-EST-01 & \badgenaoiciada \\ \hline
\end{tabularx}
\end{table}
```

---

## 6. Checklist Final de Entrega do Agente Integrador

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O documento está 100% livre de citações nominais a normas (SWEBOK, ISO 12207, etc.)?
- [ ] Todas as divergências conceituais, tecnológicas e de dados entre capítulos foram mapeadas e resolvidas?
- [ ] O texto passou por revisão ortográfica estrita em PT-BR (Novo Acordo Ortográfico)?
- [ ] O filtro "Humanizer" foi aplicado, eliminando 100% dos jargões e clichês de IA?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] O Diagrama de Gantt está implementado nativamente via `pgfgantt`?
- [ ] Os modelos de apoio dos diagramas estão arquivados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] A compilação LaTeX executa com zero erros fatais?
