require 'squib'
require_relative 'version'
require_relative 'sheets'

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: Sheets::Actions

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/actions.yml'

  st = data.stat.each_index.select { |i| data.stat[i] == "str.svg"}
  rect range: st, fill_color: '#fcd17b', layout: :classcolor
  st = data.stat.each_index.select { |i| data.stat[i] == "agl.svg"}
  rect range: st, fill_color: '#d3efa9', layout: :classcolor
  st = data.stat.each_index.select { |i| data.stat[i] == "int.svg"}
  rect range: st, fill_color: '#d2c0f0', layout: :classcolor

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
