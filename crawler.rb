# frozen_string_literal: true

require 'fileutils'

require 'relaton_ccsds'

FileUtils.rm Dir.glob('index-*')
FileUtils.rm_rf 'data'

RelatonCcsds::DataFetcher.fetch

system('zip index-v1.zip index-v1.yaml')
system('git add index-v1.zip index-v1.yaml')
