# frozen_string_literal: true

require 'yaml'

# Module that can be included (mixin) to take and output Yaml data
module YamlBuddy
  # take_yaml: converts a String with YAML data into @data
  # parameter: yml - a String in YAML format

  def take_yaml(yml)
    @data = YAML.safe_load(yml)
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_yaml
    @data.to_yaml
  end
end
