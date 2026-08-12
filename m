Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AAE738A706
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786551523; cv=none; b=dSUkXFgJ52CNHtkyHp8C6ABnbjMEKdCvfxG55fLCq4Q0Kqsm6rNHMjBYZxKBooQEzq/Bu/ERLXN0PJ9RqAMenbyxlVYEPBRyinXOK7x351DxNTL5gUcgLYMdhN3//HSQa6jEu0MZD2wlnb5sZ0/UfocF3TmJXV6PJaYINMJ25oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786551523; c=relaxed/simple;
	bh=fxzuj2ierPrIAKxUnATTMen9wksQydh82/7w8SY+TXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=MqxGzcysrAXybeN27j0vMdgBDaOYWzOjONI9cwRsAsX3pCAkSnMqYQChxQxrH4bVTHbmaBc2XIopx0g3AkFC88fhFqnK7VkTJKeIT74DDXbeshEQVGAEIiKO3iH3Es/gA1FN1j8H6ruyMV5nQyl6lMMRRQFl3LViGQP7CR/iWuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=CIXdQuhy; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="CIXdQuhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786551520; bh=MfAMWL1Eh4Iv8lEHXJ1pvOYWrIyJ600pH+7yP8VGekA=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=CIXdQuhyYAYTVJ0msH1d7qlzfmtNfiyoGBTfMa0EmOrb8P54567v4O4TjRn+32bzoz/z79O3kkA4FfVifGOpDNgHlcXtZsB2P4eNVaaASp3jEH+dddLxaWLrV3bfTHOg7argTA/n0su3DxgkK6gTGJdE9RyNcfRe42qmfCkXaIDc2MZAK2hBrRwLpKte3olzKUknUUyITYbUXAmbFs/xCEeR9CbMJZQfTSAejsuycJdH0scAGLbs8GSRS3sYlh+YpXlU29j+tJXRXygmqGWl6oaAnijYhEx1Qcd2A5IQ9k4Ooka4QoW8euvelVBjy+SYU1cnNgoU+TLB1TWTfiOnNQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786551520; bh=FkgJBDfbMnJ3vM2wY98P32KIr/9tw1LJZqjCFwFROLZ=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=kFvCRNjyYHn5sYrX73T8YNBEb8StNLMDWevd5dHOpzNw8qbm/pcWkzQNWXTfYCOxJiUwbsYIHFt/ygVejn6JAN6phZMfkvgdHQ4f5b28aicD+EqBJrY23GsToGXYxtvMOwbsw3+lz0j+sQqd9bwdkV1hbTEyiOzU3Z1xBCq+g7PJ415V/1ASgi7WY8UqIBtdAd7bYj0jusqukNTloD2zkS2j8VipYgM9QFABv2cM1gX2cUSvnWvAQA16MhPfRDE5eUSzF9g7+wuxeiPuqUEyzzmgqDhIaye/8x9EcL7CGFmWhl4PtTW+2LbYwIS+snG8I5gtjrMpCB5nWgrTQZsf6Q==
X-YMail-OSG: FbHBVnAVM1lEZwe3YgJ6KFGA.mFzwvsRNyCQl_guVLuF01kpzQw6zmBYJMCNn1g
 _is5o3ohljIpr_ZtX4_d5YhXGm1NTyj0M8dqrfDcl6AIVUvtKqXw6kfvVHs4Z5b8bJ30j.ecfawJ
 cL3exaBtgm1byK6DXN14nTjRtVngYrCT2X8k4flZqHms11uQyz4zVOiSzYWLW1VkvSxRgc64ay1_
 TKDUEVWzEZ_tQXORURo779RnDXRa9KDx47dfUfZI5ejFt8Au8wzVS_KnPjINX7rrtDPFLm7SAiKg
 Sv25zzonXC2OLQ.XZXS1kcNqbwNoixslOCS6z9H5kq5oaWpqpCfJSH8UBG9RsI00MChRVOTQ07x7
 vmU4mNTWFqdVA6msQyYY7dWOHz80OodXtOmFPXLuZLueV5Zm1EgOjOcEs7PW6OnikvEZ0JDvE3Ul
 zI9NuymySA7kXWDsmS.UcYTqQXJ8wroDQDU2302MnIqjSZflVsuPikBA_309x2W4_6to8fIo496N
 JqLWw0k7xE4HPhiMbq_jFn.tbAv9FxVaDM228UOISKl.WEsUvgNRogYgJjI3o3mKKtce2ruA_8ao
 PwYe0sq_8OLtllyNUgrvfeWCB3xriYj.ykdvZxobn8LQdVsKn7k8qE3ayitW2L4sU8Mv5Teexpgf
 nTkoAXL_5sGxs.QI1uRRi42o8InmtSXe2JUFnI9fEmL0vzgajKUcKl.muTHOWAjtvXJ54xs_yhUi
 VRaBhIj.xNskzRTIkEJ7YZ1HDqzGc49QkYK1hj6IJ3_eQMnMi2mP2.14nFa7SOdY7ZS2iByWfSvz
 jjFi68XBapEVT4L3XJt18wU991zSN7L8S25n8IEHYYKdDTmK18vuyD4b5oWie2Q3TuX99rhY367o
 PUeNAObjyYefa5RbqTk15Jq0CjjxrCRo33j4zgnekq4YFs9KdXvEpi8WpLBxzUDaEGvnMTO1uf6s
 RTwuSwISYvd6AGDMUwFqpuMgmw2SWCo99FxS_XsrfokyJCorma_cNmlAuzKxDc763i1A2iVF1b1E
 RzDcEJEcSwXI0NxR7PMtDmQNoV4t6t6EB1.uoQAKYy5UHYihQrNEZvO4A9uAfpWqFj9UcCU3ewry
 PfQmSGoyV61vSq8D_xt3kUThX9q4OohEC_67Z1dh0bNorNIoaMJMXwUd4DoSnkf08Kgg14zGhmbY
 kPb5RrUHCSOJcZrvUWTEpL.Nnswxjg7.m.VRcm5uTnf07gxjib1fTk.V8A9G_wba1M8uMt6aAGEX
 iCh.Ojrwd57.42GR2FN0d9LV6wsnp.cWcLYWk0NomG0kGtVuqD1b8dFegV8j7ypr16dNMR62c0m5
 6muJLde2YLOW5GqoZNdi2QHhDCLXuxd9BLk0eVERKn5PbhKkL6A.pawz7R6NsTmX_BwX_PIiU4dn
 VB8PLBUs_2czTCLmC7gSvKUJYYbTuCqITAp199qEXOZyB3J_Qpmq_TxOzN6fw_vgKld869X9pktN
 w0QN937dXxYbAFDQHPTSCjSQim1pHcJsC.QQP.9OOdMzcWi9zUs_Jad6on3pUu4qHRXgRqXawS9W
 xTKpdOOXc0LNQRxx17o3st0Vl4H9jc__6ZHRhMKWLfgVWE_NKrAv7IBUnE9al2gbrXNnRJEGagyo
 lmTsZp9CICS_Wq1WAx4CEY.XB_dwhIlA9M38bWJD7R_xAdTyL5knxSfHd2RPSaItyqywrQHa8mNL
 w_LMn87TshykqTZerBU1tP38tzRGpnLIOdAeERVFx2jQ5iJGLX7kH5czeu5IxUhDygniUjHCIALF
 7JgumHgNtLkwpEwg7OW9G_PiavG04iB1Aw1pDXFTmdN031fhXQOHrairdhCx_VhW.ZtX.oboospB
 YvHOJdjR6Z93PcawNyFk2GKOzo3ZqXokEgDyy2pOi8cGiaJqcBONLC0MClJzBc3U_vjTySM3uT_E
 ctzI7p6vcZwQ3zZqwXTnJy8Ig3g40d0eHATm.6PedC5KZ9YV1sO2K2BmagpHStJayO2X3cHM_NB_
 WU7StfnF8.SHCuBKkAAkSXKf.nMYtefZfKOkjcNEMjZRkuMyBUKV6UIXUc04mpkc-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 992a8a38-641d-48a0-a30a-9063b6716529
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Wed, 12 Aug 2026 16:18:40 +0000
Received: from dip5.lsn.ir2.yahoo.com ([87.248.99.14])
          by hello (SMTP) with SMTP ID 35b6075952d012510b8c9ad8cc12d98e;
          Wed, 12 Aug 2026 16:18:37 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 12 Aug 2026 18:18:34 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in hal_data.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rtl8723bs-space-before-tab-haldata-v1-1-8fe838e437f1@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBBA0auUWTuQRInRq0gXk2RqR0pbMlGE0
 rsbdfk2/2+gXIQVrt0GhV+isswN9tBBGmm+M0puBmecN8E6LHUKZ3eMirpSYow8LIWxUsSRpky
 V8OJPyXD2lk2AFloLD/L+TW793/qMD071W4Z9/wDV4950hgAAAA==
X-Change-ID: 20260812-rtl8723bs-space-before-tab-haldata-964c0ed61e08
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786551516; l=2685;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=fxzuj2ierPrIAKxUnATTMen9wksQydh82/7w8SY+TXA=;
 b=xodxCGPsMAFkruMJwd4qOnyMacZHLcUWN0iw2cnMKNprlJHGhz1uF77DSor+oxXANVhXzXN7R
 1Nb5Kj6UABlDz0BGi979W0iscZWfluS6UctMq7DaOZe4vd+skRWhbRL
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260812-rtl8723bs-space-before-tab-haldata-v1-1-8fe838e437f1.ref@yahoo.pl>

Replace space-then-tab with a single tab between field type and
name for EfuseUsedPercentage, EfuseUsedBytes, sdio_himr,
sdio_hisr, SdioTxFIFOFreePage, SdioTxOQTMaxFreeSpace,
SdioTxOQTFreeSpace, SdioRxFIFOCnt, SdioRxFIFOSize and
sdio_tx_max_len in struct hal_com_data, matching the alignment
style used by the surrounding fields.

Verified with checkpatch.pl that the 'please, no space before
tabs' warnings were present before this change and are no
longer reported for these lines after it.

Two pre-existing issues on lines 252-253 (CODE_INDENT) and 382
(line length) are unrelated to this whitespace-only change and
are left untouched; the line-382 length is unchanged by this
patch (124 columns before and after when tabs are expanded).

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 3a93ac312ded..0712baa78413 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -213,8 +213,8 @@ struct hal_com_data {
 	u8 bDisableSWChannelPlan; /*  flag of disable software change channel plan */
 
 	bool		EepromOrEfuse;
-	u8 		EfuseUsedPercentage;
-	u16 			EfuseUsedBytes;
+	u8		EfuseUsedPercentage;
+	u16			EfuseUsedBytes;
 	struct efuse_hal		EfuseHal;
 
 	/* 3 [2.4G] */
@@ -364,22 +364,22 @@ struct hal_com_data {
 
 	enum rt_ampdu_burst	AMPDUBurstMode; /* 92C maybe not use, but for compile successfully */
 
-	u32 		sdio_himr;
-	u32 		sdio_hisr;
+	u32		sdio_himr;
+	u32		sdio_hisr;
 
 	/*  SDIO Tx FIFO related. */
 	/*  HIQ, MID, LOW, PUB free pages; padapter->xmitpriv.free_txpg */
-	u8 	SdioTxFIFOFreePage[SDIO_TX_FREE_PG_QUEUE];
+	u8	SdioTxFIFOFreePage[SDIO_TX_FREE_PG_QUEUE];
 	spinlock_t		SdioTxFIFOFreePageLock;
-	u8 	SdioTxOQTMaxFreeSpace;
-	u8 	SdioTxOQTFreeSpace;
+	u8	SdioTxOQTMaxFreeSpace;
+	u8	SdioTxOQTFreeSpace;
 
 
 	/*  SDIO Rx FIFO related. */
-	u8 	SdioRxFIFOCnt;
-	u16 		SdioRxFIFOSize;
+	u8	SdioRxFIFOCnt;
+	u16		SdioRxFIFOSize;
 
-	u32 		sdio_tx_max_len[SDIO_MAX_TX_QUEUE];/*  H, N, L, used for sdio tx aggregation max length per queue */
+	u32		sdio_tx_max_len[SDIO_MAX_TX_QUEUE];/*  H, N, L, used for sdio tx aggregation max length per queue */
 
 	struct dm_priv dmpriv;
 	struct dm_odm_t		odmpriv;

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-rtl8723bs-space-before-tab-haldata-964c0ed61e08

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

