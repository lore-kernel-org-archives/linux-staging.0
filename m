Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0D3B1002
	for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260133; cv=none; b=b6XozgLhjxEXs8ju3Vyq+/eZSp6IuOGC/+vPc2+GSKOKYNHGNxURRcRmAjxo1pj9RXF287pYESAb9grkeRqaIxrGkuMTxqBWOOtiX3z/eIiQEp/qZ1VuUTuSOYT6Ba1nu4KySfLlx2ao7o8fIOowEnOXDN1FgTlAXg3/Zowq8pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260133; c=relaxed/simple;
	bh=Yw/YUvA12OO6VgsUOBveji1XvSY+TJjyKNA0wWqXmuw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WUTb2yQkW4mL5J5xBwRrIrRapkvxU5ofTNlNGwqkUQ6roqtbFls+B/g2rEAiI45K9NnifqUSsOqfMrP7bd9UD5fFG+K2rQA0OhLNhXmnG/xJWYbGC/s+XrFNpxu9dUkaB3pXeMipVUopRPguAOBmLYhsJPSQg/Ri4jYHMChmXjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6+rRSb7; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6+rRSb7"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so6778985e9.3
        for <linux-staging@lists.linux.dev>; Fri, 12 Jun 2026 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781260131; x=1781864931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NPwrd8AEEJpLpPiii7ZXmqLDlDGZgWRUjRrU+6a2tH0=;
        b=h6+rRSb7L/k743DuScPbVhUTnrpDWA8UJnk4yjfEUyawlXf3KPnsrbCMl4SCwv8TRX
         coFgoteZXxDShC/QZUa3EjOotxUQxL5N9ZLmxM77D4jgefJmRM/nkNjsJHusoHzLfCrP
         fEq6TiwTpTOFCKoYn+CLAHLfGVc0Fl7uSq2y/4sR1TRHK6slTvfNJAJRl8ynkOozvvUj
         Nbjsi48wsp3c9JqoTJ+larwbY3cZb+mrID7qZ6x30A463IkQxbiuADrVbbgWG0kAuAbV
         IwnDAlhCJizr/Q97+d8UaO53IvNsqH9xkUz0ZFUXe8AMlXlVk9CnxThZA7HfUvQef1Xf
         ja8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781260131; x=1781864931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NPwrd8AEEJpLpPiii7ZXmqLDlDGZgWRUjRrU+6a2tH0=;
        b=U75n26Va/ci6s7ZMGtdnqnlNNjh4rWzkeqrFV+D7E8RWVVM8Lc+ovIIyCUOcHiaKO1
         0FIXMDiEbVFr9ecOwFAGfoJ/4vANL1gBQullQjSES3+941f7rXSS0k0a4tW7MVJSis28
         bcoPoUZOA4egS8k/602i7biprHTVg+zbaJPeATyr4VSjRmMu3RJhAoIQp1W1oAuixVqn
         NIHcjGZq10j4VOawnLzsvP4UYLRVD92FoIWdT90Zb/B7cHING6V72oieKH/udwHjpuXq
         4CWilvaOIiLoqMR/PNCoFx5P3yCmrJ7QtFnf0wove9FmUYDOdpwCBGaSfRoQ91T6c6E2
         4DMw==
X-Gm-Message-State: AOJu0YzKUYoFK7PFU+aMjp9iKi18yBuvB7k5XDNJazdGpBJHgCIxbR0u
	k6lvM7BW/AABRRPPW+siM86kUGGuqRquoy5k9O181iXW760BvOycRORD
X-Gm-Gg: Acq92OHD0j64MbtYqgJqdHMvIKXOs7rZBlpL1HGuyBBLgLtN9gYwPJ1a69rUNh0XM1v
	geqKZXL9nNx5LI5RQKt4N9HhcKjCyLXPGwBNOMpMxRHGdVHHYD7wjomc6TQHIwuAKx1Q0Q/aP2v
	+RO+U4YlSOdDF5Ktwz9oEYlcPYmslsXnKPpbklAb3rPiaf8occg/u/2tyuS4gvhQrug0UofsPLr
	Bz/ax/y8wnAN5uYZOQhrdpLBoOjVvvxKmx0Vrab205n61tgHE+80Nigg8z1chDERurK6DYlgJV9
	iOIK+E09MJaEFVW/UKUijwoM+Pcaa0KiT5gfc3ghVwv0H1pDRdQzEm5NkgaC/6hmBjrcvugq1Qm
	r031WG7Skjll9SFpyyifUEj735Vpn7pMmqvDOkLiqtFh/91Oi0Y0zKnT0h/8SoR78hf1CdWEBaB
	7PX0VY8rS7wBX2c8CBtaTixtiLbDudKw7oBYM4
X-Received: by 2002:a05:600d:8497:10b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-490ec5031dbmr18854455e9.22.1781260130738;
        Fri, 12 Jun 2026 03:28:50 -0700 (PDT)
Received: from home.powerhub ([2a0a:ef40:30:7801:2655:7809:9974:b326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2637ccsm4358881f8f.6.2026.06.12.03.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:28:50 -0700 (PDT)
From: Quentin Strydom <qstrydom0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	qstrydom0@gmail.com
Subject: [PATCH v2 6/7] staging: rtl8723bs: hal: fix space-before-tab warnings in rtl8723b_hal_init.c
Date: Fri, 12 Jun 2026 11:28:33 +0100
Message-ID: <20260612102834.39935-6-qstrydom0@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612102834.39935-1-qstrydom0@gmail.com>
References: <20260611162128.57870-1-qstrydom0@gmail.com>
 <20260612102834.39935-1-qstrydom0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments to match kernel coding style.

Signed-off-by: Quentin Strydom <qstrydom0@gmail.com>
---
v2:
 - Rebased onto staging-next as requested

 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b2893c..a71d44484905 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -283,8 +283,8 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 }
 
 /*  */
-/* 	Description: */
-/* 		Download 8192C firmware code. */
+/*	Description: */
+/*		Download 8192C firmware code. */
 /*  */
 /*  */
 s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
@@ -437,7 +437,7 @@ void rtl8723b_InitializeFirmwareVars(struct adapter *padapter)
 }
 
 /*  */
-/* 				Efuse related code */
+/*				Efuse related code */
 /*  */
 static u8 hal_EfuseSwitchToBank(
 	struct adapter *padapter, u8 bank
@@ -1310,7 +1310,7 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct TxPowerInfo24G	pwrInfo24G;
-	u8 	rfPath, ch, TxCount = 1;
+	u8	rfPath, ch, TxCount = 1;
 
 	Hal_ReadPowerValueFromPROM_8723B(padapter, &pwrInfo24G, PROMContent, AutoLoadFail);
 	for (rfPath = 0 ; rfPath < MAX_RF_PATH ; rfPath++) {
@@ -1834,8 +1834,8 @@ void rtl8723b_update_txdesc(struct xmit_frame *pxmitframe, u8 *pbuf)
 
 /*  */
 /*  Description: In normal chip, we should send some packet to Hw which will be used by Fw */
-/* 			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
-/* 			Fw can tell Hw to send these packet derectly. */
+/*			in FW LPS mode. The function is to fill the Tx descriptor of this packets, then */
+/*			Fw can tell Hw to send these packet derectly. */
 /*  Added by tynli. 2009.10.15. */
 /*  */
 /* type1:pspoll, type2:null */
@@ -2246,7 +2246,7 @@ s32 c2h_handler_8723b(struct adapter *padapter, u8 *buf)
 
 	/*  Clear event to notify FW we have read the command. */
 	/*  Note: */
-	/* 	If this field isn't clear, the FW won't update the next command message. */
+	/*	If this field isn't clear, the FW won't update the next command message. */
 /* 	rtw_write8(padapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE); */
 exit:
 	return ret;
-- 
2.43.0

