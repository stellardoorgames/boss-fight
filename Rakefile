require 'squib'
require 'irb'
require 'rake/clean'

# Add Rake's clean & clobber tasks
CLEAN.include('_output/*').exclude('_output/gitkeep.txt')

desc 'By default, just build the deck without extra options'
task default: [:actions, :ground, :equipment, :classes, :bossactions, :bosses]

desc 'Build everything for Tabletop Simulator'
task tts: [:with_tts, :actions, :ground, :equipment, :classes, :bossactions, :bosses]

#desc 'Build everything for Tabletop Simulator'
#task ttsproof: [:with_tts, :actions, :ground, :equipment]

desc 'Build everything, with all the options'
task all: [:with_tts, :with_proofs, :actions, :ground, :equipment, :classes, :bossactions, :bosses]

desc 'Build action cards'
task action: [:with_tts, :with_proofs, :actions]
desc 'Build ground cards'
task gnd: [:with_tts, :with_proofs, :ground]
desc 'Build class cards'
task class: [:with_tts, :with_proofs, :classes]
desc 'Build equipment cards'
task equip: [:with_tts, :with_proofs, :equipment]
desc 'Build boss action cards'
task bossaction: [:with_tts, :with_proofs, :bossactions]
desc 'Build boss cards'
task boss: [:with_tts, :with_proofs, :bosses]
desc 'Build chits'
task chit: [:with_tts, :with_proofs, :chits]

desc 'Build the deck'
task(:actions)     { load 'src/actions.rb' }
task(:ground)     { load 'src/ground.rb' }
task(:classes)     { load 'src/classes.rb' }
task(:equipment)     { load 'src/equipment.rb' }
task(:bossactions)     { load 'src/bossactions.rb' }
task(:bosses)     { load 'src/bosses.rb' }
task(:chits)     { load 'src/chits.rb' }

desc 'Enable proof lines'
task(:with_proofs) do
  puts "Enabling proofing lines."
  Squib.enable_build_globally :proofs
end

desc 'Enable print-and-play builds'
task(:with_pnp) do
  puts "Enabling print-and-play builds."
  Squib.enable_build_globally :pnp
end

desc 'Enable Tabletop Simulator builds'
task(:with_tts) do
  puts "Enabling Tabletop Simulaotr builds."
  Squib.enable_build_globally :tts
end