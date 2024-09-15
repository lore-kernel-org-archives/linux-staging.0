Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7D41BC59
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382465; cv=none; b=Ua3uS4dCy/A3/A+benOqS+kd7MLqkOGc3MoXs08MU5XxZUJ6keyZS6KqFtSxF26QpanUxxiA2dXZyeF13E+mHIw/dsAvTm9IAIRxVQL2mqRaF2v2ewNKZUzTiGlKe4Czr3UeChQqP8EPZTGHMmgIXeksVYT0XJhsKGr/cZ61rgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382465; c=relaxed/simple;
	bh=x5sCgwLHh1A9huYqe0WPnMubIiLl4YyjkxXVTZFcEcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSkrhSBXzJCny0upCQW2y8G6clxSIrx1PL9iava/EwmIxQmhabipCkln+zwp5U7/PIVgqTaCwKncQcOnCJT+MoBs2weHwU5+uU0tXDRsNu9f4/juVKG7W+rrDBlDVVpuzYIqwjlqh2M82rZGiP/0d+DUEEVUHd3gh1x9+80hEZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLe5I8fc; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLe5I8fc"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8b155b5e9eso464900766b.1
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382462; x=1726987262; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJboqtmrxph9K3PVRnau8dONXpRrIv6lutqIff5OCzE=;
        b=GLe5I8fcwmuplhQssvBEqWJFME/SGbXyYxoJawUm3ukQnV9hRilwCIGLfr5bHnBL2K
         sl5d9/Kpz032noY8pCFgM5Pm5tBU7ZMAa2dc8Lih4hqa9zQYC92W8uvnzyL159g2L7+C
         J3BI2rE/p7hohoi1u/gOyrax8gdlueAgTemTQad/Qh3tPrWlT0n1jMwa7JxU9/atWWUm
         EjZfCj+yzoZuzUdt8eRGWOmBR7r/qbRsZNMESDAC+G1QuE4mqZMHOgl0xf0mBc44Wpbk
         XgRDB+HvQsrlN+mQQFAGaEr4uc0TNiJSPVpW7wljXMiHVHow0Bqvt5qpRZqh7pX9QMmn
         zVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382462; x=1726987262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJboqtmrxph9K3PVRnau8dONXpRrIv6lutqIff5OCzE=;
        b=BTLJ+F64Dpw/C8n5zl1JntKwUk+Z5eXhjhePrPnrBxRghybCkw8BkU4tc4opPuwrg3
         7EZSKDBbur3KewRoIuYvE8RCnDF4i/HzwUymlezkEN+bzQo10I4i/5CJBkyLYFREqbWg
         QTKtdV7MhwNMFg65Ziiz53JNkMcS6fMYgGiqJhjVrfUbPGAHp3JFAw3xoNENIcl78Cq9
         ppvVdDGUXiTGYR4gGR/oEetW2EwiANCcMwdIVD/myXqbT0aS58PaDbghU/AhrYFuIg0y
         lWajZRAOGApjoH69GHVxxftkMBAVJajzaZWV8RQkuwHhaJOkJYs+famH5hzMO6Rfh3ee
         JOaw==
X-Forwarded-Encrypted: i=1; AJvYcCXwVV+DG2PheaSG3HnKs8LIU3huVTTmx8292l3YhcfvCccd8bIuMBLUePMDxkS5gQG7HqQ403spBmQcuGeR@lists.linux.dev
X-Gm-Message-State: AOJu0YxiX1/fRKWq4KU+izEtGlmj8AYxKFse/cgM5HU7ljZ9MtlR14xx
	h6SseGxAHUkS/5nuGvgZbKCzcRqEPK8LXofLuanpCAtYIXbTQqC/
X-Google-Smtp-Source: AGHT+IHbsBoHDxfQcaBt/dZZWTkkFy+yzmgG3vfNRxAFyJj9u2P4jXYlDh4XR3q196DI7ZhpEf2IiQ==
X-Received: by 2002:a17:907:d15:b0:a8b:6ee7:ba22 with SMTP id a640c23a62f3a-a90294ec2abmr1242653766b.39.1726382462111;
        Sat, 14 Sep 2024 23:41:02 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:01 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 08/17] staging: rtl8723bs: Remove unused function PHY_SetBWMode8723B
Date: Sun, 15 Sep 2024 08:38:22 +0200
Message-ID: <4f3a76bce3dc309a179e588d184765e54816d3d9.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function PHY_SetBWMode8723B and belonging unused function
pointer in struct hal_ops set_bwmode_handler.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c |  1 -
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c   | 11 -----------
 drivers/staging/rtl8723bs/include/hal_intf.h      |  1 -
 drivers/staging/rtl8723bs/include/hal_phy_cfg.h   |  3 ---
 4 files changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 37ebbbf408ec..a44c1dd0f691 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1884,7 +1884,6 @@ void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 
 	pHalFunc->UpdateRAMaskHandler = &UpdateHalRAMask8723B;
 
-	pHalFunc->set_bwmode_handler = &PHY_SetBWMode8723B;
 	pHalFunc->set_channel_handler = &PHY_SwChnl8723B;
 	pHalFunc->set_chnl_bw_handler = &PHY_SetSwChnlBWMode8723B;
 
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 4ff092b7c9c9..a4ea124eb9ad 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -764,17 +764,6 @@ static void PHY_HandleSwChnlAndSetBW8723B(
 	}
 }
 
-void PHY_SetBWMode8723B(
-	struct adapter *Adapter,
-	enum channel_width Bandwidth, /*  20M or 40M */
-	unsigned char Offset /*  Upper, Lower, or Don't care */
-)
-{
-	struct hal_com_data *pHalData = GET_HAL_DATA(Adapter);
-
-	PHY_HandleSwChnlAndSetBW8723B(Adapter, false, true, pHalData->CurrentChannel, Bandwidth, Offset, Offset, pHalData->CurrentChannel);
-}
-
 /*  Call after initialization */
 void PHY_SwChnl8723B(struct adapter *Adapter, u8 channel)
 {
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index f559a5c1fd16..84da38c55d7e 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -189,7 +189,6 @@ struct hal_ops {
 	void (*enable_interrupt)(struct adapter *padapter);
 	void (*disable_interrupt)(struct adapter *padapter);
 	u8 (*check_ips_status)(struct adapter *padapter);
-	void (*set_bwmode_handler)(struct adapter *padapter, enum channel_width Bandwidth, u8 Offset);
 	void (*set_channel_handler)(struct adapter *padapter, u8 channel);
 	void (*set_chnl_bw_handler)(struct adapter *padapter, u8 channel, enum channel_width Bandwidth, u8 Offset40, u8 Offset80);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_phy_cfg.h b/drivers/staging/rtl8723bs/include/hal_phy_cfg.h
index ea494bcf830b..acf714946365 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy_cfg.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy_cfg.h
@@ -53,9 +53,6 @@ void PHY_GetTxPowerLevel8723B(struct adapter *Adapter, s32 *powerlevel);
 
 void PHY_SetTxPowerLevel8723B(struct adapter *Adapter, u8 channel);
 
-void PHY_SetBWMode8723B(struct adapter *Adapter, enum channel_width Bandwidth,
-			unsigned char Offset);
-
 /*  Call after initialization */
 void PHY_SwChnl8723B(struct adapter *Adapter, u8 channel);
 
-- 
2.43.0

