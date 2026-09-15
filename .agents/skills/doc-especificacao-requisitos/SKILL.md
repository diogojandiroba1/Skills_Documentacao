---
name: doc-especificacao-requisitos
description: Guia o agente na especificação de requisitos de software (SRS / ERS) conforme IEEE Std 830-1998 e ISO/IEC/IEEE 29148, abordando requisitos funcionais (RF), dicionário de atributos, regras de negócio (RN) e requisitos não funcionais (RNF).
---

# Skill: Especificação de Requisitos de Software (SRS / ERS)

Esta skill orienta o agente na elicitação, análise, especificação e validação formal da **Especificação de Requisitos de Software (SRS - Software Requirements Specification)** em estrita conformidade com as normas internacionais **ISO/IEC/IEEE 29148:2018** e **IEEE Std 830-1998**, fundamentada na Área de Conhecimento de Requisitos do **SWEBOK v4**.

---

## 1. Fundamentação Teórica (SWEBOK v4 e Normas IEEE/ISO)

O trabalho do agente deve refletir rigorosamente os princípios de Engenharia de Requisitos:

* **SWEBOK v4 (Software Engineering Body of Knowledge):**
  * **Chapter 1 -- Software Requirements:**
    * *Requirements Fundamentals:* Distinção formal entre requisitos funcionais (comportamento observável do sistema), restrições de domínio e requisitos não funcionais (qualidades sistêmicas de confiabilidade, desempenho e segurança);
    * *Requirements Elicitation:* Captura sistemática de necessidades de múltiplos perfis de usuários e cenários operacionais;
    * *Requirements Analysis:* Classificação estruturada, modelagem conceitual de dados e resolução de conflitos de negócio;
    * *Requirements Specification:* Documentação formal com nível ótimo de detalhe, evitando omissões e ambiguidades;
    * *Requirements Validation:* Aplicação de critérios de verificação e validação (atomicidade, verificabilidade e testabilidade de cada requisito);
    * *Practical Considerations:* Manutenção da matriz de rastreabilidade bidirecional e gestão de atributos de requisitos (identificador, descrição, prioridade, status, regras vinculadas).
* **Normas Internacionais:**
  * **ISO/IEC/IEEE 29148:2018:** *Systems and software engineering -- Life cycle processes -- Requirements engineering* (Cláusula de requisitos para SRS e critérios de qualidade: Singular, Não-ambíguo, Completo, Consistente, Verificável e Rastreável);
  * **IEEE Std 830-1998:** *Recommended Practice for Software Requirements Specifications*;
  * **ISO/IEC 25010:2023:** *Systems and software Quality Requirements and Evaluation (SQuaRE) -- Product quality model*.

---

## 2. Estrutura Padrão do Documento

1. **Visão Geral dos Requisitos**
   - **Perspectiva do Produto:** Se o software é independente ou componente de um sistema maior;
   - **Funções do Produto:** Resumo executivo das capacidades principais organizadas por módulos;
   - **Classes e Características dos Usuários:** Perfis de acesso, formação, privilégios e frequência de uso;
   - **Restrições Gerais:** Limitações de hardware, tecnologias obrigatórias, conformidade legal (LGPD, normas da ANVISA/CFM se aplicável);
   - **Suposições e Dependências:** Fatores externos cuja alteração impacta os requisitos (ex.: estabilidade de APIs de terceiros).

2. **Requisitos Funcionais (RF)**
   - Agrupados por **Módulos Funcionais** coerentes (ex.: M1: Pessoas e Acesso, M2: Agenda, M3: Prontuário, M4: Estoque/Farmácia, M5: Financeiro);
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
   - Devem ser **mensuráveis e testáveis**, categorizados segundo a ISO 25010:
     - **Desempenho e Eficiência:** Tempo de resposta em segundos para percentil 95 ($P95 \le 2{,}0$s), vazão mínima de requisições;
     - **Segurança da Informação:** Algoritmos de criptografia (AES-256, TLS 1.3), hashing com salt (Bcrypt/Argon2), tokens stateless JWT com tempo de expiração;
     - **Confiabilidade e Disponibilidade:** Índice de uptime (ex.: 99.5%), tolerância a falhas e RTO/RPO;
     - **Usabilidade:** Responsividade em diferentes resoluções, tempo máximo para novos operadores aprenderem operações básicas;
     - **Conformidade Legal:** Anonimização de dados, revogação de consentimento e logs de acesso conforme a LGPD.

---

## 3. Modelos de Tabelas e Código em LaTeX

### Requisitos Funcionais por Módulo
```latex
\subsection{Módulo M1: Gestão de Identidade e Acessos}

\begin{table}[htbp]
\caption{Requisitos Funcionais -- Módulo M1}
\label{tab:rf_m1}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l Y c l @{}}
\toprule
\textbf{ID} & \textbf{Descrição do Requisito Funcional} & \textbf{Prioridade} & \textbf{Regras Vinculadas} \\
\midrule
RF01 & Permitir o login de usuários mediante e-mail corporativo e senha criptografada. & \badgealta & RN01, RN02 \\
RF02 & Bloquear a conta temporariamente por 15 minutos após 5 tentativas consecutivas de senha inválida. & \badgealta & RN03 \\
RF03 & Permitir ao administrador criar e inativar perfis de permissão no modelo RBAC. & \badgemedia & RN04 \\
\bottomrule
\end{tabularx}
\end{table}
```

### Dicionário de Atributos de Requisito (Padrão Booktabs)
```latex
\begin{table}[htbp]
\caption{Dicionário de Atributos -- RF01 (Autenticação)}
\label{tab:atributos_rf01}
\centering
\small
\begin{tabularx}{\textwidth}{@{} l l l c Y @{}}
\toprule
\textbf{Atributo} & \textbf{Tipo} & \textbf{Formato} & \textbf{Obrigatório} & \textbf{Validação / Restrição} \\
\midrule
email & String & RFC 5322 & Sim & Deve conter `@` e domínio corporativo válido. \\
senha & String & Min. 8 caracteres & Sim & Conter ao menos 1 maiúscula, 1 número e 1 caractere especial. \\
token & String & JWT (Bearer) & Saída & Assinado com chave assimétrica RSA-256 e TTL de 8 horas. \\
\bottomrule
\end{tabularx}
\end{table}
```

### Catálogo de Regras de Negócio (RN)
> **Diretriz:** NÃO utilize caixas gráficas de destaque ou molduras (`regrabox`, `destaque`). Apresente as regras de negócio em tabela `booktabs` estruturada:

```latex
\begin{table}[htbp]
\caption{Catálogo de Regras de Negócio (RN)}
\label{tab:regras_negocio}
\centering
\small
\renewcommand{\arraystretch}{1.25}
\begin{tabularx}{\textwidth}{@{} l l Y @{}}
\toprule
\textbf{Código} & \textbf{Nome da Regra} & \textbf{Descrição e Condição de Guarda} \\
\midrule
RN01 & Autenticação Multifator (MFA) & Todo acesso por médicos e administradores deve exigir validação de segundo fator antes de liberar prontuários. \\
RN02 & Bloqueio por Tentativas & Bloquear a conta por 15 minutos após 5 tentativas consecutivas de senha inválida. \\
\bottomrule
\end{tabularx}
\end{table}
```

---

## 4. Diretrizes para Evitar Ambiguidade nos Requisitos

- **Evite Termos Vagos:** Nunca use expressões como *"rápido"*, *"amigável"*, *"seguro"* ou *"otimizado"*. Substitua sempre por métricas numéricas verificáveis (ex.: em vez de *"sistema rápido"*, use *"tempo de resposta $\le 1{,}5$ segundos sob carga de 50 usuários simultâneos"*).
- **Consistência de Vocabulário:** Mantenha os mesmos nomes de entidades ao longo de todo o documento (se usou "Paciente", nunca alterne para "Cliente" ou "Usuário" sem distinguir os papéis).
- **Transição para Modelagem Visual (StarUML v7.0):** Os requisitos funcionais catalogados servirão como insumo primário para a modelagem visual dos Casos de Uso e Modelo Conceitual no StarUML v7.0 (executada através da skill `doc-casos-de-uso`). Não utilize diagramas-como-código nesta fase.

---

## 5. Checklist de Qualidade do Agente
- [ ] Todos os requisitos são atômicos?
- [ ] Todos os requisitos funcionais possuem verbo de ação e estão no modo indicativo afirmativo?
- [ ] Todo requisito não funcional possui métrica quantificável para teste de aceite?
- [ ] O dicionário de dados cobre todos os campos manipulados pelos requisitos principais?
- [ ] As regras de negócio (RN) estão desacopladas das telas e focam puramente nas restrições do negócio?
- [ ] Há indicação clara dos requisitos prioritários frente ao MVP?
