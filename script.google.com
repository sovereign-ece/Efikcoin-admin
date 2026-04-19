// ========== CONFIGURATION ==========
const SUPPORT_EMAIL = "efikcoineternal@gmail.com";  // Change to your support email
const SPREADSHEET_ID = "";  // Optional: leave empty to skip saving to sheet
// If you want to save to Google Sheet, create a sheet and paste its ID here

function doPost(e) {
  try {
    const data = JSON.parse(e.postData.contents);
    const { name, email, message, subject } = data;
    
    // Validate required fields
    if (!name || !email || !message) {
      return sendResponse(400, { success: false, error: "Missing fields" });
    }
    
    // Send email
    const mailSubject = subject || `Contact from ${name}`;
    const body = `Name: ${name}\nEmail: ${email}\n\nMessage:\n${message}`;
    MailApp.sendEmail({
      to: SUPPORT_EMAIL,
      subject: mailSubject,
      body: body,
      replyTo: email
    });
    
    // Optional: save to Google Sheet
    if (SPREADSHEET_ID) {
      const sheet = SpreadsheetApp.openById(SPREADSHEET_ID).getActiveSheet();
      sheet.appendRow([new Date(), name, email, message]);
    }
    
    return sendResponse(200, { success: true, message: "Email sent" });
  } catch (err) {
    return sendResponse(500, { success: false, error: err.toString() });
  }
}

function doGet(e) {
  // Simple HTML form for testing (optional)
  const html = `
    <!DOCTYPE html>
    <html>
    <head><title>Contact Support</title></head>
    <body>
      <h2>Contact EfikCoin Support</h2>
      <form id="contactForm">
        <input type="text" name="name" placeholder="Your Name" required><br>
        <input type="email" name="email" placeholder="Your Email" required><br>
        <textarea name="message" placeholder="Your Message" required></textarea><br>
        <button type="submit">Send</button>
      </form>
      <div id="result"></div>
      <script>
        document.getElementById('contactForm').addEventListener('submit', async (e) => {
          e.preventDefault();
          const formData = new FormData(e.target);
          const data = Object.fromEntries(formData.entries());
          const res = await fetch('', { method: 'POST', body: JSON.stringify(data), headers: {'Content-Type': 'application/json'} });
          const result = await res.json();
          document.getElementById('result').innerText = result.success ? 'Message sent!' : 'Error: ' + result.error;
        });
      </script>
    </body>
    </html>
  `;
  return HtmlService.createHtmlOutput(html);
}

function sendResponse(status, data) {
  return ContentService
    .createTextOutput(JSON.stringify(data))
    .setMimeType(ContentService.MimeType.JSON);
}
