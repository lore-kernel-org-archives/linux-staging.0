Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693D326E71F
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783737763; cv=none; b=bgH+n9i/6JmwhHmzWfFmOsXDnlPZ9UiTN35kfVraIAURNZt1YCQPMLvVucH1bckLO6uCLMsJlIMxU50TtbxbxlA30icMqTepNT22hjC0ahe0QovdL8Gh8xdEI/IfZqs+GGatYYaNRuAN7buPHSuLsIvHH9/VonsI0QkSgJnWs1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783737763; c=relaxed/simple;
	bh=qhzaz5c7gqai7uH8ENp4OXcvcRx5rtyjEEv0SrYq2GE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BRbRWIxlbvC2cH0T3j/Kr6OIUifYttfVWFmt+3boM1dre2z+AHrYdpPUOCXd1A8wwg3flBvvIQ+NVMrav/04A2gxTl5vE20VIcsYgTuVWj/zjTHybZ2ZkBAnFpSYrxtLS5t4PXz0NgCC3BF/z1ZvSYk27KRNW1srpnsGcigqrkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AHsTE0oA; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHsTE0oA"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1850463a91.3
        for <linux-staging@lists.linux.dev>; Fri, 10 Jul 2026 19:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783737762; x=1784342562; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+aTWheqepBxqS9cLgqp6GBAdIX7fO7wElh36f1viqvM=;
        b=AHsTE0oA3RIuRgarWpiMOSeL48j/IzF6W9N6bsnyJ1DLLr/4Mkfz5h6sR8zZDibtDj
         Sb5Cy1FrdCxmBZDMv1kTF9BwpDpCcNmTyECOvgphJE83WVAlQcHv3Xz69tJES/FqZ1PC
         NnemswS/dgJ3o4z9UT3fqGsAKLVbvqNOGpFV01LN55yacZJ5XAFgurTcfHf089EuPlbz
         S7lRopNBuxhZLFeCgx73rik3ZBCcc/fp41jti9GFIh/sw9ezj9kWZKhsUJzF6yghrvZH
         SBSbYvKuFAxoIYyUqE6CyCTvbhpSqmjmnNmKvPL8fBwl7Np3g3xkwLZZI908hyajYA1g
         Xc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783737762; x=1784342562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+aTWheqepBxqS9cLgqp6GBAdIX7fO7wElh36f1viqvM=;
        b=JYSUBTxg4Mv3zAtzl0hOM7YFH5Caqu4Vqlwe7ds30x2xx6VvufjvddEuzjPU2Ga8o6
         h5Hppy850FT7AV3HsK6hIbkG3Qof62QGxze7euArNTIy18iLrZ8qZ1tP9sPUyCstUPxP
         m+EGQ9oD7CgPfOgezB5vP57X22ydhBnOwqUPzlvzS44nDMkmwZ1MxjLgD+7bb3QG3PXo
         LPS2YNM8O+1za5FWiJ/elBSU20uvI8T4UtAojEgdbXulbH6ZiiYrokON3LyRYlJ5eKpB
         uWbUstbN5rnU/nW2GDywWj5wIkD7xa/zyv2SOfmofgdDBsHbdnxhZTGE/KqsrBQtc1hE
         7FqQ==
X-Gm-Message-State: AOJu0YxvrGCkDJo3AXAMU8evREMQToc94p5ZC2lfkttGFtThetgW3VOt
	F5fHv40gpSWaEnIfjYL64VVVvQq/M44ot5qJrD5KW4fewG/Q+O2AyZWR
X-Gm-Gg: AfdE7cm3Fksir88VNv45fZ7t33SPqgtStILKtUyDPKnG1rx0NadsuPdTf/SpbO+zQI+
	LQdl7GWfucOxFOzAJA2y9bMMu90hgt7RyO0DwRppgbN5CcrjCa2H0IcW0fY8TG/6AwEQ1zsPLCL
	0fo9WOfrwi6Co/emGxpeZ9ckF8aa9deiqT3fTZDcd5RPL3Qy3yJiU5J7iQETFIxuo5AqwP3TG9W
	fKc+XOu1aJnkmrksiKTHpEr1jPA2hLqxOvYKuVVxNYGLXjX9kkarlI5tQQ+1lvcPOrC7evdkPaP
	Ks4y76YdCMzQzWK3ceEr3hRyAr3C04k2tFYFneVbGCNGdUnkLgT1R//BIwzB3miYUkr13kUVzmz
	X5lT5X0JjcUc9MJexdbPAsteqzPRe0Jae9EQUs/i09dNKsYMLGoBbWzQMGeLAbb8o6J5upaUdVL
	gxrjw6hQTgQcgL0LC5NGq9HRu42ZNZ
X-Received: by 2002:a05:6a21:110:b0:3c0:9c19:65b2 with SMTP id adf61e73a8af0-3c110a7742fmr1779738637.74.1783737761855;
        Fri, 10 Jul 2026 19:42:41 -0700 (PDT)
Received: from localhost.localdomain ([116.68.83.225])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm45686757eec.2.2026.07.10.19.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 19:42:41 -0700 (PDT)
From: Ananthan <ananthanr.off@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ananthan <ananthanr.off@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace magic number in InitBeaconParameters
Date: Sat, 11 Jul 2026 08:10:06 +0530
Message-ID: <20260711024005.19900-2-ananthanr.off@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Signed-off-by: Ananthan <ananthanr.off@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b2893c..9609ae025736 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -11,6 +11,9 @@
 #include <rtl8723b_hal.h>
 #include "hal_com_h2c.h"
 
+#define TBTT_PROHIBIT_SETUP     0x04  /* bits 3:0: setup time, unit 32us */
+#define TBTT_PROHIBIT_HOLD_LOW  0x64  /* bits 15:8: low byte of 12-bit hold time, unit 32us */
+
 static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 {
 	u8 tmp, count = 0;
@@ -861,8 +864,8 @@ void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 
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

