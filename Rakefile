require 'rake/clean'
require 'yaml'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  puts 'RSpec not loaded'
end

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  puts 'Rubocop not loaded'
end

begin
  require 'puppet_forge'
  require 'semverse'

  class FakePuppetfile
    def initialize
      @new_content = []
    end

    def forge(url)
      @new_content << ['forge', url, nil]
      PuppetForge.host = url
    end

    def mod(name, options = nil)
      if options.is_a?(Hash) && !options.include?(:ref)
        release = PuppetForge::Module.find(name.tr('/', '-')).current_release
        version = Semverse::Version.new(release.version)
        max = "#{version.major}.#{version.minor + 1}.0"
        @new_content << ['mod', name, ">= #{version} < #{max}"]
      else
        @new_content << ['mod', name, options]
      end
    end

    def content
      max_length = @new_content.select { |type, _value| type == 'mod' }.map { |_type, value| value.length }.max

      @new_content.each do |type, value, options|
        if type == 'forge'
          yield "forge '#{value}'"
          yield ""
        elsif type == 'mod'
          if options.nil?
            yield "mod '#{value}'"
          elsif options.is_a?(String)
            padding = ' ' * (max_length - value.length)
            yield "mod '#{value}', #{padding}'#{options}'"
          else
            padding = ' ' * (max_length - value.length)
            yield "mod '#{value}', #{padding}#{options.map { |k, v| ":#{k} => '#{v}'" }.join(', ')}"
          end
        end
      end
    end
  end

  pin_task = true
rescue LoadError
  pin_task = false
end

BUILDDIR = File.expand_path(ENV['BUILDDIR'] || '_build')
PREFIX = ENV['PREFIX'] || '/usr/local'
BINDIR = ENV['BINDIR'] || "#{PREFIX}/bin"
LIBDIR = ENV['LIBDIR'] || "#{PREFIX}/lib"
SBINDIR = ENV['SBINDIR'] || "#{PREFIX}/sbin"
INCLUDEDIR = ENV['INCLUDEDIR'] || "#{PREFIX}/include"
SYSCONFDIR = ENV['SYSCONFDIR'] || "#{PREFIX}/etc"
LOCALSTATEDIR = ENV['LOCALSTATEDIR'] || "#{PREFIX}/var"
SHAREDSTAREDIR = ENV['SHAREDSTAREDIR'] || "#{LOCALSTATEDIR}/lib"
LOGDIR = ENV['LOGDIR'] || "#{LOCALSTATEDIR}/log"
DATAROOTDIR = DATADIR = ENV['DATAROOTDIR'] || "#{PREFIX}/share"
MANDIR = ENV['MANDIR'] || "#{DATAROOTDIR}/man"
PKGDIR = ENV['PKGDIR'] || File.expand_path('pkg')

SCENARIOS = ['server-db-mysql', 'server-db-pgsql', 'server-ido-mysql', 'server-ido-pgsql', 'worker', 'agent'].freeze

exporter_dirs = ENV['PATH'].split(':').push('/usr/bin', ENV['KAFO_EXPORTER'])
exporter = exporter_dirs.find { |dir| File.executable? "#{dir}/kafo-export-params" } or
  raise("kafo-export-paths is missing from PATH, install kafo")

directory BUILDDIR
directory PKGDIR
directory "#{BUILDDIR}/parser_cache"
file "#{BUILDDIR}/parser_cache" => BUILDDIR

SCENARIOS.each do |scenario|
  config = "config/#{scenario}.yaml"
  file "#{BUILDDIR}/#{scenario}.yaml" => [config, BUILDDIR] do |t|
    cp t.prerequisites.first, t.name

    scenario_config_replacements = {
      'answer_file' => "#{SYSCONFDIR}/icinga-installer/scenarios.d/#{scenario}-answers.yaml",
      'hiera_config' => "#{DATADIR}/icinga-installer/config/icinga-hiera.yaml",
      'installer_dir' => "#{DATADIR}/icinga-installer",
      'log_dir' => "#{LOGDIR}/icinga-installer",
      'module_dirs' => "#{DATADIR}/icinga-installer/modules",
      'parser_cache_path' => "#{DATADIR}/icinga-installer/parser_cache/#{scenario}.yaml",
    }

    scenario_config_replacements.each do |setting, value|
      sh format('sed -i "s#\(.*%s:\).*#\1 %s#" %s', setting, value, t.name)
    end

    if ENV['KAFO_MODULES_DIR']
      sh format('sed -i "s#.*\(:kafo_modules_dir:\).*#\1 %s#" %s', ENV['KAFO_MODULES_DIR'], t.name)
    end
  end

  file "#{BUILDDIR}/parser_cache/#{scenario}.yaml" => [config, "#{BUILDDIR}/modules", "#{BUILDDIR}/parser_cache"] do |t|
    sh "#{exporter}/kafo-export-params -c #{t.prerequisites.first} -f parsercache --no-parser-cache -o #{t.name}"
  end

  file "#{BUILDDIR}/#{scenario}-options.asciidoc" => [config, "#{BUILDDIR}/parser_cache/#{scenario}.yaml"] do |t|
    sh "#{exporter}/kafo-export-params -c #{t.prerequisites.first} -f asciidoc -o #{t.name}"
  end

  file "#{BUILDDIR}/config/#{scenario}.yaml" => ["config/#{scenario}.yaml", "#{BUILDDIR}/config"] do |t|
    cp t.prerequisites.first, t.name
  end

  file "#{BUILDDIR}/config/#{scenario}-answers.yaml" => ["config/#{scenario}-answers.yaml", "#{BUILDDIR}/config"] do |t|
    cp t.prerequisites.first, t.name
  end

end

file "#{BUILDDIR}/icinga-installer" => 'bin/icinga-installer' do |t|
  cp t.prerequisites[0], t.name
  sh format('sed -i "s#\(^.*CONFIG_DIR = \).*#CONFIG_DIR = %s#" %s', "'#{SYSCONFDIR}/icinga-installer/scenarios.d/'", t.name)
end

directory "#{BUILDDIR}/modules"
file "#{BUILDDIR}/modules" => BUILDDIR do |_t|
  if Dir["modules/*"].include?('modules/install') and Dir["modules/*"].length < 2
    cp_r "modules/install/", "#{BUILDDIR}/modules"
    sh "r10k puppetfile install --verbose --moduledir=#{BUILDDIR}/modules"
  else
    cp_r "modules/", BUILDDIR
  end
end

directory "#{BUILDDIR}/config"

file "#{BUILDDIR}/config/config_header.txt" => ['config/config_header.txt', "#{BUILDDIR}/config"] do |t|
  cp t.prerequisites[0], t.name
end

file "#{BUILDDIR}/config/icinga-hiera.yaml" => ['config/icinga-hiera.yaml', "#{BUILDDIR}/config"] do |t|
  cp t.prerequisites[0], t.name
  sh format('sed -i "s#custom.yaml#%s#" %s', "#{SYSCONFDIR}/icinga-installer/custom-hiera.yaml", t.name)
end

directory "#{BUILDDIR}/config/icinga.hiera"
file "#{BUILDDIR}/config/icinga.hiera" => ['config/icinga.hiera', "#{BUILDDIR}/config"] do |t|
  cp_r t.prerequisites[0], t.prerequisites[1]
end

namespace :build do
  task :base => [
    BUILDDIR,
    "#{BUILDDIR}/config/config_header.txt",
    "#{BUILDDIR}/config/icinga-hiera.yaml",
    "#{BUILDDIR}/config/icinga.hiera",
    "#{BUILDDIR}/icinga-installer",
    "#{BUILDDIR}/modules",
  ]

  task :scenarios => [SCENARIOS.map do |scenario|
    [
      "#{BUILDDIR}/#{scenario}.yaml",
      "#{BUILDDIR}/config/#{scenario}.yaml",
      "#{BUILDDIR}/config/#{scenario}-answers.yaml",
      "#{BUILDDIR}/parser_cache/#{scenario}.yaml",
    ]
  end].flatten
end

task :build => ['build:base', 'build:scenarios']

task :install => :build do
  mkdir_p "#{DATADIR}/icinga-installer"
  cp_r Dir.glob('{checks,hooks,README.md,LICENSE}'), "#{DATADIR}/icinga-installer"
  cp_r "#{BUILDDIR}/config", "#{DATADIR}/icinga-installer"

  mkdir_p "#{SYSCONFDIR}/icinga-installer/scenarios.d"
  SCENARIOS.each do |scenario|
    cp "#{BUILDDIR}/#{scenario}.yaml", "#{SYSCONFDIR}/icinga-installer/scenarios.d/"
    cp "config/#{scenario}-answers.yaml", "#{SYSCONFDIR}/icinga-installer/scenarios.d/#{scenario}-answers.yaml"
  end

  cp_r "#{BUILDDIR}/modules", "#{DATADIR}/icinga-installer", :preserve => true
  cp_r "#{BUILDDIR}/parser_cache", "#{DATADIR}/icinga-installer"

  mkdir_p "#{SYSCONFDIR}/icinga-installer"
  cp "config/custom-hiera.yaml", "#{SYSCONFDIR}/icinga-installer"

  mkdir_p SBINDIR
  install "#{BUILDDIR}/icinga-installer", "#{SBINDIR}/icinga-installer", :mode => 0o755, :verbose => true

  mkdir_p "#{LOGDIR}/icinga-installer"
end

task :default => :build

CLEAN.include [
  BUILDDIR,
  PKGDIR,
]

if pin_task
  desc 'Pin all the modules in Puppetfile to released versions instead of git branches'
  task :pin_modules do
    filename = 'Puppetfile'

    fake = FakePuppetfile.new
    fake.instance_eval { instance_eval(File.read(filename), filename, 1) }

    File.open(filename, 'w') do |file|
      fake.content do |line|
        file.write("#{line}\n")
      end
    end
  end
end

