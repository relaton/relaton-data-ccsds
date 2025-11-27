# frozen_string_literal: true

require 'fileutils'

require 'relaton/ccsds/processor'

FileUtils.rm Dir.glob('index-*')
FileUtils.rm_rf 'data'

processor = Relaton::Ccsds::Processor.new
processor.fetch_data

system('zip index-v1.zip index-v1.yaml')
system('git add index-v1.zip index-v1.yaml')
