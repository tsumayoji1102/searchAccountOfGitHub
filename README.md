# searchAccountOfGitHub
GitHubアカウントを検索するアプリケーションです。

// 使用したAPI：
https://developer.github.com/v3/search/#search-users
・qの値を指定することで、ユーザーをJSON形式で取得可能



// 使用したライブラリ：

UIKit
→基本中の基本

WebKit
→WKWebViewの使用に必要

KRProgressHUD
→非同期処理、WebViewの待ち時間に使用。イライラがなくなる。



// 使用を検討した（使用しなかった）ライブラリ：

Alamofire
→こちらの方が冗長化を防げるが、APIにGETリクエストを行う処理を直接書いてみたかったため

Realm
→検索結果をキャッシュ化しようとしたが、自身の時間の見積もり的にNGが出た

SwiftyJSON
→JSONDecoderがあるため必要性を感じなかった



// アーキテクチャ
MVVMを採用（正確には意識）したが、APIでの実装なのでCRUD処理ではなく、今回の実装がこのアーキテクチャになっているのかは微妙


// 反省点
・非同期処理に苦戦をしたが、クロージャーの扱い方を改めて勉強になった
・個人の勢いで開発して行ったため、gitのコミットが複数要素含まれて行なっていた


