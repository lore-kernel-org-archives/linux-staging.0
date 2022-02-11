Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999542C9C
	for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 08:07:39 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id qe15so7409388pjb.3
        for <linux-staging@lists.linux.dev>; Fri, 11 Feb 2022 00:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=xAUT/gQq29nJV2O5W7LW1nLis7KlGvFawT35+Y71sHg=;
        b=GHGGarrC3d6LAv2KMugEICgtYfLX8+oSQ7ajZSMOk+Mqt93Ft4+B0+dFXmDtB9pVbd
         QUkK4L4+kB5rEQMEgiUbqWdAfVbB7T3ehIXhAWF9hsSVbP53mHhfDHQQwsN8wQ+mnMaT
         Apy3XXTt0sn4Po9CwISNy/63MSAznmyjyIE4iXNX7WF1oBUCnRIQ/Ve+i8umiPmJ6XuL
         XmF/rynZ9oAT7h5Ej+bWZqAo6vZPVQmFsEw87qQHr6PsX0AI9XdUqws33/B56S5Rm9e1
         c2jE53KVihmEnwYbSSIp3u8UzGXvJlvuwbpTJNjkR0SJg0ABQOMzlWbFO1ciw5VR6X26
         EQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=xAUT/gQq29nJV2O5W7LW1nLis7KlGvFawT35+Y71sHg=;
        b=NbeZuFjLuSh1wavKe3Qfq3XDnqWoh1/4Ky2LJ9nQdovvLsKEeAirCAL277CVLdVHSF
         jcaPXI7uVJrR1Jrg3S+v8VU+j8dAgWcWs2iIMH6JyxzgYl5SBwvAQsKlkuoslKl9jhMf
         w1QVA+OyoMqDMf3H4Yd4HORICz/WjCkyhKZVsuyDO9/qAdNjf8j1TBZ2tWgsz3qOlxZr
         Ey8MEoveuTGn7Zrb3ZeZ2/IrtS97eqmO7A5VuqITKZ4DcXtD25cGJs/6mFGpQgHY8IzM
         +JPHDhFiubvGwexESs7mNMYMfXZEwfb8rrdce717Yfd5YguxqU+U+W2k1j+Ttvc9IX3z
         FrEg==
X-Gm-Message-State: AOAM532Hj3UALjo5rEfAbI1O2FpZxieE2sGa/mfn/ukAZtM5DI2utlFi
	AWMgmkul0BpqtSMeKNgnaqA=
X-Google-Smtp-Source: ABdhPJw8agmr/Wkjjlbpw0m/muQtFl1SPv09lYm2nrDz5cf6Hpr3AnJ1h6sTedjjDczGVxLW0dinqQ==
X-Received: by 2002:a17:902:ba98:: with SMTP id k24mr397500pls.44.1644566858982;
        Fri, 11 Feb 2022 00:07:38 -0800 (PST)
Received: from mail.google.com (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id z27sm18548399pgk.78.2022.02.11.00.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 00:07:38 -0800 (PST)
Date: Fri, 11 Feb 2022 21:07:32 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, paulo.miguel.almeida.rodenas@gmail.com,
	realwakka@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: add rf69_dbg_hex function
Message-ID: <YgYZRArwwF7Z1B4f@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

dev_<level> functions don't support printing hex dumps and the
alternative available (print_hex_dump_debug) doesn't print the device
information such as device's driver name and device name. That type of
information which comes in handy for situations in which you can more
than 1 device attached at the same type.

this patch adds a utility function that can obtain the same result as
print_hex_dump_debug while being able to honour all possible flags that
one may be interested in when dynamic debug is used.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
Meta-comments:

the initial discussion to use print_hex_dump_debug started in this patch
but the original idea got merged into the brach.

https://lore.kernel.org/lkml/a630d8381cee0f543e0d77614052e1d04ab162a5.camel@perches.com/#t

---
 drivers/staging/pi433/rf69.c | 39 ++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index 901f8db3e3ce..82d4ba24c35f 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -822,9 +822,37 @@ int rf69_set_dagc(struct spi_device *spi, enum dagc dagc)
 
 /*-------------------------------------------------------------------------*/
 
+static void rf69_dbg_hex(struct spi_device *spi, u8 *buf, unsigned int size,
+			 const char *fmt, ...)
+{
+	va_list args;
+	char textbuf[512] = {};
+	char *text = textbuf;
+	int text_pos;
+
+	int rowsize = 16;
+	int i, linelen, remaining = size;
+
+	va_start(args, fmt);
+	text_pos = vscnprintf(text, sizeof(textbuf), fmt, args);
+	text += text_pos;
+	va_end(args);
+
+	for (i = 0; i < size; i += rowsize) {
+		linelen = min(remaining, rowsize);
+		remaining -= rowsize;
+
+		hex_dump_to_buffer(buf + i, linelen, rowsize, 1,
+				   text, sizeof(textbuf) - text_pos, false);
+
+		dev_dbg(&spi->dev, "%s\n", textbuf);
+
+		memset(text, 0, sizeof(textbuf) - text_pos);
+	}
+}
+
 int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 {
-	int i;
 	struct spi_transfer transfer;
 	u8 local_buffer[FIFO_SIZE + 1];
 	int retval;
@@ -844,9 +872,7 @@ int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 	retval = spi_sync_transfer(spi, &transfer, 1);
 
-	/* print content read from fifo for debugging purposes */
-	for (i = 0; i < size; i++)
-		dev_dbg(&spi->dev, "%d - 0x%x\n", i, local_buffer[i + 1]);
+	rf69_dbg_hex(spi, local_buffer + 1, size, "%s - ", __func__);
 
 	memcpy(buffer, &local_buffer[1], size);
 
@@ -855,7 +881,6 @@ int rf69_read_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 
 int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 {
-	int i;
 	u8 local_buffer[FIFO_SIZE + 1];
 
 	if (size > FIFO_SIZE) {
@@ -867,9 +892,7 @@ int rf69_write_fifo(struct spi_device *spi, u8 *buffer, unsigned int size)
 	local_buffer[0] = REG_FIFO | WRITE_BIT;
 	memcpy(&local_buffer[1], buffer, size);
 
-	/* print content written from fifo for debugging purposes */
-	for (i = 0; i < size; i++)
-		dev_dbg(&spi->dev, "0x%x\n", buffer[i]);
+	rf69_dbg_hex(spi, local_buffer + 1, size, "%s - ", __func__);
 
 	return spi_write(spi, local_buffer, size + 1);
 }
-- 
2.34.1

