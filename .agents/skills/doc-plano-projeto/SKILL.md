---
name: doc-plano-projeto
description: Orienta o agente na elaboração do Documento de Plano de Projeto e Viabilidade (SPMP / Project Charter), cobrindo escopo preliminar, trade-offs técnicos, WBS, Gantt, matriz de riscos, infraestrutura, equipe, custos e modelagem no StarUML v7.0.
---

# Skill: Elaboração de Plano de Projeto e Viabilidade de Software

Esta skill orienta o agente na concepção, estruturação e redação formal do **Plano de Gerenciamento de Projeto de Software (SPMP - Software Project Management Plan)** e **Estudo de Viabilidade Técnica e Econômica (Project Charter / Business Case)**. O documento gerado fundamenta a justificativa estratégica do software, sua viabilidade de engenharia e os parâmetros rigorosos de governança, cronograma, custos, infraestrutura e riscos.

O agente atua simultaneamente como **gerente técnico de projeto** e **copiloto de modelagem no StarUML v7.0**, auxiliando a estruturação da Estrutura Analítica do Projeto (WBS/EAP) e o mapeamento dos marcos do projeto.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

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

## 2. Estrutura Obrigatória do Documento

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
   - **Marcos de Entrega (Milestones):** Definição das datas-chave de validação;
   - **Gráfico de Gantt e Caminho Crítico (CPM):** Mapeamento do caminho que determina o prazo final.

8. **Análise e Gerenciamento de Riscos**
   - Identificação sistemática dos riscos (técnicos, organizacionais, de cronograma e de equipe);
   - Matriz Probabilidade $\times$ Impacto;
   - Registro de Riscos tabulado com: ID, Risco, Probabilidade, Impacto, Gatilho, Ação de Mitigação (preventiva), Ação de Contingência (reativa) e Responsável.

9. **Estimativa de Custos e Orçamento (CAPEX e OPEX)**
   - Custo de infraestrutura durante desenvolvimento e pós-lançamento;
   - Custos de hardware, licenças e mão de obra alocada.

---

## 3. Padrões de Tabelas em LaTeX

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

## 4. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

### 4.1. Estrutura Analítica do Projeto (WBS / EAP)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Class Diagram` (ou `Composite Structure Diagram`) e nomeie como `proj_wbs_escopo`;
2. **Decomposição em Árvore:**
   - Crie a classe raiz do projeto (ex.: `1.0 Projeto VitaCare`);
   - Crie as classes filhas de primeiro nível representando as grandes fases (ex.: `1.1 Planejamento`, `1.2 Requisitos`, `1.3 Arquitetura`, `1.4 Construção`, `1.5 Testes`, `1.6 Deploy`);
   - Crie as classes de pacotes de trabalho (nível 2 e 3) com IDs decimais (ex.: `1.2.1 Elicitação`, `1.2.2 SRS`);
3. **Conexões de Agregação / Composição:**
   - Conecte os níveis usando **`Composition`** (losango preenchido na fase pai apontando para os pacotes de trabalho filhos), estabelecendo uma decomposição hierárquica estrita.

### 4.2. Exportação e Inclusão no Template LaTeX

1. **Procedimento de Exportação:**
   - Acesse **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
   - Resolução **2x ou 3x (300 DPI)** com **fundo branco**;
   - Salvar em `Template_Unificado_LATEX/Imagens/`:
     - `Imagens/proj_wbs_escopo.png`
     - `Imagens/proj_gantt_cronograma.png`

2. **Ativação no LaTeX (`Capitulos/01_Plano_Projeto.tex`):**
   ```latex
   \incluirdiagrama{Imagens/proj_wbs_escopo.png}{Estrutura Analítica do Projeto (WBS)}{fig:proj_wbs}
   ```

---

## 5. Checklist de Qualidade do Agente

- [ ] Todos os custos apresentam distinção clara entre desenvolvimento (CAPEX) e manutenção recorrente (OPEX)?
- [ ] A WBS cobre 100% do escopo do projeto e foi estruturada conforme as diretrizes do StarUML v7.0?
- [ ] As estimativas de hardware diferenciam requisitos de desenvolvimento vs ambiente de produção?
- [ ] Os riscos possuem gatilhos objetivos e responsáveis formalmente designados?
- [ ] O Rationale da solução adotada fundamenta formalmente a exclusão das alternativas de mercado?
