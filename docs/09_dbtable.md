# テーブル

## テーブル一覧

| No. | 論理テーブル名 | 物理テーブル名        | 列1 | 備考 |
| --- | -------------- | --------------------- | --- | ---- |
| 1   | 加入者情報     | T_MEMBER              |     |      |
| 2   | 料金情報       | T_CHARGE              |     |      |
| 3   | 請求データ     | T_BILLING_DATA        |     |      |
| 4   | 請求明細データ | T_BILLING_DETAIL_DATA |     |      |
| 5   | 請求データ状況 | T_BILLING_STATUS      |     |      |

## 加入者情報◆T_KANYU

論理テーブル名: 加入者情報
物理テーブル名: T_MEMBER

凡例：〇対象、×対象外、―該当なし、Uユニークキー

| No. | 論理列名       | 物理列名       | データ型  | 長さ | 精度 | ブランク | NULL | 主キー | デフォルト値      | FK  | INDEX | 備考                          |
| --- | -------------- | -------------- | --------- | ---- | ---- | -------- | ---- | ------ | ----------------- | --- | ----- | ----------------------------- |
| 1   | 加入者ID       | member_id      | BIGINT    |      |      | ―        | ×    | 〇     | AUTO              |     |       |                               |
| 2   | メールアドレス | mail           | VARCHAR   | 255  |      | ×        | ×    | ×      |                   |     | U     |                               |
| 3   | 氏名           | name           | VARCHAR   | 31   |      | ×        | ×    | ×      |                   |     |       |                               |
| 4   | 住所           | address        | VARCHAR   | 127  |      | ―        | ×    | ×      |                   |     |       |                               |
| 5   | 加入日         | start_date     | DATE      |      |      | ―        | ×    | ×      |                   |     |       |                               |
| 6   | 解約日         | end_date       | DATE      |      |      | ―        | 〇   | ×      |                   |     |       |                               |
| 7   | 決済方法       | payment_method | TINYINT   |      |      | ―        | ×    | ×      |                   |     |       | 1: クレジット決済 2: 銀行振込 |
| 8   | レコード作成日 | created_at     | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |     |       |                               |
| 9   | レコード更新日 | modified_at    | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |     |       |                               |

## 料金情報◆T_CHARGE

論理テーブル名: 料金情報
物理テーブル名: T_CHARGE

凡例：〇対象、×対象外、―該当なし、Uユニークキー

| No. | 論理列名       | 物理列名    | データ型  | 長さ | 精度 | ブランク | NULL | 主キー | デフォルト値      | FK  | INDEX | 備考 |
| --- | -------------- | ----------- | --------- | ---- | ---- | -------- | ---- | ------ | ----------------- | --- | ----- | ---- |
| 1   | 料金ID         | charge_id   | BIGINT    |      |      | ―        | ×    | 〇     | AUTO              |     |       |      |
| 2   | 料金名         | name        | VARCHAR   | 127  |      | ×        | ×    | ×      |                   |     |       |      |
| 3   | 月額料金       | amount      | NUMERIC   | 9    | 0    | ―        | ×    | ×      |                   |     |       |      |
| 4   | 適用開始日     | start_date  | DATE      |      |      | ―        | ×    | ×      |                   |     |       |      |
| 5   | 適用終了日     | end_date    | DATE      |      |      | ―        | 〇   | ×      |                   |     |       |      |
| 6   | レコード作成日 | created_at  | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |     |       |      |
| 7   | レコード更新日 | modified_at | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |     |       |      |

## 請求データ◆T_BILLING_DATA

論理テーブル名: 請求データ
物理テーブル名: T_BILLING_DATA

凡例：〇対象、×対象外、―該当なし、Uユニークキー

| No. | 論理列名       | 物理列名       | データ型  | 長さ | 精度 | ブランク | NULL | 主キー | デフォルト値      | FK                               | INDEX | 備考                      |
| --- | -------------- | -------------- | --------- | ---- | ---- | -------- | ---- | ------ | ----------------- | -------------------------------- | ----- | ------------------------- |
| 1   | 請求年月       | billing_ym     | DATE      |      |      | ―        | ×    | 〇     |                   | T_BILLING_DATA_STATUS.BILLING_YM |       | 日は01固定 例: 2023-08-01 |
| 2   | 加入者ID       | member_id      | BIGINT    |      |      | ―        | ×    | 〇     |                   |                                  |       |                           |
| 3   | メールアドレス | mail           | VARCHAR   | 255  |      | ×        | ×    | ×      |                   |                                  |       |                           |
| 4   | 氏名           | name           | VARCHAR   | 31   |      | ×        | ×    | ×      |                   |                                  |       |                           |
| 5   | 住所           | address        | VARCHAR   | 127  |      | ×        | ×    | ×      |                   |                                  |       |                           |
| 6   | 加入日         | start_date     | DATE      |      |      | ―        | ×    | ×      |                   |                                  |       |                           |
| 7   | 解約日         | end_date       | DATE      |      |      | ―        | 〇   | ×      |                   |                                  |       |                           |
| 8   | 決済方法       | payment_method | TINYINT   |      |      | ―        | ×    | ×      |                   |                                  |       |                           |
| 9   | 請求金額       | amount         | NUMERIC   | 10   | 0    | ―        | ×    | ×      |                   |                                  |       | 税抜き金額                |
| 10  | 消費税率       | tax_ratio      | NUMERIC   | 5    | 2    | ―        | ×    | ×      |                   |                                  |       |                           |
| 11  | 請求総額       | total          | NUMERIC   | 10   | 0    | ―        | ×    | ×      |                   |                                  |       | 請求金額＋消費税額        |
| 12  | レコード作成日 | created_at     | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |                                  |       |                           |
| 13  | レコード更新日 | modified_at    | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |                                  |       |                           |

## 請求明細データ◆T_BILLING_DETAIL_DATA

論理テーブル名: 請求明細データ
物理テーブル名: T_BILLING_DETAIL_DATA

凡例：〇対象、×対象外、―該当なし、Uユニークキー

| No. | 論理列名       | 物理列名    | データ型  | 長さ | 精度 | ブランク | NULL | 主キー | デフォルト値      | FK                        | INDEX | 備考                      |
| --- | -------------- | ----------- | --------- | ---- | ---- | -------- | ---- | ------ | ----------------- | ------------------------- | ----- | ------------------------- |
| 1   | 請求年月       | billing_ym  | DATE      |      |      | ―        | ×    | 〇     |                   | T_BILLING_DATA.BILLING_YM |       | 日は01固定 例: 2023-08-01 |
| 2   | 加入者ID       | member_id   | BIGINT    |      |      | ―        | ×    | 〇     |                   | T_BILLING_DATA.MEMBER_ID  |       |                           |
| 3   | 料金ID         | charge_id   | BIGINT    |      |      | ―        | ×    | 〇     |                   |                           |       |                           |
| 4   | 料金名         | name        | VARCHAR   | 127  |      | ―        | ×    | ×      |                   |                           |       |                           |
| 5   | 月額料金       | amount      | NUMERIC   | 9    | 0    | ×        | ×    | ×      |                   |                           |       |                           |
| 6   | 適用開始日     | start_date  | DATE      |      |      | ―        | ×    | ×      |                   |                           |       |                           |
| 7   | 適用終了日     | end_date    | DATE      |      |      | ―        | 〇   | ×      |                   |                           |       |                           |
| 8   | レコード作成日 | created_at  | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |                           |       |                           |
| 9   | レコード更新日 | modified_at | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |                           |       |                           |

## 請求データ状況◆T_BILLING_STATUS

論理テーブル名: 請求データ状況
物理テーブル名: T_BILLING_STATUS

凡例：〇対象、×対象外、―該当なし、Uユニークキー

| No. | 論理列名       | 物理列名    | データ型  | 長さ | 精度 | ブランク | NULL | 主キー | デフォルト値      | FK  | INDEX | 備考                      |
| --- | -------------- | ----------- | --------- | ---- | ---- | -------- | ---- | ------ | ----------------- | --- | ----- | ------------------------- |
| 1   | 請求年月       | billing_ym  | DATE      |      |      | ―        | ×    | 〇     |                   |     |       | 日は01固定 例: 2023-08-01 |
| 2   | 確定           | is_commit   | BOOLEAN   |      |      | ―        | ×    | ×      | 0                 |     |       |                           |
| 3   | レコード作成日 | created_at  | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |     |       |                           |
| 4   | レコード更新日 | modified_at | TIMESTAMP |      |      | ―        | ×    | ×      | CURRENT_TIMESTAMP |     |       |                           |
