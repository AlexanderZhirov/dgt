import std.net.curl;
import std.json;
import std.uri;
import std.format;
import std.algorithm;
import std.array;
import std.conv;
import std.uni;

class DGTL {
private:
    struct Settings {
        DGTL _dgtl;
        static string[][] langlist = [
            ["am", "am", "Amharic"],
            ["ar", "ar", "Arabic"],
            ["eu", "eu", "Basque"],
            ["bn", "bn", "Bengali"],
            ["engb", "en-GB", "English (UK)"],
            ["ptbr", "pt-BR", "Portuguese (Brazil)"],
            ["bg", "bg", "Bulgarian"],
            ["ca", "ca", "Catalan"],
            ["chr", "chr", "Cherokee"],
            ["hr", "hr", "Croatian"],
            ["cs", "cs", "Czech"],
            ["da", "da", "Danish"],
            ["nl", "nl", "Dutch"],
            ["en", "en", "English (US)"],
            ["et", "et", "Estonian"],
            ["fil", "fil", "Filipino"],
            ["fi", "fi", "Finnish"],
            ["fr", "fr", "French"],
            ["de", "de", "German"],
            ["el", "el", "Greek"],
            ["gu", "gu", "Gujarati"],
            ["iw", "iw", "Hebrew"],
            ["hi", "hi", "Hindi"],
            ["hu", "hu", "Hungarian"],
            ["isl", "is", "Icelandic"],
            ["id", "id", "Indonesian"],
            ["it", "it", "Italian"],
            ["ja", "ja", "Japanese"],
            ["kn", "kn", "Kannada"],
            ["ko", "ko", "Korean"],
            ["lv", "lv", "Latvian"],
            ["lt", "lt", "Lithuanian"],
            ["ms", "ms", "Malay"],
            ["ml", "ml", "Malayalam"],
            ["mr", "mr", "Marathi"],
            ["no", "no", "Norwegian"],
            ["pl", "pl", "Polish"],
            ["ptpt", "pt-PT", "Portuguese (Portugal)"],
            ["ro", "ro", "Romanian"],
            ["ru", "ru", "Russian"],
            ["sr", "sr", "Serbian"],
            ["zhcn", "zh-CN", "Chinese (PRC)"],
            ["sk", "sk", "Slovak"],
            ["sl", "sl", "Slovenian"],
            ["es", "es", "Spanish"],
            ["sw", "sw", "Swahili"],
            ["sv", "sv", "Swedish"],
            ["ta", "ta", "Tamil"],
            ["te", "te", "Telugu"],
            ["th", "th", "Thai"],
            ["zhtw", "zh-TW", "Chinese (Taiwan)"],
            ["tr", "tr", "Turkish"],
            ["ur", "ur", "Urdu"],
            ["uk", "uk", "Ukrainian"],
            ["vi", "vi", "Vietnamese"],
            ["cy", "cy", "Welsh"]
        ];

        enum LK {
            AM, AR, EU, BN, ENGB, PTBR, BG, CA,
            CHR, HR, CS, DA, NL, EN, ET, FIL,
            FI, FR, DE, EL, GU, IW, HI, HU,
            ISL, ID, IT, JA, KN, KO, LV, LT,
            MS, ML, MR, NO, PL, PTPT, RO, RU,
            SR, ZHCN, SK, SL, ES, SW, SV, TA,
            TE, TH, ZHTW, TR, UR, UK, VI, CY
        }

        this(DGTL dgtl) {
            _dgtl = dgtl;
        }

        string getLang(string lang) {
            LK key;
            try {
                key = to!LK(lang.toUpper);
            } catch (Exception e) {
                throw new Exception("The language is not supported: " ~ lang);
            }

            return langlist[key][1];
        }

        @property public void source(string lang) {
            this._dgtl._sl = getLang(lang);
        }

        @property public void target(string lang) {
            this._dgtl._tl = getLang(lang);
        }

        @property public Language source() {
            return Language(this._dgtl._sl);
        }

        @property public Language target() {
            return Language(this._dgtl._tl);
        }

        @property public string[] list() {
            return langlist.array.map!(l => l[0]).array;
        }

        @property public string[][] longlist() {
            return langlist.array.map!(l => [l[0], "%s (%s)".format(l[2], l[1])]).array;
        }

        struct Language {
            string* _current;

            this(ref string current) {
                _current = &current;
            }

            @property public void am() { *_current = Settings.langlist[LK.AM][1]; }
            @property public void ar() { *_current = Settings.langlist[LK.AR][1]; }
            @property public void eu() { *_current = Settings.langlist[LK.EU][1]; }
            @property public void bn() { *_current = Settings.langlist[LK.BN][1]; }
            @property public void engb() { *_current = Settings.langlist[LK.ENGB][1]; }
            @property public void ptbr() { *_current = Settings.langlist[LK.PTBR][1]; }
            @property public void bg() { *_current = Settings.langlist[LK.BG][1]; }
            @property public void ca() { *_current = Settings.langlist[LK.CA][1]; }
            @property public void chr() { *_current = Settings.langlist[LK.CHR][1]; }
            @property public void hr() { *_current = Settings.langlist[LK.HR][1]; }
            @property public void cs() { *_current = Settings.langlist[LK.CS][1]; }
            @property public void da() { *_current = Settings.langlist[LK.DA][1]; }
            @property public void nl() { *_current = Settings.langlist[LK.NL][1]; }
            @property public void en() { *_current = Settings.langlist[LK.EN][1]; }
            @property public void et() { *_current = Settings.langlist[LK.ET][1]; }
            @property public void fil() { *_current = Settings.langlist[LK.FIL][1]; }
            @property public void fi() { *_current = Settings.langlist[LK.FI][1]; }
            @property public void fr() { *_current = Settings.langlist[LK.FR][1]; }
            @property public void de() { *_current = Settings.langlist[LK.DE][1]; }
            @property public void el() { *_current = Settings.langlist[LK.EL][1]; }
            @property public void gu() { *_current = Settings.langlist[LK.GU][1]; }
            @property public void iw() { *_current = Settings.langlist[LK.IW][1]; }
            @property public void hi() { *_current = Settings.langlist[LK.HI][1]; }
            @property public void hu() { *_current = Settings.langlist[LK.HU][1]; }
            @property public void isl() { *_current = Settings.langlist[LK.ISL][1]; }
            @property public void id() { *_current = Settings.langlist[LK.ID][1]; }
            @property public void it() { *_current = Settings.langlist[LK.IT][1]; }
            @property public void ja() { *_current = Settings.langlist[LK.JA][1]; }
            @property public void kn() { *_current = Settings.langlist[LK.KN][1]; }
            @property public void ko() { *_current = Settings.langlist[LK.KO][1]; }
            @property public void lv() { *_current = Settings.langlist[LK.LV][1]; }
            @property public void lt() { *_current = Settings.langlist[LK.LT][1]; }
            @property public void ms() { *_current = Settings.langlist[LK.MS][1]; }
            @property public void ml() { *_current = Settings.langlist[LK.ML][1]; }
            @property public void mr() { *_current = Settings.langlist[LK.MR][1]; }
            @property public void no() { *_current = Settings.langlist[LK.NO][1]; }
            @property public void pl() { *_current = Settings.langlist[LK.PL][1]; }
            @property public void ptpt() { *_current = Settings.langlist[LK.PTPT][1]; }
            @property public void ro() { *_current = Settings.langlist[LK.RO][1]; }
            @property public void ru() { *_current = Settings.langlist[LK.RU][1]; }
            @property public void sr() { *_current = Settings.langlist[LK.SR][1]; }
            @property public void zhcn() { *_current = Settings.langlist[LK.ZHCN][1]; }
            @property public void sk() { *_current = Settings.langlist[LK.SK][1]; }
            @property public void sl() { *_current = Settings.langlist[LK.SL][1]; }
            @property public void es() { *_current = Settings.langlist[LK.ES][1]; }
            @property public void sw() { *_current = Settings.langlist[LK.SW][1]; }
            @property public void sv() { *_current = Settings.langlist[LK.SV][1]; }
            @property public void ta() { *_current = Settings.langlist[LK.TA][1]; }
            @property public void te() { *_current = Settings.langlist[LK.TE][1]; }
            @property public void th() { *_current = Settings.langlist[LK.TH][1]; }
            @property public void zhtw() { *_current = Settings.langlist[LK.ZHTW][1]; }
            @property public void tr() { *_current = Settings.langlist[LK.TR][1]; }
            @property public void ur() { *_current = Settings.langlist[LK.UR][1]; }
            @property public void uk() { *_current = Settings.langlist[LK.UK][1]; }
            @property public void vi() { *_current = Settings.langlist[LK.VI][1]; }
            @property public void cy() { *_current = Settings.langlist[LK.CY][1]; }
        }
    }

    string _url = "http://translate.googleapis.com/translate_a/single?client=gtx&sl=%s&tl=%s&dt=t&q=%s";
    string _sl; // source language
    string _tl; // target language
    string _st; // source text
    string _tt; // target text

    void check(string text) {
        if (!_sl.length)
            throw new Exception("The source language was not set");
        if (!_tl.length)
            throw new Exception("The target language was not set");
        if (!text.length)
            throw new Exception("The text was not set");
    }
public:
    string translate(string text) {
        check(text);

        _tt = string.init;
        _st = encode(text);
        string _request;

        auto http = HTTP(_url.format(_sl, _tl, _st));

        http.onReceiveStatusLine = (HTTP.StatusLine status) {
            if (status.code != 200) {
                throw new Exception("Error %s (%s)".format(status.code, status.reason));
            }
        };

        http.onReceive = (ubyte[] data) {
            _request = cast(string)data;
            return data.length;
        };

        http.perform();

        parseJSON(_request).array.each!(
            first => first.type is JSONType.array && first.array.each!(
                second => second.type is JSONType.array &&
                    second[0].type is JSONType.string &&
                        (_tt ~= second[0].str)
            )
        );

        return _tt;
    }

    @property Settings lang() {
        return Settings(this);
    }
}
