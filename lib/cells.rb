require "abstract_controller"
require "action_controller"
require "pathname"

module Cell
  class Base < ActionController::Metal
    include AbstractController
    include Rendering, Layouts, Helpers, Callbacks, Translation
    include ActionController::RequestForgeryProtection

    abstract!

    class_attribute :cached_actions
    self.cached_actions = []

    class << self
      attr_reader :cached_bodies
    end

    def self.inherited(base)
      base.append_view_path(Pathname.new(caller[0].split(":")[0]).dirname)
      base.instance_variable_set("@cached_bodies", {})
    end

    def self.controller_path
      @controller_path ||= name.sub(/Cell$/, '').underscore unless anonymous?
    end

    def self.cache(*actions)
      cached_actions.concat(actions.map {|a| a.to_s })
    end

    def process(*)
      self.response_body = super
    end

    def render_to_string(*args)
      return super unless cached_actions.include?(action_name)

      if body = self.class.cached_bodies[action_name]
        body
      else
        self.class.cached_bodies[action_name] = super
      end
    end

    attr_internal :request

    delegate :session, :params, :to => "@_request"

    alias render render_to_string
  end
end