# ⚽ World Cup Database Analytics

Projeto acadêmico de modelagem, normalização e análise de dados da Copa do Mundo utilizando SQLite e SQL.

---

# 📌 Sobre o Projeto

Este projeto tem como objetivo desenvolver um banco de dados relacional normalizado baseado em dados históricos da Copa do Mundo FIFA, aplicando conceitos de:

* Modelagem Relacional;
* Normalização (1FN, 2FN e 3FN);
* DDL e DML no SQLite;
* Integridade Referencial;
* Consultas Analíticas em SQL.

O sistema foi desenvolvido como atividade acadêmica da disciplina de Banco de Dados.

---

# 🏗️ Estrutura do Banco de Dados

O banco foi dividido em três entidades principais:

## 📂 Tabelas

### `WorldCups`

Armazena informações gerais de cada edição da Copa do Mundo.

| Campo           | Tipo         |
| --------------- | ------------ |
| year            | INTEGER (PK) |
| country         | TEXT         |
| winner          | TEXT         |
| runners_up      | TEXT         |
| third           | TEXT         |
| fourth          | TEXT         |
| goals_scored    | INTEGER      |
| qualified_teams | INTEGER      |
| matches_played  | INTEGER      |
| attendance      | INTEGER      |

### `WorldCupMatches`

Armazena informações das partidas.

| Campo                | Tipo         |
| -------------------- | ------------ |
| match_id             | INTEGER (PK) |
| year                 | INTEGER (FK) |
| stage                | TEXT         |
| stadium              | TEXT         |
| city                 | TEXT         |
| home_team_name       | TEXT         |
| away_team_name       | TEXT         |
| home_team_goals      | INTEGER      |
| away_team_goals      | INTEGER      |
| attendance           | INTEGER      |
| half_time_home_goals | INTEGER      |
| half_time_away_goals | INTEGER      |
| win_conditions       | TEXT         |

### `WorldCupPlayers`

Armazena informações dos jogadores.

| Campo        | Tipo         |
| ------------ | ------------ |
| player_id    | INTEGER (PK) |
| year         | INTEGER (FK) |
| player_name  | TEXT         |
| team         | TEXT         |
| goals_scored | INTEGER      |
| yellow_cards | INTEGER      |
| red_cards    | INTEGER      |
| position     | TEXT         |
| coach_name   | TEXT         |

---

# 🔗 Relacionamentos

WorldCups (1) -------- (N) WorldCupMatches

WorldCups (1) -------- (N) WorldCupPlayers

---

# 🧠 Normalização Aplicada

O banco foi normalizado até a Terceira Forma Normal (3FN).

## ✅ Primeira Forma Normal (1FN)

* Eliminação de grupos repetitivos;
* Dados atômicos;
* Registros únicos.

## ✅ Segunda Forma Normal (2FN)

* Remoção de dependências parciais;
* Separação entre Copa, Partidas e Jogadores.

## ✅ Terceira Forma Normal (3FN)

* Remoção de dependências transitivas;
* Redução de redundância;
* Melhor integridade dos dados.

---

# 🛠️ Tecnologias Utilizadas

* SQLite
* SQL
* DB Browser for SQLite
* Git
* GitHub

---

# 📊 Consultas Analíticas

O projeto contém 15 consultas analíticas utilizando:

* `INNER JOIN`
* `LEFT JOIN`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `LIMIT`
* Funções de agregação:

  * `SUM()`
  * `AVG()`
  * `COUNT()`
  * `MAX()`
  * `MIN()`

## Exemplos de análises realizadas

* Estádios com maior média de gols em finais;
* Seleções com mais viradas históricas;
* Copas com maior média de público;
* Seleções com maior saldo de gols em mata-mata;
* Jogadores com participações em múltiplas Copas.

# 📚 Conceitos Aplicados

* Modelagem Relacional
* MER (Modelo Entidade-Relacionamento)
* DDL
* DML
* Integridade Referencial
* Normalização
* Consultas Analíticas
* Banco de Dados Relacional

---

# 🎯 Objetivos do Projeto

* Aplicar conceitos de Banco de Dados;
* Criar uma estrutura relacional eficiente;
* Desenvolver consultas analíticas criativas;
* Trabalhar com dados históricos da Copa do Mundo;
* Utilizar boas práticas de SQL.

---

# 👨‍💻 Autor

Wesley Bastos

Projeto acadêmico desenvolvido para a disciplina de Banco de Dados.

---

# 📄 Licença

Este projeto possui finalidade exclusivamente educacional.



https://github.com/user-attachments/assets/3ce68914-f605-4bbc-90b4-5f50537137be



