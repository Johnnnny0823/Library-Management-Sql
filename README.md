# 圖書館借閱管理系統（MySQL）

資料庫課程期末專案。將圖書館的借書、還書、預約與通知規則，實作為 MySQL 資料表、預存程序、觸發器與檢視表。

## 資料模型

| 資料表 | 說明 | 主要約束 |
|---|---|---|
| `member` | 會員 | Email 唯一 |
| `category` | 書籍分類 | 分類名稱唯一 |
| `book` | 書籍 | ISBN 唯一；`BookStatus`（可借閱／已借出）；FK → category |
| `record` | 借閱紀錄 | FK → member、book；`ReturnDate` 為 NULL 表示未歸還 |
| `reservation` | 預約紀錄 | FK → member、book |
| `notification` | 系統通知 | FK → member |
| `loginlog` | 登入紀錄 | FK → member |

E-R Model、正規化（1NF～BCNF）與資料表說明見 `docs/資料庫期末報告.docx`。

## 資料庫程式

**預存程序**
- `BorrowBook(member, book, date)`：借書
- `ReturnBook(member, book, date)`：還書
- `ReserveBook(member, book, date)`／`CancelReservation(member, book)`：預約與取消
- `CheckOverdueAndNotify()`：檢查逾期並寫入通知
- `CheckUpcomingReservationAndForceReturn()`：處理即將到期的預約

**觸發器**（皆掛在 `record`）
- `trg_before_borrow_reservation_check`：借書前檢查是否有他人預約
- `trg_after_borrow`：借出後將書籍狀態改為「已借出」
- `trg_after_return`：歸還後恢復「可借閱」並通知下一位預約者

**檢視表**
- `borrowedbooks`：目前借出中的書
- `overduebooks`：借閱超過 14 天未還
- `recordsummary`：借閱紀錄總覽

## 匯入方式

```bash
mysql -u root -p < librarydb.sql
```

會建立 `librarydb` 資料庫並匯入範例資料（範例會員資料皆為虛構）。

> 在 Windows 的 MySQL 8 上開發。預存程序中部分資料表名稱使用大寫開頭（如 `Book`），
> Linux／macOS 預設區分大小寫，需在 MySQL 設定 `lower_case_table_names=1` 後再匯入。

## 範例操作

```sql
USE librarydb;
CALL BorrowBook(1, 2, CURDATE());   -- 會員 1 借書 2
SELECT * FROM borrowedbooks;
CALL ReturnBook(1, 2, CURDATE());   -- 歸還
SELECT * FROM notification WHERE MemberID = 1;
```

## 文件

- `docs/資料庫期末報告.docx`：系統說明、E-R Model、正規化與分工
- `docs/基本功能.docx`：功能說明
- `docs/上台報告操作.docx`：展示操作流程

組員：鄭翔元、黃楙登、林晨、蘇奕安
