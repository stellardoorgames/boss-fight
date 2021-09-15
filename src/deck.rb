require 'squib'
require_relative 'version'
require_relative 'sheets'

# Note: run this code by running "rake" at the command line
# To see full list of options, run "rake -T"

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: Sheets::Actions

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/deck.yml'

  text str: data.name, layout: :name

  text str: data.value, layout: :VAL
  text str: data.def, layout: :DEF


  svg file: data.stat, layout: :ATR
  svg file: 'checked-shield.svg', layout: :shield
  
  text str: data.text, layout: :text do |embed|
	embed.svg key: '[str]', file: 'img/str.svg', layout: :embedded
	embed.svg key: '[agl]', file: 'img/agl.svg', layout: :embedded
	embed.svg key: '[int]', file: 'img/int.svg', layout: :embedded

  end

  text str: data.level.map { |s| "Level: #{s}"}, layout: :level

  text str: MySquibGame::VERSION, layout: :version

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save format: :png, prefix: 'actions_'

  build(:pnp) do
    save_sheet prefix: 'pnp_actions_',
               trim: '0.125in',
               rows: 3, columns: 3
  end

  build(:tts) do
    save_sheet prefix: 'tts_actions_',
               trim: 0,
               rows: 7, columns: 10
  end

end
