Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09CF430E84E
	for <linux-staging@lists.linux.dev>; Wed, 20 May 2026 02:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779245048; cv=none; b=FH03Hly4XH1CBvUdaSGUsHdIQvG5SIpYtFJQ2NEvDat422HVRot9T0blGLwnJL7aTduCxe+0U6j+cHZP28GUU0tZwFwCY58RXml29NfUfoAwgEQf11J57deydbZb3wPyqkRvI6p2dXjVeSZpIkOohF9btsDPmMnXbAGmVDRj3lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779245048; c=relaxed/simple;
	bh=6WiEvwmNN5itgkroxIolMeit6yFB79ORyzznRi4vnF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=paudkHvPQ78fvv2s7kxuIdqqCrufL4J8EhhC/XCTKZV7fTcz/NKOrzPtyP6XjVcziVIkTqewRZ4OKOC0d69fxKKGBuZ2Wv80js57RvETWxDbp+T60OElCxLZc98qzNUPJHlMVUnBudsL53g5Dm52RVR6XLL1tVBuu4ABp6+rsAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hzmdr6oS; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hzmdr6oS"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-95cc3522c40so2888786241.2
        for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 19:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779245046; x=1779849846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dp0vCDZPCe1rJMQjdKdJy1wpPdZpOogFV+3zlUS9uqk=;
        b=hzmdr6oSz4XhEjBSLXAzn/l7ijiDk+fA3UejDegnlpWgUwL5d/QHwW1mf2WJ+ybScl
         eqO7qFfl+IUy/KEg6k4OK1c7zdTZL49NpV1oaBIZuS2FNUeEuo1NyP/edIEFw7SIp1EI
         MFziV307oCgDjZtI+0EiXIi3/qethVRxRHKXkcSAjXVfYtOH+yRrNFNaMIlZH4RmKLsh
         VTtlwZ+1kQiRMgHFjazc7eC7FFy1nY5dGRfsvnHxOHARBnr8lGZQf183jRY1FakCiiLH
         gt87RQCw7Up9kOmmnx5Hy2ftAnnJvp10jxqHHRR6lXQcCxeYyvX0NAft2f5lsrcsss2j
         +tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245046; x=1779849846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp0vCDZPCe1rJMQjdKdJy1wpPdZpOogFV+3zlUS9uqk=;
        b=aEnsdIT5S6vQH82yqhRdpsa1GoWe2nuzkqWx/4I1/aw0R+CSmcVLUnqRdoWRnpcQJ1
         vjWb34fyVsjgTsu7NdS9iBvYLXNShlQGqVFPzAFsIE9yzowmBN4zam+D7vBNfmN7RUVF
         LQce+hNkSJ5BsxqzdM4BOqwuQ50KyQGINtbulDVGmYw0Gb53c/cRPlbss7T0vDMeQAy9
         KNieBBUlS4z0C43L1I5+lWhv7AlBwunLiW93Df1jDrEjVmNNZ0l1n+HOrG6npjqeXe5+
         KYYUMpXBGHEbI6tj+y3XM4s73J0/Oq/GX7EfywIaKYNT1pl3RjNFxhDyJrjzDbI+JKMw
         h3iQ==
X-Forwarded-Encrypted: i=1; AFNElJ88Lue+JZXs6UUlYDw9kjwQHfDTU5EG05FZ6za+IOAfe6TPJa4VbA5wtM3hq5mjdjIUtZ0nOEx012JBW/L6@lists.linux.dev
X-Gm-Message-State: AOJu0YxF+x4rgcdp7Cq+U4M1frggGnSqXqWJwCTtp73bMiPxD5KfoB14
	8sYAeOhxX2CNCSx4re+iF4ZhKa2DJ7y3A0K8zM9XEQ6BU+jcORZI7HlK
X-Gm-Gg: Acq92OFsMwfspoFY9DUVYZ4zCmhtFB86EdA3aLYt6hR9ESWNUzkt1EyVptaaWDSGH8g
	QaOdwHufFjkLfQTeEvdt0ukdovVvj/iP0WdlHZb5ZHbhafQilE3L2nMjZOyuBg7yBwCTcKxXVCv
	rIwJybLOSYgNQmEXqDevnm/pXNMi8qCbnPoLj62Ja7L74zjFUdRkIUOqFOX1kf6BgaGjuVRrSlm
	erR7WLGKj8ac2Vvd+Z24Ogk9fs48uijgXC/PkmO+LySBSM8b//vEDe8TFYY+gjyQh9zJaC+v0ph
	fCwn6/J0bCLGTW01sOYqMOBvF5JTaR26h9zhtPVM45JNIW/lR6qDYkVe5I6ZUhXvHECowBzpBf2
	6fPovruQ5LudShGPdWQsEWrxOmLaYT3hYHajLNG5SiIg4PgsURdl+CxfhE0o5MrM53sQO+mKbji
	1Ftj4IgfsmgYXq2MFYSIOs
X-Received: by 2002:a05:6102:6051:b0:634:8685:d335 with SMTP id ada2fe7eead31-63a3ec8c2efmr11368508137.14.1779245045997;
        Tue, 19 May 2026 19:44:05 -0700 (PDT)
Received: from arch ([186.195.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2fbe40esm7063186241.11.2026.05.19.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 19:44:05 -0700 (PDT)
From: AkaLuiz <luizcarlosmdea@gmail.com>
To: David Lin <dtwlin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AkaLuiz <luizcarlosmdea@gmail.com>
Subject: [PATCH] staging: greybus: uart: document locking and fix indentation
Date: Tue, 19 May 2026 23:41:28 -0300
Message-ID: <20260520024128.68942-1-luizcarlosmdea@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add comments describing what the lock fields in struct gb_tty
protect, and fix the indentation of the
wait_for_completion_timeout() call.

Signed-off-by: AkaLuiz <luizcarlosmdea@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..85586e9a4341 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock; /* protects iocount and oldcount for TIOCMIWAIT */
+	spinlock_t write_lock; /* protects write_fifo and credits */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex; /* protects disconnected during lookup and removal */
 	u8 ctrlin;	/* input control lines */
 	u8 ctrlout;	/* output control lines */
 	struct gb_uart_set_line_coding_request line_coding;
@@ -318,7 +318,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty)
 		return 0;
 
 	ret = wait_for_completion_timeout(&gb_tty->credits_complete,
-			msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
+					  msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
 	if (!ret) {
 		dev_err(&gb_tty->gbphy_dev->dev,
 			"time out waiting for credits\n");
-- 
2.54.0

