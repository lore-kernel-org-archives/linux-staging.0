Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E953859EE
	for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 18:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769799460; cv=none; b=Q8NAvKqEhkaN7uiy+46bluXgMKk5yC7ULD57en9sunzmxBWr458d79cm0XwJGMdC6jVvIVe5TAu9nEBAPqT2DZUl6Qh3X5htYf+Q5+cwsjPSwJaVLbMIaZdEFzoDR6fEPirUIIvhoO+gxkxrvGm+K5wq1DFSvy8G5efPLLUjOfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769799460; c=relaxed/simple;
	bh=rydnYZqJ+NFeWlELYNoZjjVmnW/PmZZQ4nMY0FQMv2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0jx5c0LhVPeUR+QgDmn/UXDvEbBD0NwnKLskxZYNMsHalpu9DDgfpHhZhtUs+ewDjd5LR5OFGbvWi1SGwP2Ntq1nQmmDH+4ZNbyrOPT/GXRysNFxvYFAW6gjMnQh8Qu13JLiwhjcDZeeumRwnV6pCjn5zsbxGxdCqmQIqlJTFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M65mR+Xe; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M65mR+Xe"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so2065384f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jan 2026 10:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769799457; x=1770404257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=M65mR+XecYzMwbLN3/FJUdao+KJuVFCMF7ZxcV+JkDz1T+B3kLGVNhj+oWG0xwdHkM
         w+V4/RAHIwbtv/rji/qpq/EQmYjumKqXB9uQ+PVSkmHqvlrHsXblv15reBSxqwhbU9w5
         wqntTGbLRML6ulc+bjqGdTZ5hVKiSnyw7YEe4q+HMFR8Xs8gnmbxT/MURh2+S0jixOZt
         wNSi3BcYhqEwS1SowBBERST5BwpdKJyGL0cTy8f/o6fsB4hR8VvYwtlW6Qz/dz9rJfnP
         PKFhaQSHK2npl+Ub846OQRcmIB/ipdzjYLr7T17E6x7HI95eUu9Azbqhw4y3L1IgWNSK
         BA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769799457; x=1770404257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=DpnGo4cL3l5b01JnbUHpaa5BOkf3E3e2uZvtfBUtCRS3+pO56syYRlxifykh5Ck2+z
         JUivl8QIa7oX3I0rLxmeFktBXA90pvKkhHQsy36GiFpeZgy0k2TvnS8AQIlW6kptNJV3
         1bqN0kLURqISjD1L5VQQDOuX55+zP3JJFB99VFxm2Cg/cx4B1FUCRsmIVQZV7xpTXXwQ
         JjzloN7kjRZoFX1CvbywiyGcZa3HsdIYacLGFjipQBwKPRXC5eibxTN0mzS+suAVboTP
         vfkQloKEoT8iXiz4SMFCqw28hovQ0OP0DmP46Pk0EjUTz5YX101T/hJ3qwAa1CmJEBrT
         v6tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDHEx5ZEyUBm2phSRpyfFhVCFvUe4ektSAZkN7tR1JRG8mOgdXNznB0jcK5+4rEDZ9E+A8c5V18xI9j0lI@lists.linux.dev
X-Gm-Message-State: AOJu0YwVRk0llRADFEkWTVOwAXHpPoYagEe9bnHDsjA0S45y1ThVjMNh
	MmuBtOh9IjeqCtAir/XDbVFgI5DX7zLUetLCt2oN/Quhjv/2cL0VDTQ=
X-Gm-Gg: AZuq6aJBCqGTHltD2gjv+tzYSyGSI74bF8y0GFph8qlXyg6FiJxcn9GhxQIPCU/nd2J
	xyPkalBgcVMk9ibjvK5uYAmERtAIE6OFpHvssjyx2wlESVkZ5LFhtWX+Pi4kq+Lw5T7F7AOqip/
	ndhy77xoatBxYBWmZVz47pSTKh1A4XDY7xXiY5idl1qjdXej+V912gnWnKTfHqc5yil/+4jPTwy
	RyertekzisgfpSkxoh67ja7kwPkgFf36MD3WPWlBGAtfL1I949yvb3SzbVEba1ItIaMKKxOXCjV
	fs1z8zqsisiZCpfkbnTTCgFD9FBSP7Ol01UZxmkFf07e+DDULJdJUa6qqnoZPgfL2bVahRMREUp
	wIjOoCljjRjNQovk3w9Zut2woU9/x21HUfFU5xMP/TMjVPrQz7u0du3Naxri/qa5wkztuw9A1jT
	AcpaRIVrELNnuFOnYxU8XcC33juJT1BW3sXmGgD5EylEUqONZZgCg3vcjGvVR89A==
X-Received: by 2002:a05:6000:1786:b0:435:dd81:4f4d with SMTP id ffacd0b85a97d-435f3a7bf2fmr6863728f8f.26.1769799456973;
        Fri, 30 Jan 2026 10:57:36 -0800 (PST)
Received: from LGPC ([31.223.131.55])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10edf62sm26474164f8f.13.2026.01.30.10.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 10:57:36 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v6 3/5] staging: rtl8723bs: fix spacing around operators
Date: Fri, 30 Jan 2026 19:56:56 +0100
Message-ID: <20260130185658.207785-4-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260130185658.207785-1-lukagejak5@gmail.com>
References: <20260130185658.207785-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix coding style issues by adding missing spaces around operators.

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 28 +++++++++----------
 drivers/staging/rtl8723bs/hal/sdio_halinit.c  |  2 +-
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index d75a63fd8a6b..ae5e4980ed06 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -17,8 +17,8 @@ static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 
 	if (enable) {
 		/*  8051 enable */
-		tmp = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-		rtw_write8(padapter, REG_SYS_FUNC_EN+1, tmp|0x04);
+		tmp = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, tmp | 0x04);
 
 		tmp = rtw_read8(padapter, REG_MCUFWDL);
 		rtw_write8(padapter, REG_MCUFWDL, tmp|0x01);
@@ -158,23 +158,23 @@ void _8051Reset8723(struct adapter *padapter)
 	/*  Reset 8051(WLMCU) IO wrapper */
 	/*  0x1c[8] = 0 */
 	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
-	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
+	io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
 	io_rst &= ~BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
+	rtw_write8(padapter, REG_RSV_CTRL + 1, io_rst);
 
-	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 	cpu_rst &= ~BIT(2);
-	rtw_write8(padapter, REG_SYS_FUNC_EN+1, cpu_rst);
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, cpu_rst);
 
 	/*  Enable 8051 IO wrapper */
 	/*  0x1c[8] = 1 */
-	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
+	io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
 	io_rst |= BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);
+	rtw_write8(padapter, REG_RSV_CTRL + 1, io_rst);
 
-	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+	cpu_rst = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 	cpu_rst |= BIT(2);
-	rtw_write8(padapter, REG_SYS_FUNC_EN+1, cpu_rst);
+	rtw_write8(padapter, REG_SYS_FUNC_EN + 1, cpu_rst);
 }
 
 u8 g_fwdl_chksum_fail;
@@ -268,19 +268,19 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
 		rtw_write8(padapter, REG_HMETFR+3, 0x20);
 
-		val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		while (val & BIT2) {
 			Delay--;
 			if (Delay == 0)
 				break;
 			udelay(50);
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
 		}
 
 		if (Delay == 0) {
 			/* force firmware reset */
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN+1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN+1, val&(~BIT2));
+			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index c774a9009e95..668616efa68a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -875,7 +875,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 	val = rtw_read8(padapter, REG_RSV_CTRL + 1);
 	val |= BIT(0);
-	rtw_write8(padapter, REG_RSV_CTRL+1, val);
+	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 
 	/* 	==== Reset digital sequence end ====== */
 
-- 
2.52.0

