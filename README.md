

# Morse Coder
  ***
  ## תוכן העניינים
  - [פרטים על הפרויקט](#details)
  - [מהי מטרת הפרויקט?](#purpose)
  - [איך זה עובד?](#how)
  - [איך להשתמש בתוכנית?](#use)
  - [תהליך הייצור](#production)
  - [מה הלאה? תוכניות קדימה](# תוכניות)
  - [Reflection](#reflection)
  ***
  <a name="details"></a>
  ## פרטים על הפרויקט
 שם הפרויקט:
 Morse Coder.<br/>
  **תוכנית:** גרוהר דביר.<br/>
  **ציון:** 10.<br/>
  **שיעור:** מדעי המחשב. לומד על ידי ברק צוברי.<br/>
  **בית ספר:** ישיבת בני עקיבא גבעת שמואל.<br/>
  **שנת ההגשה:** 2023.<br/>
  **סטטוס הפרויקט:** הפקה/`הושלם`/הגשה
  
  <a name="purpose"></a>
  ## מה מטרת הפרויקט?
  הפרויקט נכתב במלואו בשפת ה-assembly 8086, ומורכב מקובץ ‎.asm אחד (ראה [program.asm](https://github.com/baraksu/SortDictionary/blob/main/program.asm)).
  מטרת התוכנית היא לקחת מחרוזת קלט, המורכבת ממילים המופרדות בפסיקים,
  עבדו אותו והחזרו רשימה חדשה של מילים ממוינת לפי אלפביתי.
  
  <a name="how"></a>
  ## איך זה עובד?
  `הוסף כאן דוגמאות של זמן ריצה, תמונות והסברים`
  ### דגימות זמן ריצה
  #### דוגמה 1
  
  
  <a name="use"></a>
  ## כיצד להשתמש בתוכנית?
  בעת הפעלת התוכנית, הקונסולה תיפתח, ותוצג הנחיה על המסך.
  לאחר מכן, המשתמש יידרש להזין מילים, בהתאם להוראות הבאות:
  1. המילים מופרדות בפסיקים.<br/>
  2. אין רווחים בין מילים לפסיקים.<br/>
  3. הרשימה מסתיימת בנקודה. לאחר מכן התוכנית תמשיך.<br/>
  
  לאחר הכניסה לרשימת המילים, התוכנית תמיין את המילים לפי סדר אלפביתי.
  לאחר מכן הרשימה הממוינת תודפס על הקונסולה.
  
  <a name="production"></a>
  ## תהליך הייצור
  ### כתיבת תהליך setIndexes
  בשלב זה, כתבתי פרוק שקובע את האינדקסים עבור כל מילה, במערכי האינדקס.<br/><br/>
  זהו קוד ההרכבה של הפרוצדורה<br/>
  אני אסביר בפירוט את הקוד בשורות הבאות.<br>
  ```הרכבה
  mov ax, bx
  ```
  ### כתיבת תהליך findLowestWord
  כתיבת פרוק שמוצא את האינדקס של המילה הנמוכה ביותר בסדר אלפביתי, במערכי האינדקס.
  ### כתיבת תהליך takeStringInput
  כתיבת פרוק שלוקח קלט מחרוזת.
  ### כתיבת תהליך printWords
  כתיבת פרוק שמדפיס את המילים ממחרוזת הקלט, לפי סדר האינדקסים במערכי האינדקס.
  ### כתיבת תהליך switchByteSize
  כתיבת פרוק שלוקח שתי כתובות זיכרון ומעביר את הערכים בכתובות אלו בין זה לזה.
  ### חיבור כל החלקים יחד
  כתיבת פרוק הממיין את המילים לפי סדר אלפביתי, באמצעות הפרוצדורות שהוגדרו בשלבים הקודמים.
  
  <a name="plans"></a>
  ## מה הלאה? תוכניות קדימה
  לאחר שסיימתי את הפרויקט, שמתי לב שהתוכנית עובדת כמו שצריך. למרבה הצער, מורכבות הזמן של התוכנית אינה גדולה. אני מאמין שאין שימוש ממשי בתוכנית, בעיקר בגלל שיש עוד תוכנות הרבה יותר מהירות שניתן להשתמש בהן באינטרנט, ללא צורך בהורדת קובץ התוכנית.
  <br/><br/>
  מלבד זאת, אני חושב שיש כמה שיפורים שאינם הכרחיים, אבל יכולים לשפר את חווית המשתמש בהרבה.
  הקלט הוא המרכיב העיקרי המעורב על ידי המשתמש של התוכנית, ואני מאמין שניתן לשפר אותו באופן דרסטי. חלק מההצעות שלי הן טיפול ברווחים במחרוזת הקלט, או יצירת מדריך למשתמש להזין בו את המילים. בסך הכל, אני חושב שניתן לשפר את חווית המשתמש על ידי ביצוע ההצעות הללו.
  
  <a name="reflection"></a>
  ## השתקפות
  במבט לאחור, לא ניגשתי כמו שצריך לפרויקט הזה. התחלתי לעבוד עליו בקושי שבוע לפני המועד האחרון להגשה. לכן, היה לי הרבה לחץ בהשלמת הפרויקט בזמן. זה הביא לקושי מסוים בכמה חלקים בהפקה.<br/>
  עם זאת, סיימתי את הפרויקט בזמן, ועשיתי את זה לדעתי.
  בסופו של דבר, מצאתי את הפרויקט מעניין ונהניתי מתהליך החשיבה שהיה כרוך בו.