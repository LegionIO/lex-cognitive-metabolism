# lex-cognitive-metabolism

**Level 3 Leaf Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-agentic/CLAUDE.md`

## Purpose

Energy reserve model for cognitive processing. Inspired by biological metabolism: spending energy on operations depletes reserves and degrades efficiency; recovery restores both. Catabolism converts complex structures into energy (breakdown for fuel); anabolism converts energy into structural value (building). Metabolic cycles track sequences of operations with timing and energy-per-operation metrics. Six operation types with defined costs: `perception` (5), `reasoning` (15), `creativity` (20), and others.

## Gem Info

- **Gem name**: `lex-cognitive-metabolism`
- **Module**: `Legion::Extensions::CognitiveMetabolism`
- **Version**: `0.1.0`
- **Ruby**: `>= 3.4`
- **License**: MIT

## File Structure

```
lib/legion/extensions/cognitive_metabolism/
  version.rb
  client.rb
  helpers/
    constants.rb
    energy_reserve.rb
    metabolic_cycle.rb
  runners/
    cognitive_metabolism.rb
```

## Key Constants

| Constant | Value | Purpose |
|---|---|---|
| `MAX_ENERGY` | `1000.0` | Maximum energy reserve |
| `RESTING_METABOLIC_RATE` | `0.5` | Baseline energy consumed per idle cycle |
| `RECOVERY_RATE` | `2.0` | Energy restored per recovery unit |
| `EFFICIENCY_DECAY` | `0.01` | Efficiency reduction per energy-spending operation |
| `OPERATION_COSTS` | hash | Per-type energy costs (perception=5, reasoning=15, creativity=20, etc.) |
| `METABOLIC_STATES` | symbol array | `%i[hyperactive active resting recovering depleted]` |
| `STATE_THRESHOLDS` | hash | Energy ratio thresholds for each metabolic state |

## Helpers

### `Helpers::EnergyReserve`
Core energy tracker with efficiency modulator.

- `energy_ratio` — `energy / MAX_ENERGY`
- `state` — current metabolic state based on `energy_ratio` vs `STATE_THRESHOLDS`
- `depleted?` — energy at or below zero
- `spend!(operation_type)` — deducts operation cost divided by current efficiency; degrades efficiency by `EFFICIENCY_DECAY`
- `recover!(amount)` — restores energy by `amount * RECOVERY_RATE`; partially restores efficiency at `0.5x` rate
- `catabolize!(complexity)` — converts complexity * 10 into energy (breakdown)
- `anabolize!(energy_amount)` — converts energy_amount to `structure_value` via efficiency ratio

### `Helpers::MetabolicCycle`
Records an operational cycle.

- `record_operation(type:, cost:)` — appends operation record
- `complete!` — marks cycle done, sets `completed_at`
- `duration_seconds` — wall-clock duration
- `average_energy_per_operation` — total cost / operation count

## Runners

Module: `Runners::CognitiveMetabolism`

| Runner Method | Description |
|---|---|
| `create_reserve(initial_energy:)` | Initialize an energy reserve |
| `spend_energy(operation_type:)` | Spend energy on an operation |
| `recover(amount:)` | Restore energy and partial efficiency |
| `catabolize(complexity:)` | Convert complexity to energy |
| `anabolize(energy_amount:)` | Convert energy to structural value |
| `metabolic_status` | Current reserve state |
| `run_cycle(operations:)` | Execute a sequence of operations as a cycle |

All runners return `{success: true/false, ...}` hashes.

## Integration Points

- `lex-tick` integration: `metabolic_status` can gate whether full-active mode is available (depleted reserve → fallback to sentinel)
- `lex-cognitive-load`: extraneous load maps to energy overhead; reducing extraneous load = recovering energy
- `lex-emotion` arousal correlates with energy level: depleted → low arousal
- `lex-dream` dormant_active cycle can trigger `recover` operations during idle consolidation
- Catabolism (breaking down old structures) parallels `lex-memory` decay: pruned traces release conceptual energy

## Development Notes

- `Client` instantiates a single `EnergyReserve`; runners operate on it
- `spend!` cost is divided by efficiency: at `efficiency = 0.5`, operations cost double
- `recover!` restores efficiency at `0.5x` rate to prevent instant full reset after recovery
- `OPERATION_COSTS` keys must match the `operation_type:` argument to `spend_energy`; unknown types raise or return error
- `MetabolicCycle` is a lightweight record object; it does not hold a reference to the reserve
