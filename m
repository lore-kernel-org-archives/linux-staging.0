Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3CE21764D
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786755; cv=none; b=pDDQ8yKcdxcMHn2ffadxY1+IM+Qh3U4X4Z1CDv1YM0ItbkrwaQme2cKbPW9/FxWszTChNMNPd5zfpQ6AU0J7YQwZhsjseBJyEDO1bIcdFO0I1ey5kjGsoabOLnPvlCwp/qQWPlngxilCJfw2tXQGGi3k8c3Dk3k8lbR6xHBpj5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786755; c=relaxed/simple;
	bh=IAOgtSHPmVLoRJLg+8QXPPOSqnpbN/zZE8yNPOkZR4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bj3VATwgMiWH7LqCvfOMS+XwoeO6YJRgf+pSi0nilmtzVJEiNE12IXqLU3pII5PGGw8fafqkyinKK3BbqFwp9HZrdIy1QIV0RzlCapvxWieVvgmswDnuAKtE3WSCt2FXX8jtBbYdwwODmPsI01iSJ7b24QLmqtZO3W1KLZVcR9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IeeYaZB8; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IeeYaZB8"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-219f8263ae0so72634575ad.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:05:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786754; x=1740391554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gon5m/uHwX5/tX/GlOAqTznsXMi3PVn+WonV1pVvztk=;
        b=IeeYaZB8wIEeJN5Kvf7MwIVwvwB17ZdzKONsgedw1MPMsFTm2i5PnDi2YZxpJIfVDR
         +dGfTJgjvRKAdxLGfApHHg3YsV3l5oZp9SgoltlcgoVBkM574U5rBjoBpoSPsMicx+bG
         a2RTi6y+87ZW/MWaN3huFqvFNeynZWLfBsW81s7Y4wRyyfU65MFyGyt8W0UAkRxlLLkt
         /Kh2wcGLOLHR/F5dt2JHHZH8n+bGp8R9gmyYHor7qiXv1/LyXHB7GQ7Ubsa7dDLPFvwK
         exkGkxkdIUuoyb9rPk5wYD6hQd2ZRvMlCbrXKAxtG4Gq8iiR/B5mEHbZVFVsgzCebviT
         vGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786754; x=1740391554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gon5m/uHwX5/tX/GlOAqTznsXMi3PVn+WonV1pVvztk=;
        b=hhDhOGlB+zloHdwZdZXvINVf/CEbvhhX2Tx0B/9Bse5tg3S7+CcDlyzaE4VuOhQGSi
         TGqw9sRXpCPdR4A/Q1DjrcEjMkMjavzgdGeUgtgYmGsBR8t2OaJv1UjCrkDluAey1Yap
         2GznEAfC9YnJpl3r4ePX9wKWe+8vMcZI2ANMEzj1HOFs7bmczQRgiAf1G36nj5uzanFC
         MWCORzsaes/oSzbMwDSxWU3cXqmzqQr3w7n2PWl1nRhIgDBU+4yotcecJWUsE0gD2P3o
         M+yU7cz2xyFslIEl82CxcyMHAna5n481jQmJgPU62ueEzjGy6uHmOYJl44yaqq0A5V5Q
         dxjg==
X-Forwarded-Encrypted: i=1; AJvYcCXIigBwvdRGQJPm/5fD+hZu55oknv9LdC6wihDNBWd3nXx+7h9lP1jA42QMLb56FMimWveP+a6kdzXeqyz3@lists.linux.dev
X-Gm-Message-State: AOJu0YxlfB4yft3tL+0nRvBu1vX74hOMa51Fgd8+sLlWeZUiQV/PQRHu
	am98A1XE99P6aGenqstBxDnVbpDidW9yqAKKk1cNkWt/KQKqZGUQ
X-Gm-Gg: ASbGncsQR+QWjlPP9ORJc7PEG8MHhn8N7YyolIoEM2j4lH2c/6p6Cz/LWxkFZ9xxXOx
	foZRLzSmixJ72IAbVT9nOUrl8elugBAvJcoBRXBnQ9uLXAzmWnKzau4fUhPS92LhYI4gMrOaljb
	JtM9qvxIpd5XV/2J8PjoTGl4pIDMhPXLSIu95ErRkKcPTSpbI0oD+5RnK9XPkdh/1hyN1ZCtD+4
	wyxBBTGkhcrjlSk0bluHNC/gMkvD1JZSAfodLYYBNjsuwOhAjFzIuGaCBA5WW1aJkKUZ36dF1GM
	JSDyFZztdTKvD+LtEnbS
X-Google-Smtp-Source: AGHT+IH3fn6ruZvmVbfVZA/heT5i3BY36VeD/JfcO5bNPtOZmGRDCFwBN4W8l978gaiFOsM8CtJUOw==
X-Received: by 2002:a05:6a21:6e91:b0:1ee:8634:75a5 with SMTP id adf61e73a8af0-1ee8cbd7eefmr15973546637.26.1739786753608;
        Mon, 17 Feb 2025 02:05:53 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-add3f326b31sm4670219a12.64.2025.02.17.02.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:05:53 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 2/4] [PATCH V2 2/4] staging:gpib:agilent_82350b: Removed commented out code
Date: Mon, 17 Feb 2025 15:35:12 +0530
Message-ID: <20250217100526.49495-3-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739783909.git.kumarkairiravi@gmail.com>
References: <cover.1739783909.git.kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

Removed commented out debugging code to make code look cleaner as
spcified by TODO

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 5a74a22015..7936c7285d 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -176,7 +176,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 
 	event_status = read_and_clear_event_status(board);
 
-	//pr_info("ag_ac_wr: event status 0x%x tms state 0x%lx\n", event_status, tms_priv->state);
 
 #ifdef EXPERIMENTAL
 	pr_info("ag_ac_wr: wait for previous BO to complete if any\n");
@@ -190,13 +189,11 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		return retval;
 #endif
 
-	//pr_info("ag_ac_wr: sending first byte\n");
 	retval = agilent_82350b_write(board, buffer, 1, 0, &num_bytes);
 	*bytes_written += num_bytes;
 	if (retval < 0)
 		return retval;
 
-	//pr_info("ag_ac_wr: %ld bytes eoi %d tms state 0x%lx\n",length, send_eoi, tms_priv->state);
 
 	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BOIE, IMR0);
 	for (i = 1; i < fifotransferlength;) {
@@ -210,8 +207,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		}
 		writeb(ENABLE_TI_TO_SRAM, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 
-		//pr_info("ag_ac_wr: send block: %d bytes tms 0x%lx\n", block_size,
-		// tms_priv->state);
 
 		if (agilent_82350b_fifo_is_halted(a_priv)) {
 			writeb(RESTART_STREAM_BIT, a_priv->gpib_base + STREAM_STATUS_REG);
@@ -226,7 +221,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 						  test_bit(TIMO_NUM, &board->status));
 		writeb(0, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 		num_bytes = block_size - read_transfer_counter(a_priv);
-		//pr_info("ag_ac_wr: sent  %ld bytes tms 0x%lx\n", num_bytes, tms_priv->state);
 
 		*bytes_written += num_bytes;
 		retval = translate_wait_return_value(board, retval);
@@ -238,8 +232,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		return retval;
 
 	if (send_eoi) {
-		//pr_info("ag_ac_wr: sending last byte with eoi byte no:   %d\n",
-		// fifotransferlength+1);
 
 		retval = agilent_82350b_write(board, buffer + fifotransferlength, 1, send_eoi,
 					      &num_bytes);
@@ -284,7 +276,6 @@ static irqreturn_t agilent_82350b_interrupt(int irq, void *arg)
 		tms9914_interrupt_have_status(board, &a_priv->tms9914_priv, tms9914_status1,
 					      tms9914_status2);
 	}
-//pr_info("event_status=0x%x s1 %x s2 %x\n", event_status,tms9914_status1,tms9914_status2);
 //write-clear status bits
 	if (event_status & (BUFFER_END_STATUS_BIT | TERM_COUNT_STATUS_BIT)) {
 		writeb(event_status & (BUFFER_END_STATUS_BIT | TERM_COUNT_STATUS_BIT),
-- 
2.48.1

