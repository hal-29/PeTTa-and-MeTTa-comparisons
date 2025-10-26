## MeTTa vs PeTTa interpreter comparison and observations (Last Updated Oct 27, 2025)

### PeTTa keywords  ✨


| Keyword | Category | Brief description |
|---|---|---|
| `let` | Control | Single binding; sugar over `let*` |
| `let*` | Control | Sequential bindings list |
| `import!` | Space/IO | Import a `.metta` file into `&self` (relative path; `.metta` auto-appended) |
| `add-atom` | Space | Add atom/function to space (registers functions) |
| `remove-atom` | Space | Remove atom or function clause from `&self` |
| `get-atoms` | Space | List atoms stored in the space |
| `match` | Space | Pattern query over a space (supports conjunction lists) |
| `eval` | Eval | Evaluate an expression via translator |
| `reduce` | Eval | Reduce an expression (when available) |
| `superpose` | Nondet | Enumerate elements of a list |
| `empty` | Nondet | Always fail (search control) |
| `and` | Bool | Boolean and |
| `or` | Bool | Boolean or |
| `not` | Bool | Boolean not |
| `+` | Arithmetic | Integer/float arithmetic |
| `-` | Arithmetic | Integer/float arithmetic |
| `*` | Arithmetic | Integer/float arithmetic |
| `/` | Arithmetic | Integer/float arithmetic |
| `%` | Arithmetic | Integer/float arithmetic |
| `<` | Comparison | Relational test returning `true`/`false` |
| `>` | Comparison | Relational test returning `true`/`false` |
| `==` | Comparison | Relational/equality test returning `true`/`false` |
| `=` | Comparison | Unification test returning `true`/`false` |
| `=?` | Comparison | Weak/attempted unification returning `true`/`false` |
| `<=` | Comparison | Relational test returning `true`/`false` |
| `>=` | Comparison | Relational test returning `true`/`false` |
| `min` | Arithmetic | Numeric minimum |
| `max` | Arithmetic | Numeric maximum |
| `id` | Utility | Identity |
| `first-from-pair` | Pairs | First element of a pair |
| `second-from-pair` | Pairs | Second element of a pair |
| `car-atom` | Lists | Head of list |
| `cdr-atom` | Lists | Tail of list |
| `cons-atom` | Lists | Construct list from head and tail |
| `decons-atom` | Lists | Deconstruct list into head and tail |
| `cons` | Lists | Alias of `cons-atom` |
| `decons` | Lists | Alias of `decons-atom` |
| `index-atom` | Lists | 0-based index into list |
| `append` | Lists | Append two lists |
| `length` | Lists | Length of a list |
| `reverse` | Lists | Reverse a list |
| `sort` | Lists | Sort without duplicates removed |
| `msort` | Lists | Stable sort (keeps duplicates) |
| `maplist` | Lists/HOF | Apply predicate over list(s) |
| `foldl` | Lists/HOF | Left fold over a list |
| `fold-flat` | HOF | Fold over flat structure with combiner |
| `fold-nested` | HOF | Fold over nested structure with combiner |
| `map-flat` | HOF | Map over flat structure with mapper |
| `map-nested` | HOF | Map over nested structure with mapper |
| `memberfast` | Lists | Membership test helper |
| `excludefast` | Lists | Exclude elements equal to given value |
| `concat` | Lists | Concatenate two lists |
| `unique-atom` | Sets | Deduplicate a list (set semantics) |
| `union-atom` | Multiset | Union of two lists (multiset semantics) |
| `intersection-atom` | Multiset | Intersection of two lists |
| `subtraction-atom` | Multiset | Difference of two lists |
| `union` | Sets (generic) | Set union with equality predicate first arg (e.g., `=alpha`) |
| `intersection` | Sets (generic) | Set intersection with equality predicate first arg |
| `subtract` | Sets (generic) | Set subtraction with equality predicate first arg |
| `sqrt` | Math | Square root |
| `exp` | Math | Exponential function |
| `log` | Math | Natural logarithm |
| `sin` | Math/Trig | Sine |
| `cos` | Math/Trig | Cosine |
| `pow-math` | Math | Power `A ** B` |
| `sqrt-math` | Math | Square root |
| `abs-math` | Math | Absolute value |
| `log-math` | Math | Logarithm with explicit base |
| `trunc-math` | Math | Truncate toward zero |
| `ceil-math` | Math | Ceiling |
| `floor-math` | Math | Floor |
| `round-math` | Math | Round to nearest |
| `sin-math` | Math/Trig | Sine |
| `cos-math` | Math/Trig | Cosine |
| `tan-math` | Math/Trig | Tangent |
| `asin-math` | Math/Trig | Arcsine |
| `acos-math` | Math/Trig | Arccosine |
| `atan-math` | Math/Trig | Arctangent |
| `isnan-math` | Math | Test for NaN |
| `isinf-math` | Math | Test for ±Inf |
| `min-atom` | Lists/Math | Minimum of numeric list |
| `max-atom` | Lists/Math | Maximum of numeric list |
| `=alpha` | Equality | Alpha-equivalence test |
| `get-type` | Types | Inspect value type |
| `get-metatype` | Types | Inspect metatype (Grounded/Expression/Symbol/Variable) |
| `is-function` | Types | Check `(-> A B)` function shape |
| `is-var` | Types | Variable check |
| `is-expr` | Types | Expression (list) check |
| `repr` | Conversion | Convert term to string |
| `repra` | Conversion | Convert term to atom |
| `sread` | Conversion | Parse string into term |
| `println!` | Diagnostics | Print a value |
| `trace!` | Diagnostics | Trace value and pass content |
| `readln!` | Diagnostics | Read one line from stdin and parse |
| `test` | Diagnostics | Print check line with ✅/❌; returns `true` |
| `assert` | Diagnostics | Assert a goal; halts with message if it fails |
| `py-call` | Interop | Call Python functions/methods |


## MeTTa - PeTTa test cases

No |              Test Case               |  MeTTa  | PeTTa |  Observations   
---|--------------------------------------|---------|-------|----
1  | `!(bind! A B)`                       | ✅      | ❌    | Doesn't work on PeTTa
2  | `!(import! &tmp file)`               | ✅      | ⚠️    | PeTTa supports `import!` for `&self` only (see note below)
3  | `!(union-atom (1 2) (3 4))`          | ✅      | ✅    | Now supported in PeTTa
4  | `!(cons-atom 0 (1 2 3))`             | ✅      | ✅    | Now supported in PeTTa
5  | `!(decons-atom (1 2 3))`             | ✅      | ✅    | Now supported in PeTTa
6  | `!(intersection-atom (1 2) (3 4))`   | ✅      | ✅    | Now supported in PeTTa
7  | `!(car-atom (1 2 3))`                | ✅      | ✅    | Works on both
8  | `!(cdr-atom (1 2 3))`                | ✅      | ✅    | Works on both
9  | `!(superpose (1 2 3))`               | ✅      | ✅    | Works on both
10 | `!(collapse (superpose(1 2 3)))`     | ✅      | ✅    | Works on both
11 | `!(size-atom (1 2 3))`               | ✅      | ❌    | Doesn't work on PeTTa
12 | `!(index-atom (1 2 3) 1)`            | ✅      | ✅    | Now supported in PeTTa


### Equality and Reduction

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
13 | `(= (add 1 2) 3)` | ✅ | ✅ | Rule definition accepted; PeTTa shows Prolog clause translation
14 | `!(id 5)` | ✅ | ✅ | Identity now supported in PeTTa
15 | `!(=alpha (Father $X) (Father $Y))` | ✅ | ✅ | Both return True; different variable names considered alpha-equal
16 | `!(=alpha (Father $X) (Son $X))` | ✅ | ✅ | Both return False
17 | `!(assertEqual (+ 1 2) (- 6 3))` | ✅ | ❌ | PeTTa aborts; in MeTTa returns ()
18 | `!(assertAlphaEqual (+ $x $y) (+ $a $b))` | ✅ | ❌ | PeTTa aborts before running
19 | `!(assertEqualToResult (+ 1 2) 3)` | ✅ | ❌ | PeTTa aborts before running
20 | `!(assertAlphaEqualToResult (adder) ($y))` with `(= (adder) $x)` | ✅ | ❌ | PeTTa aborts before running

Notes: Intentionally failing variants of the assertions terminate both interpreters early, so they’re placed at the end of the test file.

### Error Handling

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
21 | `!(Error (add "a" 2) BadType)` | ✅ | ❌ | MeTTa constructs an Error atom but halts subsequent evaluation; PeTTa unsupported
22 | `!(if-error (Error 5 BadType) "Error!" "No error")` | ⚠️ | ❌ | Blocked by prior Error halting MeTTa run; PeTTa unsupported
23 | `!(return-on-error (Error 5 BadType) 6)` | ⚠️ | ❌ | Same as above

### Evaluation Control

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
24 | `!(function (return 5))` | ✅ | ❌ | PeTTa prints unevaluated form
25 | `!(eval (double 5))` with `(= (double $x) (+ $x $x))` | ✅ | ✅ | MeTTa returns `(+ 5 5)` then 10; PeTTa shows 10 for simple arithmetic
26 | `!(evalc (+ 5 5) &self)` | ✅ | ❌ | Unevaluated in PeTTa
27 | `!(chain (+ 2 3) $x (* $x 2))` | ✅ | ✅ | Returns 10 in both; PeTTa prints `(10)`
28 | `!(for-each-in-atom (1 3 5 62 2 5) print-each)` | ✅ | ❌ | MeTTa prints numbers and returns (); PeTTa unevaluated

### Mathematical Operations

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
29 | `!(pow-math 2 3)` | ✅ | ✅ | Supported in PeTTa
30 | `!(sqrt-math 9)` | ✅ | ✅ | Supported in PeTTa
31 | `!(abs-math -5)` | ✅ | ✅ | Supported in PeTTa
32 | `!(log-math 10 100)` | ✅ | ✅ | Supported in PeTTa
33 | `!(trunc-math 5.6)` | ✅ | ✅ | Supported in PeTTa
34 | `!(ceil-math 5.2)` | ✅ | ✅ | Supported in PeTTa
35 | `!(floor-math 5.8)` | ✅ | ✅ | Supported in PeTTa
36 | `!(round-math 5.4)` | ✅ | ✅ | Supported in PeTTa
37 | `!(round-math 5.6)` | ✅ | ✅ | Supported in PeTTa
38 | `!(sin-math 0)` | ✅ | ✅ | Supported in PeTTa
39 | `!(asin-math 0)` | ✅ | ✅ | Supported in PeTTa
40 | `!(cos-math 0)` | ✅ | ✅ | Supported in PeTTa
41 | `!(acos-math 1)` | ✅ | ✅ | Supported in PeTTa
42 | `!(tan-math 0)` | ✅ | ✅ | Supported in PeTTa
43 | `!(atan-math 0)` | ✅ | ✅ | Supported in PeTTa
44 | `!(isnan-math 0.0)` | ✅ | ✅ | Supported in PeTTa
45 | `!(isinf-math 0.0)` | ✅ | ✅ | Supported in PeTTa
46 | `!(min-atom (2 6 7 4 9 3))` | ✅ | ✅ | Supported in PeTTa
47 | `!(max-atom (2 6 7 4 9 3))` | ✅ | ✅ | Supported in PeTTa
48 | `!(random-int &rng 2 9)` | ❌ | ❌ | Unevaluated in both (rng resource not available)
49 | `!(random-float &rng 2 9)` | ❌ | ❌ | Unevaluated in both (rng resource not available)

### Non-deterministic Computation

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
50 | `!(superpose (A B C))` | ✅ | ✅ | MeTTa returns nondet A,B,C; PeTTa prints `A B C`
51 | `!(collapse (superpose (A B C)))` | ✅ | ✅ | MeTTa `(A B C)`; PeTTa `((A B C))`

### Type System

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
52 | `!(is-function (-> Atom Atom))` | ✅ | ✅ | Supported in PeTTa
53 | `!(is-function Atom)` | ✅ | ✅ | MeTTa False; PeTTa False
54 | `!(type-cast A type1 &self)` with `(: type1 Type)` | ✅ | ❌ | PeTTa unevaluated
55 | `!(type-cast 1 type1 &self)` | ✅ | ❌ | MeTTa returns Error (BadType); PeTTa unevaluated
56 | `!(match-types Atom Atom "Matched!" "Didn't match")` | ✅ | ❌ | MeTTa "Matched!"
57 | `!(match-types Atom Number "Matched!" "Didn't match")` | ✅ | ❌ | MeTTa "Didn't match"
58 | `!(first-from-pair (A B))` | ✅ | ❌ | MeTTa A
59 | `!(match-type-or True Number Bool)` | ✅ | ❌ | MeTTa True/False as per docs

### List Manipulation

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
60 | `!(format-args (Probability of {} is {}%) (head 50))` | ❌ | ❌ | Requires proper formatting context and quoted string
61 | `!(foldl-atom (1 2 3 4) 0 $acc $x (+ $acc $x))` | ✅ | ❌ | Works in this MeTTa env; unsupported in PeTTa
62 | `!(map-atom (1 2 3) $x (+ $x 1))` | ✅ | ❌ | Works in this MeTTa env; unsupported in PeTTa
63 | `!(filter-atom (1 2 3 4 5) $x (> $x 3))` | ❌ | ❌ | NoReturn in this MeTTa env; unsupported in PeTTa

### Atomspace Interaction

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
64 | `!(add-reduct &self (= (add) (+ 1 3)))` | ✅ | ❌ | MeTTa adds reduced rule; PeTTa unevaluated
65 | `!(add-atom &self (= (add) (+ 1 3)))` | ✅ | ✅ | Supported in PeTTa (registers functions and atoms)
66 | `!(get-type 1)` | ✅ | ✅ | Number in MeTTa; `(Number)` in PeTTa
67 | `(: a A)` then `!(get-type-space &self a)` | ✅ | ❌ | MeTTa A; PeTTa unevaluated
68 | `!(get-metatype True)` | ✅ | ✅ | Grounded in MeTTa; `(Grounded)` in PeTTa
69 | `!(get-metatype (a b))` | ✅ | ✅ | Expression
70 | `!(if-equal 1 1 "Equal" "Not Equal")` | ✅ | ❌ | MeTTa "Equal"; PeTTa unevaluated
71 | `!(new-space)` | ✅ | ❌ | Returns new space ref in MeTTa; PeTTa unevaluated
72 | `!(bind! state (new-state rest))` | ✅ | ❌ | MeTTa state works; PeTTa unevaluated
73 | `!(change-state! state active)` then `!(get-state state)` | ✅ | ❌ | MeTTa returns (State active) and active; PeTTa unevaluated
74 | `!(get-atoms &self)` | ✅ | ✅ | Supported in PeTTa (lists stored atoms)
75 | `!(match &self (= (add) (+ $x $y)) $x)` | ✅ | ✅ | MeTTa returns `1, 4`; PeTTa prints `1 1 4`

### Quoting

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
76 | `!(quote (+ 1 2))` | ✅ | ❌ | MeTTa returns quoted form; PeTTa unevaluated/incorrect
77 | `!(unquote (quote (+ 1 2)))` | ✅ | ❌ | MeTTa 3; PeTTa unevaluated
78 | `!(noreduce-eq (+ 1 2) (+ 1 2))` | ✅ | ❌ | MeTTa True; PeTTa unevaluated
79 | `!(noreduce-eq (+ 1 2) 3)` | ✅ | ❌ | MeTTa False; PeTTa duplicates True

### Set Operations

No | Test Case | MeTTa | PeTTa | Observations
---|-----------|-------|-------|-------------
80 | `!(unique (superpose (a b c d d)))` | ✅ | ❌ | `unique` (without -atom) still unsupported in PeTTa
81 | `!(union (superpose (a b b c)) (superpose (b c c d)))` | ✅ | ⚠️ | Use PeTTa's `union` with an equality predicate: e.g., `(union =alpha (a b b c) (b c c d) $out)`
82 | `!(intersection (superpose (a b c c)) (superpose (b c c c d)))` | ✅ | ⚠️ | Use `(intersection =alpha ...)` form in PeTTa
83 | `!(subtraction (superpose (a b b c)) (superpose (b c c d)))` | ✅ | ⚠️ | Use `(subtract =alpha ...)` form in PeTTa
84 | `!(unique-atom (a b c d d))` | ✅ | ✅ | Supported in PeTTa
85 | `!(union-atom (a b b c) (b c c d))` | ✅ | ✅ | Supported in PeTTa
86 | `!(intersection-atom (a b c c) (b c c c d))` | ✅ | ✅ | Supported in PeTTa
87 | `!(subtraction-atom (a b b c) (b c c d))` | ✅ | ✅ | Supported in PeTTa
