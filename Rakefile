#!/usr/bin/env rake
require 'sass'

require 'pathname'
require 'logger'
require 'fileutils'
require 'sprockets'
require "sprockets-sass"

ROOT        = Pathname(File.dirname(__FILE__))
LOGGER      = Logger.new(STDOUT)
BUNDLES     = %w( application.css customizer.js )
BUILD_DIR   = ROOT.join("build")
SOURCE_DIR  = ROOT.join("app/assets")

task "assets:compile" do
  sprockets = Sprockets::Environment.new(ROOT) do |env|
    env.logger = LOGGER
  end
  
  sprockets.append_path 'vendor/assets/bower_components'
  sprockets.append_path 'app/assets/javascripts'
  sprockets.append_path 'app/assets/stylesheets'
  sprockets.append_path 'app/assets/images'

  BUNDLES.each do |bundle|
    asset = sprockets.find_asset(bundle)
    prefix, basename = asset.pathname.to_s.split('/')[-2..-1]
    FileUtils.mkpath BUILD_DIR.join(prefix)
    realname = asset.pathname.basename.to_s.split(".")[0..1].join(".")
    asset.write_to(BUILD_DIR.join(prefix, realname))
  end
end
