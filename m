Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADFE30E853
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 06:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783752006; cv=none; b=FglcBnl8u4r/oMyNuu0ddYxAL9ejdjIMtdJOXg123twsP6vnDvvC3XSncHHpyauQSjCc449oJse/sOVl7xcffrcAzlUpxWddeNSxOv6mAQck+HYtKjGyC/IfuPjruzVfdcqDf6Ds8HNSWMdYwlnLbDgElLRCf8H9eMtlioaQvXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783752006; c=relaxed/simple;
	bh=GQ1TAWjjBjrlB2S9Xqz1fc49hfjlJo5p0+PdZds9EGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T1zOmo/4Gsi/0Ur33RdDf290DqkJNYzhecbJA9pK5y6mEdrqxuUGw+RELPZDlObA8ryp8iOjZQaxAidAd5+qtFUVvJ6aJnxgdNoI/SheTkpvvlcBvJ/qClFUsqstw4Zr1g4S46Ptih3hG5G9k4fq7S0nKXEJ7wLFTatMlBdGxV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9gL6QjS; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9gL6QjS"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1106130a12.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 23:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783752004; x=1784356804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJ6EGOu7YfdhOIrZiHiND5M9DO4WwcJm9kCM/Ck4sNc=;
        b=q9gL6QjS8mbndSfvZoSKepk0yTvlSQ/inu59czU3ti7nEu2jzcR1KxOMamqhVZg4E6
         /VvuruhqlurrrmpkKsjkB4D9fS7u6CctguAKxB3v2G/snNikWOKYgwBZeAWyG453b1ht
         1rGZGqRE6u0l9g5q582UsjpAGV/3ySdeq8Pq/fmWNk/xdhHubFVCxW3PdxFcYTw8S0gt
         87l2TBioGHd+DiHiLDLI5N//7lkzbMtgL6Nf+EBykrpkTAP2PX2ku3vSp0WV0WVbHYTo
         4ZOhygcMGkdcOeoy2WJvtS2MXG9w/9EJf6pbdOo8ZImNMB2SKkjLE6myckrkg8vEymr2
         Uj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783752004; x=1784356804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJ6EGOu7YfdhOIrZiHiND5M9DO4WwcJm9kCM/Ck4sNc=;
        b=C+VP4eVd9Inlh7JqnWN9QpJX5FIdQc9ib+/a2DfJ3xpLMB6Gw1a/Vcas0J4rtq5Hv4
         986arDRcbVfPEGLY7j1QrwA8lX0Y46DN6KRHMsmqOEJ0gj+3fMTvjtNyftkYeeySNRwm
         cA/9jU2xAZP0yEj0wtlYVy9YQCiw1qFa1kA9+h9xBag7PNYYsqgCRfybsdISxMIVXjSb
         f+pEWGWCc5ji+MxSz0sYOnhdvarHGO3LxAAIOrvzep81qVnSWazGzdmkqg77bFCz/eN8
         47vfxOXVb+aPM1Fthxqsx5W5B3vgM1q6bXtbS2Di7TsZe5zotBGH+RNXhGzCngfot9hS
         kosQ==
X-Gm-Message-State: AOJu0YxcA6Zx8+yLtrB3rp4FuJuyv+xUNYG3g4ImmZsolYr4WVpXYoyx
	UtlUmoIf49ZEWAF38zpIdlQyPLt/fFfB/uRPv/x0fRPoE78A1mMKL/D1
X-Gm-Gg: AfdE7cnsg90tAHjE0sjbdfXisYbx1ary4PorkBOyQW62TXVdi4VkZ0W9W0pAiiGHB3Y
	estOOnVWLkg28KNEx9Ag0zpkQHm6b2+n0/fQwBmsgWJL+Lru/uq7QlF70de9zX98CLLtNMVNlwm
	wwkFZxXaQ2jQIAkMAWUr37bAP/Ofk+hdQI5HR90CNbjn8N7ZNklro6+gA6s08NcYljk/UYrKKUq
	HnOBfozvEXvQzI2D9rdzDkeNvyNEDO54luC6Y9vBnpGoetBATDME/hwaB6diBsvguZId9Wpj9GJ
	XrsrXrnMI0kowTC6isLUUK6DHCbfB/6X70LfXP03sKPegknSeUONPNuMrXnn6sGbpo0GFW4CG4S
	LkDRm3KR425Nc7hhjLBGlkkrQlqPbEztBMeDGkhC8JiZUN/91OsMAQqOlyvZFt2WBUlBBtGdmPM
	X2QC/cPa0Ppopi9Dm6tR9S91m1IbGx
X-Received: by 2002:a05:6a21:9d48:b0:3c1:85d:fa2f with SMTP id adf61e73a8af0-3c1108c2d4fmr2062836637.36.1783752003709;
        Fri, 10 Jul 2026 23:40:03 -0700 (PDT)
Received: from localhost.localdomain ([116.68.83.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311b00048a3sm17907959eec.5.2026.07.10.23.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 23:40:02 -0700 (PDT)
From: Anantha Krishnan <ananthanr.off@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anantha Krishnan <ananthanr.off@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: replace magic number in InitBeaconParameters
Date: Sat, 11 Jul 2026 12:09:02 +0530
Message-ID: <20260711063901.30828-2-ananthanr.off@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026071157-ovary-property-4427@gregkh>
References: <2026071157-ovary-property-4427@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Per the bitfield comment in hal_com_reg.h, REG_TBTT_PROHIBIT packs
a "setup" time in bits 3:0 and a "hold" time in bits 19:8. The
rtw_write16() call here only writes the low 16 bits of that
register, covering the full setup field and the low byte of the
hold field.

Replace the magic number 0x6404 with two named constants
representing these fields.

No functional change.

Bit-field positions are documented in the comment above
REG_TBTT_PROHIBIT in drivers/staging/rtl8723bs/include/hal_com_reg.h.

Signed-off-by: Anantha Krishnan <ananthanr.off@gmail.com>
---
v2: Use full name in Signed-off-by and document the source of the
    bitfield values (comment above REG_TBTT_PROHIBIT in hal_com_reg.h)
    per Greg's review.
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b2893c..699e24f52392 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -11,6 +11,13 @@
 #include <rtl8723b_hal.h>
 #include "hal_com_h2c.h"
 
+/*
+ * Bitfield layout per the comment above REG_TBTT_PROHIBIT in
+ * drivers/staging/rtl8723bs/include/hal_com_reg.h.
+ */
+#define TBTT_PROHIBIT_SETUP     0x04  /* bits 3:0: setup time, unit 32us */
+#define TBTT_PROHIBIT_HOLD_LOW  0x64  /* bits 15:8: low byte of 12-bit hold time, unit 32us */
+
 static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 {
 	u8 tmp, count = 0;
@@ -861,8 +868,8 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT,
+		    (TBTT_PROHIBIT_HOLD_LOW << 8) | TBTT_PROHIBIT_SETUP);/*  ms */
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (!check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
-- 
2.43.0

