# Room

---

## room_goto_string -- [source](../LiftKit/LKRoom/LKRoom.gml#L3)

```gml
room_goto_string(_room)
```

Navigates to a room by its asset name as a string. Does nothing if the string is not a valid room asset name. Equivalent to `room_goto` but accepts a string instead of a direct asset reference.

| Parameter | Type | Description |
|-----------|------|-------------|
| `_room` | `String` | The name of the room to go to. |

```gml
// Navigate to a room specified in a config file
room_goto_string(json_load("config.json").start_room);
```
