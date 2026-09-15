# Skills_Documentacao

> **Ecossistema de Skills Especializadas para Agentes de IA e Template LaTeX Unificado para Documentação Formal de Todo o Ciclo de Vida de Software (SDLC)**  
> Estritamente fundamentado nas Áreas de Conhecimento do **SWEBOK v4 (IEEE Computer Society)** e nas normas internacionais **IEEE** e **ISO/IEC/IEEE**.

---

## 📑 Visão Geral

O repositório **Skills_Documentacao** foi concebido para resolver de forma definitiva o desafio da documentação técnica e formal em projetos de software corporativos e acadêmicos. Ele fornece:

1. **12 Skills Especializadas para Agentes Autônomos de IA** (compatíveis com *Antigravity IDE*, *Google Gemini*, *Claude Code* e sistemas de agentes baseados em skills): Instruções formais, regras prescritivas de escrita, matrizes de rastreabilidade e snippets LaTeX prontos para geração de artefatos.
2. **Fundamentação Teórica Rigorosa**: Cada documento e skill está mapeado diretamente a um capítulo do **SWEBOK v4 (Software Engineering Body of Knowledge)** e às normas formais correspondentes da **IEEE** e **ISO/IEC**.
3. **Template LaTeX Unificado (`modern-engsoft.cls`)**: Classe tipográfica moderna com fontes profissionais (*Inter* e *JetBrains Mono*), microtipografia avançada, tabelas no padrão internacional `booktabs`, badges semânticos de rastreabilidade e compilação modular (documento integrado completo ou capítulos individuais isolados com capa própria).
4. **Diretriz Editorial Limpa**: Eliminação total de caixas gráficas genéricas (*tcolorbox* e fundos coloridos) em prol de diagramação editorial sofisticada, legível e pronta para publicação de nível sênior.
5. **Padronização Oficial de Modelagem no StarUML v7.0**: Descontinuação definitiva de diagramas-como-código (PlantUML, Mermaid) em favor da modelagem visual rigorosa no StarUML v7.0, eliminando linhas tortas, textos truncados e sobreposições desordenadas.

---

## 🎨 Padronização de Modelagem Visual: StarUML v7.0

A partir desta versão, **não utilizamos mais diagramas como código (PlantUML, Mermaid, etc.)**. Todas as representações gráficas de engenharia de software devem ser modeladas visualmente na ferramenta profissional **StarUML v7.0** e exportadas em alta resolução (PNG com fundo branco a 300 DPI ou PDF vetorial) para o diretório `Template_Unificado_LATEX/Imagens/`.

### 📥 Instalação do StarUML v7.0
Para instalar a versão completa do StarUML v7.0 (sem marca d'água na exportação), acesse o tutorial oficial da comunidade:  
👉 **[Tutorial de Instalação do StarUML v7.0 Pro (Remover Marca d'Água)](https://github.com/rodyuzuriaga/Get-full-version-of-StarUML-7.0.0-Pro-Remove-Watermark)**

### 🤖 Novo Papel dos Agentes de IA
Os agentes atuam em conjunto com o usuário através de um duplo papel:
1. **Gerador da Documentação Formal:** Redige o conteúdo técnico rigoroso, tabelas `booktabs`, especificações textuais de Casos de Uso, catálogo de ADRs e matrizes de rastreabilidade em LaTeX.
2. **Copiloto / Assistente de Modelagem no StarUML v7.0:** Fornece um roteiro textual passo a passo, detalhando exatamente como o usuário deve construir visualmente cada diagrama no StarUML (árvore do *Model Explorer*, tipo de diagrama, elementos da Toolbox, estereótipos, visibilidades `+`, `-`, `#`, métodos, tipos de retorno, multiplicidades, conexões e alinhamento).

### 📋 Catálogo Oficial de Diagramas e Nomenclatura

| # | Capítulo / Skill | Tipo no StarUML v7.0 | Nome do Arquivo Salvo | Formato |
|:---:|:---|:---|:---|:---:|
| 01 | `doc-plano-projeto` | **Class / Tree Diagram** | `Imagens/proj_wbs_escopo.png` | `.png` (300 DPI) / `.pdf` |
| 03 | `doc-casos-de-uso` | **Use Case Diagram** | `Imagens/uc_geral.png` | `.png` (300 DPI) / `.pdf` |
| 03 | `doc-casos-de-uso` | **Use Case Diagram** | `Imagens/uc_<modulo>.png` | `.png` (300 DPI) / `.pdf` |
| 03 | `doc-casos-de-uso` | **Class Diagram** (Análise) | `Imagens/cls_conceitual_dominio.png` | `.png` (300 DPI) / `.pdf` |
| 04 | `doc-arquitetura-software` | **Component Diagram** | `Imagens/arch_visao_logica.png` | `.png` (300 DPI) / `.pdf` |
| 04 | `doc-arquitetura-software` | **Sequence / Activity Diagram** | `Imagens/arch_visao_processos.png` | `.png` (300 DPI) / `.pdf` |
| 04 | `doc-arquitetura-software` | **Package Diagram** | `Imagens/arch_visao_desenvolvimento.png` | `.png` (300 DPI) / `.pdf` |
| 04 | `doc-arquitetura-software` | **Deployment Diagram** | `Imagens/arch_visao_implantacao.png` | `.png` (300 DPI) / `.pdf` |
| 04 | `doc-arquitetura-software` | **Component Diagram** (Segurança) | `Imagens/arch_visao_seguranca.png` | `.png` (300 DPI) / `.pdf` |
| 05 | `doc-design-detalhado` | **Class Diagram** (Projeto) | `Imagens/cls_projeto_<modulo>.png` | `.png` (300 DPI) / `.pdf` |
| 05 | `doc-design-detalhado` | **Sequence Diagram** | `Imagens/seq_<caso_uso>.png` | `.png` (300 DPI) / `.pdf` |
| 05 | `doc-design-detalhado` | **Statechart Diagram** | `Imagens/dsm_<entidade>.png` | `.png` (300 DPI) / `.pdf` |
| 05 | `doc-design-detalhado` | **Activity Diagram** | `Imagens/act_<processo>.png` | `.png` (300 DPI) / `.pdf` |
| 06 | `doc-plano-testes` | **Component / Package Diagram** | `Imagens/test_piramide_estrategia.png` | `.png` (300 DPI) / `.pdf` |
| 06 | `doc-plano-testes` | **Statechart Diagram** | `Imagens/test_ciclo_defeito.png` | `.png` (300 DPI) / `.pdf` |
| 07 | `doc-implantacao-devops` | **Activity Diagram** (Swimlanes) | `Imagens/devops_pipeline_cicd.png` | `.png` (300 DPI) / `.pdf` |
| 07 | `doc-implantacao-devops` | **Deployment Diagram** | `Imagens/devops_topologia_infra.png` | `.png` (300 DPI) / `.pdf` |
| 08 | `doc-manual-usuario` | **Screenshots / Telas Reais** | `Imagens/ui_<funcionalidade>.png` | `.png` |
| 09 | `doc-gerencia-configuracao` | **Activity Diagram** (Branches) | `Imagens/scm_branching_model.png` | `.png` (300 DPI) / `.pdf` |
| 10 | `doc-garantia-qualidade` | **Activity Diagram** (Code Review) | `Imagens/sqa_processo_revisao.png` | `.png` (300 DPI) / `.pdf` |
| 11 | `doc-plano-manutencao` | **Activity Diagram** (Incidentes) | `Imagens/manut_ciclo_incidente.png` | `.png` (300 DPI) / `.pdf` |

### 🖼️ Placeholders nos Templates LaTeX
Os capítulos LaTeX em `Template_Unificado_LATEX/Capitulos/` contêm placeholders visuais elegantes informando o nome exato do arquivo, o menu do StarUML v7.0 e a linha comentada `\incluirdiagrama{Imagens/<arquivo>.png}{...}{fig:...}`. Uma vez exportada a imagem do StarUML para `Imagens/`, basta descomentar a linha no `.tex` para ativar a figura na publicação.

---

## 🏛️ Matriz Sinóptica: Skills, Documentos e Fundamentação Normativa

A tabela abaixo sintetiza a cobertura do ciclo de vida de software, associando cada documento à respectiva skill, área de conhecimento do SWEBOK v4 e normas de referência:

| # | Documento Técnico | Identificador da Skill | Área de Conhecimento (SWEBOK v4) | Norma Internacional de Referência |
|:---:|:---|:---|:---|:---|
| **01** | **Plano de Projeto e Viabilidade** (SPMP / Charter) | `doc-plano-projeto` | Cap. 7 (Economics), Cap. 8 (Management), Cap. 11 (Process) | **IEEE Std 1058**, ISO/IEC/IEEE 12207, ISO 16085 |
| **02** | **Especificação de Requisitos de Software** (SRS / ERS) | `doc-especificacao-requisitos` | Cap. 1 (Software Requirements) | **ISO/IEC/IEEE 29148:2018**, IEEE Std 830-1998, ISO 25010 |
| **03** | **Modelagem de Casos de Uso e Domínio** (UC / Conceptual) | `doc-casos-de-uso` | Cap. 1 (Requirements) e Cap. 3 (Design) | **OMG UML 2.5.1**, Cockburn Use Case Template |
| **04** | **Documento de Arquitetura de Software** (SAD) | `doc-arquitetura-software` | Cap. 2 (Software Architecture) | **ISO/IEC/IEEE 42010:2022**, ISO 42020:2019, Kruchten 4+1 |
| **05** | **Documento de Design Detalhado** (SDD) | `doc-design-detalhado` | Cap. 3 (Software Design) | **IEEE Std 1016-2009**, ISO/IEC/IEEE 12207, OMG UML 2.5.1 |
| **06** | **Plano e Especificação de Testes** (STP / STD) | `doc-plano-testes` | Cap. 4 (Software Testing) | **ISO/IEC/IEEE 29119 (Partes 1--4)**, IEEE Std 829-2008 |
| **07** | **Guia de Implantação, DevOps e Runbook** | `doc-implantacao-devops` | Cap. 10 (Software Engineering Operations) | **ISO/IEC/IEEE 12207:2017**, DORA, The Twelve-Factor App |
| **08** | **Manual do Usuário Final e Guia Operacional** | `doc-manual-usuario` | Cap. 10 (Operations) e Cap. 12 (Models & Methods) | **ISO/IEC/IEEE 26514:2022**, IEEE Std 1063-2001 |
| **09** | **Plano de Gerência de Configuração** (SCM Plan) | `doc-gerencia-configuracao` | Cap. 6 (Software Configuration Management) | **IEEE Std 828-2012**, ISO 12207 Cl. 6.3.5, SemVer 2.0.0 |
| **10** | **Plano de Garantia da Qualidade** (SQAP) | `doc-garantia-qualidade` | Cap. 5 (Software Quality) | **IEEE Std 730-2014**, ISO/IEC 25010:2023, ISO 12207 |
| **11** | **Plano de Manutenção e Suporte de Software** | `doc-plano-manutencao` | Cap. 9 (Software Maintenance) | **ISO/IEC/IEEE 14764:2022**, IEEE Std 1219-1998, ITIL v4 |
| **12** | **Orquestrador e Integrador Técnico Final** | `doc-integrador-final` | Cap. 8 (Management), Cap. 11 (Process), Cap. 12 (Models) | **ISO/IEC/IEEE 15288:2023**, ISO/IEC/IEEE 12207:2017 |

---

## 🔍 Detalhamento das Skills Especializadas

### 1. `doc-plano-projeto` -- Plano de Projeto e Viabilidade
- **Para que serve:** Estabelece os limites formais de escopo, viabilidade econômica, estimativa de custos/prazos, matriz de riscos e cronograma inicial (WBS/Gantt) antes de qualquer esforço de codificação.
- **Estrutura Obrigatória:**
  1. Identificação do Projeto e Justificativa Estratégica.
  2. Análise de Viabilidade Técnica e Econômica (Trade-offs e ROI).
  3. Escopo Preliminar e Entregas (WBS / EAP).
  4. Cronograma Estimado de Marcos e Gantt.
  5. Estratégia de Equipe, Alocação de Recursos e Custos (OPEX/CAPEX).
  6. Matriz de Gestão de Riscos (Probabilidade, Impacto e Ação Mitigadora).
- **Referência:** SWEBOK v4 Caps. 7, 8 e 11; **IEEE Std 1058**; ISO/IEC/IEEE 16085.

### 2. `doc-especificacao-requisitos` -- Especificação de Requisitos (SRS / ERS)
- **Para que serve:** Modela rigorosamente as capacidades e restrições da solução em linguagem formal e não ambígua.
- **Estrutura Obrigatória:**
  1. Catálogo Tabulado de Requisitos Funcionais (identificador `RFxx`, descrição, prioridade MoSCoW, rastreabilidade).
  2. Dicionário de Atributos de Dados.
  3. Tabela de Regras de Negócio (`RNxx`) com pré-condições, pós-condições e penalidades.
  4. Catálogo de Requisitos Não Funcionais (`RNFxx`) mensuráveis categorizados pela ISO/IEC 25010.
- **Referência:** SWEBOK v4 Cap. 1; **ISO/IEC/IEEE 29148:2018**; IEEE Std 830-1998; ISO/IEC 25010:2023.

### 3. `doc-casos-de-uso` -- Modelagem de Casos de Uso e Modelo Conceitual
- **Para que serve:** Detalha a interação dinâmica entre atores e sistema, estruturando o comportamento em cenários passo a passo e estabelecendo o vocabulário conceitual de domínio.
- **Estrutura Obrigatória:**
  1. Especificação Textual Expandida de Casos de Uso (Ator Principal, Pré/Pós-condições, Fluxo Principal numerado, Fluxos Alternativos e de Exceção).
  2. Particionamento Modular de Diagramas de Caso de Uso (máximo 4 a 6 UCs por pacote funcional).
  3. Matriz de Rastreabilidade Requisito x Caso de Uso ($RF \leftrightarrow UC$).
  4. Modelo Conceitual de Classes (entidades puras de domínio, tipos primitivos, multiplicidades).
- **Referência:** SWEBOK v4 Caps. 1 e 3; **OMG Unified Modeling Language (UML 2.5.1)**; Modelo Cockburn.

### 4. `doc-arquitetura-software` -- Documento de Arquitetura (SAD)
- **Para que serve:** Define a espinha dorsal técnica do sistema, decomposição em camadas, comunicação entre componentes, decisões tecnológicas fundamentadas e governança de dados.
- **Estrutura Obrigatória:**
  1. Modelo de Visões Arquiteturais 4+1 de Kruchten estendido (Visão Lógica, de Processos, de Desenvolvimento, Física e de Segurança/LGPD).
  2. Catálogo de Registros de Decisão Arquitetural (ADRs) com Contexto, Decisão, Consequências Positivas e Negativas.
  3. Governança de Dados, Criptografia e Conformidade Regulatória.
  4. Verificação de Completude pelo framework ArchCaMo.
- **Referência:** SWEBOK v4 Cap. 2 (Área dedicada no v4); **ISO/IEC/IEEE 42010:2022**; ISO/IEC/IEEE 42020:2019.

### 5. `doc-design-detalhado` -- Documento de Design Detalhado (SDD)
- **Para que serve:** Converte a arquitetura de alto nível em especificações técnicas executáveis para os desenvolvedores (nível de classes, esquemas de banco e dinâmica temporal).
- **Estrutura Obrigatória:**
  1. Mapeamento Objeto-Relacional (ORM / DDL SQL) completo com chaves primárias, estrangeiras e índices.
  2. Diagrama de Classes em Nível de Projeto (visibilidade, tipos de linguagem alvo, métodos e retorno).
  3. Diagramas Dinâmicos UML: Sequência (chamadas com payload e retornos assíncronos), Máquinas de Estado e Atividades.
- **Referência:** SWEBOK v4 Cap. 3; **IEEE Std 1016-2009**; ISO/IEC/IEEE 12207:2017; OMG UML 2.5.1.

### 6. `doc-plano-testes` -- Plano e Especificação de Testes (STP / STD)
- **Para que serve:** Planeja a estratégia abrangente de verificação e validação da qualidade funcional e estrutural do software.
- **Estrutura Obrigatória:**
  1. Pirâmide de Testes (Unitários, Integração, Contrato, E2E e Carga/Estresse).
  2. Especificação Tabulada de Casos de Teste (`CTxx`) com Pré-condições, Passos, Entradas, Resultados Esperados e Critérios de Aceite.
  3. Matriz de Rastreabilidade Requisitos x Testes ($RF/RNF \leftrightarrow CT$).
  4. Critérios Formais de Entrada, Suspensão e Saída de Ciclos de Teste.
- **Referência:** SWEBOK v4 Cap. 4; **ISO/IEC/IEEE 29119 (Partes 1 a 4)**; IEEE Std 829-2008; IEEE Std 1044-2010.

### 7. `doc-implantacao-devops` -- Implantação, DevOps e Runbook
- **Para que serve:** Especifica a esteira de entrega contínua, infraestrutura como código, procedimentos de implantação e guia operacional para resolução de incidentes.
- **Estrutura Obrigatória:**
  1. Arquitetura da Pipeline de CI/CD (estágios de Lint, Test, Build, Scan de Segurança e Deploy).
  2. Configuração de Contêineres e Infraestrutura (Docker, Kubernetes, docker-compose).
  3. Estratégia de Migração de Dados em Produção com idempotência e rollback.
  4. Runbook Operacional de Contingência e Troubleshooting (ações passo a passo para incidentes).
  5. Monitoramento, Métricas DORA e Observabilidade.
- **Referência:** SWEBOK v4 Cap. 10; **ISO/IEC/IEEE 12207:2017**; The Twelve-Factor App; Métricas DORA.

### 8. `doc-manual-usuario` -- Manual do Usuário Final e Guia Operacional
- **Para que serve:** Orienta os operadores reais e usuários finais do sistema sobre como realizar seus fluxos diários com linguagem acessível, telas comentadas e resolução de dúvidas.
- **Estrutura Obrigatória:**
  1. Visão Geral do Sistema e Requisitos de Acesso (sem jargões técnicos de código).
  2. Primeiros Passos e Gestão de Acesso (autenticação, primeiro login, recuperação de senha).
  3. Guias Passo a Passo de Operações Principais (objetivo, pré-requisitos, instruções numeradas, tela comentada, validação de sucesso).
  4. Resolução de Problemas Comuns (Troubleshooting / Mensagens de Erro amigáveis).
  5. FAQ (Perguntas Frequentes) e Canais de Suporte.
- **Referência:** SWEBOK v4 Caps. 10 e 12; **ISO/IEC/IEEE 26514:2022**; **IEEE Std 1063-2001**.

### 9. `doc-gerencia-configuracao` -- Plano de Gerência de Configuração (SCM)
- **Para que serve:** Define a governança de versões, integridade dos itens de configuração, regras de branching no Git, políticas de baseline e comitê de controle de mudanças.
- **Estrutura Obrigatória:**
  1. Identificação e Matriz de Itens de Configuração (CIs: código, DDL, Docker, documentação).
  2. Modelo de Branching (GitFlow / Trunk-based) e Regras Estritas de Proteção de Branches.
  3. Versionamento Semântico (SemVer 2.0.0) e Política de Baselines com Git Tags assinadas.
  4. Fluxo de Solicitação de Mudança (RFC) e Change Control Board (CCB).
  5. Auditorias de Configuração (FCA e PCA).
- **Referência:** SWEBOK v4 Cap. 6; **IEEE Std 828-2012**; ISO/IEC/IEEE 12207 Cl. 6.3.5; SemVer 2.0.0.

### 10. `doc-garantia-qualidade` -- Plano de Garantia da Qualidade (SQAP)
- **Para que serve:** Garante a conformidade dos processos de desenvolvimento através de auditorias, revisões por pares, análise estática automatizada e métricas de qualidade.
- **Estrutura Obrigatória:**
  1. Políticas de Análise Estática de Código (SAST, linters, checagem de segredos e dependências).
  2. Processo Formal de Revisão por Pares (Code Review Checklist).
  3. Critérios Obrigatórios de Definition of Ready (DoR) e Definition of Done (DoD).
  4. Quadro de Métricas de Qualidade do Produto e do Processo.
  5. Ritos de Auditoria de Processo e Retrospectiva Técnica (Post-Mortem sem culpados).
- **Referência:** SWEBOK v4 Cap. 5; **IEEE Std 730-2014**; ISO/IEC 25010:2023; ISO/IEC/IEEE 12207 Cl. 6.3.8.

### 11. `doc-plano-manutencao` -- Plano de Manutenção e Suporte
- **Para que serve:** Estrutura os processos de sustentação operacional, triagem de chamados pós-entrega, evolução do sistema e acordos contratuais de SLA.
- **Estrutura Obrigatória:**
  1. Tipologia de Manutenção do SWEBOK (Corretiva, Adaptativa, Perfectiva, Preventiva).
  2. Níveis de Atendimento (N1 Helpdesk, N2 Aplicação, N3 Engenharia de Software).
  3. Matriz de Acordos de Nível de Serviço (SLA) com prazos contratuais de resposta e solução.
  4. Rito Formal para Hotfixes Emergenciais em Produção.
  5. Política de Fim de Vida e Descontinuação (Deprecation & EOL).
- **Referência:** SWEBOK v4 Cap. 9; **ISO/IEC/IEEE 14764:2022**; IEEE Std 1219-1998; Práticas ITIL v4 / SRE.

### 12. `doc-integrador-final` -- Orquestrador e Integrador Técnico
- **Para que serve:** Atua como o editor técnico chefe que audita, harmoniza e consolida todos os artefatos gerados em uma Especificação Técnica Consolidada no template LaTeX unificado.
- **Estrutura Obrigatória:**
  1. Harmonização Terminológica e Conceitual entre todos os capítulos.
  2. Auditoria de Rastreabilidade Ponta a Ponta ($\text{Problema} \rightarrow \text{RF} \rightarrow \text{UC} \rightarrow \text{ADR} \rightarrow \text{Classe/ORM} \rightarrow \text{Teste}$).
  3. Resolução e Validação de Referências Cruzadas e Citações Bibliográficas.
  4. Matriz Global de Rastreabilidade do Ciclo de Vida Completo.
  5. Execução do Ciclo de Compilação em 4 Passagens com zero erros fatais.
- **Referência:** SWEBOK v4 Caps. 8, 11 e 12; **ISO/IEC/IEEE 15288:2023**; ISO/IEC/IEEE 12207:2017.

---

## 🚀 Como Utilizar as Skills no Antigravity / Gemini CLI

As skills estão localizadas no diretório `.agents/skills/`. Elas são automaticamente indexadas pela plataforma Antigravity e pelo ecossistema de agentes.

### Invocação Direta via Prompt
Para acionar uma skill específica, basta mencionar o documento desejado ou invocar a skill nominalmente no seu prompt:

```text
Ative a skill doc-especificacao-requisitos para elicitar e especificar formalmente
todos os requisitos funcionais, não-funcionais e regras de negócio para o módulo
de Agendamento de Consultas de uma plataforma de telemedicina. Siga rigorosamente
a ISO/IEC/IEEE 29148 e utilize a tabela booktabs padronizada.
```

```text
Ative a skill doc-arquitetura-software e crie o documento de arquitetura (SAD)
em conformidade com a ISO/IEC/IEEE 42010:2022 para nosso backend orientado a microserviços.
Gere os diagramas nas visões 4+1 e elabore as ADRs fundamentando o uso de PostgreSQL e Kafka.
```

### Pipeline de Engenharia em Multi-Etapas
Você pode orquestrar um ciclo de vida de desenvolvimento completo encadeando as skills:

```text
[Iniciação]      doc-plano-projeto
                     ↓
[Eng. Requisitos] doc-especificacao-requisitos ──→ doc-casos-de-uso
                     ↓
[Arquitetura]    doc-arquitetura-software
                     ↓
[Design Técnico] doc-design-detalhado
                     ↓
[Qualidade]      doc-plano-testes ──→ doc-garantia-qualidade
                     ↓
[DevOps & SCM]   doc-implantacao-devops ──→ doc-gerencia-configuracao
                     ↓
[Operações]      doc-manual-usuario ──→ doc-plano-manutencao
                     ↓
[Consolidação]   doc-integrador-final (Compilação do SAD/SRS Integrado em LaTeX)
```

---

## 📄 Template LaTeX Unificado (`Template_Unificado_LATEX`)

O template incluído na pasta `Template_Unificado_LATEX` é uma classe corporativa e acadêmica de alto padrão projetada pelo autor:

### Estrutura de Pastas
```
Template_Unificado_LATEX/
├── modern-engsoft.cls      # Classe LaTeX customizada (autor: Diogo Santos Pires Jandiroba)
├── estilo.sty              # Pacotes auxiliares e definições visuais
├── Bibliografia.bib        # Entradas BibTeX de normas, livros e referências
├── main.tex                # Documento mestre integrado (compila todos os 7 capítulos)
├── main_individual.tex     # Driver de compilação para documentos isolados (1 capítulo)
├── Capitulos/
│   ├── 01_Plano_Projeto.tex
│   ├── 02_Especificacao_Requisitos.tex
│   ├── 03_Modelagem_Casos_Uso.tex
│   ├── 04_Arquitetura_Software.tex
│   ├── 05_Design_Tecnico.tex
│   ├── 06_Plano_Testes.tex
│   └── 07_Implantacao_DevOps.tex
└── Imagens/
    ├── capa.png            # Arte visual da capa institucional
    └── *.png               # Diagramas arquiteturais, UML e telas
```

### Compilação do Documento Integrado
Para compilar o documento completo com todos os capítulos, sumário, lista de figuras e referências cruzadas resolvidas:

```bash
cd Template_Unificado_LATEX
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

### Compilação de um Documento Individual
Se desejar gerar um PDF exclusivo contendo apenas um dos capítulos (por exemplo, apenas a *Especificação de Requisitos* ou o *Documento de Arquitetura*):

1. Abra `main_individual.tex` e altere a linha `\input{Capitulos/...}` para o capítulo desejado:
   ```latex
   \documentotipo{Especificação de Requisitos de Software (SRS)}
   \title{Sistema VitaCare}
   \subtitulo{Especificação Formal de Requisitos de Software}
   ...
   \input{Capitulos/02_Especificacao_Requisitos.tex}
   ```
2. Compile normalmente com `pdflatex main_individual.tex`.

---

## 👤 Autoria

- **Autor:** Diogo Santos Pires Jandiroba   
- **Ano:** 2026

---

