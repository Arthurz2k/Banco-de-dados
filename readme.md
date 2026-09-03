<div align="center">
  <img src="https://cdn-icons-png.flaticon.com/512/3135/3135810.png" width="100" alt="Database Icon">
  <h1>🎓 Sistema de Gestão Acadêmica - Modelagem de Dados</h1>
  <p><i>Estrutura Relacional Otimizada para Instituições de Ensino</i></p>

  [![Made with DBML](https://img.shields.io/badge/Made_with-DBML-0078D4?style=for-the-badge&logo=database&logoColor=white)](https://dbml.org/)
  [![dbdiagram.io](https://img.shields.io/badge/Designed_in-dbdiagram.io-FF7043?style=for-the-badge&logo=diagrams.net&logoColor=white)](https://dbdiagram.io/)
  [![GitHub](https://img.shields.io/badge/GitHub-Repository-black?style=for-the-badge&logo=github)](#)
</div>

---

## 🗺️ Diagrama Entidade-Relacionamento (DER)

Abaixo está a representação visual do modelo de banco de dados gerado, focando na resolução de cardinalidades clássicas, atributos multivalorados e escalabilidade do banco.

<div align="center">
  <img src="Untitled_2.png" alt="Visão Geral do Banco de Dados" width="850" style="border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);">
  <br>
  <i>(Certifique-se de que o arquivo Untitled_2.png esteja na mesma pasta que este README)</i>
</div>

---

## 📦 Entidades Principais

As tabelas do sistema foram desenhadas utilizando as melhores práticas de normalização:

<table>
  <tr>
    <td align="center" width="120"><img src="https://cdn-icons-png.flaticon.com/512/2995/2995112.png" width="50"><br><b>Aluno</b></td>
    <td>Armazena dados cadastrais como <code>matricula</code> (Chave Primária), <code>nome</code>, <code>cpf</code> (Garantido como único) e <code>data_nascimento</code>.</td>
  </tr>
  <tr>
    <td align="center"><img src="https://cdn-icons-png.flaticon.com/512/3014/3014875.png" width="50"><br><b>Telefone</b></td>
    <td>Isola os contatos em uma tabela própria (<code>Aluno_Telefone</code>) para permitir que cada aluno registre múltiplos números, resolvendo perfeitamente o atributo multivalorado.</td>
  </tr>
  <tr>
    <td align="center"><img src="https://cdn-icons-png.flaticon.com/512/167/167707.png" width="50"><br><b>Curso</b></td>
    <td>Mantém o registro geral dos cursos oferecidos na instituição através do <code>id_curso</code> e <code>nome_curso</code>.</td>
  </tr>
  <tr>
    <td align="center"><img src="https://cdn-icons-png.flaticon.com/512/3389/3389081.png" width="50"><br><b>Disciplina</b></td>
    <td>Entidade estruturada com <code>id_disciplina</code> que vincula e organiza as matérias aos seus respectivos cursos.</td>
  </tr>
  <tr>
    <td align="center"><img src="https://cdn-icons-png.flaticon.com/512/194/194936.png" width="50"><br><b>Professor</b></td>
    <td>Registra o corpo docente através do <code>id_prof</code>, seu nome e a disciplina principal de especialidade.</td>
  </tr>
  <tr>
    <td align="center"><img src="https://cdn-icons-png.flaticon.com/512/2641/2641409.png" width="50"><br><b>Turma</b></td>
    <td>O núcleo operacional e central (identificado por <code>id_turma</code>) que cruza os dados e aloca as matrículas e o professor responsável.</td>
  </tr>
</table>

---

## 🔗 Mapeamento de Relacionamentos (Foreign Keys)

A estrutura de relacionamentos (chaves estrangeiras) segue as seguintes regras de cardinalidade:

- <img src="https://cdn-icons-png.flaticon.com/512/148/148754.png" width="16"> **Aluno ↔ Telefone:** Relação de um para muitos (`1:N`). A matrícula do aluno referencia seus contatos `(Aluno_Telefone.matricula_aluno > Aluno.matricula)`.
- <img src="https://cdn-icons-png.flaticon.com/512/148/148754.png" width="16"> **Curso ↔ Disciplina:** Relação de um para muitos (`1:N`). Um curso possui múltiplas disciplinas `(Disciplina.curso_id > Curso.id_curso)`.
- <img src="https://cdn-icons-png.flaticon.com/512/148/148753.png" width="16"> **Disciplina ↔ Turma:** Relação de muitos para muitos (`N:N`). Conectando o currículo à oferta de aulas `(Disciplina.id_disciplina <> Turma.id_turma)`.
- <img src="https://cdn-icons-png.flaticon.com/512/148/148753.png" width="16"> **Professor ↔ Turma:** Define tanto a atuação do professor nas turmas `(Professor.id_prof <> Turma.id_turma)` quanto a responsabilidade/orientação `(Professor.id_prof - Turma.Prof_responsavel)`.
- <img src="https://cdn-icons-png.flaticon.com/512/148/148753.png" width="16"> **Aluno ↔ Turma:** Relação de muitos para muitos (`N:N`). Representa a matrícula efetiva nas aulas `(Aluno.matricula <> Turma.matricula_aluno)`.

---
<p align="center">
  <i>Desenvolvido para modelagem e documentação de estrutura de dados relacional.</i>
</p>
