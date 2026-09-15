# Template LaTeX Corporativo para Engenharia de Software

Template corporativo moderno, minimalista e modular projetado especificamente para o **Mercado de Software (Enterprise Tech Spec & Architecture Whitepaper)**, seguindo padrões de documentação técnica adotados por Big Techs (Stripe, AWS, Google) e normas internacionais (ISO/IEC/IEEE 42010, IEEE 830, ISO 29119, SWEBOK v4).

**Autor / Desenvolvedor:** Diogo Santos Pires Jandiroba  
**Perfil:** Lead Software Engineer & Solutions Architect

---

## 1. Princípios de Design Visual de Mercado

- **Paleta Minimalista Executiva:** Tons neutros sóbrios (Preto `#111827`, Grafite `#374151`, Cinza Médio `#6B7280`, Linhas sutis `#E5E7EB` e Fundo off-white `#F9FAFB`);
- **Sem Caixas Infantis / Coloridas:** Substituição de caixas coloridas pesadas por ambientes executivos limpos com barra vertical fina de 2pt a 3pt em grafite escuro (`destaque`, `decisao`, `restricao`);
- **Capa Corporativa de Mercado:** Padrão Whitepaper técnico com classificação de confidencialidade, metadados de engenharia, versão SemVer (`v1.0.0`), status de aprovação e nota de governança;
- **Tabelas Executivas Limpas:** Estruturadas com `booktabs` (`\toprule`, `\midrule`, `\bottomrule`) e cabeçalho sutil em cinza claro, sem grades pretas pesadas;
- **Tipografia e Cabeçalhos:** Linha divisória minimalista de cabeçalho e rodapé com identificação de confidencialidade e numeração formal.

---

## 2. Estrutura de Arquivos do Template

```
Template_Unificado_LATEX/
├── modern-engsoft.cls         # Classe LaTeX corporativa (Modos individual e consolidado)
├── estilo.sty                 # Pacote de estilos executivos (destaques, tabelas, código, diagramas)
├── Bibliografia.bib           # Base BibTeX com normas internacionais e referências
├── main.tex                   # Compilador Mestre do Documento Consolidado Completo
├── main_individual.tex        # Compilador para Documentos Técnicos Avulsos / Isolados
├── Capitulos/                 # Módulos técnicos do ciclo de vida:
│   ├── 01_Plano_Projeto.tex   # Project Charter, Mendelow, WBS, Gantt, Riscos, Custos
│   ├── 02_Especificacao_Requisitos.tex # SRS / ERS (IEEE 830 / ISO 29148)
│   ├── 03_Modelagem_Casos_Uso.tex      # UML Use Cases e Modelo Conceitual
│   ├── 04_Arquitetura_Software.tex     # SAD (ISO/IEC/IEEE 42010 e ArchCaMo)
│   ├── 05_Design_Tecnico.tex           # SDD, ORM DDL SQL e Diagramas Dinâmicos
│   ├── 06_Plano_Testes.tex             # STP / STD (ISO/IEC/IEEE 29119)
│   └── 07_Implantacao_DevOps.tex       # CI/CD, Docker, Migrações e Runbook
└── Imagens/                   # Armazenamento de diagramas vetoriais e telas
```

---

## 3. Ambientes de Destaque Minimalistas

- `\begin{destaque}[Título] ... \end{destaque}`: Nota técnica ou observação de processo com barra lateral fina em grafite;
- `\begin{decisao}[Título] ... \end{decisao}`: Registro de Decisão Arquitetural (ADR) ou justificativa técnica formal (Rationale);
- `\begin{restricao}[Título] ... \end{restricao}`: Alertas de conformidade legal, segurança ou LGPD;
- `\incluirdiagrama{caminho}{Legenda}{label}`: Inserção vetorial padronizada de diagramas.

---

## 4. Compilação e Geração de PDF

```bash
# Compilação completa do Documento Consolidado:
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex

# Compilação de Documento Individual (ex.: apenas SAD):
pdflatex -interaction=nonstopmode main_individual.tex
```
