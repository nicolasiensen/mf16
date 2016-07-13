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
    render layout: "shared/card" do
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
end

def container
  return content_tag(:div, class: "max-width-4 mx-auto py2 px2") { yield }
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
