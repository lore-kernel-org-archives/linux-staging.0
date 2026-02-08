Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD1347FEA
	for <linux-staging@lists.linux.dev>; Sun,  8 Feb 2026 11:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770548511; cv=none; b=kJ25y3bs6Mdd7+GCo1rTqfGI232+l+QqNc/3AuNQRjTOwGu74vMtaa5CluOACnhjtFH7GMtgeMP42L+LjoKXy2CtBtt18ifaxWw2QseMmRYLpt0gflHeo55vSCIdMxOMub9fGj1IZhw7P/QCxyYOvdI7tKhas/5BNOJrmoK8/Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770548511; c=relaxed/simple;
	bh=Of2SV3j9PugSpmkX4JCoDxwPxE7qRGDpDkDbZIglqcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbIFt2D8e39+ytMGkDPnpptQuSTFjSDTuSIzgpIPCwPx6QHhEvT+xTolpvwG8UTyUtlKnZA64JD0a5mRzC+8RtDrX/MjVRcamuqHrxcuNjJ3CKjJlI83gojYDduY0O32t9GisAYQ8nZ5FiDSOqCigT5DCytMl0tehwnyh3cjXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=R8aDMfzt; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="R8aDMfzt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770548509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RXnZ5nUvJskGmnF4x//0E2NGFgo2Mnz/g8c2tUg6Nuk=;
	b=R8aDMfztyeuIgOHFgz71UmXJdGlC3MeiV7C1QL2VL6gGdfxVzQcfbs8x5WfJ1bPdMuZKZK
	lcd4/bBkJoCYn3ofS1mv4f7RA3JyF63UpKfViT9fjvDw/4pLK2j53/YVAXbBG5rkAfFYTi
	3hOYY2DtiNzoEq/OEsIzlLg7wElwKZA=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>
Subject: [PATCH v3 13/22] staging: rtl8723bs: hal: fix line lengths in rtl8723b_hal_init.c
Date: Sun,  8 Feb 2026 12:01:02 +0100
Message-ID: <20260208110111.46642-14-luka.gejak@linux.dev>
In-Reply-To: <20260208110111.46642-1-luka.gejak@linux.dev>
References: <20260208110111.46642-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Break long lines exceeding 100 characters to comply with kernel coding
style.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 64 ++++++++++++-------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 54dbcea89491..8505909725bc 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -58,7 +58,10 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	remainSize_p1 = buffSize % blockSize_p1;
 
 	for (i = 0; i < blockCount_p1; i++) {
-		ret = rtw_write32(padapter, (FW_8723B_START_ADDRESS + i * blockSize_p1), *((u32 *)(bufferPtr + i * blockSize_p1)));
+		u32 addr = FW_8723B_START_ADDRESS + i * blockSize_p1;
+		u32 data = *((u32 *)(bufferPtr + i * blockSize_p1));
+
+		ret = rtw_write32(padapter, addr, data);
 		if (ret == _FAIL) {
 			netdev_dbg(padapter->pnetdev, "write failed at %s %d, block:%d\n",
 				   __func__, __LINE__, i);
@@ -261,27 +264,34 @@ void rtl8723b_FirmwareSelfReset(struct adapter *padapter)
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
 	u8 val;
 	u8 Delay = 100;
+	bool old_fw;
 
-	if (
-		!(IS_FW_81xxC(padapter) && ((pHalData->FirmwareVersion < 0x21) || (pHalData->FirmwareVersion == 0x21 && pHalData->FirmwareSubVersion < 0x01)))
-	) { /*  after 88C Fw v33.1 */
-		/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
-		rtw_write8(padapter, REG_HMETFR+3, 0x20);
+	/* Check for old firmware version */
+	old_fw = IS_FW_81xxC(padapter) &&
+		 ((pHalData->FirmwareVersion < 0x21) ||
+		  (pHalData->FirmwareVersion == 0x21 &&
+		   pHalData->FirmwareSubVersion < 0x01));
+
+	if (old_fw)
+		return;
 
+	/* after 88C Fw v33.1 */
+	/* 0x1cf = 0x20. Inform 8051 to reset. 2009.12.25. tynli_test */
+	rtw_write8(padapter, REG_HMETFR + 3, 0x20);
+
+	val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+	while (val & BIT2) {
+		Delay--;
+		if (Delay == 0)
+			break;
+		udelay(50);
 		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		while (val & BIT2) {
-			Delay--;
-			if (Delay == 0)
-				break;
-			udelay(50);
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-		}
+	}
 
-		if (Delay == 0) {
-			/* force firmware reset */
-			val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
-			rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
-		}
+	if (Delay == 0) {
+		/* force firmware reset */
+		val = rtw_read8(padapter, REG_SYS_FUNC_EN + 1);
+		rtw_write8(padapter, REG_SYS_FUNC_EN + 1, val & (~BIT2));
 	}
 }
 
@@ -998,9 +1008,13 @@ void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write32(padapter, REG_TCR, value32);
 
 	/*  NOTE: Fix test chip's bug (about contention windows's randomness) */
-	if (check_fwstate(&padapter->mlmepriv, WIFI_ADHOC_STATE|WIFI_ADHOC_MASTER_STATE|WIFI_AP_STATE) == true) {
-		rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
-		rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
+	{
+		u16 state_mask = WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE | WIFI_AP_STATE;
+
+		if (check_fwstate(&padapter->mlmepriv, state_mask)) {
+			rtw_write8(padapter, REG_RXTSF_OFFSET_CCK, 0x50);
+			rtw_write8(padapter, REG_RXTSF_OFFSET_OFDM, 0x50);
+		}
 	}
 
 	_BeaconFunctionEnable(padapter, true, true);
@@ -1653,7 +1667,9 @@ static u8 fill_txdesc_sectype(struct pkt_attrib *pattrib)
 	return sectype;
 }
 
-static void fill_txdesc_vcs_8723b(struct adapter *padapter, struct pkt_attrib *pattrib, struct txdesc_8723b *ptxdesc)
+static void fill_txdesc_vcs_8723b(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct txdesc_8723b *ptxdesc)
 {
 	if (pattrib->vcs_mode) {
 		switch (pattrib->vcs_mode) {
@@ -1684,7 +1700,9 @@ static void fill_txdesc_vcs_8723b(struct adapter *padapter, struct pkt_attrib *p
 	}
 }
 
-static void fill_txdesc_phy_8723b(struct adapter *padapter, struct pkt_attrib *pattrib, struct txdesc_8723b *ptxdesc)
+static void fill_txdesc_phy_8723b(struct adapter *padapter,
+				  struct pkt_attrib *pattrib,
+				  struct txdesc_8723b *ptxdesc)
 {
 	if (pattrib->ht_en) {
 		ptxdesc->data_bw = BWMapping_8723B(padapter, pattrib);
-- 
2.52.0

