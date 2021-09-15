require 'squib'
require_relative 'version'
require_relative 'sheets'

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: Sheets::Chits

Squib::Deck.new(width: 100, height: 100, cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/chits.yml'

  #text str: data.name, layout: :name
  #text str: data.type, layout: :type
  #text str: data.subtype, layout: :subtype
  #text str: data.text, layout: :text
  svg file: data.image, layout: :image

  #text str: MySquibGame::VERSION, layout: :version

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save format: :png, prefix: 'chits_'

  build(:pnp) do
    save_sheet prefix: 'pnp_chits_',
               trim: '0.125in',
               rows: 3, columns: 3
  end
  
  build(:tts) do
    save_sheet prefix: 'tts_chits_',
               trim: 0,
               rows: 7, columns: 10
  end

end
