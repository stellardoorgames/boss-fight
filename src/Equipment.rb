require 'squib'
require_relative 'version'
require_relative 'sheets'

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: Sheets::Equipment

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/equipment.yml'

  st = data.archetype.each_index.select { |i| data.archetype[i] == "Fighter"}
  rect range: st, fill_color: '#fcd17b', layout: :classcolor
  st = data.archetype.each_index.select { |i| data.archetype[i] == "Rogue"}
  rect range: st, fill_color: '#d3efa9', layout: :classcolor
  st = data.archetype.each_index.select { |i| data.archetype[i] == "Mage"}
  rect range: st, fill_color: '#d2c0f0', layout: :classcolor

  text str: data.name, layout: :name
  text str: data.archetype.map { |s| "Class: #{s}"}, layout: :archetype
  text str: data.value.map { |s| "Value : #{s}"}, layout: :value

  text str: data.cost.map { |s| "Cost\n#{s}" }, layout: :cost do |embed|
	embed.svg key: '[ap]', file: 'img/action-point.svg', layout: :cost_icon
	embed.svg key: '[ar]', file: 'img/arrow.svg', layout: :cost_icon
	embed.svg key: '[po]', file: 'img/poison.svg', layout: :cost_icon
	embed.svg key: '[fi]', file: 'img/fire.svg', layout: :cost_icon
	embed.svg key: '[wa]', file: 'img/water.svg', layout: :cost_icon
	embed.svg key: '[he]', file: 'img/health.svg', layout: :cost_icon
  end

  text str: data.text, layout: :text do |embed|
	embed.svg key: '[str]', file: 'img/str.svg', layout: :embedded
	embed.svg key: '[agl]', file: 'img/agl.svg', layout: :embedded
	embed.svg key: '[int]', file: 'img/int.svg', layout: :embedded
  end

  svg file: data.pattern, layout: :pattern
  svg file: data.damage, layout: :damage

  text str: MySquibGame::VERSION, layout: :version

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save format: :png, prefix: 'equipment_'

  build(:pnp) do
    save_sheet prefix: 'pnp_equipment_',
               trim: '0.125in',
               rows: 3, columns: 3
  end
  
  build(:tts) do
    save_sheet prefix: 'tts_equipment_',
               trim: 0,
               rows: 7, columns: 10
  end

end
