# Terraform Built-in Function

## `lookup(map, key)`
Retrieves a value from a map by key.
```hcl
lookup(var.ami_type, var.region)  # → "ami-0abcd1234" (based on region key)
```

---

## `length(list)`
Returns the number of elements in a list, map, or string.
```hcl
length(["web", "app", "db"])  # → 3
```

---

## `element(list, index)`
Returns the element at a given index in a list (wraps around if index exceeds length).
```hcl
element(["web", "app", "db"], 1)  # → "app"
```

---

## `formatdate(format, timestamp)`
Formats a UTC timestamp string into a specified date format.
```hcl
formatdate("YYYY-MM-DD", "2024-03-10T00:00:00Z")  # → "2024-03-10"
```

---

## `timestamp()`
Returns the current UTC date and time as an RFC 3339 formatted string.
```hcl
timestamp()  # → "2024-03-10T12:34:56Z"
```