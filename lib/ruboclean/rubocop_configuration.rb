# frozen_string_literal: true

module Ruboclean
  # Contains the config_hash representation of the `.rubocop.yml` file
  class RubocopConfiguration
    def initialize(config_hash)
      @config_hash = config_hash
    end

    def to_h
      @config_hash
    end

    def order
      Ruboclean::Orderer.new(@config_hash).order
    end
  end
end
