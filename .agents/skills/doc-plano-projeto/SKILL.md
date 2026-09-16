---
name: doc-plano-projeto
description: Orienta o agente na elaboração do Documento de Plano de Projeto e Viabilidade (SPMP / Project Charter), cobrindo escopo preliminar, trade-offs técnicos, WBS, Gantt, matriz de riscos, infraestrutura, equipe, custos e modelagem no StarUML v7.0.
---

# Skill: Elaboração de Plano de Projeto e Viabilidade de Software

Esta skill orienta o agente na concepção, estruturação e redação formal do **Plano de Gerenciamento de Projeto de Software (SPMP - Software Project Management Plan)** e **Estudo de Viabilidade Técnica e Econômica (Project Charter / Business Case)**. O documento gerado fundamenta a justificativa estratégica do software, sua viabilidade de engenharia e os parâmetros rigorosos de governança, cronograma, custos, infraestrutura e riscos.

O agente atua simultaneamente como **gerente técnico de projeto** e **copiloto de modelagem no StarUML v7.0**, auxiliando a estruturação da Estrutura Analítica do Projeto (WBS/EAP) e o mapeamento dos marcos do projeto.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de gerar qualquer conteúdo LaTeX para o Plano de Projeto ou sugerir os diagramas no StarUML v7.0, o agente **NUNCA deve assumir premissas arbitrárias**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação Técnica)
O agente deve formular perguntas claras, agrupadas por tópicos essenciais, apresentando opções técnicas com prós, contras e recomendação:

1. **Visão Estratégica e Dores Centrais:**
   - Qual é a dor de negócio central que o software visa sanar? Como a operação funciona atualmente (planilhas, papel, sistema legado falho)?
   - Qual é a proposta de valor única (declaração de posicionamento / Elevator Pitch)?
2. **Escopo, Objetivos e Trade-offs:**
   - O que está expressamente **dentro** do escopo e o que fica **fora** do escopo nesta release?
   - Quais são os objetivos gerais e metas específicas (SMART) mensuráveis?
   - Existe preferência ou pré-disposição para desenvolvimento próprio vs SaaS vs open-source?
3. **Stakeholders e Governança:**
   - Quem são os atores envolvidos, operadores e patrocinadores (para mapeamento na Matriz Poder $\times$ Interesse de Mendelow)?
   - Qual é o modelo de ciclo de vida de desenvolvimento adotado (Scrum, Kanban, Iterativo/Incremental)?
4. **Prazos, Orçamento e Equipe:**
   - Qual é a estimativa de prazo total e se há alguma data-limite regulatória ou comercial inegociável?
   - Qual é o perfil e quantidade de desenvolvedores/engenheiros disponíveis?
   - Premissas de infraestrutura: foco em nuvem pública (CAPEX reduzido, OPEX mensal) ou servidores dedicados/on-premise?
5. **Mapeamento de Riscos:**
   - Quais ameaças técnicas, humanas ou externas são mais temidas no projeto?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza o escopo e apresenta formalmente:
- **Resumo do Escopo e Marcos (Milestones)**;
- **Sugestão de Diagramas no StarUML v7.0:**
  1. `Imagens/proj_wbs_escopo.png`: Estrutura Analítica do Projeto (WBS/EAP) em decomposição hierárquica por fases;
  2. `Imagens/proj_gantt_cronograma.png`: Diagrama de Gantt com raias de fases, predecessores, caminho crítico (CPM) e marcos contratuais.

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova esta estrutura de escopo, cronograma preliminar e a relação de diagramas sugeridos para prosseguirmos com a redação formal do capítulo LaTeX e o guia do StarUML v7.0?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

O conteúdo gerado por esta skill deve aderir estritamente aos corpos de conhecimento e normas internacionais:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 7 -- Software Engineering Management:**
    * *Initiation and Scope Definition:* Elaboração do Project Charter, análise de viabilidade, definição de objetivos de negócio mensuráveis e restrições de contorno;
    * *Software Project Planning:* Decomposição da Estrutura Analítica do Projeto (WBS / EAP), estimativa de prazos com Caminho Crítico (CPM / PERT) e alocação de marcos de entrega (milestones);
    * *Software Project Enactment & Governance:* Gestão de partes interessadas (Stakeholders) e plano de comunicação;
    * *Risk Management:* Identificação sistemática, análise qualitativa (Probabilidade $\times$ Impacto) e planos de mitigação e contingência.
  * **Chapter 11 -- Software Engineering Economics:** Análise de trade-offs de decisão técnica (Make vs. Buy vs. Reuse -- Desenvolvimento Próprio vs. SaaS vs. Open-Source) e estimativa de custos de ciclo de vida (TCO - Total Cost of Ownership).
  * **Chapter 8 -- Software Engineering Process:** Definição do modelo de ciclo de vida (Iterativo/Incremental, Ágil) e ritos de governança.
* **Normas Internacionais:**
  * **IEEE Std 1058-1998:** *Standard for Software Project Management Plans (SPMP)*;
  * **ISO/IEC/IEEE 12207:2017:** *Systems and software engineering -- Software life cycle processes* (Subcláusula 6.3.1 -- *Project Planning Process*);
  * **ISO/IEC/IEEE 16085:2021:** *Systems and software engineering -- Life cycle processes -- Risk management*;
  * **IEEE Std 1490-2011:** *Adoption of the Project Management Institute (PMI) Standard A Guide to the Project Management Body of Knowledge (PMBOK Guide)*.

---

## 3. Estrutura Obrigatória do Documento

1. **Termo de Abertura e Concepção do Projeto (Project Charter)**
   - **Termo de Abertura Formal:** Propósito executivo, justificativa estratégica de mercado e autorização de início do projeto;
   - **Visão do Produto e Declaração de Posicionamento (Elevator Pitch):**
     - *Para* [público-alvo / cliente], *cujo* [problema / necessidade], *o* [nome do software] *é um* [categoria do produto] *que* [benefício-chave / diferencial], *diferente de* [alternativas existentes / concorrentes], *nosso produto* [proposta de valor única];
   - **Análise e Mapeamento de Stakeholders (Matriz Poder $\times$ Interesse de Mendelow):**
     - Classificação dos stakeholders em 4 quadrantes operacionais: *Gerenciar de Perto* (Alto Poder, Alto Interesse), *Manter Satisfeito* (Alto Poder, Baixo Interesse), *Manter Informado* (Baixo Poder, Alto Interesse) e *Monitorar com Esforço Mínimo* (Baixo Poder, Baixo Interesse);
   - Contextualização do domínio de negócio e motivação;
   - Descrição objetiva da situação atual (como os processos são executados hoje);
   - Atores do processo atual e gargalos identificados.

2. **Definição do Problema e Dores do Negócio**
   - Lista explícita dos problemas e impactos (inconsistência de dados, riscos de segurança, retrabalho operacional).

3. **Objetivos do Sistema**
   - **Objetivo Geral:** Propósito central da solução em uma única declaração clara;
   - **Objetivos Específicos:** 5 a 8 metas técnicas e de negócio mensuráveis.

4. **Estudo de Viabilidade e Soluções Alternativas (Trade-offs)**
   - Comparação formal entre três abordagens:
     1. *Desenvolvimento Completo Próprio*;
     2. *Contratação de Software as a Service (SaaS)*;
     3. *Customização de Plataforma Open-source*.
   - Tabela comparativa com critérios de Custo, Tempo, Aderência, Dependência de Terceiros e Soberania dos Dados;
   - **Solução Adotada:** Justificativa técnica (Rationale) respaldada nos requisitos de segurança e negócio.

5. **Especificação de Componentes e Infraestrutura**
   - **Hardware de Produção e Desenvolvimento:** Especificações mínimas para estações de trabalho, nós de servidor e periféricos;
   - **Stack Tecnológico:** Linguagens, frameworks, bibliotecas e SGBD justificados;
   - **Redes e Comunicação:** Topologia LAN, redundância de link externo;
   - **Hospedagem em Nuvem:** Provedor selecionado, instâncias, banco gerenciado e armazenamento de objetos.

6. **Equipe de Desenvolvimento e Topologia**
   - Perfis técnicos necessários e papéis (Arquiteto, Tech Lead, Engenheiro de Requisitos, Devs, DevOps/QA);
   - Matriz RACI preliminar.

7. **Gerenciamento de Tempo e Cronograma**
   - **WBS / EAP (Estrutura Analítica do Projeto):** Decomposição em pacotes de trabalho numerados com duração estimada e rede de predecessores;
   - **Cronograma Sintético:** Tabela consolidada com fases, entregáveis, datas e marcos formais;
   - **Marcos de Entrega (Milestones):** Definição das datas-chave de validação de entregas críticas;
   - **Diagrama de Gantt e Caminho Crítico (CPM):** Representação visual completa do cronograma no StarUML v7.0, detalhando dependências término-a-início (*Finish-to-Start*), durações, paralelismos, marcos de sprint e destaque das atividades no caminho crítico que determinam o prazo final do projeto.

8. **Análise e Gerenciamento de Riscos**
   - Identificação sistemática dos riscos (técnicos, organizacionais, de cronograma e de equipe);
   - Matriz Probabilidade $\times$ Impacto;
   - Registro de Riscos tabulado com: ID, Risco, Probabilidade, Impacto, Gatilho, Ação de Mitigação (preventiva), Ação de Contingência (reativa) e Responsável.

9. **Estimativa de Custos e Orçamento (CAPEX e OPEX)**
   - Custo de infraestrutura durante desenvolvimento e pós-lançamento;
   - Custos de hardware, licenças e mão de obra alocada.

---

## 4. Padrões de Tabelas em LaTeX

### Tabela de Comparação de Alternativas (Padrão Booktabs)
```latex
\begin{table}[htbp]
\caption{Matriz Comparativa de Abordagens de Solução}
\label{tab:comparativo_solucoes}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l Y Y l @{}}
\toprule
\textbf{Abordagem} & \textbf{Vantagens} & \textbf{Desvantagens} & \textbf{Veredito} \\
\midrule
Desenvolvimento Próprio & Aderência estrita às regras de negócio e governança total dos dados. & Maior tempo e custo inicial de desenvolvimento. & \textbf{Adotada} \\
SaaS com Integrações & Rápido início de operação e manutenção pelo provedor. & Custo recorrente elevado e dados sensíveis em nuvem de terceiros. & Descartada \\
Customização Open-source & Custo zero de licença e base pré-existente. & Complexidade de adaptação arquitetural similar a novo desenvolvimento. & Descartada \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 5. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

### 4.1. Estrutura Analítica do Projeto (WBS / EAP)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Class Diagram` (ou `Composite Structure Diagram`) e nomeie como `proj_wbs_escopo`;
2. **Decomposição em Árvore:**
   - Crie a classe raiz do projeto (ex.: `1.0 Projeto VitaCare`);
   - Crie as classes filhas de primeiro nível representando as grandes fases (ex.: `1.1 Planejamento`, `1.2 Requisitos`, `1.3 Arquitetura`, `1.4 Construção`, `1.5 Testes`, `1.6 Deploy`);
   - Crie as classes de pacotes de trabalho (nível 2 e 3) com IDs decimais (ex.: `1.2.1 Elicitação`, `1.2.2 SRS`);
3. **Conexões de Agregação / Composição:**
   - Conecte os níveis usando **`Composition`** (losango preenchido na fase pai apontando para os pacotes de trabalho filhos), estabelecendo uma decomposição hierárquica estrita.

### 4.2. Diagrama de Gantt e Cronograma de Atividades
O Diagrama de Gantt fornece a visualização executiva do tempo, predecessores e marcos do projeto. No **StarUML v7.0**, deve ser modelado com rigor visual através da seguinte abordagem recomendada:

1. **Criação do Diagrama:**
   - No **Model Explorer**, clique com o botão direito no modelo do projeto e selecione:
     `Add Diagram -> Activity Diagram` (ou `Timing Diagram`);
   - Renomeie o diagrama para **`proj_gantt_cronograma`**.
2. **Estruturação por Raias Temporais (Swimlanes Horizontais):**
   - Na Toolbox, selecione **`Horizontal Swimlane`** (ou `Swimlane (Horizontal)`);
   - Crie uma raia horizontal para cada grande fase / sprint do projeto:
     - *Raia 1: Fase 1 -- Iniciação e Planejamento (Semanas 1--2)*
     - *Raia 2: Fase 2 -- Engenharia de Requisitos (Semanas 2--5)*
     - *Raia 3: Fase 3 -- Arquitetura e Design (Semanas 5--7)*
     - *Raia 4: Fase 4 -- Construção e Implementação (Semanas 7--12)*
     - *Raia 5: Fase 5 -- Verificação e Testes (Semanas 11--14)*
     - *Raia 6: Fase 6 -- Homologação e Implantação (Semanas 13--15)*
3. **Inserção dos Pacotes de Trabalho e Atividades:**
   - Para cada atividade da WBS, arraste um **`Action`** (nó retangular arredondado) para dentro de sua respectiva raia temporal;
   - Nomeie o nó com o código WBS, nome da entrega e período estimado.  
     *Exemplo:* `[1.2.2] Especificação SRS IEEE 830 (Sem. 3-4 | 10d)`;
   - Posicione os nós horizontalmente da esquerda para a direita, respeitando a escala cronológica de semanas/meses.
4. **Dependências de Precedência (Finish-to-Start):**
   - Conecte as atividades dependentes utilizando **`Control Flow`** (seta contínua);
   - Indique relações de precedência estritas (uma atividade só inicia após o término de sua predecessora);
   - Atividades paralelas (que ocorrem simultaneamente em diferentes raias) devem divergir de um **`Fork Node`** (barra horizontal preta) e convergir em um **`Join Node`**.
5. **Destaque do Caminho Crítico (Critical Path Method - CPM):**
   - Identifique a sequência de atividades sem folga (*float = 0*) que determina a data final do projeto;
   - No painel **Style** (canto inferior direito), selecione as atividades e setas do caminho crítico e altere a propriedade **`Line Color`** para vermelho (`#D32F2F`) ou aumente a espessura da linha, tornando o caminho crítico visualmente evidente para a gestão.
6. **Inserção de Marcos de Entrega (Milestones):**
   - Insira um elemento **`Decision / Merge Node`** (losango) ou nó de sinal estilizado para cada marco de entrega contratual / técnico;
   - Nomeie com o prefixo do marco e data.  
     *Exemplos:*  
     - `◆ M1: Baseline do Plano Aprovado (Fim Sem. 2)`  
     - `◆ M2: SRS e Casos de Uso Congelados (Fim Sem. 5)`  
     - `◆ M3: Arquitetura SAD Aprovada (Fim Sem. 7)`  
     - `◆ M4: Release Candidate 1.0 (Fim Sem. 12)`  
     - `◆ M5: Go-Live em Produção (Fim Sem. 15)`

### 4.3. Exportação e Inclusão no Template LaTeX

1. **Procedimento de Exportação:**
   - Abra o diagrama no StarUML v7.0;
   - Acesse **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
   - Selecione resolução **2x ou 3x (300 DPI)** com **fundo branco**;
   - Salvar no diretório `Template_Unificado_LATEX/Imagens/`:
     - `Imagens/proj_wbs_escopo.png`
     - `Imagens/proj_gantt_cronograma.png`

2. **Ativação no LaTeX (`Capitulos/01_Plano_Projeto.tex`):**
   ```latex
   % Inclusão da WBS
   \incluirdiagrama{Imagens/proj_wbs_escopo.png}{Estrutura Analítica do Projeto (WBS / EAP)}{fig:proj_wbs}

   % Inclusão do Diagrama de Gantt
   \incluirdiagrama{Imagens/proj_gantt_cronograma.png}{Diagrama de Gantt e Cronograma de Atividades e Marcos}{fig:proj_gantt}
   ```

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa de perguntas técnicas foi realizada com o usuário e a proposta foi formalmente aprovada antes da redação?
- [ ] Todos os custos apresentam distinção clara entre desenvolvimento (CAPEX) e manutenção recorrente (OPEX)?
- [ ] A WBS cobre 100% do escopo do projeto e foi estruturada conforme as diretrizes do StarUML v7.0?
- [ ] O Diagrama de Gantt foi modelado no StarUML v7.0 com raias temporais, predecessores e destaque visual do Caminho Crítico (CPM)?
- [ ] Os marcos de entrega (milestones) estão claramente posicionados na linha do tempo com datas de verificação?
- [ ] As estimativas de hardware diferenciam requisitos de desenvolvimento vs ambiente de produção?
- [ ] Os riscos possuem gatilhos objetivos e responsáveis formalmente designados?
- [ ] O Rationale da solução adotada fundamenta formalmente a exclusão das alternativas de mercado?
