---
name: doc-implantacao-devops
description: Orienta o agente na elaboração do Guia de Implantação, DevOps e Runbook Operacional, cobrindo esteiras de CI/CD, contêineres Docker, migrações de banco, monitoramento, rollback e contingência.
---

# Skill: Guia de Implantação, DevOps e Runbook Operacional

Esta skill orienta o agente na redação do **Guia de Implantação, DevOps e Runbook Operacional de Software**, em conformidade com os processos de transição e operação da **ISO/IEC/IEEE 12207:2017**, fundamentada na Área de Conhecimento de Operações de Engenharia de Software do **SWEBOK v4** (Capítulo 10) e nas métricas de confiabilidade DORA / SRE.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas ISO/IEC/IEEE)

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

## 2. Estrutura Obrigatória do Documento

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

## 3. Modelos de Código e Tabelas em LaTeX

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

## 4. Diretrizes de Diagramação (Topologia de Deploy e Pipeline)

1. **Pipeline de CI/CD em Mermaid:**
   ```mermaid
   flowchart LR
       Push[Push no GitHub] --> Lint[Linting & Static Analysis]
       Lint --> Test[Testes Unitários & API]
       Test --> Build[Build Imagem Docker]
       Build --> Staging[Deploy Homologação]
       Staging --> Prod[Aprovação & Deploy Produção]
   ```
2. **Topologia de Implantação:**
   Evite fios cruzados. Mantenha a separação limpa entre Borda (Reverse Proxy), Serviços de Aplicação e Camada Gerenciada de Dados.

---

## 5. Checklist de Qualidade do Agente

- [ ] A esteira de CI/CD possui barreiras de qualidade bloqueantes (falha em teste impede deploy)?
- [ ] Os procedimentos de rollback cobrem tanto o código da aplicação quanto as migrações do banco de dados?
- [ ] O runbook contém ações claras e acionáveis para falhas comuns de infraestrutura?
- [ ] As variáveis de ambiente críticas não estão expostas em texto puro no repositório?
