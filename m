Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F94A287263
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 13:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693062; cv=none; b=jrkyEc1tPBC4Z/VhL6ucObknL2p55XO1HX37bBvbdv+WidT6lc7Qt2lYyH4+SBIFtO3AVCk55vVtqHslblqaz48tI5UBRYXPL28vdwnQ0CtZQOwEId84Gtd5WKUjSRzcGxRKD981fW+QapC/HXq1kG9ztw4vPyszsQg2pCaKOR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693062; c=relaxed/simple;
	bh=rydnYZqJ+NFeWlELYNoZjjVmnW/PmZZQ4nMY0FQMv2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ODXLPgcSt2f4TueDJ+klQRuEMH0EnXbX2Udsx8bVTtM1byz0WSZYrwEe0+9TrFW+swJiBKlXvCyWgGmc7vT6gqVTXi1lv7T3oaHKhvJj4Yyg3svQxmD8VPr5PgGryqt3L5oCSMdFa+Agc+Hg2aCXlVQkPLizhpE2Rcz2kS0Yaio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqoIxjZI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqoIxjZI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4801c2fae63so7699565e9.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 05:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769693059; x=1770297859; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=jqoIxjZI7Be0y50f1d7Yi81n90HUEsw59DKtnoRxgjpKe9fdqsP6vGImVjBnxxbMns
         NBtwbf2Qr5IKjw8ILTyv02aU31D8HQps3KIA1VRNgW7P03vhL5HNOZ0vsNhXhIY8DeIU
         Mo7lcHfuPFtCnIGlUsl/PXxsIH3diS+g9mY7+ozelSP0Th1qaWfc/uI10iP6g+7t3MNf
         6MOx3gL86JRGCYYna/tno/GTrS1PKDg6tpcWWjxZVMkiXa4e0NocXBt1cuKteqWGgHEm
         1WUe3qQwX8MblOpqedw3CbvSScxBuenf5swBX3jIa/fY28jAxNXPYeW3s4aTgUMZD/mq
         yQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693059; x=1770297859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=itsgzrCz2Yf6Uryqzwzu2QWjHF5Dbr5bnBZ816xY3xM=;
        b=c2K6chxq2oO/hnA82U3AeCs0YAu5ozJjJbZvQ2RTk+J7SkV/SEpeKJdB6yoXp1Rgi2
         xfN8QDUxRXKP2uBNiCUZuQ2MoUYEkF3h1sX9BaFP/YVQD6azynTokdN1zp4x93E1urI6
         cIjusYWQneP/v6DTJhYjOrIcqGeIav0gb3rVLvYetcdbA5u61hKN7kNjzDoWbxmdxpph
         DTNFkDDVb5zY+inRJiN5CKZz7ye1hLw1nHuTzOdfyoNPxrr7D4DGwBgesD0a+jMl/trh
         7KxJHyDi4J9oXUOe0ImoGuCcw9FyoveB45oi0ZrDHeqQ3XPtbQdg9D9cPhU0TOD0XPz5
         cUmg==
X-Forwarded-Encrypted: i=1; AJvYcCU9qyTrU+OPjS0ZP0n/OvWXvO79KVta+ta5dmRVeNMEJJURARegeCH+t0N6WJgA7I4CxNEYAjrC8h6JvEGj@lists.linux.dev
X-Gm-Message-State: AOJu0YyeFj+T5peOmTtvWIXJyplhnp9cxI2YssUEWz9kJKMGRiB/QBIK
	wHsxJG2b3ITG+ZU9MNoq0Glw24nAn9CGsQd7MHd2gcGdPSvIVxgba7KKRYqPByQ=
X-Gm-Gg: AZuq6aJpZo1A/YhzkAWSj+hrmtR3/2wcMowRpjXA9QBnbL+YpA0gTBczUibQ4snuUeD
	kH8e1ZpIqSwNIFX2qAzOws2ROaeymeeoWFHi8L5w8qISfQE6RT5BwQcSfGOyvpSaIQigmOniYX7
	UHTLACippkxntn5coSoSRqr8phSgWOh/LM5XFLtcbhbYC3bum6BDj/3s2e2vqmwRTOKqEgc1G4i
	vUikR3eD3XwCyx/FIT1WKVRnSONo+yCX6dUiCGzqYkHOh4bojnWAD7xHk4S8BJqRfzIttB+UMEV
	H1rxA+U8Wq4T0YjlHZOlQmkPAEVrQpUElwURGlZXcQKGFI+9gxAj0lLqY/FnAEwXFY94jB2VYPC
	uEMVk63a1vw9hcfQeN2rNsjsbwGTDRcV+qg30IOXIHHipktkHI39hSxhY2OKf4DjvBfc2frPNKu
	4z
X-Received: by 2002:a05:600c:450b:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-48069c0e6bcmr101345105e9.13.1769693058670;
        Thu, 29 Jan 2026 05:24:18 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm217492315e9.1.2026.01.29.05.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:24:18 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v2 2/5] staging: rtl8723bs: fix spacing around operators
Date: Thu, 29 Jan 2026 14:23:49 +0100
Message-ID: <20260129132352.14615-3-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129132352.14615-1-lukagejak5@gmail.com>
References: <20260129132352.14615-1-lukagejak5@gmail.com>
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

