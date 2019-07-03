images_list = %w[https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png
                 https://assets.pokemon.com/assets/cms2/img/pokedex/full/025.png
                 https://cdn.bulbagarden.net/upload/f/f5/Detective_Pikachu_artwork_2.png]

Image.create!(images_list.map do |url|
  { image_url: url }
end)
