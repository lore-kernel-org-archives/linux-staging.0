Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393A24DC55B
	for <linux-staging@lists.linux.dev>; Thu,  9 Jul 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783621636; cv=none; b=swuMnLkNxmpvOmWryTuJoMfdRboN3jWwWNcl42aPLU+rade32I6KPTOOSzeX+aFMeGIg5BLJp1MS0AjDhOjESBhTwLfxG35VkcQ7Yh/tB5N+B6GIrZyw+IoOiTsR580wqcUAl8K+jRtetEIuu1YiFRgUznjpOQhfdYrsgqeuI5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783621636; c=relaxed/simple;
	bh=Z52ToPKEg32VPKVJxD7AjmhXwJ0Kw0PhujDbc9y+dd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AaA4WIjvprXdQFWKlmdcDiQnO3GEyhfc6IFYskJnU4weFnvEzDOyMxDGrFmei3QTpRCDch4WOiro4Ay0y8/cQSB8Zj87Ykn4/oIeSP/PU0eTrkTj6DwMdSXFjF0w04oizjEDQGzPO8N2+jNTYle2Pe9vcTvj0c5dIgGVesMwCJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeNXv823; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeNXv823"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so165231a12.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Jul 2026 11:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783621634; x=1784226434; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXiPU2fxAbLhPCsFgvXdgLgVGDiB63KP2EaWSZzv/gc=;
        b=jeNXv823I13r0Q6hqJXmv7IkD5fBq8+ffQkBQfCFVgaAt89M8D5VbwCfh9Q0bHNJIt
         f6QftQwTy9H8jupxCHa9lbvWwH/RyDE6Hbc4mKYUAD4uJvH0lmUxjQVY1WVSi0qUrTRh
         g6dEP9ng7xY7GY4VE2nItVqr9zhTaleJMNKXmyDXXP4860ExQwsEz8Uch0llS5mKrrK8
         kIN3GwOVLIxJl3RM4PEllEwZ0c5a+q4XBoQU3xfwzIGJzIHxAibUFmOGO+V+1PSn5aUe
         dFcBwcNV71HCAwPYAeti0ELLXtm/2XFRpH4kW8X649fO8LGWzS2BnBtoIWyehOvpLTuL
         jdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783621634; x=1784226434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kXiPU2fxAbLhPCsFgvXdgLgVGDiB63KP2EaWSZzv/gc=;
        b=d97Yk7LxCqFpcTD0ODIM5Q8OsM3hoBri7dRBwV+DonrRZwIzcwUMvKFo8Gkg7x0xit
         LjsZo/AlY/jhhNAM75B+Tpz37vKFn/xau3dWkkZj6umbDlpBMetVxa/DWppP65m1BB8j
         SNqpcuR68B666NDv+zOMELnuQJIoAMAYZsUiAMpRiml4ftQ7ovXscOwJUpmQAws29Nw8
         BKLNtRikkD26H6W+PjtOX+T5hfrOMlWBd9CFvNUyp++KxwewoXf1prS99wuWtAcwZGAx
         wD+lZj/3//wxPkdWRwFiGSzNJiuNuRPZKYUOf9rp1s/NncZWYlRl6v/L3o8bqfWarkoq
         GxzQ==
X-Gm-Message-State: AOJu0YwXeO2YFms6voNEVCvhKKht6PNqp2xMepzaEBPmR5sng/mIfhZY
	fBdzGx7XoYycGpZE3lUJmxSHGMJlbfDGwL0z4j2XJojsEuTvpcx8/rZouQvc8g==
X-Gm-Gg: AfdE7cmJomEmMAzSYxC+MN+8F42daadrd8jx2gOiKRXns8Yw12Mf2FKEX3HrponQMWz
	isn/AWgBtAGkSrIKAC39IhXqqcvAkrB4kWowD5788Z2MKB64h7VMrT+ecvNZwq/yky/O1JtNU+j
	x0zNpjTYAUSlhlf1/9aI0gcoeJZ4d5W/Vs4zQT7XqgC5Bb9SzURBLQo3HlGrbwI0++4UlTQT0jQ
	9z/lTju/eXuD8saJkY514u0lSSS+KCVszZVZ7SjnxyOMIfnQYUMUO9rDunybKxxbWwA3x5b2aR+
	4sBxhCnsARCVXImgglYBN4pTAuDO2+FCczcoJp7U5VGPrPo4DQKgyFfuvmdGxwtS+Qf/gJiT2c6
	zd/TDHaEnCH8nEqiknsyTs2Q/OGgpludO4CxTcvaaur+ALGmoTaFnYsJyvlV0yFY7MyHvGsMpBP
	qyP2bQJTZmtQ==
X-Received: by 2002:a17:907:948e:b0:c15:f693:7761 with SMTP id a640c23a62f3a-c15f6937953mr62163766b.44.1783621633647;
        Thu, 09 Jul 2026 11:27:13 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15f272141dsm91168066b.59.2026.07.09.11.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:27:13 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 3/9] staging: rtl8723bs: remove unused RegulatorMode from struct hal_com_data
Date: Thu,  9 Jul 2026 21:15:10 +0300
Message-ID: <20260709182627.16327-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709182627.16327-1-nikolayof23@gmail.com>
References: <20260709182627.16327-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variable is set during initialization but never used, so remove it.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ---
 drivers/staging/rtl8723bs/include/hal_com_reg.h   | 1 -
 drivers/staging/rtl8723bs/include/hal_data.h      | 7 -------
 3 files changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index b7478f5f38f1..5548d1b449e5 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -829,9 +829,6 @@ static void ReadChipVersion8723B(struct adapter *padapter)
 	value32 = rtw_read32(padapter, REG_SYS_CFG);
 	pHalData->chip_normal = ((value32 & RTL_ID) ? false : true);
 
-	/*  For regulator mode. by tynli. 2011.01.14 */
-	pHalData->RegulatorMode = ((value32 & SPS_SEL) ? RT_LDO_REGULATOR : RT_SWITCHING_REGULATOR);
-
 	/*  For multi-function consideration. Added by Roger, 2010.10.06. */
 	pHalData->MultiFunc = RT_MULTI_FUNC_NONE;
 	value32 = rtw_read32(padapter, REG_MULTI_FUNC_CTRL);
diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
index 6aa95a10a0f4..5b23a6ae6a15 100644
--- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
+++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
@@ -342,7 +342,6 @@
 #define VENDOR_ID				BIT(19)
 
 #define RTL_ID					BIT(23) /*  TestChip ID, 1:Test(RLE); 0:MP(RL) */
-#define SPS_SEL					BIT(24) /*  1:LDO regulator mode; 0:Switching regulator mode */
 
 
 #define CHIP_VER_RTL_MASK		0xF000	/* Bit 12 ~ 15 */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index ebbbc8e03d6a..fc6e1af24b9a 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -22,12 +22,6 @@ enum rt_multi_func {
 	RT_MULTI_FUNC_GPS	= 0x04,
 };
 
-/*  For RTL8723 regulator mode. by tynli. 2011.01.14. */
-enum rt_regulator_mode {
-	RT_SWITCHING_REGULATOR	= 0,
-	RT_LDO_REGULATOR	= 1,
-};
-
 enum rt_ampdu_burst {
 	RT_AMPDU_BURST_NONE	= 0,
 	RT_AMPDU_BURST_92D	= 1,
@@ -156,7 +150,6 @@ struct dm_priv {
 
 struct hal_com_data {
 	enum rt_multi_func MultiFunc; /*  For multi-function consideration. */
-	enum rt_regulator_mode	RegulatorMode; /*  switching regulator or LDO */
 
 	u16 FirmwareVersion;
 	u16 FirmwareVersionRev;
-- 
2.54.0

