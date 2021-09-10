require 'squib'
require_relative 'version'

# Note: run this code by running "rake" at the command line
# To see full list of options, run "rake -T"

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: 0

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/deck.yml'

  text str: data.name, layout: :name

  text str: data.value, layout: :VAL
  # text str: data.def.map { |s| "#{s} DEF" }, layout: :DEF
  text str: data.def, layout: :DEF


  svg file: data.stat, layout: :ATR
  svg file: 'checked-shield.svg', layout: :shield
  
  text str: data.text, layout: :text do |embed|
	embed.svg key: '[str]', file: 'img/str.svg', layout: :embeded
	embed.svg key: '[agl]', file: 'img/agl.svg', layout: :embeded
	embed.svg key: '[int]', file: 'img/int.svg', layout: :embeded

  end

  text str: MySquibGame::VERSION, layout: :version

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save format: :png

  build(:pnp) do
    save_sheet prefix: 'pnp_sheet_',
               trim: '0.125in',
               rows: 3, columns: 3
  end

  build(:tts) do
    save_sheet prefix: 'tts_sheet_',
               trim: 0,
               rows: 10, columns: 7
  end

end
