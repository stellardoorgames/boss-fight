require 'squib'
require_relative 'version'
require_relative 'sheets'

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: Sheets::BossActions

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/bossactions.yml'

  svg file: data.background, layout: :background
  text str: data.name, layout: :name
  svg file: data.image1, layout: :image1
  svg file: data.image2, layout: :image2

  text str: MySquibGame::VERSION, layout: :version

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save format: :png, prefix: 'bossactions_'

  build(:pnp) do
    save_sheet prefix: 'pnp_bossactions_',
               trim: '0.125in',
               rows: 3, columns: 3
  end
  
  build(:tts) do
    save_sheet prefix: 'tts_bossactions_',
               trim: 0,
               rows: 7, columns: 10
  end

end
