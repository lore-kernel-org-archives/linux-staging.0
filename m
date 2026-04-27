Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B522EDD62
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 04:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777265703; cv=none; b=ACCk3ywH6sjKCy4zeo+5m/1leyFNQEUjJt7/9zv2RUZKWaTo7SN+YDLf3hjLiAof0+sQWeUm4/pQuoWjpwr03w2S6k2fkFfsUizKLcMhmTJ6KqUiaNx4yCr3Dy8tKekWbAcY+UkHIC9K9OcDaCNEL5NTch8uC5ZyGLQwt7/O5Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777265703; c=relaxed/simple;
	bh=kzR4tTank6nQucPVfQWtrXjauNtrYKZpw16r3ImS3pw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ggXubehaSiMnrNIuKIjCaHqzjFbrjoS96HyBmKUgamVs2nWM5g2gX/BMjMxPWQU0NwphDGh9TFKL6WsSAxZLZpTpxLXjH59l85FZwmPaiBPHWOR2kX4XOAzfp1nvRkTxQuDmqAS048q1XyAgHLxYREIjBr2YzFkt5r0x6TYkudU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JJR+JzlJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JJR+JzlJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c7963df6f17so6462812a12.0
        for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 21:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777265701; x=1777870501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFgTfDtQqAbkf7ATgQZ3F8aWPMjefay/fF2UFGDgFWQ=;
        b=JJR+JzlJm2u5Mok+u2C/bZAvJkMeW+X8/cXw/C2yZKN0neNVPRL9TvQeSdXM26+OIr
         GeE1/zlLebYufne0Hl80OpVUqV0wobann5ozlS7yWXlS6ZZ9HdBUuaoP32clq5sBFaRg
         vRXML2Oqk21AP5Ytg4D6jE62wswgAgU21ZVky2YIG9lfKzj2FUIjo021kk910Gw8e0kE
         cd2Ej0S9bw2IsvwUHjF5y9cBE0FWt+maj9x4SUP0ufdzY7wh5rbwvIY+9zHKXuJDehpu
         3U1n23wEhXqoC5w/1gpXRS8aQ718ugsCXFidUsv4GUvjMcClhN7gYsg804/kHErZUdvz
         oZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777265701; x=1777870501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFgTfDtQqAbkf7ATgQZ3F8aWPMjefay/fF2UFGDgFWQ=;
        b=gPqIplXfDnw+CdxGo4lf9F7IJuulWlPp7l0Q/Ozrqzd3z1qJORqOjkqgR+wGrxyRGB
         WgRnUCuZ3n2BfwO0Rkt4PSth3Yvm4FMA9g3BuMMIrOGBhexQ8wxYYEIIfCGLsjNNlVVG
         h/U4XUaIyYiZxnSWPVc6Y4Rs5CEcBCklfV6n+vlw5jnBs9wP+PBwO5j+JxEFSQa3xUZY
         Z48ejZDLj4ZcamflaOa9XEqsC+KV3ud/gefXm7mddZSaE9MHBQNGkNlhDF8RL9OJ/xKU
         CzD1s2qp4YcpHZJW1M/53yon8grM93S4yNQM+75rvIu4KRuLULSK6NS80eQgYhGwiQpF
         2tBA==
X-Forwarded-Encrypted: i=1; AFNElJ/PdO6Q2pNPnVJ6p7muAIMQC/WbsH5S3gJR4hz6wKI1ro7QWL/oXNwMjt/4TPcRgL1vcffU332Wj4RUWIzw@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4F6Xde2pWT8qU2vSpB5qSla8IfwXWNTP9ZrjDhebPtao/B47x
	c0tQsfw6+fRzkpC42VvcQ6YB6K4pKS6nf3DvGpOnojUS52eG0dqb5BXZ
X-Gm-Gg: AeBDiesnjBoXER/OKj/R2C05/Wl6C+GQIy3jKfdrA+FXgJBuODNnew9ajB2HzFHUoVW
	X4SGK9LDHNhEjMtb9KveRb1v1gBHqnWuyr9jXaSpPgLXYsvNp0DFqb7vsGSoCUJQvKthSxxUf+6
	4LQwznmvyIWbhu9jXdb2XgDPYZ4ppVQyd2uWBICbZSlcCAX9C2GtO4nLBqP0O0zz1FAweNNEF9u
	Fa7dJ0KtGBhSOTRdAvevHGkL5Ay40NVLnBu9SDtmYbnffjfU0p143bbF7kADco42ZAreL66JpFe
	7vQHUjZHP7nAV7AZlARq1MzMPnYDpwYgbz4SqQC1vo7ffJ1ApCejuIyZyPZhIXoqq94awqrQoRU
	6rcuxTnkkOlzH8wUZoFujxyatyjO6dlWUFpqWhRGNjBLMu4Dhp5sfqOs5HD9jPjNmzPim/4I55s
	Ri1IG/IRK4duT95WBiEQQKJcYN8w0jQ1HRWjbox2ACNH9VWa+Gh09XJLJMZiIRdQbg
X-Received: by 2002:a05:6a21:99a3:b0:39b:d937:8010 with SMTP id adf61e73a8af0-3a08d8e076dmr45768555637.45.1777265700690;
        Sun, 26 Apr 2026 21:55:00 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:e09f:2c00:55ad:2561])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703059fsm23361399a12.24.2026.04.26.21.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 21:55:00 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: gregkh@linuxfoundation.org
Cc: debjeetbanerjee48@gmail.com,
	dtwlin@gmail.com,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	johan@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: greybus: uart: clear unsupported c_cflag bits in set_termios
Date: Mon, 27 Apr 2026 10:24:46 +0530
Message-ID: <20260427045446.16430-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026042618-whole-cassette-b15e@gregkh>
References: <2026042618-whole-cassette-b15e@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gb_tty_set_termios() derives UART line configuration from a subset of
termios->c_cflag bits (CSIZE, CSTOPB, PARENB, PARODD, CMSPAR, CRTSCTS,
CLOCAL and CBAUD). Other bits are not interpreted by the driver and are
not represented in the Greybus UART protocol.

Mask unsupported c_cflag bits so that userspace-visible termios
reflects the supported bits implemented by the driver.

This addresses the existing FIXME.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v2:
  - Clear unsupported c_cflag bits as suggested
  - Update comment to mention the change
---
 drivers/staging/greybus/uart.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..9c10e6baa7e0 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -495,7 +495,24 @@ static void gb_tty_set_termios(struct tty_struct *tty,
 
 	newline.data_bits = tty_get_char_size(termios->c_cflag);
 
-	/* FIXME: needs to clear unsupported bits in the termios */
+	/*
+	 * The Greybus UART driver only interprets a subset of termios
+	 * c_cflag bits when configuring line settings:
+	 *
+	 *   - CSIZE via tty_get_char_size() for data bits
+	 *   - CSTOPB for stop-bit format
+	 *   - PARENB, PARODD, CMSPAR for parity encoding
+	 *   - CRTSCTS for hardware flow control
+	 *   - CLOCAL for modem control handling
+	 *   - CBAUD via C_BAUD() for baud rate and B0 semantics
+	 *
+	 * Mask unsupported c_cflag bits.
+	 */
+	termios->c_cflag &= (CSIZE | CSTOPB |
+			     PARENB | PARODD | CMSPAR |
+			     CLOCAL | CRTSCTS |
+			     CBAUD);
+
 	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
 
 	if (C_BAUD(tty) == B0) {
-- 
2.53.0

