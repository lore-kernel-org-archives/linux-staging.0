Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342CD155757
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784984012; cv=none; b=uwSOZ5Gsc3WMwED0ozJwVa63+Yxz/K5ufMZQZK/FvON7Wj5ocsQSwXJRnBMJAbYFjmWlT3RvRVRqyDSXwyL48LSUGim2kKLBosYNRXWZfbFwx4jrdCv1/s4zxd0dFxWSIZYZl3L04R1bDSojc/BNVlM1Q+wnm/qS4D0wozBetjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784984012; c=relaxed/simple;
	bh=S7KnqgMTQIbRroK8xhBPb3cA2xW1t513juvtc0AMLHk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s6a8eZZbxhslCf95DIRc4bqJhnLPvJxvm2bG8FcCNm3oNa60sr27addA8ll3YgJ2RqhZZPtVlKTiZlHMECyOjMcQVyN9XvSg0RbqFkIxd1uKzRXAGuLWktDYKn0ErmSgDk10KNbSDMVZmIOxi0oCSYGYz7/zgzqL/xgHOq8tHg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgIfif97; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgIfif97"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c7fd45465so11200571fa.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 05:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784984009; x=1785588809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zUIs8jFU+rLafDKamK4dRlJnHyno43NOSjDVzCLkgXY=;
        b=QgIfif97aouWPbkQPPhr7X7XB7RAJ2ZaISBq0pXWgitju4Oy8PI+jxyoRgBJvM7rkX
         pGvcfSYkQJjs1wg8R+jTot+Rcv3G2LFyVAY3FS0GyLase6EVV52FHe7kGIrzBupmgGLd
         ELYQZhF+hIw7JCfRjstMM+/NYOiqLayMw5INljMUrfwqITswilBRmRRIJKdgrT9uVQ7N
         Zpa8acZNsjgN2z5EGF22CGucaovPV2EAuToutCYC4ttvKwfeGvoSXC5nHA1ST8Rg01jV
         hwopH0PkXn78w4du4qDdmIR8FdSWobEMVzNzitOk+6k7LhOZHe8fP1qFtoaMEoa1tMV5
         pG5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784984009; x=1785588809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUIs8jFU+rLafDKamK4dRlJnHyno43NOSjDVzCLkgXY=;
        b=BxKMvfwL8xkMFPvUnmleUb3ixV7Xc1eDnmWrshdiccZXXd4RrO9N2WVIHP1cSAUdgS
         3voIQ7+yTPoi+IEE9ST/7sQi+0cjQbRP2kWTmf1KRnpMiBxMPDNf05/LKGAfv22iRDIN
         3cZgzmlli6YloJntGqIpxsabFkblJFHxu5JWzDtt7ohfl86cFSHEQBDNMhQyIfhNrxfA
         FEa2pgM4U+6DTD/oYUdEm/X5+DUAbqjU8ftmSg7a8kLOhEQZZe5tdsmwAm3qUgvfeS93
         rovtQVUeNs85YOiiwJw+W7DNAI8IKy5/4Tde0EPiDiKvpK1nAGb64QEH35CAYdDlYRvp
         UENA==
X-Gm-Message-State: AOJu0YysKWQzGrgnr6H/GsN0vDd5Fplq3XPMCuHGnjCRD8sEBlbe5F+p
	kfTz73o8imRAn+Y+PS7ifoh8Lg7sOi1b6SWkoa7J0NlVcRczd5Sh6z1a
X-Gm-Gg: AR+sD12vJCYNN0SHn9D77FDLyRf83boLdOB/m6WFxP2K9IkG8X3gGYRfKkh8KD2ulIP
	0AsK3yfCFLh9ghQYZIcMjcEOEGYlI1JdNNlZ8EEj49Lei/6xY3ep2m7+Ix1Xg+z5HAUef5bLUXd
	reNLagZMfil3MFF1Pv9uxg1xINWRFSsuvz0FPccWJf/eyQulTwvnuuVaEqKm0s5N8+XWfoJv1aP
	wZHWeBjxYaGVvC7R/bc4ZtBzMdED5nLuhRFAzJD2froecV1G7yBoRwkXcFk0Fqqx++ssDuTLlWM
	6ERPo3yU0Pc/+lRTFdIfPZigyITDfWRN+jBFB4k0I4f8JhH/3IIUICz7vD8EcCGna+TdRYFiENz
	6PPY0Iih5xFB/yg7bx0bQHCLIoQsZGurNcaKCCjLv9pZCcjI5a5r9rZUNiGNE0A77jSLzUvnpQp
	+PJGHncoPbVE5FjiGFGRVn9BBWxwg=
X-Received: by 2002:a05:6512:2346:b0:5b0:1879:1ba5 with SMTP id 2adb3069b0e04-5b2c1b4fb9fmr338720e87.58.1784984008832;
        Sat, 25 Jul 2026 05:53:28 -0700 (PDT)
Received: from localhost.localdomain ([78.156.235.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2be1d8838sm403621e87.54.2026.07.25.05.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 05:53:28 -0700 (PDT)
From: Akhmad <akhmad100913@gmail.com>
X-Google-Original-From: Akhmad <Akhmad100913@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Akhmad <Akhmad100913@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace magic numbers with named constants
Date: Sat, 25 Jul 2026 15:53:14 +0300
Message-Id: <20260725125314.39313-1-Akhmad100913@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace magic numbers 0x6404 and 0x660F in rtl8723b_InitBeaconVariables()
with named constants TBTT_PROHIBIT_INIT_VAL and BCNTCFG_INIT_VAL.

This improves code readability and addresses a TODO comment requesting
the removal of magic numbers from this driver.

Signed-off-by: Akhmad <Akhmad100913@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -11,6 +11,9 @@
 #include <rtl8723b_hal.h>
 #include "hal_com_h2c.h"
 
+#define TBTT_PROHIBIT_INIT_VAL 0x6404
+#define BCNTCFG_INIT_VAL       0x660F
+
 static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 {
 	u8 tmp, count = 0;
@@ -878,17 +881,16 @@
 
 	rtw_write16(padapter, REG_BCN_CTRL, val16);
 
-	/*  TODO: Remove these magic number */
-	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
+	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_INIT_VAL); /* ms */
 	/*  Firmware will control REG_DRVERLYINT when power saving is enable, */
 	/*  so don't set this register on STA mode. */
 	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) == false)
-		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /*  5ms */
+		rtw_write8(padapter, REG_DRVERLYINT, DRIVER_EARLY_INT_TIME_8723B); /* 5ms */
 	rtw_write8(padapter, REG_BCNDMATIM, BCN_DMA_ATIME_INT_TIME_8723B); /*  2ms */
 
 	/*  Suggested by designer timchen. Change beacon AIFS to the largest number */
 	/*  because test chip does not contension before sending beacon. by tynli. 2009.11.03 */
-	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
+	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_INIT_VAL);
 
 	pHalData->RegBcnCtrlVal = rtw_read8(padapter, REG_BCN_CTRL);
 	pHalData->RegTxPause = rtw_read8(padapter, REG_TXPAUSE);
-- 
2.39.0
