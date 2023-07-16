# D Google Translate Library

[![license](https://img.shields.io/github/license/AlexanderZhirov/dgtl.svg?sort=semver&style=for-the-badge&color=green)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
[![main](https://img.shields.io/badge/dynamic/json.svg?label=git.zhirov.kz&style=for-the-badge&url=https://git.zhirov.kz/api/v1/repos/dlang/dgtl/tags&query=$[0].name&color=violet&logo=D)](https://git.zhirov.kz/dlang/dgtl)
[![githab](https://img.shields.io/github/v/tag/AlexanderZhirov/dgtl.svg?sort=semver&style=for-the-badge&color=blue&label=github&logo=D)](https://github.com/AlexanderZhirov/dgtl)
[![dub](https://img.shields.io/dub/v/dgtl.svg?sort=semver&style=for-the-badge&color=orange&logo=D)](https://code.dlang.org/packages/dgtl)
[![linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)](https://www.linux.org/)

The library is a simple translator based on using an HTTP GET method request in Google Translate.

## Quick start

```d
import dgtl;
import std.stdio;

void main()
{
    auto dgtl = new DGTL;

    dgtl.lang.source.en;
    dgtl.lang.target.de;

    string text = "Text intended for translation into German";

    dgtl.translate(text).writeln;
}
```

## DUB

Add a dependency on `"dgtl": "~>0.0.1"`
