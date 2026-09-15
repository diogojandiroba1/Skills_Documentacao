# PostoSmart: Exemplo Completo de Engenharia de Software

> **Sistema Integrado de Automação de Pista e Ponto de Venda Fiscal**  
> Documento técnico completo, enxuto e de alto nível de abstração, demonstrando o uso prático do template corporativo unificado (`modern-engsoft.cls`) e das 12 skills fundamentadas no **SWEBOK v4** e nas normas **IEEE / ISO/IEC / OMG**.

---

## 📋 Sobre o Projeto

O **PostoSmart** foi elaborado como um exemplo canônico de especificação técnica corporativa. O sistema aborda os desafios reais de automação industrial de postos de combustíveis:
- Comunicação via sockets TCP/IP e barramento serial RS-485 com concentradores de bombas (Companytec, Horustec);
- Arquitetura *Edge-First* tolerante a falhas de internet, com persistência local em SQLite WAL e replicação assíncrona para PostgreSQL em nuvem;
- Emissão de NFC-e com chaveamento automático para contingência offline em caso de instabilidade na SEFAZ;
- Monitoramento volumétrico de tanques e prevenção de perdas de combustível.

---

## 📊 Catálogo de Diagramas e Modelagem no StarUML v7.0

Em conformidade com a nova diretriz oficial de engenharia de software do projeto, **não utilizamos diagramas como código (TikZ/PlantUML/Mermaid)**. Toda a modelagem visual do PostoSmart é formalmente elaborada na ferramenta **StarUML v7.0** (UML 2.5.1 / ERD) e integrada ao documento LaTeX via comandos `\incluirdiagrama`.

> 💡 **Instalação do StarUML v7.0 Pro:**  
> Siga o tutorial oficial de instalação e ativação: [Get-full-version-of-StarUML-7.0.0-Pro-Remove-Watermark](https://github.com/rodyuzuriaga/Get-full-version-of-StarUML-7.0.0-Pro-Remove-Watermark).

### 📁 Mapeamento de Arquivos e Placeholders no StarUML v7.0

Todos os capítulos possuem caixas de placeholder com instruções para modelagem no StarUML v7.0. Uma vez desenhados e exportados (`File -> Export Diagram as -> PNG...` a 300 DPI ou PDF vetorial) para o diretório `Imagens/`, basta descomentar o comando `\incluirdiagrama` correspondente:

| # | Capítulo | Tipo no StarUML v7.0 | Arquivo de Destino | Elementos Modelados |
|:---:|:---|:---|:---|:---|
| **01** | Cap. 1 -- Plano de Projeto | Class / Custom Diagram | `Imagens/matriz_mendelow.png` | Matriz de Poder $\times$ Interesse dos Stakeholders |
| **02** | Cap. 1 -- Plano de Projeto | Class / Package Diagram | `Imagens/wbs_projeto.png` | Decomposição hierárquica das entregas (WBS / EAP) |
| **03** | Cap. 1 -- Plano de Projeto | Deployment / Timing Diagram | `Imagens/gantt_marcos.png` | Linha do tempo de marcos e sprints de entrega |
| **04** | Cap. 3 -- Casos de Uso | **Use Case Diagram** | `Imagens/uc_visao_geral.png` | Atores (*Frentista*, *Caixa*, *Gerente*) e Casos de Uso |
| **05** | Cap. 3 -- Casos de Uso | **Class Diagram (Conceitual)** | `Imagens/cls_modelo_conceitual.png` | Entidades de domínio e regras de negócio |
| **06** | Cap. 4 -- Arquitetura | **Component Diagram (Lógica)** | `Imagens/arc_visao_logica.png` | Camadas Edge Local (Driver, Regras, PDV) e Nuvem |
| **07** | Cap. 4 -- Arquitetura | **Activity / Timing (Processos)** | `Imagens/arc_visao_processos.png` | Threads concorrentes, Ring Buffer e WebSocket |
| **08** | Cap. 4 -- Arquitetura | **Deployment Diagram (Física)** | `Imagens/arc_visao_implantacao.png` | Ilhas de pista, RS-485, Concentrador, Edge Server, Nuvem |
| **09** | Cap. 5 -- Design Detalhado | **Class Diagram (Projeto)** | `Imagens/cls_projeto_postosmart.png` | Classes de implementação, visibilidade e tipagem |
| **10** | Cap. 5 -- Design Detalhado | **Sequence Diagram** | `Imagens/seq_abastecimento.png` | Mensageria temporal: Desengate $\rightarrow$ Autorização $\rightarrow$ Fim |
| **11** | Cap. 5 -- Design Detalhado | **Statechart Diagram** | `Imagens/dsm_bico_combustivel.png` | Máquina de estados do bico (*Repouso*, *Autorizado*, etc.) |
| **12** | Cap. 5 -- Design Detalhado | **Activity Diagram** | `Imagens/act_fechamento_venda.png` | Fluxo de caixa e contingência offline NFC-e |
| **13** | Cap. 5 -- Design Detalhado | **Class Diagram / ERD** | `Imagens/cls_er_relacional.png` | Esquema relacional de banco (`tb_tanque`, `tb_bico`, etc.) |
| **14** | Cap. 6 -- Plano de Testes | **Component Diagram** | `Imagens/test_piramide_posto.png` | Pirâmide de testes (Unitários 60\%, Integração 30\%, E2E 10\%) |
| **15** | Cap. 7 -- DevOps & Runbook | **Activity Diagram** | `Imagens/devops_pipeline_posto.png` | Esteira CI/CD automatizada (Git Push $\rightarrow$ Deploy Edge) |

---

## 🛠️ Como Compilar o Documento

Para compilar o documento consolidado de 23 páginas com todas as referências cruzadas, sumário e listas populadas:

```bash
cd exemplo_posto
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

O arquivo compilado resultante é gerado como **`main.pdf`**.

---

## 👤 Autoria

- **Autor:** Diogo Santos Pires Jandiroba  
- **Cargo:** *Lead Software Engineer & Solutions Architect*  
- **Ano:** 2026
