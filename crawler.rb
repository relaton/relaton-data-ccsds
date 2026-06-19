# frozen_string_literal: true

require 'fileutils'

require 'relaton/ccsds/processor'

FileUtils.rm Dir.glob('index-*')
FileUtils.rm_rf 'data'

processor = Relaton::Ccsds::Processor.new
processor.fetch_data

system('zip index-v1.zip index-v1.yaml')
system('zip index-v2.zip index-v2.yaml')
system('git add index-v1.zip index-v1.yaml index-v2.zip index-v2.yaml')
