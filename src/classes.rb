require 'squib'
require_relative 'version'
require_relative 'sheets'

data = Squib.xlsx file: 'data/BossFight.xlsx', sheet: Sheets::Classes

Squib::Deck.new(cards: data.nrows) do
  background color: :white
  use_layout file: 'layouts/classes.yml'

  text str: data.character, layout: :character
  text str: data.ability1, layout: :ability1
  text str: data.ability2, layout: :ability2

  text str: data.ability1text, layout: :ability1text do |embed|
	embed.svg key: '[ap]', file: 'img/action-point.svg', layout: :embedded
	embed.svg key: '[str]', file: 'img/str.svg', layout: :embedded
	embed.svg key: '[agl]', file: 'img/agl.svg', layout: :embedded
	embed.svg key: '[int]', file: 'img/int.svg', layout: :embedded
	embed.svg key: '[ar]', file: 'img/arrow.svg', layout: :embedded
	embed.svg key: '[po]', file: 'img/poison.svg', layout: :embedded
	embed.svg key: '[fi]', file: 'img/fire.svg', layout: :embedded
	embed.svg key: '[wa]', file: 'img/water.svg', layout: :embedded
	embed.svg key: '[he]', file: 'img/health.svg', layout: :embedded
  end

  text str: data.ability2text, layout: :ability2text do |embed|
	embed.svg key: '[ap]', file: 'img/action-point.svg', layout: :embedded
	embed.svg key: '[str]', file: 'img/str.svg', layout: :embedded
	embed.svg key: '[agl]', file: 'img/agl.svg', layout: :embedded
	embed.svg key: '[int]', file: 'img/int.svg', layout: :embedded
	embed.svg key: '[ar]', file: 'img/arrow.svg', layout: :embedded
	embed.svg key: '[po]', file: 'img/poison.svg', layout: :embedded
	embed.svg key: '[fi]', file: 'img/fire.svg', layout: :embedded
	embed.svg key: '[wa]', file: 'img/water.svg', layout: :embedded
	embed.svg key: '[he]', file: 'img/health.svg', layout: :embedded
  end

  text str: MySquibGame::VERSION, layout: :version

  build(:proofs) do
    safe_zone
    cut_zone
  end

  save format: :png, prefix: 'classes_'

  build(:pnp) do
    save_sheet prefix: 'pnp_classes_',
               trim: '0.125in',
               rows: 3, columns: 3
  end
  
  build(:tts) do
    save_sheet prefix: 'tts_classes_',
               trim: 0,
               rows: 7, columns: 10
  end

end
