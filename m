Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53863C4B60
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 08:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781511953; cv=none; b=PIMhGhI8k1Slb5tr8kc/Gdvu7fgF5vZwJtk/HdTxgxL9EBV+sQ6mhxawOTAIidk7gkstq5ZoYdQ/+3UFT8HSlkNbIo36F1g2tJLBVsol4a5RGb8K2n90CXhbbvVhStrRpsJwugQWBVaJk0cnTiHdSjo+cHZR8kmCeSboF7Cvux4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781511953; c=relaxed/simple;
	bh=SxqeVpqVKktTOhEdW5QlxxOLcpjScmaasLKpD8jxXx0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Bm7BuQrbWcxL6EAISQ5FJk+UfwlA4jIJ7z7OjTO/zyYSZKUf/j+jcoxS2SVi8n24dCTMNSModDWoP0mS5h08dljIm0SSt9FhxOjcXqvuyPMJn7v4v1VBW2XTBD8ieLk+iI3Lq9bqa5WVzyuos5UzThKTLqSoUUcTbHIoiyaPrrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gP+t2fen; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gP+t2fen"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36baec934b6so2084084a91.0
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 01:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781511950; x=1782116750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAX0bp6StEDyO20ClRPQbmVl8Vw+V1+agatVUuJiLcA=;
        b=gP+t2fen3qf2ibn3jxo1+GYUMF1bT8KpDGoWjGpiupm1zHuwIjlPkmlHCZcBqfEwVl
         S0lUV1LKdLr0Xl4h68Bv6H2e65PapRC0Yd9ZCJqGfY0941VfY90I2qPDlEk1lAqMVblt
         wuoWQZQuUDcd3qzv8Hak+ck8WVE8spCtDqwu81fMfJDrmq3ZL4OJ4xhJ9aAo/mYdUR7K
         Pn2RDMke+80i7lYAx7uNVYxDmHgPvDBx/CbJagKPRe2ZYSj4VNFNM/VzFVRvKQCl+kFr
         /JPHua2HtAcAyYu2q5Bec7qDhvn4Eocicd1PM/kZZOCg5khs/haP8ea2g5ytyV0twp/O
         4ytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781511950; x=1782116750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAX0bp6StEDyO20ClRPQbmVl8Vw+V1+agatVUuJiLcA=;
        b=fOc1gM6Fr+w6MYPfH/EssjDnXu1TxixD3VIcq/a3mjurkQWfPPwYlUnQGbmxtknzcc
         r12B1eUam5wpN8qbjkLGxTiw4y3Cg6FPjicq+RtuuPr8nJAfAEY6QbQoLa7JzCWc3yoF
         S82YV/d9mQfU4DRjIOL7/nWdF5E1ifVdSt7ahiDUBudll4seLcbEYy+RiH7hgDLBezpX
         jAfFjfiXDgNaVUQid+aJCwjtzE6RodeBXWXmJNtr3ECslEb1Rzjiufg19fc+e/WeDhq2
         AmIxWSG5b4y9tLLZbP5+5ejl+wmydxVwgCCRQEJjCJdF2bbq4ObbsRmA/QC4zHvq47X4
         QliQ==
X-Gm-Message-State: AOJu0YxUi1tMu4+DFtg80g25nHdE+Bf3OFhxQupSPHh6LVEgaK/rTMsr
	X+unChfA7sd283z9ibGjPz9QXiQ0oImaKt29kboNKSWjYzT4tWcQslyb
X-Gm-Gg: Acq92OEPS+DPNug/cXGL+kwz+GfmCcqe1W4aNO2r0YqS/ekHU/7dzTpHgyRDLh1eMtc
	InADDyGU8lR4MRINJlmlGl2J3sPpQiTLEMJp9rCAHnT2aiR+zNoWZxNhImIijTJavCYD9asY4Xh
	uSlFgHzjZja/SiPsn4Dw+YnknPtDQPo0RY5dmqCvUkcUWEAl4dIPwD1mnmopguoZ6wQJlxWhCq2
	6QpMwbHnyjJ4TUt3ajXW/GmAD1FfYG/B/xU8gGK+4gMJwrYMzXXjSoT58hrLGl6hgJhV2mWLQg1
	Tmybl1LItSWdS8LWeNmRq8KoJkj3x1zjUxuKtSNKntQDicq5BFYscCl3ED+ShDOsfW31V5sDGVU
	S1HHz+LmpwFWHhCxHUJBzhmRXfdcDL53AusnxU1+ApaXHNjKjALi9Qkb+LLDqMdYONMUHo6QIhq
	cIptowCjksWbclrkXfrcNP8RF6Q0WrRPVNEcJU71gt+BP08u5flwwmgBr8YXy/6Vo30ikuRld1l
	Zg8
X-Received: by 2002:a17:90a:dfcf:b0:36a:8519:a4e9 with SMTP id 98e67ed59e1d1-379f0513d86mr10438870a91.18.1781511949801;
        Mon, 15 Jun 2026 01:25:49 -0700 (PDT)
Received: from moksh-Nitro-ANV15-51.. ([103.58.154.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866518677dsm8232176a12.19.2026.06.15.01.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:25:49 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix missing spaces around operators
Date: Mon, 15 Jun 2026 08:25:38 +0000
Message-Id: <20260615082538.12007-1-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing spaces around arithmetic and bitwise operators ('+', '-',
'&') in the rtl8723bs staging driver across multiple files. These were
flagged by checkpatch.pl with:

CHECK: spaces preferred around that 'X' (ctx:VxV)

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf.c       | 8 ++++----
 drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c   | 6 +++---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 2 +-
 drivers/staging/rtl8723bs/hal/hal_sdio.c       | 2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf.c b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
index 7bef05a9a..254bfef54 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf.c
@@ -220,13 +220,13 @@ void ODM_TXPowerTrackingCallback_ThermalMeter(struct adapter *Adapter)
 				pDM_Odm->RFCalibrateInfo.OFDM_index[p];
 
 			/* 4 7.1 Handle boundary conditions of index. */
-			if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] > c.SwingTableSize_OFDM-1)
-				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = c.SwingTableSize_OFDM-1;
+			if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] > c.SwingTableSize_OFDM - 1)
+				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = c.SwingTableSize_OFDM - 1;
 			else if (pDM_Odm->RFCalibrateInfo.OFDM_index[p] < OFDM_min_index)
 				pDM_Odm->RFCalibrateInfo.OFDM_index[p] = OFDM_min_index;
 		}
-		if (pDM_Odm->RFCalibrateInfo.CCK_index > c.SwingTableSize_CCK-1)
-			pDM_Odm->RFCalibrateInfo.CCK_index = c.SwingTableSize_CCK-1;
+		if (pDM_Odm->RFCalibrateInfo.CCK_index > c.SwingTableSize_CCK - 1)
+			pDM_Odm->RFCalibrateInfo.CCK_index = c.SwingTableSize_CCK - 1;
 		/* else if (pDM_Odm->RFCalibrateInfo.CCK_index < 0) */
 			/* pDM_Odm->RFCalibrateInfo.CCK_index = 0; */
 	} else {
diff --git a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
index 86404b5e6..98a3d7695 100644
--- a/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/rtl8723bs/hal/HalPwrSeqCmd.c
@@ -88,7 +88,7 @@ u8 HalPwrSeqCmdParsing(
 					value &= (~(GET_PWR_CFG_MASK(PwrCfgCmd)));
 					value |= (
 						GET_PWR_CFG_VALUE(PwrCfgCmd)
-						&GET_PWR_CFG_MASK(PwrCfgCmd)
+						 & GET_PWR_CFG_MASK(PwrCfgCmd)
 					);
 
 					/*  Write the value back to system register */
@@ -106,7 +106,7 @@ u8 HalPwrSeqCmdParsing(
 					else
 						value = rtw_read8(padapter, offset);
 
-					value = value&GET_PWR_CFG_MASK(PwrCfgCmd);
+					value = value & GET_PWR_CFG_MASK(PwrCfgCmd);
 					if (
 						value == (GET_PWR_CFG_VALUE(PwrCfgCmd) &
 						GET_PWR_CFG_MASK(PwrCfgCmd))
@@ -126,7 +126,7 @@ u8 HalPwrSeqCmdParsing(
 				if (GET_PWR_CFG_VALUE(PwrCfgCmd) == PWRSEQ_DELAY_US)
 					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd));
 				else
-					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd)*1000);
+					udelay(GET_PWR_CFG_OFFSET(PwrCfgCmd) * 1000);
 				break;
 
 			case PWR_CMD_END:
diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index bdd595a99..5e2f4131c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -459,7 +459,7 @@ u8 PHY_GetTxPowerIndexBase(
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 txPower = 0;
-	u8 chnlIdx = (Channel-1);
+	u8 chnlIdx = (Channel - 1);
 
 	if (HAL_IsLegalChannel(padapter, Channel) == false)
 		chnlIdx = 0;
diff --git a/drivers/staging/rtl8723bs/hal/hal_sdio.c b/drivers/staging/rtl8723bs/hal/hal_sdio.c
index 665c85ecc..1d29245da 100644
--- a/drivers/staging/rtl8723bs/hal/hal_sdio.c
+++ b/drivers/staging/rtl8723bs/hal/hal_sdio.c
@@ -24,7 +24,7 @@ u8 rtw_hal_sdio_query_tx_freepage(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 
-	if ((pHalData->SdioTxFIFOFreePage[PageIdx]+pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
+	if ((pHalData->SdioTxFIFOFreePage[PageIdx] + pHalData->SdioTxFIFOFreePage[PUBLIC_QUEUE_IDX]) >= (RequiredPageNum))
 		return true;
 	else
 		return false;
-- 
2.34.1

