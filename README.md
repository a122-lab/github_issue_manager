# GitHub Issue Manager

GitHub REST APIを利用して、Issue一覧の表示・作成・更新を行うFlutterアプリです。

## ✏️ 概要

本アプリはGitHub公式アプリのIssue管理機能を参考にしつつ、モバイルアプリとしての操作性と保守性を重視して実装しました。
Clean ArchitectureとMVVMパターンを採用し、実務を想定した設計・実装を行いました。

## 🎥 動作確認動画

<!-- 動画へのリンクまたはGIF画像を配置 -->
![Demo](docs/videos/demo.gif)

## 📗 要件について

### 必須要件

- [x] **Issue一覧表示**: リポジトリのIssueを一覧で表示
- [x] **Issue作成**: 新規Issueの作成（タイトル、本文、ラベル設定）
- [x] **Issue編集**: 既存Issueの編集
- [x] テストコード: テストコードの作成
- [x] GitHub PAT認証

### 追加要件

- [x] **Issue詳細表示**: タイトル、本文、ラベル、コメント等の詳細情報
- [x] **検索**: テキストによる絞り込み

## 🏗️ アーキテクチャ・設計

<img width="121" height="341" alt="アーキテクチャ概要図 drawio" src="https://github.com/user-attachments/assets/38f32718-ad71-4124-9e17-390cc2165495" />

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

※背景画像はAI生成を使用しています

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
