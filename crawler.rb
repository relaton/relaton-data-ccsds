# frozen_string_literal: true

require 'fileutils'
require 'rbconfig'
require 'bundler'

require 'relaton/ccsds/processor'

FileUtils.rm Dir.glob('index-*')
FileUtils.rm_rf 'data'

# Fetch into data/ and build index-v2 (identifiers parsed with pubid v2).
processor = Relaton::Ccsds::Processor.new
processor.fetch_data

# Rebuild index-v1 (the released gem line, identifiers parsed with pubid v1) in
# a separate process with its own pubid-v1 bundle: pubid v1 and the pubid v2
# loaded above both define Pubid::Ccsds::Identifier and cannot coexist here.
Bundler.with_unbundled_env do
  ok = system(RbConfig.ruby, File.join(__dir__, 'build_index_v1.rb'))
  abort 'build_index_v1.rb failed' unless ok
end

system('zip index-v1.zip index-v1.yaml')
system('zip index-v2.zip index-v2.yaml')
system('git add index-v1.zip index-v1.yaml index-v2.zip index-v2.yaml')
