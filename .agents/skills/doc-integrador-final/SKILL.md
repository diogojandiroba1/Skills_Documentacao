---
name: doc-integrador-final
description: Orienta o agente na consolidação, harmonização editorial e compilação do Documento Técnico Completo do Ciclo de Vida de Software, garantindo consistência terminológica, auditoria de diagramas exportados pelo StarUML v7.0 e compilação perfeita no template LaTeX unificado.
---

# Skill: Orquestração e Integração do Documento Técnico Consolidado

Esta skill guia o agente no papel de **Editor Técnico Chefe e Integrador**, responsável por revisar, harmonizar e unificar os 7 documentos especializados do ciclo de vida de software em uma única **Especificação Técnica Consolidada**, garantindo que não existam inconsistências conceituais, terminológicas, referências quebradas ou falhas de compilação no template LaTeX unificado.

O integrador atua também como **Auditor de Qualidade Visual dos Diagramas**, assegurando que todos os modelos tenham sido construídos no **StarUML v7.0** e devidamente exportados para a pasta `Imagens/`.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

Esta skill sintetiza e orquestra o ciclo de vida completo de engenharia de software com base em:
- **SWEBOK v4 -- Áreas de Conhecimento Transversais e Síntese do Ciclo de Vida:**
  - *Capítulo 8 (Software Engineering Management):* Governança de escopo, integração contínua de artefatos, sincronização entre disciplinas de engenharia e gestão de entregas.
  - *Capítulo 11 (Software Engineering Process):* Implementação de processos do ciclo de vida, modelos de processo (incremental, ágil, formal) e auditoria de aderência aos processos.
  - *Capítulo 12 (Software Engineering Models and Methods):* Consistência entre representações formais (modelos conceituais, arquiteturais e de detalhamento comportamental/estrutural).
- **ISO/IEC/IEEE 15288:2023 (*Systems and software engineering -- System life cycle processes*):** Governança transversal e integração de estágios de ciclo de vida.
- **ISO/IEC/IEEE 12207:2017 (*Systems and software engineering -- Software life cycle processes*):** Definição unificada dos processos primários (aquisição, fornecimento, desenvolvimento, operação e manutenção) e processos de suporte (documentação, gerência de configuração, garantia da qualidade, verificação e validação).
- **Framework de Consistência Rastreável:** Assegura que nenhum artefato subsista de forma isolada, estabelecendo uma rede semântica fechada desde o problema de negócio até os testes e o runbook operacional.

---

## 2. Atribuições Centrais da Skill

1. **Harmonização Terminológica e Conceitual**
   - Garantir que todas as entidades e atores recebam exatamente o mesmo nome ao longo de todos os 7 capítulos (ex.: se no capítulo de requisitos a entidade chama-se `Paciente`, ela não pode aparecer como `Cliente` no design de banco ou `Usuário` nos casos de uso sem justificativa explícita de papel);
   - Verificar a consistência dos identificadores de rastreabilidade (`RFxx`, `RNxx`, `UCxx`, `ADRxx`, `CTxx`).

2. **Auditoria de Rastreabilidade Ponta a Ponta**
   - Confirmar a cadeia completa de valor:
     $$\text{Problema / Objetivo} \longrightarrow \text{RF / RNF} \longrightarrow \text{UC} \longrightarrow \text{ADR} \longrightarrow \text{Classe de Projeto / ORM} \longrightarrow \text{Caso de Teste (CT)}$$
   - Identificar "requisitos órfãos" (requisitos que não possuem caso de uso correspondente nem caso de teste associado).

3. **Verificação de Referências Cruzadas e Bibliografia**
   - Auditar todos os rótulos de figuras (`\label{fig:...}`), tabelas (`\label{tab:...}`) e seções (`\label{sec:...}`);
   - Garantir que cada elemento seja explicitamente citado no texto antes ou logo após sua apresentação através de `\autoref{...}` ou `\ref{...}`;
   - Conferir se todas as citações `\cite{...}` possuem entradas correspondentes em `Bibliografia.bib`.

4. **Auditoria de Modelagem e Diagramas no StarUML v7.0**
   - **Proibição de Diagramas-como-Código:** Confirmar que nenhum diagrama PlantUML ou Mermaid permaneça no texto final;
   - **Conformidade StarUML v7.0:** Assegurar que todos os diagramas foram modelados visualmente no StarUML v7.0 e exportados para `Template_Unificado_LATEX/Imagens/` com fundo branco e resolução mínima de 300 DPI (escala 2x ou 3x);
   - **Substituição dos Placeholders:** Auditar se todos os blocos de placeholders dos capítulos foram substituídos pelos comandos reais `\incluirdiagrama{Imagens/<arquivo>.png}{...}{fig:...}`;
   - **Catálogo de Imagens:** Conferir a presença dos arquivos padronizados:
     - `uc_geral.png`, `uc_<modulo>.png`
     - `cls_conceitual_dominio.png`, `cls_projeto_<modulo>.png`
     - `seq_<caso_uso>.png`, `dsm_<entidade>.png`, `act_<processo>.png`
     - `arch_visao_logica.png`, `arch_visao_desenvolvimento.png`, `arch_visao_processos.png`, `arch_visao_implantacao.png`, `arch_visao_seguranca.png`
     - `test_piramide_estrategia.png`, `devops_pipeline_cicd.png`, `devops_topologia_infra.png`.

---

## 3. Roteiro de Verificação e Compilação

### Etapa 1: Inspeção de Integridade dos Arquivos
Verifique se os 7 capítulos modulares estão presentes na pasta `Capitulos/`:
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

### Etapa 3: Ciclo de Compilação Completo
Para resolver todas as referências cruzadas, sumário, lista de figuras e citações bibliográficas, execute o ciclo em 4 passagens:
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

## 4. Matriz Global de Rastreabilidade do Projeto

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

## 5. Checklist Final de Entrega do Agente Integrador

- [ ] A compilação LaTeX executa com zero erros fatais?
- [ ] Todos os diagramas foram gerados pelo StarUML v7.0 e exportados com resolução adequada em `Imagens/`?
- [ ] Os placeholders temporários foram ativados com os diagramas reais exportados?
- [ ] O sumário, lista de figuras e lista de tabelas estão perfeitamente populados?
- [ ] Não há nenhum aviso de referência quebrada (`Reference undefined` ou `Citation undefined`) no log de compilação?
- [ ] O documento atende integralmente ao modelo de completude ArchCaMo e às boas práticas do SWEBOK v4?
