module ApplicationHelper
  def avatar image_url, options = {}
    return image_tag(
      image_url,
      class: ["circle", "left"].concat(options[:class] ? options[:class].split(" ") : []),
      width: "40",
      height: "40"
    )
  end

  def card options={}
    render layout: "shared/card", locals: {options: options} do
      yield
    end
  end

  def card_body
    render layout: "shared/card_body" do
      yield
    end
  end

  def card_actions
    render layout: "shared/card_actions" do
      yield
    end
  end

  def card_header
    render layout: "shared/card_header" do
      yield
    end
  end

  def flash_message options
    render partial: "shared/flash", locals: options
  end

  def btn_sidebar text, path, options = {}
    link_to(
      text,
      path,
      class: [
        "btn-primary",
        "block",
        "p2",
        "text-decoration-none",
        "black",
        "btn-sidebar",
        options[:selected] ? "selected" : nil
      ]
    )
  end

  def user_menu user
    render partial: "shared/user_menu", locals: {user: user}
  end

  def container
    return content_tag(:div, class: "max-width-4 mx-auto py2 px2") { yield }
  end

  def link_to_popup path, options, &block
    render partial: "shared/link_to_popup", locals: {path: path, options: options, block: block}
  end

  def dialog id
    render layout: "shared/dialog", locals: {id: id} do
      yield
    end
  end

  def toggle_link_to id, options
    render layout: "shared/toggle_link_to", locals: {id: id, options: options} do
      yield
    end
  end

  def district_list
    [
      "Não moro no Rio",
      "Abolição",
      "Acari",
      "Água Santa",
      "Alto da Boa Vista",
      "Anchieta",
      "Andaraí",
      "Anil",
      "Bancários",
      "Bangu",
      "Barra da Tijuca",
      "Barra de Guaratiba",
      "Barros Filho",
      "Benfica",
      "Bento Ribeiro",
      "Bonsucesso",
      "Botafogo",
      "Brás de Pina",
      "Cachambi",
      "Cacuia",
      "Caju",
      "Camorim",
      "Campinho",
      "Campo dos Afonsos",
      "Campo Grande",
      "Cascadura",
      "Catete",
      "Catumbi",
      "Cavalcanti",
      "Centro",
      "Cidade de Deus",
      "Cidade Nova",
      "Cidade Universitária",
      "Cocotá",
      "Coelho Neto",
      "Colégio",
      "Complexo do Alemão",
      "Copacabana",
      "Cordovil",
      "Cosme Velho",
      "Cosmos",
      "Costa Barros",
      "Curicica",
      "Del Castilho",
      "Deodoro",
      "Encantado",
      "Engenheiro Leal",
      "Engenho da Rainha",
      "Engenho de Dentro",
      "Engenho Novo",
      "Estácio",
      "Flamengo",
      "Freguesia (Ilha do Governador)",
      "Freguesia (Jacarepaguá)",
      "Galeão",
      "Gamboa",
      "Gardênia Azul",
      "Gávea",
      "Gericinó",
      "Glória",
      "Grajaú",
      "Grumari",
      "Guadalupe",
      "Guaratiba",
      "Higienópolis",
      "Honório Gurgel",
      "Humaitá",
      "Inhaúma",
      "Inhoaíba",
      "Ipanema",
      "Irajá",
      "Itanhangá",
      "Jacaré",
      "Jacarepaguá",
      "Jacarezinho",
      "Jardim América",
      "Jardim Botânico",
      "Jardim Carioca",
      "Jardim Guanabara",
      "Jardim Sulacap",
      "Joá",
      "Lagoa",
      "Lapa",
      "Laranjeiras",
      "Leblon",
      "Leme",
      "Lins de Vasconcelos",
      "Madureira",
      "Magalhães Bastos",
      "Mangueira",
      "Manguinhos",
      "Maracanã",
      "Maré",
      "Marechal Hermes",
      "Maria da Graça",
      "Méier",
      "Moneró",
      "Olaria",
      "Oswaldo Cruz",
      "Paciência",
      "Padre Miguel",
      "Paquetá",
      "Parada de Lucas",
      "Parque Anchieta",
      "Parque Columbia",
      "Pavuna",
      "Pechincha",
      "Pedra de Guaratiba",
      "Penha",
      "Penha Circular",
      "Piedade",
      "Pilares",
      "Pitangueiras",
      "Portuguesa",
      "Praça da Bandeira",
      "Praça Seca",
      "Praia da Bandeira",
      "Quintino Bocaiúva",
      "Ramos",
      "Realengo",
      "Recreio dos Bandeirantes",
      "Riachuelo",
      "Ribeira",
      "Ricardo de Albuquerque",
      "Rio Comprido",
      "Rocha",
      "Rocha Miranda",
      "Rocinha",
      "Sampaio",
      "Santa Cruz",
      "Santa Teresa",
      "Santíssimo",
      "Santo Cristo",
      "São Conrado",
      "São Cristóvão",
      "São Francisco Xavier",
      "Saúde",
      "Senador Camará",
      "Senador Vasconcelos",
      "Sepetiba",
      "Tanque",
      "Taquara",
      "Tauá",
      "Tijuca",
      "Todos os Santos",
      "Tomás Coelho",
      "Turiaçu",
      "Urca",
      "Vargem Grande",
      "Vargem Pequena",
      "Vasco da Gama",
      "Vaz Lobo",
      "Vicente de Carvalho",
      "Vidigal",
      "Vigário Geral",
      "Vila Cosmos",
      "Vila da Penha",
      "Vila Isabel",
      "Vila Militar",
      "Vila Valqueire",
      "Vista Alegre",
      "Zumbi",
      "Outro"
    ]
  end

  def school_list
    [
      "Não",
      "Sou secundarista",
      "CEFET",
      "Escola Nacional de Ciências Estatísticas (ENCE)",
      "Instituto Federal do Rio de Janeiro (IFRJ)",
      "Instituto Militar de Engenharia (IME)",
      "Instituto Nacional de Educacão de Surdos (INES)",
      "Instituto Superior de Educação do Rio de Janeiro (ISERJ)",
      "Universidade do Estado do Rio de Janeiro (UERJ)",
      "Universidade Federal do Estado do Rio de Janeiro (UNIRIO)",
      "Universidade Federal do Rio de Janeiro (UFRJ)",
      "Universidade Estadual da Zona Oeste (UEZO)",
      "Centro Universitario Augusto Motta (UNISUAM)",
      "Centro Universitario Carioca (UNICARIOCA)",
      "Centro Universitario Celso Lisboa (UCL)",
      "Centro Universitario da Cidade (UNIVERCIDADE)",
      "Centro Universitario Hermínio da Silveira (UNI IBMR)",
      "Centro Universitario Metodista BENNETT",
      "Centro Universitario Moacyr Sreder Bastos (UNIMSB)",
      "Conservatório Brasileiro de Música (CBM)",
      "Escola de Direito do Rio de Janeiro",
      "Escola de Matemática Aplicada (EMAP)",
      "Escola Superior de Ensino Helena Antipoff (ESEHA)",
      "Escola Superior de Negocios Trevisan",
      "Escola Superior de Propaganda e Marketing (ESPM)",
      "Escola Superior Nacional de Seguros (ESNS)",
      "Faculdade Angel Vianna (FAV)",
      "Faculdade Batista do Estado do Rio de Janeiro (FABERJ)",
      "Faculdade Batista do Rio de Janeiro (FABAT)",
      "Faculdade Béthencourt da Silva (FABES)",
      "Faculdade Bezerra de Araújo (FABA)",
      "Faculdade CCAA",
      "Faculdade Brasileira de Educação e Cultura (FABEC)",
      "Faculdade de Ciências Agro - Ambientais (FAGRAM)",
      "Faculdade de Cs. Médicas e Paramédicas Fluminense (SEFLU)",
      "Faculdade IBMEC",
      "Instituto de Pós-Graduação & Graduação (IPOG)",
      "Faculdade de Informática Lemos de Castro (FILC)",
      "Faculdade de Reabilitação da Asce (FRASCE)",
      "Faculdade de Tecnologia SENAC",
      "Faculdade Evangélica de Tecnologia, Ciências e Biotec. (FAECAD)",
      "Faculdade Gama e Souza (FGS)",
      "Faculdade Germário Dantas (FGD)",
      "Faculdade Integrada AVM",
      "Faculdade Internacional Signorelli",
      "Faculdade Machado de Assis (FAMA)",
      "Faculdade Mercúrio (FAMERC)",
      "Faculdade Moraes Junior (FMJ)",
      "Faculdade Pinheir Guimarães (FAPG)",
      "Faculdade São Bento",
      "Faculdade São Camilo",
      "Faculdade São José (FSJ)",
      "Faculdade São Judas Tedeu (FSJT)",
      "Faculdade SENAI/CETIQT",
      "Faculdades Integradas Campo-Grandenses (FIC)",
      "Faculdades Integradas de Jacarepaguá (FIJ)",
      "Faculdades Integradas Hélio Alonso (FACHA)",
      "Faculdades Integradas Silva e Souza (FAU)",
      "Faculdades Integradas Simonsen (FIS)",
      "Faculdade Teológica Evangélica do Rio de Janeiro (FATERJ)",
      "Fundação Técnico - Educacional Souza Marques (FTESM)",
      "Fundação Getulio Vargas (FGV)",
      "Instituto Infnet",
      "Instituto Isabel",
      "Instuto Superior de Educação Pró-Saber (ISEPS)",
      "Instuto Superior de Informática (ISI)",
      "Trevisan Escola de Negocios",
      "Universidade Cândido Mendes (UCAM)",
      "Universidade Castelo Branco (UCB)",
      "Universidade Estácio de Sá",
      "Universidade do Grande Rio (UNIGRANRIO)",
      "Universidade Gama Filho (UGF)",
      "Universidade Santa Úrsula (USU)",
      "Universidade Severino Sombra (USS) Flamengo)",
      "Universidade Veiga de Almeida (UVA)",
      "Pontifícia Universidade Católica do Rio de Janeiro (PUCRIO)",
      "Centro Brasileiro de Pesquisas Físicas (CBPF)",
      "União das Instituições Eduçacionais do Estado de São Paulo (UNIESP)",
      "Comissão Nacional de Energia Nuclear (CNEN)",
      "Outro"
    ]
  end

  def event_category_list
    [
      "Comício",
      "Phonebank",
      "Panfletagem",
      "Assembleia",
      "Flashmob",
      "Intervenção urbana"
    ]
  end

  def theme_list
    [
      "Educação",
      "Saúde",
      "Transporte"
    ]
  end

  def favorite_tasks
    [
      "Participando de panfletagens onde eu moro, trabalho ou estudo",
      "Participando de mutirões de cadastramento e contato com outros voluntários e apoiadores da campanha",
      "Ajudando a organizar eventos da campanha na rua",
      "Disponibilizando a minha casa para ser um ponto de distribuição de materiais",
      "Participando de vídeos da campanha",
      "Ajudando com design para redes",
      "Ajudando com fotografia e filmagem",
      "Ajudando com pesquisas de opinião coletivas pelo celular",
      "Doando dinheiro"
    ]
  end

  def favorite_topics
    [
      "Mulheres",
      "Negras e negros",
      "LGBTs",
      "Cultura",
      "Educação",
      "Segurança",
      "Mobilidade",
      "Meio Ambiente",
      "Saúde",
      "Juventude"
    ]
  end

  def freixo_facts
    [
      "Freixo nasceu em 12 de abril de 1967 no Fonseca, bairro da periferia de Niterói.",
      "É um dos três filhos de Aroldo e Alenice, funcionários de uma escola pública na cidade.",
      "Freixo teve infância típica de garoto da periferia, vivida nas ruas do bairro, jogando futebol, gude e empinando pipa.",
      "Aos 15 anos arrumou seu primeiro trabalho distribuindo panfletos publicitárias nas ruas para ajudar a família.",
      "Nessa mesma época começou a despertar para as desigualdades. Sua primeira experiência política foi na luta por melhorias em seu bairro.",
      "Aos 21 anos, deixou a faculdade de Economia para realizar o sonho de ser professor: ingressou no curso de História da Universidade Federal Fluminense.",
      "Ali viveu uma experiência que mudou sua vida: começou a dar aulas no sistema penitenciário como voluntário.",
      "Conhecer de perto as violências e injustiças foi essencial na sua formação como professor e defensor de Direitos Humanos.",
      "Elegeu-se deputado pelo PSOL pela primeira vez em 2006, com 13 mil votos.",
      "Em 2008,  presidiu a CPI das Milícias, que indiciou de 200 pessoas. Os principais líderes foram presos.",
      "A história inspirou o filme Tropa de Elite II.",
      "Freixo sofreu diversas ameaças de morte devido à CPI.",
      "Em 2010, se reelegeu com 177 mil votos.",
      "Presidiu a CPI do Tráfico de Armas e Munições, além de atuar nas áreas de educação,  saúde, democracia, transparência e combate à corrupção.",
      "Em 2012,após belíssima campanha que mobilizou toda a cidade, Freixo ficou em segundo lugar na disputa pela prefeitura obtendo 28% dos votos.",
      "Elegeu-se para o terceiro mandato em 2014, com 350 mil votos. Foi o deputado estadual mais votado do país.",
      "Queremos que você continue escrevendo essa história com a gente. Juntos nós podemos tornar o Rio um lugar melhor para vivermos!"
    ]
  end

  def supporters
    [
      {
        name: "Dona Penha",
        description: "Moradora da Vila Autódromo",
        testimony: "Fico muito feliz de ver essa população sem medo de lutar, de ser feliz e de cobrar os seus direitos.",
        photo: image_url("volunteers/supporters/DonaPenha.png")
      },
      {
        name: "Wagner Moura",
        description: "Ator",
        testimony: "Sempre que penso no Marcelo eu penso nos valores, na justiça social, na luta pelos direitos humanos e pela dignidade das pessoas, contra a homofobia e o racismo. Tô fechado com ele sempre",
        photo: image_url("volunteers/supporters/WagnerMoura.png")
      },
      {
        name: "Teresa Cristina",
        description: "Cantora",
        testimony: "Eu sou mulher, negra e suburbana e quero estar representada nessa prefeitura. Eu tenho dois sonhos, o primeiro é a gente se livrar do PMDB do Rio de Janeiro e o segundo é a gente ter um prefeito íntegro que não tenha rabo preso",
        photo: image_url("volunteers/supporters/TeresaCristina.png")
      },
      {
        name: "Guilherme Boulos",
        description: "Movimento dos Trabalhadores Sem Teto",
        testimony: "Eu tô com Freixo, o MTST tá com Freixo, porque a sua pré candidatura representa o enfrentamento à este modelo de cidade negócio",
        photo: image_url("volunteers/supporters/GuilhermeBoulos.png")
      },
      {
        name: "Mônica Cunha",
        description: "Movimento Moleque",
        testimony: "Eu quero que esses adolescentes que estão sendo assassinados e encarcerados possam viver. Eu acredito em Freixo e nesse movimento que está surgindo. Podemos fazer um Rio diferente",
        photo: image_url("volunteers/supporters/MonicaCunha.png")
      },
      {
        name: "Leonardo Boff",
        description: "Teólogo",
        testimony: "O Rio de Janeiro precisa de uma liderança política nova, que permita a cidade encontrar consigo mesma. A cidade precisa de alguém como Marcelo Freixo.",
        photo: image_url("volunteers/supporters/LeonardoBoff.png")
      },
      {
        name: "Ivanir dos Santos",
        description: "Babalawo",
        testimony: "Eu tenho um lado: da liberdade, do respeito, da democracia e da luta antiracista",
        photo: image_url("volunteers/supporters/IvanirdosSantos.png")
      },
      {
        name: "José Trajano",
        description: "Jornalista esportivo",
        testimony: "Para que a gente transforme essa cidade verdadeiramente na nossa cidade, temos que estar de braços dados com Marcelo Freixo",
        photo: image_url("volunteers/supporters/JoseTrajano.png")
      },
      {
        name: "Luiza Erundina",
        description: "Deputada Federal",
        testimony: "Nós estamos começando um novo tempo nessa cidade mágica, essa cidade do povo, que é o orgulho do Brasil",
        photo: image_url("volunteers/supporters/LuizaErundina.png")
      },
      {
        name: "Raquel Rolnik",
        description: "Urbanista",
        testimony: "Nesse momento de extrema crise política onde tudo parece desmanchar, aqui é o lugar onde vamos construir um movimento pelo direito à cidade para todos",
        photo: image_url("volunteers/supporters/RaquelRolnik.png")
      },
      {
        name: "Chico Alencar",
        description: "Deputado federal",
        testimony: "Isso é um prenúncio de que nós estamos predispostos a não dar sossego aos pré históricos que querem continuar mandando na cidade e no país",
        photo: image_url("volunteers/supporters/ChicoAlencar.png")
      },
      {
        name: "Frei Betto",
        description: "Escritor",
        testimony: "Conheço Marcelo Freixo de longa data e estou convicto de ser um político ético, íntegro e corajoso. Com Freixo tenho certeza que o Rio voltará a ser a cidade maravilhosa",
        photo: image_url("volunteers/supporters/FreiBetto.png")
      }
    ]
  end
end
