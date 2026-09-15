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

## 📊 Catálogo de Diagramas (15 Diagramas Nativos em TikZ Vetorial)

Todos os diagramas foram codificados diretamente em código vetorial LaTeX nativo (`tikz`), dispensando arquivos externos de imagem e garantindo qualidade gráfica perfeita em qualquer escala ou zoom:

| # | Capítulo | Tipo de Diagrama | Norma / Metodologia | Elementos Modelados |
|:---:|:---|:---|:---|:---|
| **01** | Cap. 1 -- Plano de Projeto | **Matriz de Mendelow** | Gestão de Stakeholders | Poder $\times$ Interesse (Proprietário, SEFAZ, Frentistas, Fornecedores) |
| **02** | Cap. 1 -- Plano de Projeto | **WBS / EAP em Árvore** | PMBOK / IEEE Std 1058 | Decomposição hierárquica das entregas do PostoSmart |
| **03** | Cap. 1 -- Plano de Projeto | **Linha do Tempo / Gantt** | Gestão de Cronograma | Marcos e entregas quinzenais dos 4 sprints de desenvolvimento |
| **04** | Cap. 3 -- Casos de Uso | **Diagrama de Casos de Uso** | OMG UML 2.5.1 | Atores (*Frentista*, *Caixa*, *Gerente*) e Casos de Uso com `<<include>>` |
| **05** | Cap. 3 -- Casos de Uso | **Modelo Conceitual de Domínio** | Classes de Análise / DDD | *Tanque*, *Bomba*, *Bico*, *Combustível*, *Abastecimento*, *Venda* |
| **06** | Cap. 4 -- Arquitetura | **Visão Lógica de Componentes** | Kruchten 4+1 / ISO 42010 | Camada Edge Local (Driver, Regras, PDV) e Nuvem (Sync, SEFAZ, DB) |
| **07** | Cap. 4 -- Arquitetura | **Visão de Processos** | Kruchten 4+1 / ISO 42010 | Threads concorrentes, Ring Buffer Lockless e despacho WebSocket |
| **08** | Cap. 4 -- Arquitetura | **Visão Física / Implantação** | Kruchten 4+1 / ISO 42010 | Ilhas de pista, Barramento RS-485, Concentrador, Edge Server, Nuvem |
| **09** | Cap. 5 -- Design Detalhado | **Diagrama de Classes de Projeto** | UML Design Level (SDD) | Atributos com visibilidade `+`/`-`, métodos tipados e contratos |
| **10** | Cap. 5 -- Design Detalhado | **Diagrama de Sequência** | OMG UML 2.5.1 | Ciclo completo: Desengate $\rightarrow$ Autorização $\rightarrow$ Abastecimento $\rightarrow$ Encerramento |
| **11** | Cap. 5 -- Design Detalhado | **Diagrama de Máquina de Estados** | UML State Machine | Ciclo de vida do bico (*Repouso*, *Aguardando*, *Abastecendo*, *Pendente*, *Bloqueado*) |
| **12** | Cap. 5 -- Design Detalhado | **Diagrama de Atividades** | UML Activity Diagram | Fluxo de caixa, bifurcação de contingência fiscal e impressão DANFE |
| **13** | Cap. 5 -- Design Detalhado | **Diagrama ER Relacional** | Mapeamento ORM / DDL | Tabelas físicas (`tb_tanque`, `tb_bico`, `tb_abastecimento`, `tb_venda`) com PK/FK |
| **14** | Cap. 6 -- Plano de Testes | **Pirâmide de Testes de Software** | ISO/IEC/IEEE 29119 | Distribuição de esforço: Unitários (60\%), Integração (30\%) e E2E (10\%) |
| **15** | Cap. 7 -- DevOps & Runbook | **Pipeline de CI/CD** | Entrega Contínua / DORA | Git Push $\rightarrow$ Lint/SAST $\rightarrow$ Testes $\rightarrow$ Docker Build $\rightarrow$ Scan $\rightarrow$ Deploy |

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
