# frozen_string_literal: true

require 'securerandom'
require 'legion/extensions/cognitive_metabolism/version'
require 'legion/extensions/cognitive_metabolism/helpers/constants'
require 'legion/extensions/cognitive_metabolism/helpers/energy_reserve'
require 'legion/extensions/cognitive_metabolism/helpers/metabolic_cycle'
require 'legion/extensions/cognitive_metabolism/helpers/metabolism_engine'
require 'legion/extensions/cognitive_metabolism/runners/cognitive_metabolism'
require 'legion/extensions/cognitive_metabolism/client'

module Legion
  module Extensions
    module CognitiveMetabolism
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
