---
name: doc-implantacao-devops
description: Orienta o agente na elaboração do Guia de Implantação, DevOps e Runbook Operacional, cobrindo esteiras de CI/CD, contêineres Docker, migrações de banco, monitoramento, rollback, tabelas com cabeçalho bege e geração de modelos em sugests_diagrams/.
---

# Skill: Guia de Implantação, DevOps e Runbook Operacional

Esta skill orienta o agente na redação do **Guia de Implantação, DevOps e Runbook Operacional de Software**, detalhando a esteira de CI/CD, topologia de infraestrutura e procedimentos de contingência.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue as melhores práticas de DevOps e SRE à risca, mas **sem citar nominalmente as normas no texto** (ex.: sem citar ISO 12207 ou SWEBOK no corpo do documento);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Gera os modelos de apoio em `sugests_diagrams/<nome_diagrama>/` contendo `.puml`, `.png` e `.md`, mantendo o `.tex` livre de tutoriais do StarUML.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de redigir o Guia de Implantação, DevOps e Runbook em LaTeX ou sugerir diagramas, o agente **NÃO deve assumir ferramentas ou infraestrutura sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de DevOps e Operações)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após o Plano de Testes) do projeto atual?
2. **Plataforma de CI/CD e Gates de Qualidade:**
   - Qual plataforma de CI/CD será adotada (GitHub Actions, GitLab CI, Jenkins)?
   - Quais barreiras bloqueantes devem existir no pipeline (linters, testes unitários, testes de integração, scan SAST)?
   - O deploy em produção é contínuo automático ou exige aprovação manual formal?
3. **Infraestrutura e Provedor Cloud:**
   - Onde o sistema rodará (AWS, GCP, Azure, DigitalOcean, VPS ou On-Premise)?
   - A infraestrutura será gerenciada via Docker Compose, Kubernetes ou instâncias dedicadas?
   - O banco relacional será gerenciado (RDS/Cloud SQL) ou rodará em contêiner autohospedado?
4. **Estratégia de Deploy e Zero-Downtime:**
   - Qual estratégia de implantação é desejada (*Rolling Update*, *Blue-Green Deployment* ou *Canary Release*)?
   - Como são gerenciadas as variáveis sensíveis e segredos (GitHub Secrets, AWS Secrets Manager, Vault)?
5. **Migração e Versionamento de Banco:**
   - Qual ferramenta de migração será empregada (Flyway, Liquibase, Alembic, Prisma Migrate)?
   - Qual é a política de rollback em caso de falha de migração no banco?
6. **Observabilidade, Métricas e Runbook:**
   - Quais ferramentas de monitoramento e logs serão adotadas (Prometheus/Grafana, Datadog, ELK/Loki)?
   - Quais são os principais incidentes operacionais previstos e os limites de recuperação (RTO e RPO)?

### 1.2. Proposição Estruturada e Sugestão de Diagramas
Após as respostas, o agente sintetiza e submete formalmente para validação:
- **Arquitetura da Esteira CI/CD** e matriz de ambientes (Dev, Staging, Produção);
- **Políticas de Rollback e Runbook Operacional**;
- **Sugestão de Diagramas para Construção no StarUML v7.0:**
  1. `Imagens/devops_pipeline_cicd.png`: Fluxo Automatizado da Esteira CI/CD com Raias (Activity Diagram com Swimlanes);
  2. `Imagens/devops_topologia_infra.png`: Topologia de Infraestrutura e Ambientes (Deployment Diagram com nós, contêineres e portas).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova este pipeline de CI/CD, topologia de infraestrutura e os diagramas sugeridos para prosseguirmos com a elaboração formal do Guia de DevOps em LaTeX e a geração dos modelos de apoio em sugests_diagrams/?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

- **PROIBIÇÃO DE METACITAÇÕES:** O documento é um manual de operações e infraestrutura de produto. Não cite no texto termos como *"conforme a ISO 12207"*, *"segundo o SWEBOK"*, *"pelas métricas DORA"*. Aplique os princípios de automação, imutabilidade e runbooks determinísticos diretamente no conteúdo.
- **GRADE NÍTIDA EM TABELAS:** Todas as matrizes de ambientes, variáveis e runbooks devem possuir linhas verticais e horizontais explícitas (`|l|Y|...|` e `\hline`), com a linha de cabeçalho em bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.
- **SEPARAÇÃO DE MODELOS:** O arquivo `.tex` e o PDF final contêm apenas `\incluirdiagrama{...}`. Instruções de modelagem no StarUML v7.0 **NÃO devem ir para o PDF**; devem ser geradas em `sugests_diagrams/<nome_diagrama>/`.

---

## 3. Estrutura Obrigatória do Documento

1. **Arquitetura da Esteira de CI/CD**
   - Mapeamento das etapas automatizadas no pipeline: Linting, Testes Automatizados, Build Docker Multi-Stage, Registro de Imagens e Deploy.

2. **Matriz de Ambientes e Gerenciamento de Configuração**
   - Especificação clara de Desenvolvimento (Local), Homologação (Staging) e Produção (Live);
   - Gestão de variáveis de ambiente (`.env.example`) e rotação de segredos.

3. **Procedimentos de Migração e Versionamento de Banco de Dados**
   - Mecanismo de evolução de esquema relacional sem perda de dados;
   - Comandos padronizados de migração e reversão (`upgrade`/`downgrade`).

4. **Guia de Execução Local e Pré-requisitos de Instalação**
   - Pré-requisitos mínimos e passo a passo numerado para executar a aplicação localmente.

5. **Observabilidade, Monitoramento e Logs**
   - Endpoints de saúde (`/health`, `/metrics`), logs estruturados em JSON e gatilhos de alerta.

6. **Runbook Operacional e Resposta a Incidentes (Contingência e Rollback)**
   - Procedimentos detalhados para falhas pós-deploy, degradação de banco, queda de provedor e perda de dados.

---

## 4. Modelos de Código e Tabelas em LaTeX (Grade Nítida e Cabeçalho Bege)

### Esteira de CI/CD (Pipeline)
```latex
\begin{lstlisting}[language=bash, caption={Exemplo de Workflow GitHub Actions para CI/CD}]
name: CI/CD Pipeline
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Executar Linter e Testes Unitarios
        run: |
          docker compose run --rm api pytest --cov=app --cov-fail-under=80

  deploy:
    needs: test
    if: github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    steps:
      - name: Deploy em Homologacao
        run: |
          echo "Disparando webhook de deploy para a nuvem..."
\end{lstlisting}
```

### Runbook de Incidentes Operacionais
```latex
\begin{table}[htbp]
\caption{Matriz do Runbook de Resposta a Incidentes}
\label{tab:runbook_incidentes}
\centering
\small
\begin{tabularx}{\textwidth}{|l|Y|Y|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Incidente} & \textbf{Diagnóstico Imediato} & \textbf{Procedimento de Mitigação / Rollback} \\ \hline
Falha pós-deploy & Alerta de erros 500 no monitoramento. & Reverter imagem Docker para a tag anterior estável e acionar \texttt{alembic downgrade -1} se houve migração de banco. \\ \hline
Pool de conexões esgotado & Timeout de consultas ao PostgreSQL. & Reiniciar contêiner da aplicação, aumentar o parâmetro \texttt{max\_connections} e verificar vazamento de sessão. \\ \hline
Queda da fibra local & Indisponibilidade de acesso na clínica. & Roteador comuta automaticamente para o link secundário 4G/5G contingencial em até 30 segundos. \\ \hline
\end{tabularx}
\end{table}
```

---

## 5. Apoio à Modelagem: Pasta `sugests_diagrams/`

Para cada diagrama deste capítulo, o agente deve gerar uma subpasta dedicada em `sugests_diagrams/`:
- `sugests_diagrams/devops_pipeline_cicd/`
- `sugests_diagrams/devops_topologia_infra/`

Cada subpasta conterá obrigatoriamente três arquivos:
1. `<nome_diagrama>.puml`: Código PlantUML do pipeline ou topologia;
2. `<nome_diagrama>.png`: Imagem da prévia do PlantUML;
3. `<nome_diagrama>.md`: Roteiro textual detalhado para modelar no StarUML v7.0 (Raias de execução, Actions, Nós de Infraestrutura, ExecutionEnvironments, protocolos de rede e exportação para `Template_Unificado_LATEX/Imagens/`).

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (ISO 12207, SWEBOK, DORA)?
- [ ] Todas as tabelas possuem divisão nítida de linhas/colunas e `\rowcolor{tableheaderbeige}`?
- [ ] A esteira de CI/CD possui barreiras de qualidade bloqueantes?
- [ ] Os procedimentos de rollback cobrem tanto a aplicação quanto as migrações de banco?
- [ ] Os modelos de apoio foram gerados em `sugests_diagrams/` com o trio `.puml`, `.png` e `.md`?
- [ ] Nenhum guia de como usar o StarUML foi injetado dentro do arquivo `.tex` ou no PDF?
- [ ] As variáveis de ambiente críticas não estão expostas em texto puro?
