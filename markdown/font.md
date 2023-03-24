# LuaLaTeX のフォントについて

## 基本的な方法

### fontspec

fontspecでは、\rmfamily, \sffamily, \ttfamilyに対応するフォントを変更できます。  
要するに、これで本文全体のフォント設定を変更できるんです。

- 欧文フォント
  - `\setmainfont{...}` : `\rmfamily` セリフ
  - `\setsansfont{...}` : `\sffamily` サンセリフ
  - `\setmonofont{...}` : `\ttfamily` タイプライタ
- 日本語フォント
  - `\setmainjfont{...}` : `\mcfamily` 明朝体
  - `\setsansjfont{...}` : `\gtfamily` ゴシック体
  - `\setmonojfont{...}` : `\ttfamily` 日本語タイプライタ

```latex
\documentclass[a4paper,11pt]{ltjsarticle}
\usepackage[no-math,deluxe,expert,haranoaji]{luatexja-preset}
\setmainfont{TeX Gyre Pagella}
\setsansfont{Iwona}
\begin{document}
とりあえず設定してみた。ABC. \textsf{ABC.}
\end{document}
```

フォントを探すには[LaTeX Font Calogue](https://tug.org/FontCatalogue/)を当たるとよいでしょう。

### 文字フォントの変更

Times New Roman や MS Mincho などを指定されたことを想定して説明します。  
`luatexja-fontspec` を使えば簡単に設定できます。

問題は太字や斜体の設定です。Times New Roman のようにはじめから太字や斜体が用意されているフォントがほとんどですが，MS Mincho などは用意されていません。  

MS Word などでは MS Mincho を太字にするとき疑似的に太字にしています。  
LuaLaTeX でもオプションにより疑似太字，疑似斜体を実現することができます。
`FakeBold=2`，`FakeSlant=0.33` に設定したとき MS Word と同様の結果になりました。

<img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/699841/26c7004d-beee-6a24-2f97-855357e7c6a1.png" width="320">

```TeX
\usepackage{luatexja-fontspec}
\setmainfont[Ligatures={Rare,TeX}]{Times-New-Roman}
\setsansfont{Arial}
\setmainjfont[
	YokoFeatures       = {JFM=jlreq},
	TateFeatures       = {JFM=jlreqv},
	BoldFont           = MS-Gothic,
	BoldFeatures       = {FakeBold=2},
	ItalicFont         = MS-Mincho,
	ItalicFeatures     = {FakeSlant=0.33},
	BoldItalicFont     = MS-Gothic,
	BoldItalicFeatures = {FakeBold=2, FakeSlant=0.33}
]{MS-Mincho}
\setsansjfont[
	YokoFeatures       = {JFM=jlreq},
	TateFeatures       = {JFM=jlreqv},
	BoldFont           = MS-Gothic,
	BoldFeatures       = {FakeBold=2},
	ItalicFont         = MS-Gothic,
	ItalicFeatures     = {FakeSlant=0.33},
	BoldItalicFont     = MS-Gothic,
	BoldItalicFeatures = {FakeBold=2, FakeSlant=0.33}
]{MS-Gothic}
```

### 数式フォントの変更

現在 MS Word では数式フォントに Cambria を使用しています。  
`unicode-math` を使用すれば簡単に設定できます。

<img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/699841/e5e0d542-e44e-ae0e-79da-fc4234a5c6c3.png" width="320">

```TeX
\usepackage{unicode-math}
\setmathfont{Cambria-Math}
```

### luatexja-fontspec

fontspec を和文フォントに対応するように拡張した luatexja-fontspec を用いてフォントの設定を行う。  
luatexja-fontspec を使用することで下に示すコードにより，OS にインストールされているフォントを PDF に埋め込むことができる。  
また，ttf ファイルなどを直接参照することもできる。

```latex
\usepackage{luatexja-fontspec}
\setmainfont[Ligatures=TeX]{Times New Roman}
\setmainjfont[BoldFont=MS Gothic]{MS Mincho}
```


あらかじめ用意された和文フォントから選択することができる luatexja-preset というパッケージがあります。  
例えば IPA 明朝と IPA ゴシックを使う設定する場合次のように書けばよいです。他のフォントについては LaTeX-ja の使い方を参照してください。

```latex
\usepackage[ipa]{luatexja-preset}
```

## フォントサイズの変更

`\Large` 等をあらかじめ設定しておくことで，要求された体裁を容易に守ることができる。  

```TeX
\renewcommand\tiny{\@setfontsize\tiny{5bp}{6bp}}
\renewcommand\scriptsize{\@setfontsize\scriptsize{7bp}{8bp}}
\renewcommand\footnotesize{\@setfontsize\footnotesize{8bp}{10bp}}
\renewcommand\small{\@setfontsize\small{9bp}{12bp}}
\renewcommand\normalsize{\@setfontsize\normalsize{10bp}{15bp}}
\renewcommand\large{\@setfontsize\large{12bp}{15bp}}
\renewcommand\Large{\@setfontsize\Large{14.4bp}{16bp}}
\renewcommand\LARGE{\@setfontsize\LARGE{17.28bp}{18bp}}
\renewcommand\huge{\@setfontsize\huge{20.74bp}{30bp}}
\renewcommand\Huge{\@setfontsize\Huge{24.88bp}{36bp}}
```

## まとめ

~~アンチMS Wordな人のために~~ LuaLaTeX での細かいフォント設定についてまとめました。曖昧なところや間違ってるところがあると思うのでその時は指摘してください。ソースコードは下の文献から見に行けます。

## 文献

1. [ソースコード (GitHub)](https://github.com/Daiji256/TeX-TikZ-Heatran/)
1. [LuaTeX-ja パッケージ (CTAN)](http://mirrors.ibiblio.org/CTAN/macros/luatex/generic/luatexja/doc/luatexja-ja.pdf)
1. [unicode-math (CTAN)](https://ctan.org/pkg/unicode-math)
1. [Point typography (Wiki)](https://en.wikipedia.org/wiki/Point_(typography))
