Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017E9217711
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 10:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739788282; cv=none; b=RvuOHUBx1DjvTzUUqwlrY1KoKYhbrtUU5++A8X9xp1r82eLcuPnYYpCkwJMGo9pQUAOrxwg4HC7GaYEK/dy0TDB8sBC1J/S6ucFBI73ybUNH6L4Av2o0n+UWw/ZN+Cgcf594UW1Own4/LhePqOI6j2m2ouB3YF5sban+CSgX4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739788282; c=relaxed/simple;
	bh=XO6uPpFukGBucmrCA20btnJlN/3eEn2EL2uIuT8mRyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUvFyVNMidlqSt0sLVBi6bBsodc05d0ifdBwbSoSb0TEJGVSIfJ6uzGEJYF8K3IU/0ZFTMbFPbSpN8aWs+j1mb5letcsDlsR+cOImqYJbbyh2cdsiZTS3aWqlncW12wJYz/XLGW9Kg35sKxWk/zKEOWAorr8Sg/R2NQUN6FM7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4WaRe24; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4WaRe24"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-22101839807so44000535ad.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 02:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739788280; x=1740393080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g6ix2sWH7fK+O3pMFw+ar4SRdhAMLkYoHd95tZujCUw=;
        b=l4WaRe24BfOduY+0xYCqQLz524AqCfz9mnsgiED9A2n/SBJHnwAjRmju/Lze+fnWFo
         keAELqs1oSWysD8mBlVPHHOTfTlnuQzRKpvfDr66hGJXkSpVfeMC+/EWotLycnl/p9nk
         mVxmC5HlHHoYfcDMUxWQisfKKc4PJOp10QM2mEZX1CHSTJr0rwOldJI0S1pF2aTLTt0d
         sg9rq1QSRkIb0xfr+5Ll7bqhgE3suguXpCka/cpPvAVUBXQzuz6MhtwvNzewlVbfZ2Pe
         jjTgdt3ItqZcASOEI/g1cwBlt9rXYAMC2x9bDApgPORlJ7HfrGhlpU2wxzce1w9uEaOB
         wgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739788280; x=1740393080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g6ix2sWH7fK+O3pMFw+ar4SRdhAMLkYoHd95tZujCUw=;
        b=Uxy7OYIvc2cu6yq4jdWgJvkPx1JybSJvwxWqxzPK0kcdk48W5sLOyZNYCYkW3BV+LB
         cSND67lcLhWDsdEHgFH13NrxSNElfU7fmbo0lAluqaDNpJwDtyNfUzbt+2MtqraAHt1n
         VMsmZo4BRSaPY7OJxp8xnNfhmznLHkLPwgmwtWJuhB7MSYpbJiTjsgaIospeyqFgsejm
         lwUP3iJ0gdpUdDiBDIKq9jf0SKCyOcm5+cOoxzwTm3zIz7l+9bpXd3QH6J0hj80kTGKM
         lMNIjqmPZrsIwZwxpebruMon8hV9Il6jVrUViLLfQ1fxL54Zn5Dq6vbIZJwoMSe5GR6n
         c3OA==
X-Forwarded-Encrypted: i=1; AJvYcCVjIuq+HysOiBM/Hmwm0XM1Plbkg2pK4AgWEjMcYN3M4Od5KqrCe78rCKRZUjV+VTj6YAaoMVBvJf/I0Cx6@lists.linux.dev
X-Gm-Message-State: AOJu0YyiNdwkRYLW26Y972SbLHc40leDJ/l30kSow3ELpauUJlfee7N9
	wG43tUrochgNINy6eQh0M+XhihaiJFFb367ZiV/OBtv416W/hU1a
X-Gm-Gg: ASbGncs6zG78aJHIOzEYaBLaoOSddQRa1LuAzONDmjNEgfA82HIp/bSRWWCcWEdKXwY
	gJlo/Enh2hk1nHisBY83oIzWuFrY42wOW3DBNkdg38ZOfQz2i8EEaB1smXv9XKgzLcPs4LVP1VB
	23gE6R5hEyQYRBatSgiEQgSZDhN06pr46lnoAicWQcjPqjDuXuF47DOoZ0+12qwpyLHku053aCW
	URE51piMwMWfx1lTZw+NmWmIvaLybw6UxW+ucpuN2e4LajiP6FPZCb779+OllEfVzY89hNLIKKr
	p50d3MLf7ZgGelL/wuXb
X-Google-Smtp-Source: AGHT+IEPOHcTF6hyyEmXMlteolNIm5KtdB7tzEBsHZ2kU7maGDRQ+x6WWVlf11YGDM9J+5Z0UGFesg==
X-Received: by 2002:a17:903:41c6:b0:21d:dfae:300c with SMTP id d9443c01a7336-22103efc10cmr136496685ad.3.1739788280168;
        Mon, 17 Feb 2025 02:31:20 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d53491ecsm68412705ad.9.2025.02.17.02.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:31:19 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org,
	dan.carpenter@linaro.org,
	rmk+kernel@armlinux.org.uk,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH v3 3/4] [PATCH V2 3/4] staging:gpib:agilent_82350b:Removed blank line
Date: Mon, 17 Feb 2025 16:00:37 +0530
Message-ID: <20250217103046.54294-4-kumarkairiravi@gmail.com>
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

