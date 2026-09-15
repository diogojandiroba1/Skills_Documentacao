# Diretório de Imagens e Diagramas do PostoSmart (StarUML v7.0)

Este diretório armazena todos os diagramas visuais e capturas de tela do projeto **PostoSmart** modelados visualmente no **StarUML v7.0** e referenciados pelos capítulos em LaTeX.

---

## 🎨 Padrão de Modelagem: StarUML v7.0

Todos os diagramas de engenharia de software do PostoSmart foram convertidos para a diretriz visual do **StarUML v7.0**, eliminando diagramas como código (TikZ, PlantUML, Mermaid) e garantindo conformidade com a OMG UML 2.5.1.

### ⚙️ Instruções de Exportação no StarUML v7.0:
1. Abra o arquivo do modelo `.mdj` no StarUML v7.0;
2. Selecione o diagrama desejado no *Model Explorer*;
3. Acesse o menu: **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
4. Configure resolução de **2x** ou **3x (300 DPI)** com **fundo branco**;
5. Salve os arquivos diretamente nesta pasta (`exemplo_posto/Imagens/`) com os nomes padronizados da tabela abaixo.

---

## 📋 Catálogo de Diagramas do PostoSmart

| # | Capítulo | Tipo no StarUML v7.0 | Nome do Arquivo Salvo | Formato |
|:---:|:---|:---|:---|:---:|
| **01** | Cap. 1 -- Plano de Projeto | **Class / Matrix Diagram** | `Imagens/proj_matriz_mendelow.png` | `.png` (300 DPI) / `.pdf` |
| **02** | Cap. 1 -- Plano de Projeto | **Class / Tree Diagram** | `Imagens/proj_wbs_escopo.png` | `.png` (300 DPI) / `.pdf` |
| **03** | Cap. 1 -- Plano de Projeto | **Activity / Timeline Diagram** | `Imagens/proj_gantt_marcos.png` | `.png` (300 DPI) / `.pdf` |
| **04** | Cap. 3 -- Casos de Uso | **Use Case Diagram** | `Imagens/uc_postosmart.png` | `.png` (300 DPI) / `.pdf` |
| **05** | Cap. 3 -- Casos de Uso | **Class Diagram** (Análise) | `Imagens/cls_conceitual_postosmart.png` | `.png` (300 DPI) / `.pdf` |
| **06** | Cap. 4 -- Arquitetura | **Component Diagram** | `Imagens/arch_visao_logica.png` | `.png` (300 DPI) / `.pdf` |
| **07** | Cap. 4 -- Arquitetura | **Sequence / Activity Diagram** | `Imagens/arch_visao_processos.png` | `.png` (300 DPI) / `.pdf` |
| **08** | Cap. 4 -- Arquitetura | **Deployment Diagram** | `Imagens/arch_visao_implantacao.png` | `.png` (300 DPI) / `.pdf` |
| **09** | Cap. 5 -- Design Detalhado | **Class Diagram** (Projeto) | `Imagens/cls_projeto_postosmart.png` | `.png` (300 DPI) / `.pdf` |
| **10** | Cap. 5 -- Design Detalhado | **Sequence Diagram** | `Imagens/seq_abastecimento.png` | `.png` (300 DPI) / `.pdf` |
| **11** | Cap. 5 -- Design Detalhado | **Statechart Diagram** | `Imagens/dsm_bico_combustivel.png` | `.png` (300 DPI) / `.pdf` |
| **12** | Cap. 5 -- Design Detalhado | **Activity Diagram** (Raias) | `Imagens/act_fechamento_venda.png` | `.png` (300 DPI) / `.pdf` |
| **13** | Cap. 5 -- Design Detalhado | **Class Diagram** (Esquema ER) | `Imagens/cls_er_relacional.png` | `.png` (300 DPI) / `.pdf` |
| **14** | Cap. 6 -- Plano de Testes | **Component / Package Diagram** | `Imagens/test_piramide_posto.png` | `.png` (300 DPI) / `.pdf` |
| **15** | Cap. 7 -- DevOps & Runbook | **Activity Diagram** | `Imagens/devops_pipeline_posto.png` | `.png` (300 DPI) / `.pdf` |
