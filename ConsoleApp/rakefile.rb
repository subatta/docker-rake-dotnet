require 'albacore'
build :compile do |b|
  b.sln  = 'ConsoleApp.sln'    # alt. name
  b.target = ['Clean', 'Rebuild']              # call with an array of targets or just a single target
  b.prop 'Configuration', 'Release'            # call with 'key, value', to specify a MsBuild property
  #b.cores = 4                                  # no of cores to build with, defaults to the number of cores on your machine
  #b.clp 'ShowEventId'                          # any parameters you want to pass to the console logger of MsBuild
  b.logging = 'detailed'                       # detailed logging mode. The available verbosity levels are: q[uiet], m[inimal], n[ormal], d[etailed], and diag[nostic]
  #b.be_quiet                                  # opposite of the above
  b.nologo                                     # no Microsoft/XBuild header output
end

task :default => [:compile]
