Forja é um website que reúne quem quer ensinar com quem quer aprender, mas com um molho secreto: só cursos presenciais.
A filosofia é estar onde as coisas acontecem, onde as pessoas se olham nos olhos.

Público-Alvo
Professor/Instrutor
Quer divulgar curso, mas tem dificuldade para formar turmas. 
Não tem tempo para divulgar, 
não tem network
Se não tiver um espaço onde receber um grupo de alunos, pode encontrar em nosso repositório de Espaços.

Artista/Aluno
Quer estudar uma técnica nova, aprender cerâmica, mas os equipamentos são caros. Ele não sabe se é realmente aquele caminho que quer seguir, mas quer experimentar.
Quer tirar dúvidas sobre como misturar as tintas, praticar fotografia com um grupo, participar de um mutirão de escrita de projetos.
Está saturado de cursos online que custam caro e só entregam promessas. Descobriu que a internet é um ótimo lugar para aprender coisas novas, mas tem coisas que a gente só aprende à moda antiga mesmo.


Funcionalidades
MVP (Minimum Viable Product)
Gestão de Usuários
* Autenticação segura (signup/login com e-mail)
* Recuperação de senha
* Opção de exclusão de conta
* Perfil com avatar, bio, links e portfólio
* Atualização de informações (email, senha com validação)
Sistema de Perfis
* Categorização: Instrutor ou Aluno
* Sistema de seguir outros perfis profissionais
* Publicação de projetos (apenas fornecedores)
* Sistema de curtidas em projetos

Cadastro de cursos
Instrutor pode cadastrar seu curso para ser oferecido ao público da plataforma

Campos Tabela Profile:
Full Name: String - (Obrigatório)
Profile Type: Enum (:instrutor ou :aluno)
About: ActionText
Avatar: ActiveStorage
Website: String
Email: String
Telefone: String
Address: String
City: String
State: String
Country: String
Categoria: Acts As Taggable On
Has Many: Cursos

Cursos
Data do Início: DateTime
Name: String - (Obrigatório)
About: ActionText
Cover: ActiveStorage
Has Many: Imagens
Categoria Principal: Acts As Taggable On
Telefone: String
Address: String
City: String
State: String
Country: String


Usuário será reconhecido como professor após cadastrar o primeiro curso:
Quando o usuário criar sua conta, ele entra como aluno. Depois que ele anuncia seu primeiro curso na plataforma, seu profile é atualizado para :professor
