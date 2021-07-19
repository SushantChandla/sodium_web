# sodium_web

A new flutter plugin project for [libsodium](https://libsodium.gitbook.io/doc/) support on flutter web with the help of [libsodium.js](https://github.com/jedisct1/libsodium.js/).

## Installing

##### Web setup

Download the sodium.js file from [https://raw.githubusercontent.com/jedisct1/libsodium.js/master/dist/browsers-sumo/sodium.js](https://raw.githubusercontent.com/jedisct1/libsodium.js/master/dist/browsers-sumo/sodium.js)

and add it to you flutter web directory. Then in your web/index.html add  
```html
<script src="sodium.js"></script>
```

Add to your pubspec.yaml
```yaml
dependencies:
  sodium_web: ^9.0.1
```

Import the plugin
```dart
import 'package:sodium_web/sodium_web.dart';
```


And you are good to go : )

Check example directory for any issue with the setup.



