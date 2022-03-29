# frozen_string_literal: true

require 'ruboclean/version'
require 'ruboclean/rubocop_configuration'
require 'ruboclean/rubocop_configuration_path'
require 'ruboclean/orderer'

# Ruboclean entry point
module Ruboclean
  class Error < StandardError; end

  def self.run(path)
    rubocop_configuration_path = RubocopConfigurationPath.new(path)

    rubocop_configuration = rubocop_configuration_path.load
    ordered_rubocop_configuration = rubocop_configuration.order

    rubocop_configuration_path.write(rubocop_configuration.order) unless same?(ordered_rubocop_configuration, rubocop_configuration)
  end

  private

  def self.same?(left, right)
    left.to_h.keys == right.to_h.keys
  end
end
