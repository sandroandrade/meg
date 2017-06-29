module Meg
  class MyGenerate < SubThor
    include MyCli::SharedMethods

    SUBCOMMAND = "generate"
    DESCRIPTION = "Generate all sort of assets"

    desc "view", "Generates a new view"
    def view
      puts 'Generating a new view'
    end

    desc "model", "Generates a new model"
    def model
      puts 'Generating a new model'
    end

  end
end
