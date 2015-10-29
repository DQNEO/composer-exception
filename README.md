# a Makefile to reproduce the issue https://github.com/composer/composer/issues/4557

`make c557715`

and result is

```
./composer.c557715 -V
Composer version 1.0-dev (c557715669ba8dd2dc6c63859f919351a4aa5e2f) 2015-10-28 14:13:03
./composer.c557715 install
Loading composer repositories with package information
Installing dependencies (including require-dev)
- Installing predis/predis (v0.8.5)
Loading from cache

predis/predis suggests installing ext-phpiredis (Allows faster serialization and deserialization of the Redis protocol)
Writing lock file
Generating autoload files



[RuntimeException]
Could not scan for classes inside "vendor/predis/predis/Predis.php" which does not appear to be a file nor a folder



install [--prefer-source] [--prefer-dist] [--dry-run] [--dev] [--no-dev] [--no-plugins] [--no-custom-installers] [--no-autoloader] [--no-scripts] [--no-progress] [-v|vv|vvv|--verbose] [-o|--optimize-autoloader] [-a|--classmap-authoritative] [--ignore-platform-reqs] [--] [<packages>]...


make: *** [c557715] Error 1
```

# workaround

use `files` instead of `classmap`

```
diff --git a/composer.json b/composer.json
index 6c53c32..5b0b71b 100644
--- a/composer.json
+++ b/composer.json
@@ -3,7 +3,7 @@
     "predis/predis": "v0.8.5"
   },
   "autoload": {
-    "classmap": [
+    "files": [
       "vendor/predis/predis/Predis.php"
     ]
   },
```
