# Serializable

## Overview

Extended Codable Protocol

## Usage

First, make the structure compliant with the protocol `Serializable`.

```swift
struct Article: Serializable {
    let id: String
    let title: String
    let tag: [String]
    let content: String
}
```

Serialize (object to JSON string):

``` swift
let article = Article(id: "001", title: "Hello!", tag: ["Introduction"], content: "# Hi there! I'm Enchan.")

let serialized = article.serialize()!
print(serialized)
```

Deserialize (JSON string to object):

```swift
let deserialized = "{"id":"001","title":"Hello!","content":"# Hi there! I'm Enchan.","tag":["Introduction"]}"

let article = Article.deserialize(object: deserialized)!
print(article)
```

## License

This repository is published under MIT License.  
In details, see [LICENSE](LICENSE).
