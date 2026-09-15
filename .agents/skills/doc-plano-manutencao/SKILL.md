---
name: doc-plano-manutencao
description: Guia o agente na elaboração do Plano de Manutenção e Suporte de Software conforme a área de conhecimento de Manutenção do SWEBOK, cobrindo tipologia de manutenção, SLAs, suporte N1/N2/N3, triagem de defeitos, ciclo de hotfixes e política de descontinuação (EOL).
---

# Skill: Plano de Manutenção e Suporte de Software

Esta skill orienta o agente na formulação do **Plano de Manutenção e Suporte de Software (Software Maintenance & Support Plan)**, fundamentado na Área de Conhecimento de Manutenção de Software do **SWEBOK v4** e nas melhores práticas de Service Level Management (ITIL/SRE). O documento estabelece as regras e processos para manter o software operando com estabilidade e evoluindo após sua entrega inicial.

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

Esta skill está fundamentada nos preceitos formais da Engenharia de Software:
- **SWEBOK v4 -- Capítulo 9 (Software Maintenance KA):**
  - *1. Software Maintenance Fundamentals:* Definições essenciais, manutenção como fase predominante do ciclo de vida em termos de custo e esforço, leis de evolução de software (Leis de Lehman), categorias canônicas de manutenção.
  - *2. Key Issues in Software Maintenance:* Desafios técnicos (compreensão de código legado, análise de impacto, manutenibilidade, testabilidade) e de gestão (alinhamento estratégico, alocação de equipe especializada, estimativa de custos de sustentação).
  - *3. Maintenance Process:* As 6 atividades formais do processo de manutenção da ISO/IEC/IEEE 14764:
    1. *Process Implementation* (plano de manutenção e procedimentos);
    2. *Problem and Modification Analysis* (análise de impacto e triagem);
    3. *Modification Implementation* (desenvolvimento e testes de regressão);
    4. *Maintenance Review/Acceptance* (homologação com usuários);
    5. *Migration* (migração de ambiente/plataforma sem perda de dados);
    6. *Software Retirement* (descontinuação e política de fim de vida - EOL).
  - *4. Techniques for Maintenance:* Compreensão de programas, engenharia reversa, reengenharia, análise de impacto e refatoração de código.
- **ISO/IEC/IEEE 14764:2022 (*Software engineering -- Software life cycle processes -- Maintenance*):** Norma internacional que define a arquitetura dos processos operacionais de manutenção de software.
- **IEEE Std 1219-1998 (*IEEE Standard for Software Maintenance*):** Referência histórica para procedimentos iterativos de controle de manutenção.
- **Práticas de ITIL v4 e SRE (Site Reliability Engineering):** Gestão de Incidentes, Acordos de Nível de Serviço (SLA), SLOs e ritos de Post-Mortem.

---

## 2. Estrutura Obrigatória do Documento

1. **Introdução e Escopo da Manutenção**
   - Transição formal da fase de desenvolvimento para a fase de operação/manutenção;
   - Premissas de sustentação e suporte ao ciclo de vida.

2. **Categorias de Manutenção de Software (Tipologia SWEBOK)**
   - **Manutenção Corretiva:** Correção reativa de defeitos e bugs identificados em produção;
   - **Manutenção Adaptativa:** Modificações necessárias para manter o software compatível com alterações no ambiente operacional (atualizações de SO, navegadores, migrações de nuvem ou novas exigências da LGPD/legislação);
   - **Manutenção Perfectiva:** Melhorias incrementais de usabilidade, otimização de performance de queries e refatorações que aumentam o valor para os usuários;
   - **Manutenção Preventiva:** Identificação proativa e correção de vulnerabilidades latentes antes que se manifestem como falhas.

3. **Estrutura de Atendimento e Níveis de Suporte**
   - Definição clara dos níveis de escalonamento técnico:
     - **Nível 1 (N1 - Helpdesk Operacional):** Triagem inicial, dúvidas de uso, orientações de tela e reset de credenciais;
     - **Nível 2 (N2 - Suporte de Aplicação):** Análise de dados inconsistentes, execução de scripts assistidos e diagnóstico de logs;
     - **Nível 3 (N3 - Engenharia / Especialistas):** Correção direta no código-fonte, refatoração de regras de negócio e patches emergenciais.

4. **Acordos de Nível de Serviço (SLA) e Prazos de Resposta/Solução**
   - Tabela formal de severidades, prazos máximos para primeiro atendimento e prazos de resolução definitiva.

5. **Fluxo de Solicitação de Mudança e Triagem de Defeitos**
   - Ciclo de vida do chamado: Abertura $\rightarrow$ Triagem e Classificação de Severidade $\rightarrow$ Diagnóstico e Reprodução em Staging $\rightarrow$ Desenvolvimento da Solução $\rightarrow$ Testes de Regressão $\rightarrow$ Deploy;
   - **Fluxo de Hotfixes Emergenciais:** Rito acelerado para mitigação de falhas críticas de indisponibilidade ou segurança.

6. **Política de Descontinuação e Fim de Vida (Deprecation & EOL)**
   - Regras para desativação gradual de versões antigas da API, componentes depreciados e migração assistida de usuários.

---

## 3. Modelos de Tabelas e SLAs em LaTeX

### Tabela de Acordos de Nível de Serviço (SLA - Padrão Booktabs)
```latex
\begin{table}[htbp]
\caption{Matriz de Acordos de Nível de Serviço (SLA) de Manutenção}
\label{tab:sla_manutencao}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l Y c c l @{}}
\toprule
\textbf{Severidade} & \textbf{Critério de Classificação} & \textbf{Resposta Inicial} & \textbf{Resolução Máxima} & \textbf{Equipe Responsável} \\
\midrule
Crítica (P1) & Sistema inoperante ou falha de segurança que interrompe as operações clínicas. & $\le 15$ minutos & $\le 2$ horas & Engenharia N3 / SRE de plantão \\
Alta (P2) & Funcionalidade essencial com falha, mas com contorno operacional viável. & $\le 1$ hora & $\le 8$ horas & Suporte N2 / Engenharia N3 \\
Média (P3) & Erro secundário de interface ou relatório sem impacto no atendimento. & $\le 4$ horas & $\le 48$ horas & Equipe de Sustentação N2 \\
Baixa (P4) & Dúvidas operacionais de uso ou sugestão de melhoria estética. & $\le 8$ horas & Próxima release & Helpdesk N1 \\
\bottomrule
\end{tabularx}
\end{table}
```

### Rito de Hotfix Emergencial
> **Diretriz:** NÃO utilize caixas gráficas de destaque (`destaque`, `tcolorbox`). Apresente o procedimento como subseção com lista formal:

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

## 4. Checklist de Qualidade do Agente

- [ ] A classificação de incidentes (P1 a P4) possui critérios objetivos e prazos contratuais de SLA?
- [ ] O papel e as responsabilidades dos níveis de suporte N1, N2 e N3 estão claramente delimitados?
- [ ] O fluxo de hotfix emergencial prevê testes de regressão obrigatórios antes da publicação?
- [ ] O plano aborda os quatro tipos de manutenção do SWEBOK (corretiva, adaptativa, perfectiva e preventiva)?
