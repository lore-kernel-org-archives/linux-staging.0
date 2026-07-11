Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E45EEC0
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783751121; cv=none; b=LQbhgVMn8i/sN4jEcImnkPM7y4sS28JBFUPwlp54d5Y1HblLPDW/tEN1toVVTu0TsDsKCaXCAxgszo+DfMABUXGYQNXaTRWsjqbB/mHKiO+rmLRM493HXj2EfMsqG93mnRj5a62SrGNfx+4Xst6ltZVw5ORGX9iouOZlziW6H8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783751121; c=relaxed/simple;
	bh=Vmurisb9eB8FtZsRd/bofS9k3i50a6aT5Y5TF+yMT/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i43vIWaf8UF6MmMn61BgfEz7KdjFv4kDSdtsu7NJmryfnrNjbf7lFqaUJFo1h8M6doPaahNtKKBSCzh2BhBEpAFMdBeICtMHz40fGOuhlpJ7LgFknsHbTXMMN+WYms+6tDFkfk2hUijg8wAERAL7UiComm0aN33NzdJMitTOWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAbEc5Gs; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAbEc5Gs"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso1990646a91.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 23:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783751120; x=1784355920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HflrA3DS7s9sHksbSEJbprS8Xnl3UhqhC/sOKdZCX8=;
        b=IAbEc5GsqluKmbJ+OSEYhwZk9RUXVr5A0gB6vOQhCGMMpzQgC+Qs8ZjZqscb5H6sTy
         SKtrmC25rhTEWJgFElRLZ7CEcUXtFGo8N9v/A68YcyX/xN8SUr9hUro+ODYBi72bpvP4
         aIGtB5Y63tNUC8rvbgzOJt23VxdJ+Yvu6hlc/OcNjQY79PVYLfS35gE7WDKZZsRFTS3I
         NcOx2EVgfYLBy3XEUv16rjznCc+qCdpKxo+0bmqij5sWamz3p4u5TTNedfFIHHakX6xW
         ppYZKkE7SSwblpA3KS2BReRaTHTwty1jvCCCeUrkY7Q3blGwyxhOdZPLLMuxMqsbYdmR
         a/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783751120; x=1784355920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HflrA3DS7s9sHksbSEJbprS8Xnl3UhqhC/sOKdZCX8=;
        b=rOQvDYpPnnWjgYQfdPPsKM5/I4D6pkluhrcL7YHbMBabVcUAa+vg3hkhDr/lxgdxs7
         VOygEysRnASuv4b/7VbKGdjbhzcws7/4aGCo3R7v+/K0EEMANRhbZamcwwCmwWURw59a
         Rme0l6tHNotM9PpH+mAtaRcKiSvpaGIxjXKNCD5RfOWlGJSariEOVV7wjAOMEM9CTQvk
         JpJmY1IeF56wjSP7EmWkqx3oWUoIEM0sdMhALl4epMt4ckNgq6dhzjPzLMn+PcJ0yhTN
         jiEaJLPRcxbEph0BEgG+4a4/D1eLI9MxXEbH7wqfG1IVnFtpEire/XhpOZFaKjIG5PEe
         KPFw==
X-Gm-Message-State: AOJu0Yx2Bth1OAGAPF207fT4AGOHk2uwFwOIoHRd5yhPa03+cBjo3pAh
	qzUFQSzBBQqwn60minPPRoPdWZmPv+cHlD5VsFjNPU98IWTEFs9HN+SF9FPsrA==
X-Gm-Gg: AfdE7ckhPdrsvA5xYT+vnHKOfOKAfX1+fWLkx+OOVCkYsinpKtK+Fy97xs/lenYnayq
	XCqIDSFaezq/u5NjXP3eRmHJ2Rm94opLMOWeJWBCqftNL4xXpgTzL0spMfrbRM4FrFpr7iC5udF
	Y2stVb7cayo0kvhMjjOlRJC4itpA/gMnxembleYYJoSet8WZ9cxzXQne7A68mT91kWq2dEnLYI5
	RIyHKcJDExZPqM36DwfQGpuXpQuF7iR4FlsIPp81xGpCnk3+vugN6jPonHqE4dFXLlTvjKZRpyK
	TL5jCFuHIkx9Px17h8VlVDkzQwlP/703XTZLJ2E34Fr4mH4Y7mAxue3ax9dsF2faGvrRrJjD5sG
	XS7A8RGoSGs6tdor1NpJRqhsbYxZKFeEcdrDnAG+o9G5dBQjWNGcRXRTR46L00PLS59EGZ0XBUz
	v4xnvALhIAWR1Rb1UFUBpu6BoEMPWD6NLu6krg/DQ=
X-Received: by 2002:a17:90b:41:b0:387:e0db:3d8e with SMTP id 98e67ed59e1d1-38dc77c7b37mr2121398a91.41.1783751119919;
        Fri, 10 Jul 2026 23:25:19 -0700 (PDT)
Received: from localhost.localdomain ([116.68.83.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118ee6080dsm31644604eec.17.2026.07.10.23.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 23:25:19 -0700 (PDT)
From: Anantha Krishnan <ananthanr.off@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anantha Krishnan <ananthanr.off@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: replace magic number in InitBeaconParameters
Date: Sat, 11 Jul 2026 11:52:49 +0530
Message-ID: <20260711062248.28968-3-ananthanr.off@gmail.com>
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

