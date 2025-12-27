Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555FA322DBB
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870880; cv=none; b=TYH4urDdPXpcW9iWAuwqC18U+s6KjUV35Im/DQoFbzIxwbQDldC/zemQBCi0oCN8B9jeGHCAw0VIiCmvHbQLqyRAOaFP6P/BhDJEat5hcEUlHaOak2iFXtz5pKLJuCN3ykhXw2wD6MQIB2Owe3pks4dO/ZuReC7nRPBuaN3YmN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870880; c=relaxed/simple;
	bh=TIPK0E7hgNoy0Yi/+6a3J/xjUGxHrEY6a6MA48HvS+A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtKCmVPuFZn5eqTMouc+lnZYP+9OHtvvYn2DqjL9KP82OncUqimIcTOWPu0YQO1Su4Z41O8t2fcj3dwPXNIJbpYZvI5WnDHbnDqKSdXbagl5KP5BiDRU11pX3BRXZAz0vcxQGpMddPM8C+DNqKm9I73X2OnDIwo2626b7dj7hzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0ORz+Hv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0ORz+Hv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so84270405e9.2
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870877; x=1767475677; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Rj70GA/g5n5WR+FT3i7NVzPWFE/DP6oBzH4FvA8O9g=;
        b=U0ORz+HvsSP8LOxKPmfyvAnju+5M8BihmH1ea2+Pe1uw5s9TRVltmIkDM+2FWsPanf
         DM88iWzwAauO04CXrGQPcInpfa6+IpcB+Sii2DM1S+D6Sef9LiqgUJKAIS+tQ51KfZWs
         xRjsKYBY9kEDseQ/f9sAE1py0Pwked+lKGLMDCYmghMkwlYsSuZel4jNqWwmr12dMc4S
         XQNB6bEWegFkMtndzNQ66T3GRINgPMssztaTQG0d17t4wqu1ziRNk29bAPp5Lk4qOtUR
         pYbwQ3dkbhlykp+AXAyoVejqSozmLyJV6KneAQN4ILpOvyvRKinmGAPJH6KUqD9fzJ1K
         1uJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870877; x=1767475677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Rj70GA/g5n5WR+FT3i7NVzPWFE/DP6oBzH4FvA8O9g=;
        b=VdmI3tTd3UBiO6zyoJGuuaiUCjvbooZbiFOQXCg+W5zsIM6hXbtgbXKoGz1CQhYYdV
         0F5Ho6c2iWyTxeuUP5OzQNCKgf/m5SrIcZbozhPAIDtUFL7F47awCfBpNDlgSfZLX499
         AGisuMQi2Ps6pC6dcXwG7/lZAcaXwU4u8+bni76FH8mlq8ZraQzuLeq8+hniVbq2F00H
         0T1ee1JL4hxYs/sCt94RkTVi61dktCxedlqvLKUAHNZPQJWrrobc4f20MzFtHVr2l9Yk
         SU1EBjhDm9R15lFWa8srUtyR6IeuPwsC1yVyWByjzIrhg3k8x+jNi9mpaNlWJypybKH0
         Mq/A==
X-Forwarded-Encrypted: i=1; AJvYcCXBK1D4GuSWldezBs/2qoACDibNZilLVl9PY9BGHk1HysKZRaqYYMWJ0TY8aeIID+pKczgGDo8gJnCmcnD/@lists.linux.dev
X-Gm-Message-State: AOJu0Yxeg4opj1aYDZBDuBuEsN+Fe2UL4QcH/8R4AyqyVVitTQGxHH2u
	+2rYh/Z0p6wtQRZWWkjzk5ygdbFUm5QBHaAluv4J8OqWA0sLXrwgRGri
X-Gm-Gg: AY/fxX5jDZ+Oq0L83tffY/yp36cGb0P1AMYgJXY7j0aQAGoFah3KUT4vjCMRptx2xCq
	/F1dk4yFQKkJTYVBpnXlTsBt/3MGUDhwbVPPIXrPowgsizrZz7bB0sVHqo15EmNdA89LfeGdvy1
	fVOvEsL7NfgqpDJKXRyp/YHosAb3wxFUFmxxDOi6y4psPzOpHI7Q+N5K9RSa2xtYwk1U1yOQ3td
	c+JMr2VXPuMF4lLr4PEwY2XByx01e8HECZ+MvRbTOhtvk72ZZKN0WJTTz/qbl4/kT0Va45kUILV
	3JyTkYofktPddQSeROmkHMD/9iUszM6DXKWr2OMVcGZO0OT9g3jChVZYESo52JSjK6xJN1zBFQr
	5+lfw2cRN1EvpQX/1VlZEqz930CjbR6WLE7/4bA0AWcApIfbCoFeGJf4caKGPIgRF+SuZiWgMYh
	cUOyDJZaraiK2ULoGyVVQo
X-Google-Smtp-Source: AGHT+IEBX/Ek2+axtA+MEONmEVq4U1UmxwRMNe88X2UG4JiYLiXir2itwIwLwDKhXe7U/7I2BhNinA==
X-Received: by 2002:a05:600c:1550:b0:477:7991:5d1e with SMTP id 5b1f17b1804b1-47d1958b250mr299031345e9.25.1766870876354;
        Sat, 27 Dec 2025 13:27:56 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:56 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 7/9] staging: axis-fifo: Remove noisy error messages for user errors
Date: Sat, 27 Dec 2025 23:26:38 +0200
Message-ID: <20251227212640.3321310-7-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
References: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dev_err() calls for conditions caused by invalid userspace
input. Logging them clutters the kernel log, especially if userspace
repeatedly makes invalid calls.

Also, consolidate the write validation checks into a single condition.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 6d9ff6384168..bce32e9da347 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -195,8 +195,6 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 	words_available = bytes_available / sizeof(u32);
 
 	if (bytes_available > len) {
-		dev_err(fifo->dt_device, "user read buffer too small (available bytes=%zu user buffer bytes=%zu)\n",
-			bytes_available, len);
 		ret = -EINVAL;
 		goto err_flush_rx;
 	}
@@ -268,20 +266,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	u32 *txbuf;
 	int ret;
 
-	if (len % sizeof(u32)) {
-		dev_err(fifo->dt_device,
-			"tried to send a packet that isn't word-aligned\n");
-		return -EINVAL;
-	}
-
 	words_to_write = len / sizeof(u32);
 
-	if (!words_to_write) {
-		dev_err(fifo->dt_device,
-			"tried to send a packet of length 0\n");
-		return -EINVAL;
-	}
-
 	/*
 	 * In 'Store-and-Forward' mode, the maximum packet that can be
 	 * transmitted is limited by the size of the FIFO, which is
@@ -291,7 +277,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 	 * otherwise a 'Transmit Packet Overrun Error' interrupt will be
 	 * raised, which requires a reset of the TX circuit to recover.
 	 */
-	if (words_to_write > (fifo->tx_fifo_depth - 4))
+	if (!words_to_write || (len % sizeof(u32)) ||
+	    (words_to_write > (fifo->tx_fifo_depth - 4)))
 		return -EINVAL;
 
 	if (f->f_flags & O_NONBLOCK) {
-- 
2.51.0

