# GitHub Issue Manager

GitHub REST APIを利用して、Issue一覧の表示・作成・更新を行うFlutterアプリです。

## ✏️ 概要

本アプリはGitHub公式アプリのIssue管理機能を参考にしつつ、モバイルアプリとしての操作性と保守性を重視して実装しました。
Clean ArchitectureとMVVMパターンを採用し、実務を想定した設計・実装を行いました。

## 🎥 動作確認動画

### Issue一覧表示・詳細表示

| iOS | Android |
|--------|--------|
| <video src="https://github.com/user-attachments/assets/83ea8e77-de8c-4aa6-bbac-168323f3910a" /> | <video src="https://github.com/user-attachments/assets/b08c74ac-38ac-450a-8b1c-c302ff1340bf" />　|

### Issue更新

| iOS | Android |
|--------|--------|
| <video src="https://github.com/user-attachments/assets/096f095e-ab1b-4a5f-9a62-2ac4821fe082" /> | <video src="https://github.com/user-attachments/assets/57c9a3d7-48fb-4735-8b25-ed184539c2ae" />　|

### Issue作成

| iOS | Android |
|--------|--------|
| <video src="https://github.com/user-attachments/assets/c0db5749-2ac2-4ca9-ab8e-4543f98abb7c" /> | <video src="https://github.com/user-attachments/assets/2973ad4e-1aa7-4c10-8cc3-40f780ce1595" />　|

### Issue検索

| iOS | Android |
|--------|--------|
| <video src="https://github.com/user-attachments/assets/9ee3eed1-ca2e-49e0-844b-3e9d932fa7c1" /> | <video src="https://github.com/user-attachments/assets/cef968e4-d581-42d5-9e3c-a9d88118ea86" />　|

## 📗 要件について

### 必須要件

- [x] **Issue一覧表示**: リポジトリのIssueを一覧で表示
- [x] **Issue作成**: 新規Issueの作成（タイトル、本文、ラベル設定）
- [x] **Issue編集**: 既存Issueの編集
- [x] テストコード: テストコードの作成
- [x] GitHub PAT認証

### 追加要件

- [x] **検索**: テキストによる絞り込み

## 🏗️ アーキテクチャ・設計

<img width="121" height="221" alt="アーキテクチャ概要図" src="https://github.com/user-attachments/assets/64437e56-bea2-4c70-8303-7b2b874d4ca8" />

MVVMをベースに、ビジネスロジックをUseCase層へ分離したClean Architecture風の構成を採用しています。<br>
UIはAtomic Designで整理し、Riverpod ProviderによるDIと状態管理を行っています。<br>
View→ViewModel→UseCase→Repositoryの一方向依存とすることで、テスタビリティと保守性を高めています。<br>
<br>
その他、Riverpodを使用した状態管理、Freezedを使用したデータモデルの管理を採用しています。<br>
上記のアーキテクチャや、パッケージは主に実務で使用したことのあるものを採用しました。

## 🎨 デザイン

より完成度の高いアプリになるよう、初回作成時からデザインを変更しました。

| before | after |
|--------|--------|
| <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-18 at 22 02 39" src="https://github.com/user-attachments/assets/669ff41a-e9e8-49f7-84ec-b6f431658cf0" /> | <img width="200"  alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-18 at 22 03 36" src="https://github.com/user-attachments/assets/41bbf4c5-c1f4-403a-8ab9-99c3f8ba5f7f" /> |

### 完成形

| Issue一覧 | Issue詳細 | Issue編集 | Issue更新 |
|--------|--------|--------|--------|
| <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-20 at 03 19 10" src="https://github.com/user-attachments/assets/9724a2bd-aba7-417e-acf6-d0affd59ac62" /> | <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-20 at 03 19 18" src="https://github.com/user-attachments/assets/d7bd7996-587e-4086-84f1-837b7e4325ba" /> | <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-20 at 03 19 21" src="https://github.com/user-attachments/assets/4535e7bd-ef93-46dc-9618-3183ab1a2403" /> | <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-20 at 03 19 13" src="https://github.com/user-attachments/assets/b8347feb-a4c8-497a-b36d-1338683a3893" /> |

| Issue検索 |　Issue検索　|　設定画面　|
|--------|--------|--------|
| <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-20 at 03 19 29" src="https://github.com/user-attachments/assets/ace8e427-7500-40ff-8d70-19821308a2d3" /> | <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-20 at 03 19 27" src="https://github.com/user-attachments/assets/83401240-b484-4bf2-b9bb-dc4d05a454fd" /> | <img width="200" alt="Simulator Screenshot - iPhone 15 Pro - 2026-06-20 at 03 19 31" src="https://github.com/user-attachments/assets/26894553-b9cf-4ec3-aa8d-1e0132470c7f" /> |

## 💯 テストコード

下記3種類のUnitTestを実装しました。

#### 1. モデルのテスト (`test/model/`)

- **目的**: データモデルの正確性を保証
- **ポイント**:
  - JSON ↔ オブジェクトの双方向変換
  - 必須フィールドの検証
  - FreezedのcopyWith動作確認
 
#### 2. UseCaseのテスト (`test/usecase/`)

- **目的**: ビジネスロジックの正確性を保証
- **ポイント**:
  - 正常系: 期待通りの動作
  - 異常系: エラーハンドリング
  - 境界値: 空リスト、null等の特殊ケース
  - 依存性の分離: Repositoryをモック化してUseCaseのみをテスト（モック化にはMockitoを使用）
  - 早期リターン: バリデーションエラー時はリポジトリを呼ばない
 
#### 3. ユーティリティのテスト (`test/utils/`)

- **目的**: 共通処理の正確性を保証
- **ポイント**:
  - 境界値テスト: 1桁の数値、特殊な日時
  - 相対時間の各パターン: 分/時間/日/月/年


## 💭 振り返り

#### 良かったこと
- 追加機能を実装できた。
  - 限られた期間だったが、必須機能に加え、追加機能を実装できた。
- デザインの更新ができた。
  - はじめにベースとなるUIを作成→デザインを更新 という流れでアプリの完成度を高めることができた。個人的にUIの実装が好きなので楽しめた🎉
- 実務に近いアーキテクチャやパッケージの選定ができた。
  - 実務で使ったことのあるアーキテクチャやパッケージを採用して、短期間で実務に近いアプリを作成できた。機能追加やアプリの規模拡大にもある程度対応できそうなアプリを作れたと思う。

#### 改善点
- 認証方法はPATを使用したが、OAuthやGitHubアプリ認証にも挑戦したかった。
- もっと機能を追加したかった（一覧のソート、検索条件の追加、ラベルやAssineeをピッカーで選択する、プルリクの表示機能、多言語対応、タブレット対応など..）
- Widgetテストにも挑戦したかった。実務でほぼ使ったことがない（技術検証だけやって、難しそうだったので採用しなかった）ので、この機会に学習も兼ねてやってみたかった。
- 他のアーキテクチャ、パッケージも検討したかった。
  - 綺麗な形のクリーンアーキテクチャもできたのでは？反対に、もっと単純なMVVMでも良かったのでは？
  - Riverpod vs GetXや、Mockito vs mocktail など、パッケージの比較検討もしてみたい。（今回は学習コストの観点から使用したことのあるパッケージを選定した）
- [GitHubパッケージ](https://pub.dev/packages/github)があるらしいのでそれも使ってみたかった。通信処理のところは自前で結構AIに頼って作ったが、パッケージ使えばもっと楽にできたかも？
- UIもっとこだわりたかった。もっと洗練されたデザインや、リッチなアニメーションなどにも挑戦してみたかった。UXの観点で、この導線使いやすいか？などもちゃんと考えてみたい。


## 備考

flutter doctor情報

```
[✓] Flutter (Channel [user-branch], 3.32.2, on macOS 15.7.1 24G231 darwin-arm64, locale ja-JP)
[✓] Android toolchain - develop for Android devices (Android SDK version 36.0.0)
[✓] Xcode - develop for iOS and macOS (Xcode 16.2)
[✓] Chrome - develop for the web
[✓] Android Studio (version 2024.2)
[✓] Connected device (3 available)
[✓] Network resources
```
