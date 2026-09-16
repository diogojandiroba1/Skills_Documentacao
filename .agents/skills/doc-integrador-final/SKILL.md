---
name: doc-integrador-final
description: Orienta o agente na consolidação, harmonização editorial e compilação do Documento Técnico Completo do Ciclo de Vida de Software, cobrindo auditoria ativa de divergências entre capítulos, revisão ortográfica em PT-BR, humanização e eliminação de jargões de IA, conferência de diagramas StarUML v7.0 e compilação no template LaTeX unificado.
---

# Skill: Orquestração, Auditoria e Integração do Documento Técnico Consolidado

Esta skill guia o agente no papel de **Editor Técnico Chefe, Auditor de Consistência e Integrador**, responsável por auditar, harmonizar e unificar os capítulos especializados do ciclo de vida de software em uma única **Especificação Técnica Consolidada**.

O agente desempenha uma tríade de atribuições de alta exigência:
1. **Auditor de Consistência e Divergências Intercapítulos:** Varre ativamente todos os capítulos em busca de contradições técnicas, tecnológicas, de escopo e de modelo de dados, apresentando alternativas de harmonização;
2. **Revisor Ortográfico e "Humanizer" de IA (PT-BR):** Realiza revisão vernácula estrita (Novo Acordo Ortográfico) e expurga cirurgicamente vícios de linguagem, parágrafos genéricos ("fluff") e clichês robóticos típicos de modelos de linguagem;
3. **Auditor Visual do StarUML v7.0 e Mestre de Compilação LaTeX:** Assegura que todos os diagramas foram modelados e exportados em alta resolução e compila o documento completo em 4 passagens sem erros.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de consolidar a compilação final ou reescrever trechos dos capítulos, o agente **NÃO deve assumir decisões unilaterais sobre divergências**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Auditoria e Consolidação Final)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Resolução de Divergências Intercapítulos Mapeadas:**
   - O agente apresenta antecipadamente a tabela de contradições encontradas entre capítulos (ex.: incompatibilidade de SGBDs, divergência entre RFs e Casos de Uso, inconsistência entre modelo conceitual e DDL):
     - *"Identificamos que o Capítulo 1 menciona banco de dados X, enquanto o Capítulo 4 adota Y. Qual decisão deve prevalecer na consolidação final?"*
     - *"O caso de uso UC03 descreve um fluxo com validação Z que não consta na regra de negócio RN04 do Capítulo 2. Deseja unificar mantendo a validação?"*
2. **Diretriz Editorial e Humanização (PT-BR):**
   - *"Autoriza a aplicação do protocolo 'Humanizer' para reescrever parágrafos prolixos e eliminar clichês típicos de IA (como 'é importante ressaltar', 'vale destacar', 'neste contexto'), tornando o texto 100% autoral, direto e técnico?"*
3. **Metadados e Identificação Oficial:**
   - Quais são os dados formais definitivos para a capa e folha de rosto (Instituição, Nome Oficial do Sistema, Subtítulo, Versão SemVer ex.: 1.0.0, Nome dos Autores e Equipe)?
4. **Escopo de Compilação:**
   - Todos os capítulos disponíveis serão consolidados no documento unificado (`main.tex`) ou há necessidade de gerar simultaneamente versões individuais com capa própria (`main_individual.tex`)?
5. **Auditoria de Imagens e Diagramas do StarUML v7.0:**
   - Todos os diagramas prescritos foram devidamente modelados no StarUML v7.0 e exportados para `Template_Unificado_LATEX/Imagens/` em 300 DPI com fundo branco?
   - Há algum diagrama ausente que ainda requeira assistência passo a passo de modelagem?

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

## 2. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

Esta skill sintetiza e orquestra o ciclo de vida completo de engenharia de software com base em:
- **SWEBOK v4 -- Áreas de Conhecimento Transversais e Síntese do Ciclo de Vida:**
  - *Capítulo 8 (Software Engineering Management):* Governança de escopo, integração contínua de artefatos, sincronização entre disciplinas de engenharia e gestão de entregas.
  - *Capítulo 11 (Software Engineering Process):* Implementação de processos do ciclo de vida, modelos de processo (incremental, ágil, formal) e auditoria de aderência aos processos.
  - *Capítulo 12 (Software Engineering Models and Methods):* Consistência entre representações formais (modelos conceituais, arquiteturais e de detalhamento comportamental/estrutural).
- **ISO/IEC/IEEE 15288:2023 (*Systems and software engineering -- System life cycle processes*):** Governança transversal e integração de estágios de ciclo de vida.
- **ISO/IEC/IEEE 12207:2017 (*Systems and software engineering -- Software life cycle processes*):** Definição unificada dos processos primários e processos de suporte (documentação, auditoria e V&V).
- **Novo Acordo Ortográfico da Língua Portuguesa:** Padronização ortográfica formal para redação científica e técnica em PT-BR.

---

## 3. Atribuições Centrais da Skill

### 3.1. Detecção Ativa e Resolução de Divergências Intercapítulos (Cross-Chapter Audit)
O agente deve cruzar sistematicamente as declarações técnicas entre capítulos para eliminar inconsistências:

1. **Stack Tecnológico e Infraestrutura:**
   - Comparar o CAPEX/OPEX do Cap. 1 com o stack do Cap. 4 (Arquitetura), as dependências do Cap. 5 (Design) e os contêineres Docker do Cap. 7 (DevOps);
   - *Exemplo de Inconsistência:* Cap. 1 prevê MySQL, mas o Cap. 4 e Cap. 5 adotam PostgreSQL 16.
2. **Escopo e Rastreabilidade de Requisitos:**
   - Verificar se todo `RFxx` do Cap. 2 possui caso de uso correspondente no Cap. 3, classe de projeto no Cap. 5 e caso de teste no Cap. 6;
   - *Requisitos Órfãos:* Requisitos sem implementação no design ou sem caso de teste devem ser apontados imediatamente.
3. **Harmonização de Entidades e Dados:**
   - Assegurar que nomes de entidades, atributos, cardinalidades e papéis sejam idênticos no Modelo Conceitual (Cap. 3), no Diagrama de Classes de Projeto (Cap. 5) e nos DDLs SQL (Cap. 5);
   - *Exemplo de Inconsistência:* Entidade `Paciente` no Cap. 3 com atributo `telefone`, que vira tabela `tb_cliente` com coluna `celular` no Cap. 5.
4. **Metas Não-Funcionais vs Operação e Suporte:**
   - Comparar a meta de disponibilidade e latência do Cap. 2 ($P95 \le 1{,}5$s, uptime 99.5%) com os alertas do Cap. 7 e os SLAs contratuais de atendimento do Cap. 11.

```latex
% Exemplo de Tabela de Resolucao de Divergencias para apresentacao ao usuario
\begin{table}[htbp]
\caption{Matriz de Resolucao de Divergencias Intercapitulos}
\label{tab:divergencias_resolvidas}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l Y Y l @{}}
\toprule
\textbf{Item Auditado} & \textbf{Divergencia Identificada} & \textbf{Solucao Harmonizada} & \textbf{Capitulos Ajustados} \\
\midrule
Banco de Dados & PostgreSQL no Cap. 4 vs MySQL no Cap. 1 & Padronizado PostgreSQL 16 & Cap. 1 e Cap. 7 \\
Nomenclatura Entidade & ``Cliente'' no Cap. 5 vs ``Paciente'' no Cap. 3 & Unificado para ``Paciente'' & Cap. 5 \\
\bottomrule
\end{tabularx}
\end{table}
```

---

### 3.2. Revisão Ortográfica e Gramatical Rigorosa (PT-BR)
O documento consolidado deve exibir padrão impecável de língua portuguesa:
- **Novo Acordo Ortográfico:** Acentuação correta (ex.: *ideia*, *heroico*, *para* sem acento; *inter-relacionamento*, *micro-ondas* com hífen);
- **Regência Verbal e Nominal Técnica:**
  - *"O sistema visa a atender"* (e não *"visa atender"*);
  - *"A falha implica a suspensão"* (e não *"implica na suspensão"*);
  - *"Atender a requisitos"* (com crase quando regido de artigo feminino pl.: *"às exigências"*);
- **Concordância e Paralelismo Sintático:** Listas com marcadores devem manter o mesmo tempo verbal e estrutura gramatical em todos os itens;
- **Padronização Tipográfica:** Uso uniforme de maiúsculas para siglas consagradas (SGBD, API, DTO, ORM, SLA, LGPD) e nomes de padrões GoF.

---

### 3.3. Módulo "Humanizer": Desintoxicação de Jargões e Clichês de IA
Documentos gerados por IA frequentemente contêm padrões repetitivos, transições vazias e linguagem excessivamente genérica. O agente integrador deve atuar como um **filtro humanizador severo**, reescrevendo o texto para garantir tom sóbrio, autoral e profissional.

#### 🚫 Blacklist de Vícios e Clichês de IA (Expurgar Rigorosamente)
| Expressão Proibida de IA | Por que remover | Como reescrever / Substituição Recomendada |
|:---|:---|:---|
| *"É importante ressaltar/destacar que..."* | Muleta de transição robótica vazia. | Exclua a frase e inicie diretamente pelo fato técnico. |
| *"No cenário atual...", "No mundo contemporâneo..."* | Introdução genérica e prolixa. | Elimine. Descreva diretamente o contexto operacional do sistema. |
| *"Uma verdadeira tapeçaria de...", "Mosaico de..."* | Metáfora poética incompatível com Engenharia. | Substitua por *"O conjunto integrado de componentes..."* ou *"A estrutura..."*. |
| *"Desempenha um papel crucial/fundamental/divisor de águas"* | Hiperbólico e repetitivo em LLMs. | Substitua por *"É responsável por..."*, *"Garante..."* ou detalhe o impacto exato. |
| *"Em suma...", "Em resumo...", "Concluindo..."* | Conclusão burocrática em cada seção. | Elimine o clichê. Finalize o tópico de forma assertiva com a implicação técnica. |
| *"Solução robusta, de ponta, revolucionária"* | Adjetivação vazia e sem comprovação técnica. | Remova os adjetivos e apresente métricas concretas (SLA, latência, cobertura). |
| *"Como mencionado anteriormente..."* | Vício de linguagem que denota desorganização. | Substitua por referência cruzada formal: `\autoref{sec:...}`. |
| *"Com o intuito de...", "A fim de que se possa..."* | Prolixidade passiva. | Substitua pelo verbo direto no infinitivo: *"Para permitir..."*, *"Para validar..."*. |

#### ✍️ Diretrizes de Redação Humanizada e Técnica Sênior:
- **Voz Ativa e Sujeito Claro:** Em vez de *"Foi implementada a validação pelo módulo"*, prefira *"O módulo de agendamento valida..."*;
- **Densidade Técnica vs "Fluff":** Se um parágrafo não adiciona uma regra de negócio, métrica, parâmetro ou decisão técnica real, **ele deve ser apagado ou enxugado**;
- **Não Repetir Tabelas em Texto Puro:** O texto que antecede uma tabela `booktabs` deve explicar a relevância dos dados, e não narrar roboticamente cada linha já visível na tabela.

---

### 3.4. Auditoria de Modelagem e Diagramas no StarUML v7.0
- **Proibição de Diagramas-como-Código:** Confirmar que nenhum diagrama PlantUML ou Mermaid permaneça no texto final;
- **Conformidade StarUML v7.0:** Assegurar que todos os diagramas foram modelados visualmente no StarUML v7.0 e exportados para `Template_Unificado_LATEX/Imagens/` com fundo branco e resolução mínima de 300 DPI (escala 2x ou 3x);
- **Substituição dos Placeholders:** Auditar se todos os blocos de placeholders dos capítulos foram substituídos pelos comandos reais `\incluirdiagrama{Imagens/<arquivo>.png}{...}{fig:...}`;
- **Catálogo de Imagens:** Conferir a presença dos arquivos padronizados:
  - `proj_wbs_escopo.png`, `proj_gantt_cronograma.png`
  - `uc_geral.png`, `uc_<modulo>.png`
  - `cls_conceitual_dominio.png`, `cls_projeto_<modulo>.png`
  - `seq_<caso_uso>.png`, `dsm_<entidade>.png`, `act_<processo>.png`
  - `arch_visao_logica.png`, `arch_visao_desenvolvimento.png`, `arch_visao_processos.png`, `arch_visao_implantacao.png`, `arch_visao_seguranca.png`
  - `test_piramide_estrategia.png`, `test_ciclo_defeito.png`
  - `devops_pipeline_cicd.png`, `devops_topologia_infra.png`
  - `scm_branching_model.png`, `sqa_processo_revisao.png`, `manut_ciclo_incidente.png`.

---

## 4. Roteiro de Verificação e Compilação

### Etapa 1: Inspeção de Integridade dos Arquivos
Verifique se os capítulos modulares estão presentes na pasta `Capitulos/`:
- `01_Plano_Projeto.tex`
- `02_Especificacao_Requisitos.tex`
- `03_Modelagem_Casos_Uso.tex`
- `04_Arquitetura_Software.tex`
- `05_Design_Tecnico.tex`
- `06_Plano_Testes.tex`
- `07_Implantacao_DevOps.tex`

### Etapa 2: Configuração dos Metadados em `main.tex`
Certifique-se de que os metadados do documento estão devidamente configurados:
```latex
\instituicao{Universidade Federal de Sergipe -- UFS\\Departamento de Computação}
\projeto{Nome do Projeto de Software}
\documentotipo{Especificação Técnica Consolidada de Software}
\title{Título do Sistema}
\subtitulo{Subtítulo Descritivo da Solução}
\versao{1.0.0}
\autor{Nome dos Autores / Equipe}
```

### Etapa 3: Ciclo de Compilação Completo em 4 Passagens
Para resolver todas as referências cruzadas, sumário, lista de figuras e citações bibliográficas:
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

## 5. Matriz Global de Rastreabilidade do Projeto

O integrador deve manter no documento consolidado a matriz global resumida:

```latex
\begin{table}[htbp]
\caption{Matriz Global de Rastreabilidade do Ciclo de Vida Completo}
\label{tab:rastreabilidade_global}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l l l l l c @{}}
\toprule
\textbf{RF} & \textbf{Caso de Uso} & \textbf{Decisão (ADR)} & \textbf{Entidade / Tabela} & \textbf{Caso de Teste} & \textbf{Status} \\
\midrule
RF01 & UC00 (Autenticação) & ADR-01 (RBAC) & \texttt{tb\_usuario} & CT-AUTH-01 & \badgeconcluido \\
RF02 & UC01 (Agendamento) & ADR-02 (Transação ACID) & \texttt{tb\_consulta} & CT-AGE-01 & \badgeconcluido \\
RF03 & UC03 (Prontuário) & ADR-03 (Criptografia) & \texttt{tb\_prontuario} & CT-PEP-01 & \badgeemprogresso \\
RF04 & UC05 (Estoque) & ADR-02 (Estoque) & \texttt{tb\_insumo} & CT-EST-01 & \badgenaoiciada \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 6. Checklist Final de Entrega do Agente Integrador

- [ ] A rodada investigativa de perguntas técnicas foi realizada com o usuário e a proposta foi formalmente aprovada antes da consolidação?
- [ ] Todas as divergências conceituais, tecnológicas e de dados entre capítulos foram mapeadas e resolvidas?
- [ ] O texto passou por revisão ortográfica estrita em PT-BR (Novo Acordo Ortográfico)?
- [ ] O filtro "Humanizer" foi aplicado, eliminando 100% dos jargões, clichês e parágrafos ociosos ("fluff") de IA?
- [ ] Não há nenhum termo da Blacklist de IA remanescente no texto?
- [ ] Todos os diagramas foram gerados pelo StarUML v7.0 e exportados com resolução adequada (300 DPI, fundo branco) em `Imagens/`?
- [ ] Os placeholders temporários foram ativados com os diagramas reais exportados?
- [ ] O sumário, lista de figuras e lista de tabelas estão perfeitamente populados?
- [ ] Não há nenhum aviso de referência quebrada (`Reference undefined` ou `Citation undefined`) no log de compilação?
- [ ] A compilação LaTeX executa com zero erros fatais?
- [ ] O documento atende integralmente ao modelo de completude ArchCaMo e às boas práticas do SWEBOK v4?
