# InteractableNode API Reference
Generated: 2026-08-01

A node that can be interacted with by pressing a certain button if another node is within its reach

## Class: InteractableNode
**Inherits:** [Area2D](https://docs.godotengine.org/en/stable/classes/class_area2d.html)


### ⚙️ Inspector Variables (Exported)
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| **target_body** | `Array[Node2D]` | `-` | The body or bodies that can interact with this object (should be the player usually) |
| **interaction_hint** | `Node2D` | `-` | An optional node that is shown when the body is in range, to show that you can interact with them |
| **trigger** | `String` | `"ui_accept"` | The input that will trigger the interaction |
| **auto_interact** | `bool` | `false` | If enabled, the interaction triggers automatically when the target enters the area, instead of waiting for the trigger input |
| **disappear_on_interact** | `bool` | `false` | If enabled, this object is removed from the scene after it has been interacted with |

---

