Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52323822A5
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 15:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776006420; cv=none; b=X2QE/nmuEK4LlwzucSWCiKz+UMJD0PX9NYjd3VNlL9l+UBBxNTmqPynFsskPJTdkZHznK2fzN0mNLmkI4LQwPsD6zjnlpby2uMqTVwVHy77dKk5QsDcFl1ENAnV1p38ndUfIdakxB4HDJhN4O41kqHrl4MG3QhI0I6EzlDXaaSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776006420; c=relaxed/simple;
	bh=1WR6F+soH8tPfpJjOUT9wNgD2eRJTjcP+Y6w5TymdK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PS1IxdyFAghqQBLC1ZGV5M5VZhnzCsAhjwaQDdAv/jrcgu6cBgdvfCD0OYc1Nv1NVBThMRjiiQ0dU68a5FdQumvnXhvD9+r7k0scGdK1z097mMf4Al1Oj0nWTKM8fV+99wCyY2rma9iOS+6bHfhGCrRjnIARILdakrd5XPtoVqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fOWkw7jm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fOWkw7jm"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so2285793f8f.3
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 08:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776006417; x=1776611217; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HhHUh9oMvar+Jto5PAeJ4x6D9kftv4Rry//SVWb2AU=;
        b=fOWkw7jmv7GinAHNIkJ+p3xwqbHUprSO7UI+m74X0TF17f7n7FlmdWfxE77Oax8Htl
         48tPPK4EosmCkzKM+Mmz1w+VNFh6EbOPy7WYeizvlbkRCUK3+jhqYH6CrPq+blJiEKkY
         6fo/3RknGkZ5AN5ssZ8aGoshGEnmpIyoV0AAaim8ScS71egUxn9eRiR9uevZYTypSFhH
         euTkEmQNuy9RuZDlk2TizbfeIYqyJOFgf75rnU/j6aaiq9SgO2LcR/PPyNQsvXnvWBmv
         P+2Ih8nV6rDYhrWlYRmMmyheOSgF4J42OsBG5NRcP5ks2nC4YobGcSZksYDHfpJCGLi5
         IyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776006417; x=1776611217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1HhHUh9oMvar+Jto5PAeJ4x6D9kftv4Rry//SVWb2AU=;
        b=jaUxEIcy71knqZo/eWykwEDjnXVW6KdizOI3P0PMM5vPMGHdOHCBrvSkO/3T+OQK03
         nnf64I8vpray8coi3uCWn8Rfhhd5EQ/h90ZK3lgDqm99/yV2UcSbn671AbAmRN53AC0U
         XEbSMm73tmNQDGjMZJUeXfHWkeu8kw0P9oEiYkYIMBakbmGyl1Voj81TP+mc9O+ASvC+
         kaVo9ISmB9vjPFhWi6wtK0VU2A3tInWN/CBnSIrchhRKRxJhGZT2T7xlTehykQsKR0/6
         CwCuNZP2LWbGeupI9rL/1S/szixDyJ2whdNRrTAhT9g1bNhhpO+aKdD5eBNPZp0A228U
         E5uw==
X-Forwarded-Encrypted: i=1; AFNElJ9lfSgytDLGZhCBceATOe+1PY63fD5aEOxGhtuoOPJFWwyGzIRTFFp7aOoE3rm8MusTzhReGijeDNfc+rs1@lists.linux.dev
X-Gm-Message-State: AOJu0YydRy3lmfWvZWSf+O2mg13Cc2B06Mvl7UwS79Beeh3yPObrWeEP
	crC35Oa5O9zEEsELHVlvo3V4qNLvzbt7vqsPMJPhv5JGGvt4rnGJnljK
X-Gm-Gg: AeBDieuaOr1wL/PVIsAqHGGJZseopB+XviOBEoObJuiJEsNk4dwAjUwsBA1DiorPvAg
	4IkUpwMSgaw+3Yj4RZIdovMXkfkdMenbA/5FJjnQFvIsS/Ss4Ow2gViXUHtsqNll+v1pRS/YD61
	paOHqyGbS/lOmw9YeJ7HQWLTgUGbctiB4nh8cko/kBaiZbJQDaLFVPxgxscfCEY7VQnZ8fFfqqf
	AR+3ytH0gGlwwaBxfwGiWsDuToLoP37cTJ9DAXNR95PSy4R2idCIZcfj4b6KO6JOPd/2QLznuDv
	FgONPbKKlEuxz5Fb2KidSnn3JRvlM7hHfu7QMiawoi0SPkAfiozaL3voXRPj/OfRclaLCPxnGbN
	mWUzI6HqpGQZOovPZ8sz89XYhajwMpmIXpl1L65gbkx30JkRaSv45odvW4opKiVb+b6I7MYedLU
	jZ853q4X9x1cKdwJpysT4mywEJAmjMwm8erbNhlo0J/1BZkNw5HjKRG3rc/TeN6My9nnwiqKfZZ
	Tx/OVdmaYcW
X-Received: by 2002:a05:6000:268a:b0:43d:7403:4b60 with SMTP id ffacd0b85a97d-43d74034c72mr3622809f8f.3.1776006416764;
        Sun, 12 Apr 2026 08:06:56 -0700 (PDT)
Received: from fedora ([2a00:23c5:4a5d:3701:b24c:c1d6:5c61:a2ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5ccdasm26760351f8f.34.2026.04.12.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 08:06:56 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Luka Gejak <lukagejak5@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: fix whitespace issues in sdio_halinit.c
Date: Sun, 12 Apr 2026 16:06:32 +0100
Message-ID: <20260412150633.12071-2-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412150633.12071-1-josh.hesketh@gmail.com>
References: <20260412150633.12071-1-josh.hesketh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove spaces before tabs in comments and fix extra spaces to
address checkpatch warnings.

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
---
v2:
 - Rebased on staging-next
 - Split from original patch 1/2
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 32 ++++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 4d74b14c3cd4..4a4f6b03253a 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -822,7 +822,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 /*  */
 /*  Description: */
-/* 	RTL8723e card disable power sequence v003 which suggested by Scott. */
+/*	RTL8723e card disable power sequence v003 which suggested by Scott. */
 /*  */
 /*  First created by tynli. 2011.01.28. */
 /*  */
@@ -834,7 +834,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	/*  Run LPS WL RFOFF flow */
 	HalPwrSeqCmdParsing(padapter, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, rtl8723B_enter_lps_flow);
 
-	/* 	==== Reset digital sequence   ====== */
+	/*	==== Reset digital sequence   ====== */
 
 	val = rtw_read8(padapter, REG_MCUFWDL);
 	if ((val & RAM_DL_SEL) && padapter->bFWReady) /* 8051 RAM code */
@@ -857,7 +857,7 @@ static void CardDisableRTL8723BSdio(struct adapter *padapter)
 	val |= BIT(0);
 	rtw_write8(padapter, REG_RSV_CTRL + 1, val);
 
-	/* 	==== Reset digital sequence end ====== */
+	/*	==== Reset digital sequence end ====== */
 
 	bMacPwrCtrlOn = false;	/*  Disable CMD53 R/W */
 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn);
@@ -959,13 +959,13 @@ void rtl8723bs_interface_configure(struct adapter *padapter)
 }
 
 /*  */
-/* 	Description: */
-/* 		We should set Efuse cell selection to WiFi cell in default. */
+/*	Description: */
+/*		We should set Efuse cell selection to WiFi cell in default. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL */
+/*	Assumption: */
+/*		PASSIVE_LEVEL */
 /*  */
-/* 	Added by Roger, 2010.11.23. */
+/*	Added by Roger, 2010.11.23. */
 /*  */
 static void _EfuseCellSel(struct adapter *padapter)
 {
@@ -1051,7 +1051,7 @@ static void _ReadEfuseInfo8723BS(struct adapter *padapter)
 static void _ReadPROMContent(struct adapter *padapter)
 {
 	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
-	u8 	eeValue;
+	u8 eeValue;
 
 	eeValue = rtw_read8(padapter, REG_9346CR);
 	/*  To check system boot selection. */
@@ -1062,11 +1062,11 @@ static void _ReadPROMContent(struct adapter *padapter)
 }
 
 /*  */
-/* 	Description: */
-/* 		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
+/*	Description: */
+/*		Read HW adapter information by E-Fuse or EEPROM according CR9346 reported. */
 /*  */
-/* 	Assumption: */
-/* 		PASSIVE_LEVEL (SDIO interface) */
+/*	Assumption: */
+/*		PASSIVE_LEVEL (SDIO interface) */
 /*  */
 /*  */
 static s32 _ReadAdapterInfo8723BS(struct adapter *padapter)
@@ -1179,14 +1179,14 @@ void SetHwRegWithBuf8723B(struct adapter *padapter, u8 variable, u8 *pbuf, int l
 }
 
 /*  */
-/* 	Description: */
-/* 		Query setting of specified variable. */
+/*	Description: */
+/*		Query setting of specified variable. */
 /*  */
 u8 GetHalDefVar8723BSDIO(
 	struct adapter *Adapter, enum hal_def_variable eVariable, void *pValue
 )
 {
-	u8 	bResult = _SUCCESS;
+	u8 bResult = _SUCCESS;
 
 	switch (eVariable) {
 	case HAL_DEF_IS_SUPPORT_ANT_DIV:
-- 
2.53.0

