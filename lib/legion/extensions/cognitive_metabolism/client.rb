# frozen_string_literal: true

require 'legion/extensions/cognitive_metabolism/helpers/constants'
require 'legion/extensions/cognitive_metabolism/helpers/energy_reserve'
require 'legion/extensions/cognitive_metabolism/helpers/metabolic_cycle'
require 'legion/extensions/cognitive_metabolism/helpers/metabolism_engine'
require 'legion/extensions/cognitive_metabolism/runners/cognitive_metabolism'

module Legion
  module Extensions
    module CognitiveMetabolism
      class Client
        include Runners::CognitiveMetabolism

        def initialize(**)
          @engine = Helpers::MetabolismEngine.new
        end

        private

        attr_reader :engine
      end
    end
  end
end
