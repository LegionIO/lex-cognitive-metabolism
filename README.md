# lex-cognitive-metabolism

Energy reserve and metabolic cycle model for LegionIO cognitive agents. Operations consume energy and degrade efficiency; recovery restores both. Catabolism breaks down complexity into energy; anabolism converts energy into structural value.

## What It Does

- Energy reserve with 5 metabolic states: hyperactive, active, resting, recovering, depleted
- Six operation types with defined costs (perception=5, reasoning=15, creativity=20)
- Efficiency modulator: spending energy degrades efficiency; higher operations cost more when efficiency is low
- Recovery restores energy and partially restores efficiency
- Catabolism: convert cognitive complexity into energy (useful during restructuring)
- Anabolism: convert energy into structural value (useful when building new patterns)
- Metabolic cycles: group sequences of operations with timing and cost metrics

## Usage

```ruby
# Create a reserve
runner.create_reserve(initial_energy: 500.0)

# Spend energy on operations
runner.spend_energy(operation_type: :reasoning)
# => { success: true, spent: 15.0, remaining: 485.0, efficiency: 0.49, state: :active }

runner.spend_energy(operation_type: :creativity)
# => { success: true, spent: 20.0 / efficiency, ... }

# Recover
runner.recover(amount: 10.0)
# => { success: true, restored: 20.0, efficiency_restored: 10.0, state: :active }

# Catabolize to gain energy from complexity
runner.catabolize(complexity: 5.0)
# => { success: true, energy_gained: 50.0 }

# Current status
runner.metabolic_status
# => { success: true, energy: 485.0, energy_ratio: 0.485, state: :active, efficiency: 0.49, ... }
```

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

## License

MIT
