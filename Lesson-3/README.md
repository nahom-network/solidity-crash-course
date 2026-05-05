# Lesson 3 – Arrays, Structs & Mappings

## Topics Covered

### Arrays
| File | Description |
|------|-------------|
| `Fxed_Sum.sol` | Sum elements of a fixed-size array |
| `Dynamic_Sum.sol` | Sum elements of a dynamic array passed as calldata |
| `Filter_to_Memory.sol` | Filter array into a new memory array |
| `Filter_to_Storage.sol` | Filter array and push results into a storage array |
| `Stack_Club_1.sol` | Dynamic address array with push – membership club |
| `Stack_Club_2.sol` | Membership club extended with pop to remove last member |
| `Practice_Arrays.sol` | Practice – push/pop, sum, filter above threshold, fixed array |

### Structs
| File | Description |
|------|-------------|
| `Vote_Memory.sol` | Define a struct and return it from memory |
| `Vote_Storage.sol` | Store a single struct in contract storage |
| `Vote_Array.sol` | Store multiple structs in a dynamic array |
| `Single_Vote.sol` | One vote per address with hasVoted guard |
| `Choice_Lookup.sol` | Look up a voter's choice via mapping |
| `Change_Vote.sol` | Allow a voter to update their existing vote |
| `Practice_Structs.sol` | Practice – Person struct with register, update, deactivate |

### Mappings
| File | Description |
|------|-------------|
| `Is_Member.sol` | `mapping(address => bool)` membership check |
| `Add_Member.sol` | Add addresses to a membership mapping |
| `Remove_Member.sol` | Remove addresses from a membership mapping |
| `Map_Structs.sol` | Map addresses to a custom struct |
| `Map_Structs_2.sol` | Map structs with balance transfer logic |
| `Nested_Maps.sol` | Nested mapping for social connections (enum values) |
| `Practice_Mappings.sol` | Practice – student registry with nested grade mapping |

## Key Concepts

- **Fixed arrays**: `uint[N]` – size set at compile time, stored in stack/memory/storage
- **Dynamic arrays**: `uint[]` – size grows with `push()`, shrinks with `pop()`
- **Memory arrays**: allocated with `new T[](n)`, exist only during function execution
- **Structs**: custom composite types grouping related data fields
- **Storage reference**: `MyStruct storage s = array[i]` – modifies in place without copying
- **Memory copy**: `MyStruct memory s = array[i]` – read-only snapshot
- **Mappings**: `mapping(KeyType => ValueType)` – O(1) key-value store, not iterable
- **Nested mappings**: `mapping(address => mapping(string => uint))` for multi-key lookups
- **Default values**: unset mapping values return the type's zero value (`0`, `false`, `address(0)`)
