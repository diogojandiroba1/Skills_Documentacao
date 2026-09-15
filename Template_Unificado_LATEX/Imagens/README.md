# Diretório de Imagens e Diagramas (StarUML v7.0)

Este diretório armazena todos os diagramas visuais e capturas de tela referenciados pelos documentos e capítulos em LaTeX do template unificado.

---

## 🎨 Padrão Oficial de Modelagem: StarUML v7.0

Todos os diagramas de engenharia de software devem ser modelados visualmente no **StarUML v7.0** e exportados para este diretório. Diagramas como código (PlantUML, Mermaid, etc.) foram totalmente descontinuados para garantir legibilidade tipográfica e conformidade editorial.

### ⚙️ Parâmetros de Exportação no StarUML v7.0:
1. Abra o diagrama desejado no StarUML;
2. Acesse o menu superior: **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...` para vetor);
3. Em caso de exportação em PNG:
   - Certifique-se de desmarcar fundo transparente (utilize **fundo branco** ou ajuste o tema para documento claro);
   - Se disponível no diálogo de exportação, selecione resolução de **2x** ou **3x (300 DPI)** para máxima nitidez na impressão;
4. Salve o arquivo diretamente nesta pasta (`Template_Unificado_LATEX/Imagens/`) respeitando com exatidão a convenção de nomes abaixo.

---

## 📋 Catálogo Oficial de Nomenclatura e Formatos

| Prefixo | Tipo no StarUML v7.0 | Descrição do Diagrama | Nome de Arquivo Padrão | Formato |
|:---|:---|:---|:---|:---:|
| `uc_` | **Use Case Diagram** | Diagrama Geral de Casos de Uso | `uc_geral.png` | `.png` / `.pdf` |
| `uc_` | **Use Case Diagram** | Diagrama de UC por Módulo/Pacote | `uc_<modulo>.png` (ex.: `uc_agendamento.png`) | `.png` / `.pdf` |
| `cls_` | **Class Diagram** | Modelo Conceitual de Domínio (Análise) | `cls_conceitual_dominio.png` | `.png` / `.pdf` |
| `cls_` | **Class Diagram** | Diagrama de Classes de Projeto | `cls_projeto_<modulo>.png` (ex.: `cls_projeto_agendamento.png`) | `.png` / `.pdf` |
| `seq_` | **Sequence Diagram** | Diagrama de Sequência Dinâmico | `seq_<caso_uso>.png` (ex.: `seq_agendamento.png`) | `.png` / `.pdf` |
| `dsm_` | **Statechart Diagram** | Máquina de Estados de Entidade | `dsm_<entidade>.png` (ex.: `dsm_agendamento.png`) | `.png` / `.pdf` |
| `act_` | **Activity Diagram** | Fluxo de Atividades com Raias | `act_<processo>.png` (ex.: `act_fluxo_agendamento.png`) | `.png` / `.pdf` |
| `arch_` | **Component / Package Diagram** | Visão Lógica da Arquitetura | `arch_visao_logica.png` | `.png` / `.pdf` |
| `arch_` | **Package Diagram** | Visão de Desenvolvimento (Camadas) | `arch_visao_desenvolvimento.png` | `.png` / `.pdf` |
| `arch_` | **Sequence / Activity Diagram** | Visão de Processos e Concorrência | `arch_visao_processos.png` | `.png` / `.pdf` |
| `arch_` | **Deployment Diagram** | Visão Física e Topologia de Implantação | `arch_visao_implantacao.png` | `.png` / `.pdf` |
| `arch_` | **Component / Security Diagram** | Visão de Segurança e Conformidade LGPD | `arch_visao_seguranca.png` | `.png` / `.pdf` |
| `devops_` | **Activity Diagram** | Arquitetura da Esteira CI/CD | `devops_pipeline_cicd.png` | `.png` / `.pdf` |
| `devops_` | **Deployment Diagram** | Topologia de Ambientes e Nuvem | `devops_topologia_infra.png` | `.png` / `.pdf` |
| `test_` | **Component / Package Diagram** | Pirâmide e Estratégia de Testes | `test_piramide_estrategia.png` | `.png` / `.pdf` |
| `test_` | **Statechart / Activity Diagram** | Ciclo de Vida do Defeito | `test_ciclo_defeito.png` | `.png` / `.pdf` |
| `scm_` | **Activity / Statechart Diagram** | Estratégia de Branches / Fluxo CCB | `scm_branching_model.png` / `scm_fluxo_ccb.png` | `.png` / `.pdf` |
| `manut_` | **Activity Diagram** | Fluxo de Incidentes e Hotfixes | `manut_ciclo_incidente.png` / `manut_fluxo_hotfix.png` | `.png` / `.pdf` |
| `proj_` | **Class / Tree Diagram** | WBS / Decomposição de Escopo | `proj_wbs_escopo.png` | `.png` / `.pdf` |
| `proj_` | **Gantt Chart (StarUML ou LaTeX)** | Cronograma Macro de Marcos | `proj_gantt_cronograma.png` | `.png` / `.pdf` |
| `ui_` | **Screenshot / Mockup** | Interface Real do Sistema (Telas) | `ui_<funcionalidade>.png` (ex.: `ui_login.png`) | `.png` |
