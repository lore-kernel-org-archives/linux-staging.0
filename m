Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE416284B2F
	for <linux-staging@lists.linux.dev>; Tue,  3 Feb 2026 11:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770118619; cv=none; b=gRt9L5jZp6e7ZWtDGNVfzF1OMv90gM8xiuW+xqPa+vqPF4rmfFSzk1+d2fFxRMKeURt+UmfLzr+hsdSWUy3LEgpQ/3q5JF587xWOu/5zllWSDIsLCcqkHQ5V2u6gtMfAAUjfA9a6c9hq/j0Qq4kf7JFdxNqicYABQKoD4BCxgmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770118619; c=relaxed/simple;
	bh=R4yssZbqTvfn4S3HPiFlaafAEvUWR1+9jtOD3K+d67c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uYw8ZPYKPng2+6RjQpmiecsKfrElT1p0SgtG6kQqNqplfhg6OrFEkDbTltih7IVspfn50sOrv095MUpSq3HQQGi9hIaDSLuM0K2HF+35yO8uF/t7XGih87yTygx07YJ5US88VoWetPdlkB44ZrcYeajguSa377kfT1G3WErDjrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CsWZ7ckJ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CsWZ7ckJ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806dffc64cso42370005e9.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Feb 2026 03:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770118616; x=1770723416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ywR3o47GPcmSkk6y1lG2JbuBuviXFgAriWoZ9xhaqb4=;
        b=CsWZ7ckJ3rCtLvfNxwm4ijKSUhRjkh9ME1BNSpa1OxSP3qukSdJLEDMXNwscwq1zeG
         QxtYlw2EM8TPItDQolV+FUNXa7y6D/a2GeSiIWJHc+6/wh05yjoX68zwoVA9dXPLBuEA
         GbWfUmkRAUA/pFogNj8jUcMcqEvzCBkmHk5Ko/KBK4ewsSsPE6dT99do5zLAHBbiJUaO
         WXU7RQdbNxeCcWEFlaLgQV4n3VTpti+IJFFyQTt3SDZToQ0x3TDQQR+xJz4jRa5Ccxzv
         qjuh0aadv8rOwNRQanKIl3gVnoEOXG38RXduhmJQijmKTgW8qsyEmjiw0bRSE0jUvhPq
         urDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770118616; x=1770723416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ywR3o47GPcmSkk6y1lG2JbuBuviXFgAriWoZ9xhaqb4=;
        b=SSJBupPrYTOW+LUVR1D6YwGhyIeAiTpyAFTgz/itSoTiCimnksEXI2aOnjKxjV9H/0
         8swTyutyQ2qqGHJRN93SXJvhfl6iMiRHSZXj3uSwu0DWB/2YTg4AtjNcjKK2bUc7MuJV
         kcvBrFE/PTCLDnUymXMBaUqJA1ek6BHtFWo/xzxRzjGCRa/ScUXgq8jtGG8GoRHFfnAB
         JWZCy+lhW/LwM4j8XQ241FZ8RvoZccWVJOhmio7tnIj7qz8WgZn4A+d4Ypg3bGeUqS7s
         JPRiRlGWnhLLxslVRMHy1X9v7V29vJwPtpuOMuj1UYTz0F1ZnG7kJM/wpmzKZjy19rhs
         FYqg==
X-Forwarded-Encrypted: i=1; AJvYcCUULfAbQ2b5rkod6MwNA6CCbI64ouugMrOgqutUQUxlJZpEw512oKgiLYY/RJhG5ufDH3VQ5PiMR5ZP4l3P@lists.linux.dev
X-Gm-Message-State: AOJu0YyJv7+bboSoTKDJ8N6WV0Hm2AYUER6cfatK2Nh2B/FQPbeEiOn/
	eQnr9mpMNzOdxOx9g74V5DBwpNliT5dgcrS67s9DQy+yXvGKG71B5x+y
X-Gm-Gg: AZuq6aL75HtGbCfeesZ3MxdgGLjeiTn/AA0vGGbDY2v2GuL60qjIEw1NqnFb5vl8QxR
	nCVAD33TYGdI+728UsA4XOhzupH20YCRXoAtfwGAtjC+XoVSJPFLQentED/rVaFR5KxAmfaOYH6
	tqig95ph26iAR8nsUflS7Eu73JVBWvgvq7JpUCCYyUUyG9JKfHzRV0FDvvrxb01sLpHkviV1xjy
	l/+TcFZTT6CWltBaHpCJYJJhQ9FTThZAIrItsr4TSlEPVA7cFsnfH01veOfIBb8wWHbYiBxd5mf
	FmuG+TXI52S3TrPL9ntU5niGx4kLJNaGj0otysNzUCnwDfxTZFu5ytJjpOl7sP/ctPCnDR1tnsT
	ScRHTElMLjih6cc+ceXafqwVveEnUEdNfbxhL3FUHxHiJ4ePZmb+dFsWIaiCsjrOYRyyZxtSWTa
	H5XTH1R29CYP4tVS1sWE3T8cjktgwV6VtgYOFDEJCIoqrtWdYAL2ArIARAvSzcmBL6od0ZRnJn
X-Received: by 2002:a05:600c:6298:b0:480:5951:fc1e with SMTP id 5b1f17b1804b1-482db45fbf4mr203194865e9.11.1770118615375;
        Tue, 03 Feb 2026 03:36:55 -0800 (PST)
Received: from localhost.localdomain ([31.206.212.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48305161534sm51164365e9.12.2026.02.03.03.36.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Feb 2026 03:36:55 -0800 (PST)
From: Baran Arda <baran9arda@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	baran9arda@gmail.com
Subject: [PATCH] staging: axis-fifo: fix sleep while holding mutex
Date: Tue,  3 Feb 2026 14:36:51 +0300
Message-Id: <20260203113651.28154-1-baran9arda@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver calls wait_event_interruptible_timeout() while holding a mutex. This can lead to a deadlock or poor performance as the mutex is held while the process is sleeping, preventing other processes from accessing the device. This patch moves the wait_event call outside of the mutex lock in both read and write operations.
---
 drivers/staging/axis-fifo/axis-fifo.c | 30 +++++++++++++--------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 509d620d6ce7..a651c59a80ea 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -197,11 +197,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 			goto end_unlock;
 		}
 	} else {
-		/* opened in blocking mode
-		 * wait for a packet available interrupt (or timeout)
-		 * if nothing is currently available
+		/*
+		 * Opened in blocking mode. Wait for a packet available
+		 * interrupt (or timeout) before acquiring the lock.
 		 */
-		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
 						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
 						       read_timeout);
@@ -214,8 +213,10 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 					ret);
 			}
 
-			goto end_unlock;
+			return ret;
 		}
+
+		mutex_lock(&fifo->read_lock);
 	}
 
 	bytes_available = ioread32(fifo->base_addr + XLLF_RLR_OFFSET);
@@ -340,27 +341,26 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 			goto end_unlock;
 		}
 	} else {
-		/* opened in blocking mode */
-
-		/* wait for an interrupt (or timeout) if there isn't
-		 * currently enough room in the fifo
+		/*
+		 * Opened in blocking mode. Wait for enough room in the FIFO
+		 * (or timeout) before acquiring the lock.
 		 */
-		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
 						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-								>= words_to_write,
+						       >= words_to_write,
 						       write_timeout);
 
 		if (ret <= 0) {
-			if (ret == 0) {
+			if (ret == 0)
 				ret = -EAGAIN;
-			} else if (ret != -ERESTARTSYS) {
+			else if (ret != -ERESTARTSYS)
 				dev_err(fifo->dt_device, "wait_event_interruptible_timeout() error in write (ret=%i)\n",
 					ret);
-			}
 
-			goto end_unlock;
+			return ret;
 		}
+
+		mutex_lock(&fifo->write_lock);
 	}
 
 	txbuf = vmemdup_user(buf, len);
-- 
2.39.5 (Apple Git-154)

