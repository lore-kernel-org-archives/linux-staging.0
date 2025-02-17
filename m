Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169451A5B8C
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788278; cv=none; b=rY0D9t4mmDZ6wp4aTkg86LKUmoDHPF39U3r8+PkgaTnfvNo0+Tvaq4ehho5W7Imwn3Xp/VsLPRTvDRj4QBGy9PfIL2/3L6ZvEr5tEGsrae/4UuTDA3zTTu9PB6DSOqX65SZ+mBNTuErj7U2ELE/9wLN6usp67bCUZL+77vvvo4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788278; c=relaxed/simple;
	bh=IAOgtSHPmVLoRJLg+8QXPPOSqnpbN/zZE8yNPOkZR4o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KcbSwBbXRLuthByNvFEgTIRblMviNEOw3RCsGejnnDF7nRzZGswoHM0utZ7SD3X3X/d5my3FqXnvbCIdXt0kdsWmdWEGLaz6U+AEMYhNC2HzfXgZxHqk+Tei5DVrm+aXuujfq9jDl4sCLsixPY9Tv3KoDEwYz1o/MxtspxaEFk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2bRZf++; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2bRZf++"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-2fbf5c2f72dso6384820a91.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739788275; x=1740393075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gon5m/uHwX5/tX/GlOAqTznsXMi3PVn+WonV1pVvztk=;
        b=J2bRZf++9ZTa9bal07vbvranK+KljY0++wi9PHy91s9y893dY4vJSAv8FoyjjKu/Cx
         RxrSKrTE+44n/yN8Of+P0xr1V8eAQHzBPI0fSGOFLKSHNMI4i3KFGLgKXbNRSSnigwOs
         87EUwhCWERZKWZLxY8XPPupDGXuGEIeZT1BZbedXCZ7GijOwqANp7KbEDMM5Upg7vv4Z
         /oZPvM6PFyyiksGm2tGs9B6zyHMCHKwYSTSCMnhOqn7P9S7F7b7/MJoQNfLEgbf5Bfap
         EHITP7KEEXkxkIxXaeQlV7tWxPJsTCHTNLfz5SPIvPC8+QmgH9dt4u8txkvlr3VFmjbo
         qt1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788275; x=1740393075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gon5m/uHwX5/tX/GlOAqTznsXMi3PVn+WonV1pVvztk=;
        b=jpVI65HLhr6Q0KfxuToALsjMUR3g88TmpXfTD60AMIHtO5D2hX/J6IiV86BLHCBpQt
         5Q+SivVDUwkauTCgjVhjUy+yM6Z9rwX9CMexGAR4XpFK+ctC8p2/I6H8NQ1Hn7t0Y7sf
         pSBl5ZtLxYnnbefC1RKE4WktfY6zMY7XjpoJunEHgBisLwENN2hrv3fSmJKbkFn2r0F/
         ELDlpYOotJiTLshEs5LHxMrIDGUDo5B4km4QdcfE7wHlmw6Ey8GlkuSHP4f7ZRcfsW2E
         90NP+wFffEhxw7b5UF3aPI3J6TPqgg/xugfti/h6I/+ZKsnwakpOVcby9QMvsO8IMkU5
         Yhpw==
X-Forwarded-Encrypted: i=1; AJvYcCVhgDUM56sCxmdOF3H+Zn/25EynUfVZCwChgDoZOVKhf5t7lYznWzG3uElHMzxnblkX8tSQiQSsMdtFuij5@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+/9ju9uwoJT9AguEFlrRc3wVMc59qDoc/tTQwR6aBWY6qOnRP
	4Nz91b0w8cIgGYGj989Ki+qqvPIdjUcL1/pPfBR7uz4muC1+9kG9
X-Gm-Gg: ASbGncub1KNzswEbc8VxXjj5Bwte2t4t0llvw0c0EGNC/wPdY8++WucGhXG5qx2+cIK
	sWHt+Tbk5elFRZ3duN1XafqI7sxqux/5lZ9YENvbyOEkNBAnSv61eyT8RV9i+3d1bfhp/oNaH9K
	CuS9tDn56hVLLWVnMsadjDPynh2AnieG/RSWzKQ6KDEiNr+atlzxFqL08vyUlRY6ucoB1c12ZQX
	yX0omSV0K6RGwhv6iIYov15tNkYSKxhWkRWjBn+0/QvawHoPcMkepzf+AgzNxtDqMr+HPOqKi5+
	wCK1nCMtFzw8tRi0JlSP
X-Google-Smtp-Source: AGHT+IFmlIM3XT7JkRePyLttLZv7uBkqX4zHAjFsBgxNCqrkB/IRmq4oiv5CJ/mXXvBtEGAUOxSzxA==
X-Received: by 2002:a17:90b:3ec5:b0:2ee:7698:e565 with SMTP id 98e67ed59e1d1-2fc40f0f503mr13083882a91.8.1739788273722;
        Mon, 17 Feb 2025 02:31:13 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fc13b9125dsm7782624a91.38.2025.02.17.02.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:31:13 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v3 2/4] [PATCH V2 2/4] staging:gpib:agilent_82350b: Removed commented out code
Date: Mon, 17 Feb 2025 16:00:36 +0530
Message-ID: <20250217103046.54294-3-kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250217103046.54294-1-kumarkairiravi@gmail.com>
References: <20250217103046.54294-1-kumarkairiravi@gmail.com>
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

