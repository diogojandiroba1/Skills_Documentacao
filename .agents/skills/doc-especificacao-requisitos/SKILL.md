---
name: doc-especificacao-requisitos
description: Guia o agente na especificação de requisitos de software (SRS / ERS), abordando requisitos funcionais (RF), dicionário de atributos, regras de negócio (RN), requisitos não funcionais (RNF) e tabelas padronizadas com cabeçalho bege.
---

# Skill: Especificação de Requisitos de Software (SRS / ERS)

Esta skill orienta o agente na elicitação, análise, especificação e validação formal da **Especificação de Requisitos de Software (SRS - Software Requirements Specification)**, estruturada para garantir clareza, verificabilidade e rastreabilidade total.

O agente atua com rigor de engenharia:
1. Conduz o interrogatório técnico e confirma se é **Documento Novo do Zero** ou **Próximo Capítulo Lógico**;
2. Segue os preceitos de engenharia de requisitos à risca, mas **sem citar nominalmente normas no texto** (ex.: sem citar ISO 29148 ou IEEE 830 no corpo da SRS);
3. Gera as tabelas com **linhas e colunas claras** e cabeçalho em **bege claro** (`\rowcolor{tableheaderbeige}`);
4. Entrega requisitos atômicos, testáveis e com priorização MoSCoW.

---

## 1. Protocolo Obrigatório de Investigação Ativa ("Interrogatório Técnico") e Gate de Aprovação

Antes de redigir qualquer requisito ou regra de negócio em LaTeX, o agente **NÃO deve assumir premissas arbitrárias nem inventar dados**. É obrigatório realizar uma rodada investigativa estruturada com o usuário.

### 1.1. Bateria Investigativa de Perguntas (Elicitação de Requisitos)
O agente deve formular perguntas claras agrupadas por tópicos essenciais, apresentando opções técnicas e boas práticas:

1. **Contexto e Fronteira do Documento:**
   - Trata-se de um **Novo Projeto do Zero** ou do **Próximo Capítulo Lógico** (após o Plano de Projeto) do projeto atual?
2. **Módulos Funcionais e Escopo:**
   - Quais são os grandes módulos funcionais do sistema (ex.: M1: Gestão de Identidade/RBAC, M2: Cadastros Centrais, M3: Operação Principal, M4: Financeiro/Faturamento, M5: Auditoria/Relatórios)?
   - Há recursos secundários que devem ser deixados explicitamente fora da primeira release?
3. **Perfis de Usuário e Acessos (RBAC):**
   - Quais são os perfis de acesso ao sistema (ex.: Administrador, Operador, Cliente/Paciente, Fiscal/Auditor)?
   - Quais ações cada perfil pode e NÃO pode executar?
4. **Regras de Negócio Invariantes (RNs):**
   - Quais regras de negócio condicionam as operações (ex.: bloqueios temporais, validações documentais, limites de desconto, exigência de aprovação por alçada)?
   - Quais são as condições de guarda obrigatórias?
5. **Dicionário de Dados e Validações:**
   - Quais campos e formatos específicos são exigidos nas principais entidades (formatos de chave, máscaras, tipos primitivos, unicidade)?
6. **Requisitos Não-Funcionais Mensuráveis:**
   - Qual o tempo máximo aceitável de resposta nas transações críticas (ex.: $P95 \le 1{,}5$s)?
   - Qual a volumetria esperada de requisições por segundo e usuários simultâneos?
   - Quais são os requisitos legais e de segurança (LGPD, autenticação multifator MFA, tempo de expiração de sessão JWT, retenção de logs)?

### 1.2. Proposição Estruturada dos Requisitos
Após a resposta do usuário, o agente sintetiza e submete para validação:
- **Matriz de Módulos Funcionais** planejados;
- **Lista Preliminar de RFs** com priorização MoSCoW (`Must`, `Should`, `Could`);
- **Relação de Regras de Negócio (RNs)** vinculadas aos requisitos;
- **Metas Quantitativas de RNFs** (desempenho, segurança e disponibilidade).

### 1.3. Gate de Aprovação do Usuário (Ação Bloqueante)
> [!IMPORTANT]
> O agente deve finalizar a interação perguntando expressamente:
> *"Você aprova esta divisão de módulos, catálogo preliminar de requisitos funcionais/regras de negócio e métricas de qualidade para iniciarmos a redação formal em LaTeX?"*
> **Nenhum arquivo `.tex` deve ser gerado ou modificado antes da aprovação explícita do usuário.**

---

## 2. Diretrizes Normativas e de Estilo

O trabalho do agente reflete rigorosamente as melhores práticas do **SWEBOK v4 (Cap. 1)**, **ISO/IEC/IEEE 29148:2018**, **IEEE Std 830-1998** e **ISO/IEC 25010:2023**:
- **PROIBIÇÃO DE METACITAÇÕES:** O documento da SRS é um documento de produto de software. **Não cite nominalmente as normas no texto** (ex.: nada de *"segundo a ISO 29148"*, *"conforme IEEE 830"*). O agente deve seguir os critérios (singularidade, não-ambiguidade, completeza, consistência e verificabilidade) diretamente no texto do requisito.
- **GRADE NÍTIDA EM TABELAS:** Todas as tabelas de RF, RN, RNF e dicionário de dados devem possuir linhas horizontais e verticais explícitas (`|l|Y|...|` e `\hline`), com cabeçalho bege claro (`\rowcolor{tableheaderbeige}`) e títulos em negrito.

---

## 3. Estrutura Padrão do Documento

1. **Visão Geral dos Requisitos**
   - **Perspectiva do Produto:** Se o software é independente ou componente de um sistema maior;
   - **Funções do Produto:** Resumo executivo das capacidades principais organizadas por módulos;
   - **Classes e Características dos Usuários:** Perfis de acesso, formação, privilégios e frequência de uso;
   - **Restrições Gerais:** Limitações de hardware, tecnologias obrigatórias, conformidade legal (LGPD);
   - **Suposições e Dependências:** Fatores externos cuja alteração impacta os requisitos.

2. **Requisitos Funcionais (RF)**
   - Agrupados por **Módulos Funcionais** coerentes (ex.: M1: Acessos, M2: Agenda, M3: Atendimento, M4: Financeiro);
   - Todo RF deve possuir:
     - **ID Único:** `RFxx` (ex.: `RF01`, `RF02`);
     - **Título Descritivo e Verbo de Ação Claro:** "Permitir ao recepcionista...", "Registrar...", "Validar...";
     - **Prioridade Padronizada (MoSCoW):** `Must have` (Alta), `Should have` (Média), `Could have` (Baixa).

3. **Atributos e Dicionário de Dados dos Requisitos**
   - Especificação rigorosa de todos os dados manipulados pelo requisito:
     - Nome do campo;
     - Tipo de dado primitivo (UUID, String, Integer, Decimal, Datetime, Boolean, Enum);
     - Tamanho máximo / Formato (ex.: CPF no formato `000.000.000-00`, ISO 8601);
     - Obrigatoriedade (Sim/Não);
     - Regras de Validação e Valores Padrão.

4. **Restrições de Domínio e Regras de Negócio (RN)**
   - Regras invariantes do negócio que condicionam a execução dos requisitos;
   - Identificação: `RNxx` (ex.: `RN01`, `RN02`);
   - Rastreabilidade explícita indicando quais RFs são afetados pela regra.

5. **Requisitos Não Funcionais (RNF)**
   - Devem ser **mensuráveis e testáveis**, categorizados segundo características de qualidade:
     - **Desempenho e Eficiência:** Tempo de resposta em segundos para percentil 95 ($P95 \le 2{,}0$s), vazão mínima de requisições;
     - **Segurança da Informação:** Algoritmos de criptografia (AES-256, TLS 1.3), hashing com salt (Bcrypt/Argon2), tokens stateless JWT com tempo de expiração;
     - **Confiabilidade e Disponibilidade:** Índice de uptime (ex.: 99.5%), tolerância a falhas e RTO/RPO;
     - **Usabilidade:** Responsividade em diferentes resoluções, tempo máximo de aprendizado;
     - **Conformidade Legal:** Anonimização de dados, revogação de consentimento e logs de auditoria LGPD.

---

## 4. Modelos de Tabelas em LaTeX (Grade Nítida e Cabeçalho Bege)

### Requisitos Funcionais por Módulo
```latex
\subsection{Módulo M1: Gestão de Identidade e Acessos}

\begin{table}[htbp]
\caption{Requisitos Funcionais -- Módulo M1}
\label{tab:rf_m1}
\centering
\small
\begin{tabularx}{\textwidth}{|l|Y|c|l|}
\hline
\rowcolor{tableheaderbeige}
\textbf{ID} & \textbf{Descrição do Requisito Funcional} & \textbf{Prioridade} & \textbf{Regras Vinculadas} \\ \hline
RF01 & Permitir o login de usuários mediante e-mail corporativo e senha criptografada. & \badgealta & RN01, RN02 \\ \hline
RF02 & Bloquear a conta temporariamente por 15 minutos após 5 tentativas consecutivas de senha inválida. & \badgealta & RN03 \\ \hline
RF03 & Permitir ao administrador criar e inativar perfis de permissão no modelo RBAC. & \badgemedia & RN04 \\ \hline
\end{tabularx}
\end{table}
```

### Dicionário de Atributos de Requisito
```latex
\begin{table}[htbp]
\caption{Dicionário de Atributos -- RF01 (Autenticação)}
\label{tab:atributos_rf01}
\centering
\small
\begin{tabularx}{\textwidth}{|l|l|l|c|Y|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Atributo} & \textbf{Tipo} & \textbf{Formato} & \textbf{Obrigatório} & \textbf{Validação / Restrição} \\ \hline
email & String & RFC 5322 & Sim & Deve conter `@` e domínio corporativo válido. \\ \hline
senha & String & Min. 8 caracteres & Sim & Conter ao menos 1 maiúscula, 1 número e 1 caractere especial. \\ \hline
token & String & JWT (Bearer) & Saída & Assinado com chave assimétrica RSA-256 e TTL de 8 horas. \\ \hline
\end{tabularx}
\end{table}
```

### Catálogo de Regras de Negócio (RN)
```latex
\begin{table}[htbp]
\caption{Catálogo de Regras de Negócio (RN)}
\label{tab:regras_negocio}
\centering
\small
\renewcommand{\arraystretch}{1.25}
\begin{tabularx}{\textwidth}{|l|l|Y|}
\hline
\rowcolor{tableheaderbeige}
\textbf{Código} & \textbf{Nome da Regra} & \textbf{Descrição e Condição de Guarda} \\ \hline
RN01 & Autenticação Multifator (MFA) & Todo acesso por médicos e administradores deve exigir validação de segundo fator antes de liberar prontuários. \\ \hline
RN02 & Bloqueio por Tentativas & Bloquear a conta por 15 minutos após 5 tentativas consecutivas de senha inválida. \\ \hline
\end{tabularx}
\end{table}
```

---

## 5. Diretrizes para Evitar Ambiguidade nos Requisitos

- **Evite Termos Vagos:** Nunca use expressões como *"rápido"*, *"amigável"*, *"seguro"* ou *"otimizado"*. Substitua sempre por métricas numéricas verificáveis (ex.: em vez de *"sistema rápido"*, use *"tempo de resposta $\le 1{,}5$ segundos sob carga de 50 usuários simultâneos"*).
- **Consistência de Vocabulário:** Mantenha os mesmos nomes de entidades ao longo de todo o documento (se usou "Paciente", nunca alterne para "Cliente" ou "Usuário" sem distinguir os papéis).
- **Transição para Modelagem Visual (StarUML v7.0):** Os requisitos funcionais catalogados servirão como insumo primário para a modelagem visual dos Casos de Uso e Modelo Conceitual no StarUML v7.0 (executada através da skill `doc-casos-de-uso`).

---

## 6. Checklist de Qualidade do Agente
- [ ] A rodada investigativa confirmou se a demanda é Documento do Zero ou Próximo Capítulo Lógico?
- [ ] O texto está totalmente livre de citações nominais a normas (ISO 29148, IEEE 830, etc.)?
- [ ] Todas as tabelas possuem linhas e colunas nítidas (`|...|` e `\hline`) com cabeçalho em `\rowcolor{tableheaderbeige}`?
- [ ] Todos os requisitos são atômicos e estão no modo indicativo afirmativo?
- [ ] Todo requisito não funcional possui métrica quantificável para teste de aceite?
- [ ] O dicionário de dados cobre todos os campos manipulados pelos requisitos principais?
- [ ] As regras de negócio (RN) estão desacopladas das telas e focam puramente nas restrições do negócio?
- [ ] Há indicação clara dos requisitos prioritários frente ao MVP?
