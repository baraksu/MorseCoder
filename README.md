

#Morse Coder
  ***
  ## תוכן העניינים
  - [פרטים על הפרויקט](#פרטים)
  - [מהי מטרת הפרויקט?](#מטרה)
  - [איך זה עובד?](#איך)
  - [איך להשתמש בתוכנית?](#שימוש)
  - [תהליך הייצור](#הפקה)
  - [מה הלאה? תוכניות קדימה](#תוכניות)
  - [רפלקציה](#רפלקציה)
  ***
  <a name="פרטים"></a>
  ## פרטים על הפרויקט
 **שם הפרויקט**:
  Morse Coder.<br/>
  **מתכנת:** גרוהר דביר.<br/>
  **כיתה:** י'1.<br/>
  **שיעור:** מדעי המחשב. לומד על ידי ברק צוברי.<br/>
  **בית ספר:** ישיבת בני עקיבא גבעת שמואל.<br/>
  **שנת ההגשה:** 2023.<br/>
  
  <a name="מטרה"></a>
  ## מה מטרת הפרויקט?
התכנית נכתבה בשפת assembly emu8086.  
מטרת התכנית היא לקלוט מחרוזת באנגלית ולתרגם אותה לקוד מורס
  <a name="איך"></a>
  ## איך זה עובד?
  `הוסף כאן דוגמאות של זמן ריצה, תמונות והסברים`
  ### דגימות זמן ריצה
   
  
  
  <a name="שימוש"></a>
  ## כיצד להשתמש בתוכנית?
  בעת הפעלת התוכנית, הקונסולה תיפתח, והמשתמש יתבקש להקליד מחרוזת, לאחר מכן יכתב בקונסולה תרגום של המחרוזת לקוד מורס והמשתמש יתבקש ללחוץ על מקש כלשהוא כדי לצאת מהתכנית.  
  <a name="הפקה"></a>
  ## שלבי הפיתוח
  ### קליטה והדפסה
כשהתחלתי לעבוד על התכנית התחלתי מהבסיס, הדפסתי משתנה שמבקש שיקלידו מחרוזת ובניתי קוד שקולט מחרוזת   
ושומר אותה במערך,לאחר מכן הדפסתי את המחרוזת
שוב והתחלתי להגדיר משתנים.
### הגדרת משתנים
(כמובן שהגדרתי משתנים לפני זה בשביל קליטת והדפסת
מחרוזת אבל את רוב המשתנים הגדרתי אחרי זה)
הגדרתי משתנים המכילים את התרגומים של כל קלט אפשרי למורס, ומערך של מיקומי התרגומים שבו בהמשך שמתי את כל התרגומים, הגדרתי גם את הודעת סיום המערך כמובן .
### פרוצדורת הכנסת משתנים למערך (p)
לאחר הגדרת המערך שהזכרתי בסעיף הקודם הייתי צריך לבנות פרוצדורה בשביל לשים את הערכים של תרגומים למערך. קראתי לפרוצדורה () מכיוון שהשתמשתי בה הרבה ורציתי שיקח לי כמה שפחות זמן לקרוא לפרוצדורה זו. 
הפרוצדורה השתמשה במשתנה () כדי לשמור זמנית את המיקום של התרגום ואז לשים אותו בפרוצדורה וכל פעם ששמה בפרוצדורה משתנה שמה אותו במקום הבא במערך (). לאחר מכן כתבתי רצף של שורות שמעבירים את המיקום של משתנה ל() וקוראת לפרוצדורה () כדי שהיא תשים אותו במערך().
  <a name="תכניות"></a>
 
## מה הייתי מוסיף לתכנית
הייתי מנסה למצוא דרך שהקוד יעשה ביפים לפי התרגום של המחרוזת, מכיוון שזה כל הקטע של קוד מורס הקשות או ביפים על פי תבנית שאפשר לתרגם אותה לשפה של דיבור. זה היה יכול להיות מאוד קול אם כשהתכנית הייתה מקבלת מחרוזת היא הייתה עושה ביפים על פי קוד מורס במקום סתם להראות את התרגום.
  
  
  <a name="רפלקציה"></a>
  ## רפלקציה 
תהליך כתיבת התכנית היה מהנה ומאוד מעשיר ולפעמים מתסכל אבל
  בניית התכנית נתנה לי שיעור חשוב בפתרון בעיות, גיליתי המון בעיות בקוד והייתי צריך לשבת על הבעיות ולסקור את כל הקוד בשביל למצוא את הבעיה וזה לימד אותי שלא משנה כמה זה קשה למצוא את הבעיה בסופו של דבר
אמצא אותה אם רק אתאמץ.