Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514DF19E968
	for <linux-staging@lists.linux.dev>; Sat, 15 Nov 2025 06:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763187502; cv=none; b=ECaLtE01am9JKZqUDULYUTiuu55p6PHSBrlH5vPdFRCI+w/3WqOXkzpKlrRQYmvmi/dHua/6kAERtaSVuwOib1OMMXIbqFZv5YqB9rLgXm5+HtaWKLF82+fimteRgZ+i9TVCZGxexwwgO1dIv41VbdOybayw1LaYuQpmp4FtGyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763187502; c=relaxed/simple;
	bh=NrEKsQoz0XxezEcop9klSosma97viVe+I9X0t+9NKwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qNUag+kQ/quk/VOXyrrRsRL01g0y0TTcRiy4TyISCWvcugRkz6QDT1tiSylYMV7OP18H3MxOVJ/DLOZiIi5rNZVShAu/CszEdkkjU+VZU90h/c9vbTuLNpjiqLRP98+KFzd3hV5LC15ZQ/TWmItRkYpE1STcjlpJl3UGfYYXJz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fx4TqEbC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fx4TqEbC"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b991081160so2686181b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 14 Nov 2025 22:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763187501; x=1763792301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nR414HzuTWuhyNuPBPVh6HF0ByypEaKaxDXsS4YHm+8=;
        b=fx4TqEbCEbXmSC8x71g+/qRZ8/TJolTq/4XZMqIjhnw4dZpJ7olgM1V6ZUSeXi2z/x
         BsPo5oBR8uO5L7cdrti3xM4S/VSHvngzjS9GqioSHQ8nC2k4UfvOEg10AiRnVpZ8txG3
         UQkunH/uAL6SGlLA/5VaJtdjnWpcGUr2U7bJnmNozigMG1UgKXwq3cRDDX2HhzQHUpYT
         vmTWxKsV96Tw7QJSbt223FU14dbjjrLdQmjHmg2ONs0UOBWqw0O8ynifj68augg6bkAx
         kt6HvgxR/KWt6FDOGTxxQKkpkUFv2sW5PzO0m8wZVuDbocCIChL3Z5KMGh8SDkivGDzu
         zb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763187501; x=1763792301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nR414HzuTWuhyNuPBPVh6HF0ByypEaKaxDXsS4YHm+8=;
        b=d3pWnIsyfwmHju5JUxVgluvvQkfECeTyzp3hIfB0q1Bt9ceENmRxm80pjCpJRiAjN0
         DHXHIKFVuOB+HM9uyLbAMGqZbnZ9GsdrvgOj07SMKoj4NZY389avZ1KzI2vvuTkXDYRm
         aBdpxbSlDDCxOaUwF8Oy46c4w15o+nb8uxMeRd28KbYShKuDx53khZcDEj8Yk+/UlBd0
         eikY/V62hAYU7ENKlmdmMp+47KC2NIZ0QGMezHc6VnzYzct2BHZp9qdh+s7PZ4fZAfxQ
         vhPA8Nn561nCfzjLO3PUjo0PZzddOdZ1+X1rOcklCE2lpMXnAhn9Hp7qspEVaasGj23g
         vOjA==
X-Forwarded-Encrypted: i=1; AJvYcCWJWbat4Bxo3fmezuWbwIfngxUv9zWZrS+HurYUCCrfyIXwhBfyxD+poJRt4ySm+yguLE767e4JgQwxygUo@lists.linux.dev
X-Gm-Message-State: AOJu0YyQUXd2Guf+nY+11NZYo1AmtJgwu19cvouh8fTlOxNLJ55IeaSP
	NYIrf765wqc3kjdV+X2n4UK5b/k6Y0WE9WCYs/g19Tuqkavs3Fc7w7ct
X-Gm-Gg: ASbGncuY4w7akPJ3iUFAEJRDX0nCFysvVhWacQuG2Xb3TAE714fnWoTiaK+ILARzIJo
	h89qdU+kIj/UkjJe+oPFrSUnyIFZuheUCjQFxOksFmWxa6K5cwNjDrGVwJa/zqjpPBM6ryAzp3g
	hSrc9q90bHffCDU3wADMsWGfn5VXwXgIA2UOl9UtGLZgvpXwQxHWi0QETe+kYKhU48JiEEyfYrm
	lVZI6QJX3NY4cOPjoUOxzgQcBccc5ly5yyag+I8UjDXbS93OvNLRPNc48rqNdGPdrU1b3UOzPka
	hCBBEkr/BGnEevvAoI7CbGQx8WlWzkdC+ytjENsQI83x3X9zIqSxshekJBDWdUY10K3hRl/Wwq/
	c8i5Kft1iLngQ+K7+b8zWpC8+Dxoe1aGvRJNRbNr8IPLMQU9OfOcwMRTWeUHpvBbpRBycFso2VY
	0TWk/aAlcmSsj765ljby2krjfZ/VB/o8G3CVKh9J8KscYMJGJWsdIj2OFQJ89aqlbUtUBJ3w473
	889eMAPHpKW1jTEBU2XmU3W4sw=
X-Google-Smtp-Source: AGHT+IH1LjD90VbAPuNapbdjB5ZQKWZ42pc4Ga7VXQDXnVR8Okq/prv5bQKCJu1zSNjuVb+IId1/ug==
X-Received: by 2002:a05:6a20:4315:b0:34e:e0ba:7ab with SMTP id adf61e73a8af0-35ba219576fmr7346436637.40.1763187500557;
        Fri, 14 Nov 2025 22:18:20 -0800 (PST)
Received: from prakrititz-UB.. ([119.161.98.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250d24b9sm6976265b3a.17.2025.11.14.22.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 22:18:20 -0800 (PST)
From: Nirbhay Sharma <nirbhay.lkd@gmail.com>
To: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Nirbhay Sharma <nirbhay.lkd@gmail.com>
Subject: [PATCH] staging: greybus: uart: check return values during probe
Date: Sat, 15 Nov 2025 11:46:47 +0530
Message-ID: <20251115061646.160847-2-nirbhay.lkd@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check the return values of send_control() and send_line_coding() during
device initialization in gb_uart_probe(). If these operations fail, the
device will be left in an inconsistent state, so propagate the error to
properly fail the probe.

Both functions call gb_operation_sync() which can fail with errors such
as -ENOMEM, -ENODEV, or -ETIMEDOUT. Ignoring these errors means the TTY
device would be registered despite incomplete initialization.

Signed-off-by: Nirbhay Sharma <nirbhay.lkd@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 10df5c37c83e..5cece0a6606f 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -879,14 +879,18 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	if (retval)
 		goto exit_put_port;
 
-	send_control(gb_tty, gb_tty->ctrlout);
+	retval = send_control(gb_tty, gb_tty->ctrlout);
+	if (retval)
+		goto exit_connection_disable;
 
 	/* initialize the uart to be 9600n81 */
 	gb_tty->line_coding.rate = cpu_to_le32(9600);
 	gb_tty->line_coding.format = GB_SERIAL_1_STOP_BITS;
 	gb_tty->line_coding.parity = GB_SERIAL_NO_PARITY;
 	gb_tty->line_coding.data_bits = 8;
-	send_line_coding(gb_tty);
+	retval = send_line_coding(gb_tty);
+	if (retval)
+		goto exit_connection_disable;
 
 	retval = gb_connection_enable(connection);
 	if (retval)
-- 
2.48.1

