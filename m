Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AEB215F75
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786749; cv=none; b=HWQoP44K3JCas6bIlPGDtKKdjit76GbmChONNt3ml6fgHISVczCrqEWjnLGPRyiEMseU96ypnMfI8KEe5TCzVD9PLW0VcRI/6UWTIKmbN3pkp6O6v5PNJMee5e/lawLafu9oQjoHHV/jEHapCToJnivzjC0wx0K0SgnfHojWUAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786749; c=relaxed/simple;
	bh=IAOgtSHPmVLoRJLg+8QXPPOSqnpbN/zZE8yNPOkZR4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A7PVCioURTkZHpKD5KDtklDtv7xxYYvrIrSpHOXfE1QUkKKwAAP842/M4IRO4zQdtQfHI+B/1+29Ko4c30z2ZyBFPdQE7NkmIaEFwXpNTDXAbhhCobnUv76wfkhVBZpZ8E/AeXiRDzwoPY7fMmwaKc9VuZLuOIZ2XPqmhwhRldk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNgROpSY; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNgROpSY"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-221057b6ac4so26172025ad.2
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786748; x=1740391548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gon5m/uHwX5/tX/GlOAqTznsXMi3PVn+WonV1pVvztk=;
        b=KNgROpSYDn52njCiazWz85FKvEWoEustUIbTNy1fGJZDu8j10+zwK9jloZO4cshBCd
         VOf9n3IvRoUEMXltklBsTf8jz0+g6k7RnD+PpszzxYQI0DsO5ctcxm3Vsiujoo4KWY9J
         ZhVtgkVWDozzYj1k0RZ2TlPHcuOS1Y9cXakIEEDmYxtTDcWDOesscCAUKJ+EtCctg6yu
         l2AVoU0Rn/C8o7l8u1Wg8WJs1hdhm2QQYEcaoBWSxibL2mCaqU0TLnzHSSebW8svMcZo
         2DWOGeFr/KYDz1PVHCKz5aQ3g9GgeJAfVw0d1QCE1sPzORnMhhKM897XpP/rBg/tf1Gw
         3mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786748; x=1740391548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gon5m/uHwX5/tX/GlOAqTznsXMi3PVn+WonV1pVvztk=;
        b=Y3rvX30PYjm+jKyRpWLzvzBOz1v03p+nMehFcQrTdj72wRGC7zJBzr2Zg2MGKfZdVK
         dCYqwRBDodx9tsrx7tZONldu6JLyqx3E3aPfItv2XuUCKWoUyBFvXGmqgo0ERaiEh6lN
         pqdfdgHozu09UxEbbncs/AhblBwVzt9KuNyhaG67gkpP7WxyjgTFhI8Kmg/0ZXJDIz5o
         oU2J7VQajYFfNnONF0jYmrGKM9SfMR4pS3UnNFGemO9wtSoRJEcVrYgmK4KRBuUEooZv
         d3qwk4c7KULz7V0nKGzf/LupX4XMfPUZKBbbz0EXwlG8Xw0wyE8wA171e4KpWpNiSZEs
         tbvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiZ1BoqSbyqJ4svJIqeuFU+9M5v860L+D8nHe+crMMt1MGeKkMSSiDmuwtzGo8QpzMYNssozpfTD1R+Sue@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlw0Bldg+h/rSXr1D4Uqsb8XUoL7PmZAPUC7N+yO87LnUWt8Zl
	rvDH4XEZmz43Z1GKJwE7Ue7jS8RC56gIXERtCgKbbnwb5KRhpzLo
X-Gm-Gg: ASbGncti5+sPg/lXCaiO2Yez/KAJurgq1faAWatbyVHsYFdPAMaSgaMBa3KncI5y9Ob
	kEXWS+pQEoRa5F/S6W5U/SB1QUEtMpqrvvR7oFKkBUUT6EqAPFV5lZfvAN7W+qCOT1ZUxUvlKyu
	ILi1edIJYolaMrSWF50mtlkrmDrqMQErddP9QOac2139Pv0ynE3dnCt3CUkrOhJgn7MjjZcc16N
	JL0ClwXy0gAJVTpCujatvkE1iv/MLF6q6XUH25S6v/YpTp3gQhYWf8o8EiwAAGnmh1GNDi6gQVf
	n/676qSrazLUcT028UJP
X-Google-Smtp-Source: AGHT+IFKg3x8muXdgwlDkwPXCICIrswO4jMVroF8RLzpfuzitmqcHTBf6fh62HGnqM/gzdxuv1M+DA==
X-Received: by 2002:a05:6a00:244e:b0:732:5f41:ea6 with SMTP id d2e1a72fcca58-73261799c2amr13786184b3a.10.1739786747690;
        Mon, 17 Feb 2025 02:05:47 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7326ea62b03sm3051345b3a.70.2025.02.17.02.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:05:47 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 1/2] [PATCH V2 2/4] staging:gpib:agilent_82350b: Removed commented out code
Date: Mon, 17 Feb 2025 15:35:11 +0530
Message-ID: <01a91fb16e4774be1d89f8e2819b453ea8936fcf.1739783909.git.kumarkairiravi@gmail.com>
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

