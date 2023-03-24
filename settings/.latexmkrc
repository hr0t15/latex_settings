#!/usr/bin/env perl

# 変数
# %O 実行時オプション
# %S 入力ファイル名
# %D 出力ファイル名
# %B 処理するファイルのベース名

# LuaLaTeX のビルドコマンド
$lualatex                      = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
# Biber, BibTeX のビルドコマンド
$biber                         = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex                        = 'bibtex %O %B';
# makeindex のビルドコマンド
$makeindex                     = 'mendex %O -o %D %S';

# PDF の作成方法を指定するオプション
# 0 PDF を作成しません。 $latex のコマンドを使います。
# 1 pdflatex を使用します。 $pdflatex を使います。
# 2 DVI と PS を経由しての PDF です。 $latex と $dvips と $ps2pdf を使います。
# 3 DVI からの PDF です。 $latex と $dvipdf を使います。
# 4 lualatex を使用します。 $lualatex を使います。
# 5 xelatex を使用します。
$pdf_mode = 4;


$max_repeat = 5;

# PDF ビュアーの設定 for Windows
# Windows では SyncTeX が利用できる SumatraPDF が推奨されている。
#$pdf_previewer = 'C:\app\SumatraPDF\SumatraPDF-3.2-64.exe -reuse-instance %O %S'
$pdf_previewer = 'SumatraPDF.exe -reuse-instance'
