Table Aluno {
  matricula int [primary key]
  nome varchar
  cpf varchar [unique]
  data_nascimento date
  endereco varchar
  curso_id int
}

// Telefone (multivalorado)
Table Aluno_Telefone {
  id int [primary key] 
  matricula_aluno int [primary key] 
  numero_telefone varchar       // O telefone
}

Table Curso {
  id_curso int [primary key]
  nome_curso varchar
  Aluno_matricula varchar
  
}

// Disciplina é uma Entidade Associativa
Table Disciplina {
  id_disciplina int [primary key]
  nome_disciplina varchar
  curso_id int
  Aluno_matricula varchar
}

Table Turma {
  id_turma int [primary key]
  Prof_responsavel varchar
  matricula_aluno varchar 
}

Table Professor {
  id_prof int [primary key]
  Nome_prof varchar
  nome_disciplina varchar
}



// Relação de "1" (Alunos) para "N" (Telefone)
Ref: Aluno_Telefone.matricula_aluno > Aluno.matricula

// Relação "1" (Curso) para "n" (Disciplina)
Ref: Disciplina.curso_id > Curso.id_curso

// Relação "n" para "n" entre Disciplina e Turma
Ref: Disciplina.id_disciplina <> Turma.id_turma

// Relação Professores e Turma
Ref: Professor.id_prof <> Turma.id_turma
Ref: Professor.id_prof - Turma.Prof_responsavel
Ref: Aluno.matricula <> Turma.matricula_aluno 