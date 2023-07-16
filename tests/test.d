import dgtl;

unittest {
    auto dgtl = new DGTL;
    dgtl.lang.source.en;
    dgtl.lang.target.de;

    string text = "Text intended for translation into LANGUAGE";

    assert(dgtl.translate(text) == "Text, der in die SPRACHE übersetzt werden soll");

    dgtl.lang.target.tr;

    assert(dgtl.translate(text) == "LANGUAGE diline çevrilmesi amaçlanan metin");
}
