Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D565217716
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739786763; cv=none; b=SNpw0OGO/xcSzi0XgArgleHbrt0h58NmsMR5dlOV0mgkKAOMLx4RU3MztUR+n5BTTjddhPEAPsAnZWDYcyEhk73o/EAHLL03yq4MOhxrOFUD2WUOZC+b8wqS2QvNFOIz3XpB5ujOBhGffFBtud1DvyDHKC93R1RM7mS/kGBFP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739786763; c=relaxed/simple;
	bh=XO6uPpFukGBucmrCA20btnJlN/3eEn2EL2uIuT8mRyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k7U7qj0Q2170VLEyoTryGmodjTVG0Ni4Jd8Ik+oZkkrGgwjbqQnRDMNsi6eJUJD89vW02aI3wFZQ5uppOORJI6IPlvTcV6kMUKASynqGnLlnFuKyyKUtPyzGbpvs14NCg16T16hFp7dJbg7/jhT/4JJZFZPB2vyhKhXnq0a/Lnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6N2AyI6; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6N2AyI6"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-2fc292b3570so4723085a91.1
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739786759; x=1740391559; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6ix2sWH7fK+O3pMFw+ar4SRdhAMLkYoHd95tZujCUw=;
        b=e6N2AyI6i4i7/0R43vggMy0KtzK63rRKmRk3gpXWuoeLoW3r7t39wK7bxRD1bDOAGw
         BGt7ODAHM+MHAEtQT+ecUW9ulKdL0TYJ3MV3+AM7AQFqPAYWl4H7k/M/KzWFT4fbld+3
         vQr+lG6cCgwrc9xIqd5OtCX/QbhMLEvQSAcLw6bBJpv58cK62H3Q71F4dvnwnrWzX639
         CiHxTjBEBdq1W/Kf155pEzmwmgOMNPoJlGHCbyV8veNiA0BbX57L82tRmr5B5DjTPnRC
         46h7+9s2DUniTYqpghTAOP4wY/iH905Zk+xHO5sAEA4YcpjVTQh9D0AtT8XEXEE0e+Ib
         84Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739786759; x=1740391559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6ix2sWH7fK+O3pMFw+ar4SRdhAMLkYoHd95tZujCUw=;
        b=fgMqwcuMkJRe5z4dVbH5ChILoqoaVMZZW2+TXdfOyo49UOXRbQYA+fzWsjTLj0p+D0
         5Mi+neULyh56X0yLFqcbBT4K8ZH8rL3XtzpxpDoQCbqxDc9in8bucwYXDYAFQ80qMV4B
         0p8s++2UfqnNKjG+Yy0avNebjS+fhRnjL3NXK4INZBUTSwWK/ynxo9Q9sv2hQBJasuSn
         WdQ1vkPv9lEp7IqcChi6d2BuT9r86l8cx5P+OGPwuIpULeRx/5oNfekZkJSSqB5aiq6H
         6ckkYmuE5gmh+VxBscBT7j4jnH5HAfuM60sSQSYPieRk82bliUVsYYqbMy0FB9MBINmi
         JcVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyKMbFhlNCGryQAu+/LC2Q2A6SiHoPBr3WhAqtqBDtb1bfPYuqNgQRyMlmeH0TqJQw1M0U9xuTdAj1hu3r@lists.linux.dev
X-Gm-Message-State: AOJu0YwU9uaGIA4HvFNUZGNb1WYxjI8B9lHqRyvQoUO3Xpjbj0k24j5+
	K8ig680NNyHWwCxpHzNNubOCVdhCdkY4sElT302lYZAzMHVOO0A6
X-Gm-Gg: ASbGncuHfGYcFjt++g6cm6B7dtPIIn4HgJgLqGTQ5XejmLEqIUnjcs1Pl9nLd3WLqHZ
	aVhHue8/3+zupj+3tSM9PR8kCkz+wGOmJ6WDp10dvKmAEWXLxaMFT876lUNEquQ66kSDYwG1pHh
	VqkO2gTHVEGil9zwXW5inZACq54+D/t47PWC5nF+Gijr9IMwKlwpYl3hHJPyTOydwcvi5DTtzg5
	v4cljENCE5blYdhR5K+RIGIEbI70r1zYK7O3ztABo441KowEpxVzgd52aM12m4KjD3X2Lsu2/Ti
	S0bNMZxnV7Z7u98MjuSm
X-Google-Smtp-Source: AGHT+IFNNtw5MiwVglxdLubZCIsw+nJVWtg78T0UT6HZ55NYVN1f9M21iXjuOWWJttgGCFPw+Y9ffg==
X-Received: by 2002:a17:90a:ec0c:b0:2f5:747:cbd with SMTP id 98e67ed59e1d1-2fc40f22ddfmr16489685a91.18.1739786759369;
        Mon, 17 Feb 2025 02:05:59 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fbf98cfd03sm9830651a91.15.2025.02.17.02.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:05:58 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 2/2] [PATCH V2 3/4] staging:gpib:agilent_82350b:Removed blank line
Date: Mon, 17 Feb 2025 15:35:13 +0530
Message-ID: <18c12dd0f1a8f2c9cbf14ef8a8c70c6b01119e73.1739783909.git.kumarkairiravi@gmail.com>
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

removed few empty lines that were causing checkpatch script warnings

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 7936c7285d..b6871eb3c8 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -176,7 +176,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 
 	event_status = read_and_clear_event_status(board);
 
-
 #ifdef EXPERIMENTAL
 	pr_info("ag_ac_wr: wait for previous BO to complete if any\n");
 	retval = wait_event_interruptible(board->wait,
@@ -193,8 +192,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 	*bytes_written += num_bytes;
 	if (retval < 0)
 		return retval;
-
-
 	write_byte(tms_priv, tms_priv->imr0_bits & ~HR_BOIE, IMR0);
 	for (i = 1; i < fifotransferlength;) {
 		clear_bit(WRITE_READY_BN, &tms_priv->state);
@@ -207,7 +204,6 @@ static int agilent_82350b_accel_write(gpib_board_t *board, uint8_t *buffer, size
 		}
 		writeb(ENABLE_TI_TO_SRAM, a_priv->gpib_base + SRAM_ACCESS_CONTROL_REG);
 
-
 		if (agilent_82350b_fifo_is_halted(a_priv)) {
 			writeb(RESTART_STREAM_BIT, a_priv->gpib_base + STREAM_STATUS_REG);
 			//	pr_info("ag_ac_wr: needed restart\n");
-- 
2.48.1

