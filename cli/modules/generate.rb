require 'active_support/inflector'

module Meg
  class MyGenerate < SubThor
    attr_accessor :pluginname

    include Thor::Actions
    include MyCli::SharedMethods

    SUBCOMMAND = "generate"
    DESCRIPTION = "Generate all sort of assets"

    def self.exit_on_failure?
      true
    end

    def self.source_root
      File.dirname(__FILE__)
    end

    desc "view", "Generates a new view"
    def view
      puts 'Generating a new view'
    end

    desc "model", "Generates a new model"
    def model
      puts 'Generating a new model'
    end

    no_tasks do
        def pluginname
	    @pluginname.downcase
	end
    end

    method_option :plugintype, :type => :string, :aliases => "-t", :default => "basic"
    method_option :appdir, :type => :string, :aliases => "-a", :required => true
    desc "plugin PLUGINNAME", "Generates a new model-view plugin named PLUGINNAME"
    def plugin(pluginname)
	self.pluginname = pluginname
	plugintype = options[:plugintype]
	appdir = options[:appdir]
	opts = { :pluginname => pluginname }
        puts "Generating '#{plugintype}' plugin '#{pluginname}' for application '#{appdir}'"
	if (!File.directory?("#{appdir}"))
            raise Thor::Error, "No application '#{appdir}' has been found"
            return
        end
	if (!File.directory?("templates/plugins/#{plugintype}"))
            raise Thor::Error, "No templates found for plugin type '#{plugintype}'"
            return
        end
	directory "../templates/plugins/#{plugintype}/", "#{appdir}/plugins/", opts
    end

  end
end
