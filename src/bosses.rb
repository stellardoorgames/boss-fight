require 'squib'
require_relative 'version'
require_relative 'sheets'

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: Sheets::Bosses

Squib::Deck.new(width: 1000, height: 1000, cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/bosses.yml'

  text str: data.name, layout: :name
  text str: data.level.map { |s| "Level: #{s}"}, layout: :level
  text str: data.hp.map { |s| "Hit Points : #{s}"}, layout: :hp
  text str: data.apt.map { |s| "Actions per Turn : #{s}"}, layout: :apt
  text str: data.movement.map { |s| "Movement : #{s}"}, layout: :movement

  svg file: 'melee.svg', layout: :melee_img
  svg file: 'ranged.svg', layout: :ranged_img
  svg file: 'magic.svg', layout: :magic_img
  svg file: 'star.svg', layout: :star_img

  svg file: data.melee_range, layout: :melee_range
  svg file: data.ranged_range, layout: :ranged_range
  svg file: data.magic_range, layout: :magic_range

  text str: data.melee, layout: :melee
  text str: data.ranged, layout: :ranged
  text str: data.magic, layout: :magic
  text str: data.star, layout: :star
  
  text str: data.text, layout: :text
  
  text str: MySquibGame::VERSION, layout: :version

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save format: :png, prefix: 'bosses_'

  build(:pnp) do
    save_sheet prefix: 'pnp_bosses_',
               trim: '0.125in',
               rows: 3, columns: 3
  end
  
  build(:tts) do
    save_sheet prefix: 'tts_bosses_',
               trim: 0,
               rows: 7, columns: 10
  end

end
