(仮)Cub3D project overview in 42 Cursus	{#mainpage}
========

## 概要

本課題は、1990年代に流行ったFPSゲーム（１人称視点ゲーム）のWolfenstein 3D迷路ゲームを実装する課題です。
３Ｄの動的な画面を作るために、レイキャスティングを使用しています。

## 仕組み
* レイキャスティングは、プレイヤー視点からの光線角度を計算してレンダリングする技術です。
* プレイヤーからマップの壁までの距離を計算して求めます。
* 画面にレンダリングするために、壁の高さや、壁の色を求めます。
* これによって、ゲーム画面に３Ｄ空間を表現します。

## 学べるトピック
* MiniLibXライブラリを活用したグラフィカルプログラミング。
* mathライブラリを活用して、浮動小数点の計算や、オーバーフロー対策。
* ゲームマップを解析するためのエラーハンドリングやアルゴリズム。

## ノート
- [README.md](@ref readme)
- [Develop with docker](@ref docker)
- [Develop Base repository](@ref dev_base)
<!--
- \ref bug_history "Bug_History"
-->

## 関連リポジトリ
* [kamitsui/Develop_Base](git@github.com:kamitsui/Develop_Base.git)
* [jothepro/doxygen-awesome-css](https://github.com/jothepro/doxygen-awesome-css.git)
