---
name: doc-implantacao-devops
description: Orienta o agente na elaboração do Guia de Implantação, DevOps e Runbook Operacional, cobrindo esteiras de CI/CD, contêineres Docker, migrações de banco, monitoramento, rollback e modelagem formal no StarUML v7.0.
---

# Skill: Guia de Implantação, DevOps e Runbook Operacional

Esta skill orienta o agente na redação do **Guia de Implantação, DevOps e Runbook Operacional de Software**, em conformidade com os processos de transição e operação da **ISO/IEC/IEEE 12207:2017**, fundamentada na Área de Conhecimento de Operações de Engenharia de Software do **SWEBOK v4** (Capítulo 10) e nas métricas de confiabilidade DORA / SRE.

O agente atua simultaneamente como **especificador de processos operacionais e infraestrutura** e **copiloto de modelagem visual no StarUML v7.0**, ensinando a desenhar a esteira de CI/CD como Diagrama de Atividades com Raias e a topologia de infraestrutura como Diagrama de Implantação.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de redigir o Guia de Implantação, DevOps e Runbook em LaTeX ou orientar os diagramas no StarUML v7.0, o agente **NÃO deve assumir ferramentas ou infraestrutura sem consultar o usuário**. É mandatório conduzir uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de DevOps e Operações)
O agente deve formular perguntas claras agrupadas por tópicos essenciais:

1. **Plataforma de CI/CD e Gates de Qualidade:**
   - Qual plataforma de CI/CD será adotada (GitHub Actions, GitLab CI, Jenkins)?
   - Quais barreiras bloqueantes devem existir no pipeline (linters, testes unitários, testes de integração, scan SAST com SonarQube/Trivy)?
   - O deploy em produção é contínuo automático ou exige aprovação manual formal?
2. **Infraestrutura e Provedor Cloud:**
   - Onde o sistema rodará (AWS, GCP, Azure, DigitalOcean, VPS ou On-Premise)?
   - A infraestrutura será gerenciada via Docker Compose, Kubernetes (EKS/GKE), ECS ou instâncias dedicadas?
   - O banco relacional será gerenciado (RDS/Cloud SQL) ou rodará em contêiner autohospedado?
3. **Estratégia de Deploy e Zero-Downtime:**
   - Qual estratégia de implantação é desejada: *Rolling Update*, *Blue-Green Deployment* ou *Canary Release*?
   - Como são gerenciadas as variáveis sensíveis e segredos (GitHub Secrets, AWS Secrets Manager, HashiCorp Vault)?
4. **Migração e Versionamento de Banco:**
   - Qual ferramenta de migração será empregada (Flyway, Liquibase, Alembic, Prisma Migrate)?
   - Qual é a política de rollback em caso de falha de migração no banco?
5. **Observabilidade, Métricas e Runbook:**
   - Quais ferramentas de monitoramento e logs serão adotadas (Prometheus/Grafana, Datadog, ELK/Loki, CloudWatch)?
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
> *"Você aprova este pipeline de CI/CD, topologia de infraestrutura e os diagramas sugeridos para prosseguirmos com a elaboração formal do Guia de DevOps em LaTeX e o guia do StarUML v7.0?"*
> **Nenhuma linha de LaTeX deve ser escrita nem arquivos modificados antes da aprovação explícita do usuário.**

---

## 2. Fundamentação Teórica (SWEBOK v4 e Normas ISO/IEC/IEEE)

A disciplina de DevOps e Operações de Software assegura a transição estável do código homologado para o ambiente produtivo:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 10 -- Software Engineering Operations (Área de Conhecimento do SWEBOK v4):**
    * *Operations Fundamentals:* Integração contínua entre Engenharia e Operações (paradigma DevOps / GitOps), gestão de requisitos operacionais e invariantes de produção;
    * *Deployment and Release Management:* Automação de esteiras CI/CD, estratégias de implantação com tolerância a falhas (*Blue-Green*, *Canary Releases*), empacotamento em contêineres imutáveis (*Docker multi-stage*) e gestão de migrações de banco sem indisponibilidade (*Zero-Downtime Database Evolution*);
    * *Operational Support & Infrastructure as Code (IaC):* Orquestração declarativa de infraestrutura e gerenciamento seguro de segredos e configurações;
    * *Monitoring, Telemetry & Incident Management:* Princípios de SRE (*Site Reliability Engineering*), os Quatro Sinais Dourados (Latência, Tráfego, Erros e Saturação), logs estruturados e alertas em tempo real;
    * *Disaster Recovery and Contingency Planning:* Runbooks operacionais determinísticos, políticas de backup com metas de RPO (*Recovery Point Objective*) e RTO (*Recovery Time Objective*), e ritos de rollback automático.
* **Normas e Referências:**
  * **ISO/IEC/IEEE 12207:2017:** Subcláusulas 6.4.10 (*Transition Process*) e 6.4.11 (*Operation Process*);
  * **Métricas Centrais DORA (DevOps Research and Assessment):** Frequência de Deploy, Tempo de Lead Time para Mudanças, Taxa de Falhas em Mudanças e Tempo Médio de Recuperação (MTTR);
  * **The Twelve-Factor App Methodology:** Declaração de configurações em variáveis de ambiente, paridade estrita entre ambientes de homologação e produção, e tratamento de logs como fluxos de eventos contínuos.

---

## 3. Estrutura Obrigatória do Documento

1. **Arquitetura da Esteira de CI/CD**
   - Mapeamento das etapas automatizadas no pipeline (GitHub Actions / GitLab CI):
     1. **Linting e Análise Estática:** Verificação de estilo, tipagem e boas práticas (ex.: Ruff, ESLint);
     2. **Execução Automatizada de Testes:** Suíte de testes unitários e de integração com medição de cobertura;
     3. **Build e Otimização de Imagens Docker:** Multi-stage build para redução de superfície de ataque e tamanho de imagem;
     4. **Push para Registro de Contêineres:** Armazenamento seguro de imagens com tags semânticas e hash de commit;
     5. **Deploy Automatizado / Contínuo:** Gatilhos para implantação em ambiente de homologação e produção com aprovação manual.

2. **Matriz de Ambientes e Gerenciamento de Configuração**
   - Especificação clara das diferenças entre ambientes:
     - **Desenvolvimento (Local):** Docker Compose, banco efêmero com seeds de teste;
     - **Homologação (Staging):** Espelho fiel da produção para testes de aceite e validação de PO;
     - **Produção (Live):** Instâncias de alta disponibilidade com backups diários e variáveis gerenciadas em Secrets Vault.
   - Gestão de Variáveis de Ambiente (`.env.example`) e políticas de rotação de segredos.

3. **Procedimentos de Migração e Versionamento de Banco de Dados**
   - Mecanismo de evolução de esquema relacional sem perda de dados (ex.: Alembic / Flyway);
   - Comandos padronizados para aplicação de migrações (`upgrade head`) e procedimento de reversão (`downgrade -1`);
   - Boas práticas para evitar locks longos em tabelas críticas em ambiente de produção.

4. **Guia de Execução Local e Pré-requisitos de Instalação**
   - Pré-requisitos mínimos de software (Docker, Docker Compose, Git);
   - Passo a passo numerado para clonar, configurar variáveis e subir a aplicação em menos de 5 minutos.

5. **Observabilidade, Monitoramento e Logs**
   - **Healthcheck Endpoints:** Especificação de `/health` e `/metrics` (verificação de conectividade com banco e cache);
   - **Logs Estruturados:** Saída padronizada em formato JSON para ingestão por ferramentas de observabilidade;
   - **Métricas e Alertas:** Gatilhos de alerta para taxa de erro HTTP 5xx $> 1\%$, latência $P95 > 2{,}0$s ou consumo de CPU $> 85\%$.

6. **Runbook Operacional e Resposta a Incidentes (Contingência e Rollback)**
   - Procedimentos detalhados para os 4 principais cenários de incidente:
     1. Falha grave identificada imediatamente após o deploy;
     2. Degradação de performance do banco de dados ou pool de conexões saturado;
     3. Queda total do provedor de nuvem principal (recuperação de desastres);
     4. Corrupção ou perda acidental de dados (restauração de backup).

---

## 4. Modelos de Código e Tabelas em LaTeX

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
\begin{tabularx}{\textwidth}{@{} l Y Y @{}}
\toprule
\textbf{Incidente} & \textbf{Diagnóstico Imediato} & \textbf{Procedimento de Mitigação / Rollback} \\
\midrule
Falha pós-deploy & Alerta de erros 500 no monitoramento. & Reverter imagem Docker para a tag anterior estável e acionar \texttt{alembic downgrade -1} se houve migração de banco. \\
Pool de conexões esgotado & Timeout de consultas ao PostgreSQL. & Reiniciar contêiner da aplicação, aumentar o parâmetro \texttt{max\_connections} e verificar vazamento de sessão. \\
Queda da fibra local & Indisponibilidade de acesso na clínica. & Roteador comuta automaticamente para o link secundário 4G/5G contingencial em até 30 segundos. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 5. Guia Passo a Passo de Modelagem no StarUML v7.0 (Auxiliar do Agente)

### 4.1. Modelagem da Esteira de CI/CD (Activity Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Activity Diagram` e nomeie como `devops_pipeline_cicd`;
2. **Raias de Execução (Swimlanes):** Na Toolbox (*Activity*), selecione **`Swimlane (Horizontal)`** e crie raias para:
   - `Desenvolvedor / Git Client` (Branch e Push);
   - `GitHub Actions Runner` (Automação de CI);
   - `Ambiente de Homologação / Staging` (Deploy automatizado);
   - `Comitê Técnico / QA` (Aprovação manual para Produção);
   - `Cluster de Produção / Live` (Deploy produtivo).
3. **Ações da Esteira:** Arraste **`Action`** para os estágios:
   - `Git Push / Pull Request`;
   - `Executar Linter e Análise Estática`;
   - `Executar Testes Unitários e Integração`;
   - `Build Imagem Docker Multi-Stage`;
   - `Publicar Imagem no Container Registry`;
   - `Deploy Automático em Staging`;
   - `Gate de Aprovação Manual`;
   - `Deploy com Zero-Downtime em Produção`.
4. **Nós de Controle:** Utilize **`Initial Node`**, **`Decision Node`** (verificando sucesso dos testes) e **`Activity Final Node`**.

### 4.2. Topologia de Infraestrutura e Ambientes (Deployment Diagram)
1. **No Model Explorer:** Selecione `Model -> Add Diagram -> Deployment Diagram` e nomeie como `devops_topologia_infra`;
2. **Nós Computacionais e Contêineres:** Arraste **`Node`** e **`ExecutionEnvironment`** para:
   - `Nuvem Pública (AWS / GCP / VPS)`;
   - `Borda / Reverse Proxy (Nginx com SSL)`;
   - `Contêiner da Aplicação FastAPI (Docker Engine)`;
   - `Banco de Dados Gerenciado (PostgreSQL 16)`;
   - `Serviço de Armazenamento de Objetos (S3 / Supabase Storage)`.
3. **Caminhos de Rede:** Conecte os nós via **`CommunicationPath`** especificando as portas e protocolos (`<<HTTPS :443>>`, `<<TCP :5432>>`).

---

### 4.3. Exportação e Inclusão no Template LaTeX

1. **Procedimento de Exportação:**
   - Acesse **`File` -> `Export Diagram as` -> `PNG...`** (ou `PDF...`);
   - Resolução **2x ou 3x (300 DPI)** com **fundo branco**;
   - Salvar em `Template_Unificado_LATEX/Imagens/`:
     - `Imagens/devops_pipeline_cicd.png`
     - `Imagens/devops_topologia_infra.png`

2. **Ativação no LaTeX (`Capitulos/07_Implantacao_DevOps.tex`):**
   ```latex
   \incluirdiagrama{Imagens/devops_pipeline_cicd.png}{Fluxo Automatizado da Esteira CI/CD}{fig:devops_pipeline}
   \incluirdiagrama{Imagens/devops_topologia_infra.png}{Topologia de Infraestrutura e Ambientes}{fig:devops_topologia}
   ```

---

## 6. Checklist de Qualidade do Agente

- [ ] A rodada investigativa de perguntas técnicas foi realizada com o usuário e a proposta foi formalmente aprovada antes da redação?
- [ ] A esteira de CI/CD possui barreiras de qualidade bloqueantes (falha em testes impede avanço)?
- [ ] A pipeline e a topologia de infraestrutura foram prescritas para modelagem no StarUML v7.0?
- [ ] Os procedimentos de rollback cobrem tanto a aplicação quanto as migrações de banco?
- [ ] O runbook contém ações claras e determinísticas para incidentes comuns?
- [ ] As variáveis de ambiente críticas não estão expostas em texto puro?
