---
name: doc-plano-projeto
description: Orienta o agente na elaboração do Documento de Plano de Projeto e Viabilidade (SPMP / Project Charter), cobrindo escopo preliminar, trade-offs técnicos, WBS, Gantt, matriz de riscos, infraestrutura, equipe e custos.
---

# Skill: Elaboração de Plano de Projeto e Viabilidade de Software

Esta skill orienta o agente na concepção, estruturação e redação formal do **Plano de Gerenciamento de Projeto de Software (SPMP - Software Project Management Plan)** e **Estudo de Viabilidade Técnica e Econômica (Project Charter / Business Case)**. O documento gerado fundamenta a justificativa estratégica do software, sua viabilidade de engenharia e os parâmetros rigorosos de governança, cronograma, custos, infraestrutura e riscos.

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

Todo plano de projeto gerado pelo agente deve conter as seguintes seções estruturadas:

1. **Termo de Abertura e Concepção do Projeto (Project Charter)**
   - **Termo de Abertura Formal:** Propósito executivo, justificativa estratégica de mercado e autorização de início do projeto;
   - **Visão do Produto e Declaração de Posicionamento (Elevator Pitch):**
     - *Para* [público-alvo / cliente], *cujo* [problema / necessidade], *o* [nome do software] *é um* [categoria do produto] *que* [benefício-chave / diferencial], *diferente de* [alternativas existentes / concorrentes], *nosso produto* [proposta de valor única];
   - **Análise e Mapeamento de Stakeholders (Matriz Poder $\times$ Interesse de Mendelow):**
     - Classificação dos stakeholders em 4 quadrantes operacionais: *Gerenciar de Perto* (Alto Poder, Alto Interesse), *Manter Satisfeito* (Alto Poder, Baixo Interesse), *Manter Informado* (Baixo Poder, Alto Interesse) e *Monitorar com Esforço Mínimo* (Baixo Poder, Baixo Interesse);
   - Contextualização do domínio de negócio e motivação;
   - Descrição objetiva da situação atual (como os processos são executados hoje: planilhas, papel, sistemas legados fragmentados);
   - Atores do processo atual e gargalos identificados.

2. **Definição do Problema e Dores do Negócio**
   - Lista explícita dos problemas e impactos:
     - Falta de integridade e inconsistência de dados;
     - Riscos de segurança e não conformidade com a LGPD;
     - Retrabalho operacional e perdas financeiras.

3. **Objetivos do Sistema**
   - **Objetivo Geral:** Propósito central da solução em uma única declaração clara;
   - **Objetivos Específicos:** 5 a 8 metas técnicas e de negócio mensuráveis (ex.: "Suporte à Decisão Clínica", "Eficiência Operacional na Recepção", "Governança de Dados").

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
   - **Redes e Comunicação:** Topologia LAN, redundância de link externo (fibra + 4G/5G contingencial);
   - **Hospedagem em Nuvem:** Provedor selecionado, instâncias, banco gerenciado e armazenamento de objetos.

6. **Equipe de Desenvolvimento e Topologia**
   - Perfis técnicos necessários e papéis (Arquiteto, Tech Lead, Engenheiro de Requisitos, Devs Front/Back, DevOps/QA);
   - Alocação temporal em horas/semana por fase;
   - Matriz RACI preliminar.

7. **Gerenciamento de Tempo e Cronograma**
   - **WBS / EAP (Estrutura Analítica do Projeto):** Decomposição em pacotes de trabalho numerados com duração estimada e rede de predecessores;
   - **Cronograma Sintético:** Tabela consolidada com fases, entregáveis, datas de início/fim e marcos formais;
   - **Marcos de Entrega (Milestones):** Definição das datas-chave de validação;
   - **Gráfico de Gantt e Caminho Crítico (CPM):** Mapeamento do caminho que determina o prazo final.

8. **Análise e Gerenciamento de Riscos**
   - Identificação sistemática dos riscos (técnicos, organizacionais, de cronograma e de equipe);
   - Matriz Probabilidade $\times$ Impacto;
   - Registro de Riscos tabulado com: ID, Risco, Probabilidade, Impacto, Gatilho, Ação de Mitigação (preventiva), Ação de Contingência (reativa) e Responsável.

9. **Interfaces e Dependências**
   - Dependências técnicas críticas (APIs de terceiros, gateways, serviços em nuvem);
   - Dependências organizacionais (aprovações de clientes, homologações legais).

10. **Estimativa de Custos e Orçamento (CAPEX e OPEX)**
    - Custo de infraestrutura durante desenvolvimento e pós-lançamento;
    - Custos de hardware e licenças de software;
    - Custos de mão de obra (esforço em horas $\times$ valor hora);
    - Resumo orçamentário consolidado.

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

### Tabela de Registro de Riscos (Padrão Booktabs)
```latex
\begin{table}[htbp]
\caption{Registro e Análise de Riscos do Projeto}
\label{tab:registro_riscos}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l Y c c Y Y @{}}
\toprule
\textbf{ID} & \textbf{Descrição do Risco} & \textbf{Prob.} & \textbf{Imp.} & \textbf{Mitigação (Prevenção)} & \textbf{Contingência (Resposta)} \\
\midrule
R01 & Desalinhamento de requisitos de negócio & Média & Alto & Reuniões de alinhamento com protótipos navegáveis. & Repactuar escopo da sprint com stakeholders. \\
R02 & Indisponibilidade de serviço em nuvem & Baixa & Crítico & Configuração multi-região e banco gerenciado com failover. & Acionar réplica em nuvem secundária ou backup offline. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 4. Diretrizes de Diagramação (Gantt, WBS e Topologia)

Para evitar poluição visual, sobreposição de rótulos e linhas tortas:
1. **Gráficos de Gantt**:
   - Utilize o pacote `pgfgantt` nativo do LaTeX ou gere a imagem via Mermaid limpo;
   - Mantenha o eixo temporal agrupado por semanas (S1, S2, ...) ou meses;
   - Destaque explicitamente os pacotes do **Caminho Crítico (CPM)** com cor diferenciada.
2. **Topologia de Equipe e WBS**:
   - Represente a WBS em formato tabular com numeração decimal (1.0, 1.1, 1.1.1) ou diagrama em árvore com no máximo 3 níveis de profundidade;
   - Em caso de diagrama vetorial, salve em `Imagens/gantt_projeto.pdf` e inclua com `\incluirdiagramalargo`.

---

## 5. Checklist de Qualidade do Agente

- [ ] Todos os custos apresentam distinção clara entre desenvolvimento (CAPEX) e manutenção mensal recorrente (OPEX)?
- [ ] A WBS cobre 100% do escopo do projeto sem omissões de fases de teste e deploy?
- [ ] As estimativas de hardware diferenciam requisitos de desenvolvimento vs ambiente de produção?
- [ ] Os riscos possuem gatilhos objetivos e responsáveis formalmente designados?
- [ ] O Rationale da solução adotada fundamenta formalmente a exclusão das alternativas de mercado?
