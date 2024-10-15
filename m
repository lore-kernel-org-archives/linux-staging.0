Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C1656B8C
	for <linux-staging@lists.linux.dev>; Tue, 15 Oct 2024 01:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728956869; cv=none; b=nc1CQH1jNLq/75CKXcl5H/H6LN5E8TfwplT2/U5AGCDRGFX9P4fpzcz4plB4qAajcVUqNnKpqB6mvRnzIYRSxy7SJpU2uyKak9P9RA1FrEXTZSGooKRefFuUPEy1VsIG16djHoI0P0sGG9pZ3JeSr/KarY512BDRC6FCCLOClt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728956869; c=relaxed/simple;
	bh=5BdIiRgeOL39dpV6SihL1KVsI1+Y8kNOVttd/LOWzSM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jp9+jC9goI+wF0GF+IEvoV8frxXUiECd3+vWb4RKxjBYvwjKsEtCH/Doj1g6FDWsu7h1SjBbod40eLRhhL5aSReS5sussAL8XL57mazmtlxU6wI7efJi8nPMMyWCiSmNn1daTHfmaXeMk3DLR5FV372voxu3SSNCXidu+xp70NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVbvMGdr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVbvMGdr"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20ce5e3b116so12809845ad.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Oct 2024 18:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956868; x=1729561668; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5is7VaCws6e/Au/1m2Z1UhAmmcER8bL2lqoXJbsp/hU=;
        b=LVbvMGdrN1DlZXffgay8nu5o0iDVa82konNVgimojiX4f3WaCiFHAWREe2y7ZOGEux
         O2tOaAFF3ghqud5vwcvgmdGDzjxtZ7ILVMDk9l28gEwEDS0HUOpiDaUuD6691rZv+oHB
         JU26dUDjYiRA3iYzeEXlisPuEAXQbR3YvYh2deqcDChKJaT82qseivQRGaisqIvLlgME
         rB486X1sLiO2vasbRy7KaoH30xgsaC36QprWi2MfqQO6n8wnXyHYd2EhhgB74fLrJnNj
         2ba/slh0F1gGH7XYI2uHb+NGEhrpLvhAjOp38/srYu4WNOHwcB6rep/b/wlBZ2E3+lip
         lIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956868; x=1729561668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5is7VaCws6e/Au/1m2Z1UhAmmcER8bL2lqoXJbsp/hU=;
        b=SKJ8J1eLwdQckmdsgn62Jbexewq9ZSNr7J5l4Nxl0jev12oJRJTAUZhlLJxIZ0pvBl
         wOx9X8MPgEh4Pwj8c0qf62aoEFiPPyIg1Dp2+inv9G/TQrlLxgqBONlCnWWXcqqyzvHg
         u1q8gcRs9EySvsWDMrL1Wkv/S53YLeWFrHsyzD5g5SOZe3Jo/La0Btb68DWbFJYFkhyr
         NBzXqlxeUWq2ZRCWIf+kuqHxocWqc43zJffSCI/apvZNLVyx7hsH5S+6E8Tu2VgYuWUJ
         5cOrnTDF7t/qDGe3WbLm6UK2Fv318YhsjO2ggAHU/j4EoNLFSF/7B5n35FETUrXY4gna
         yRXg==
X-Forwarded-Encrypted: i=1; AJvYcCWqF2+edh69XN5LleZnBjZ7QKi/wjLMcmrxWW2GsvPOO1U2EpXpiWXG0xalFmbD+wLzswA/+ZpUk6Pciwnv@lists.linux.dev
X-Gm-Message-State: AOJu0YyT/mNulcjaUEI1tNgxmJK+kMw3XhsoNHNddVjeX3yjcNlEw/D9
	x5CeNwYYr7AqW7JggVTZVW6frI89D700cg+o88iGpeudod8LOnEF
X-Google-Smtp-Source: AGHT+IEOYa3emi5du9D+64uvhNuIhET+MlLY0rZewtyWdoaLOzkrcYTsPfcOHwelSUWOvPYyU9YB4g==
X-Received: by 2002:a17:902:f70f:b0:20b:3f70:2e05 with SMTP id d9443c01a7336-20cbb230588mr151359605ad.41.1728956867753;
        Mon, 14 Oct 2024 18:47:47 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:4e84:7ad0:3bea:5c55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d18036251sm1863615ad.172.2024.10.14.18.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:47:47 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: change remaining printk to proper api
Date: Mon, 14 Oct 2024 22:47:37 -0300
Message-Id: <20241015014738.41685-2-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241015014738.41685-1-rodrigo.gobbi.7@gmail.com>
References: <20241015014738.41685-1-rodrigo.gobbi.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As part of TODO file for future work, use dyn debug api for
remaining printk statements.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  6 +++---
 drivers/staging/rtl8723bs/hal/hal_com.c           |  7 ++++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 10 ++++++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      |  2 +-
 4 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index bbdd5fce28a1..58da34f125db 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1870,10 +1870,10 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	if (0) {
 		int pp;
 
-		printk("pattrib->pktlen = %d =>", pattrib->pkt_len);
+		pr_debug("pattrib->pktlen = %d =>", pattrib->pkt_len);
 		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			printk(" %02x ", pframe[pp]);
-		printk("\n");
+			pr_debug(" %02x ", pframe[pp]);
+		pr_debug("\n");
 	}
 
 	return _SUCCESS;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 719dd116d807..484e0b4e489f 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -910,10 +910,11 @@ void rtw_dump_raw_rssi_info(struct adapter *padapter)
 
 	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
 		if (!isCCKrate) {
-			printk(", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
-			psample_pkt_rssi->ofdm_pwr[rf_path], psample_pkt_rssi->ofdm_snr[rf_path]);
+			pr_debug(", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
+				 psample_pkt_rssi->ofdm_pwr[rf_path],
+				 psample_pkt_rssi->ofdm_snr[rf_path]);
 		} else {
-			printk("\n");
+			pr_debug("\n");
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 37ebbbf408ec..b9c6cd1f80d6 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -62,7 +62,8 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	for (i = 0; i < blockCount_p1; i++) {
 		ret = rtw_write32(padapter, (FW_8723B_START_ADDRESS + i * blockSize_p1), *((u32 *)(bufferPtr + i * blockSize_p1)));
 		if (ret == _FAIL) {
-			printk("====>%s %d i:%d\n", __func__, __LINE__, i);
+			pr_debug("write failed at %s %d, block:%d\n",
+				 __func__, __LINE__, i);
 			goto exit;
 		}
 	}
@@ -85,7 +86,8 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 			ret = rtw_write8(padapter, (FW_8723B_START_ADDRESS + offset + i), *(bufferPtr + offset + i));
 
 			if (ret == _FAIL) {
-				printk("====>%s %d i:%d\n", __func__, __LINE__, i);
+				pr_debug("write failed at %s %d, block:%d\n",
+					 __func__, __LINE__, i);
 				goto exit;
 			}
 		}
@@ -127,7 +129,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 		ret = _PageWrite(padapter, page, bufferPtr+offset, MAX_DLFW_PAGE_SIZE);
 
 		if (ret == _FAIL) {
-			printk("====>%s %d\n", __func__, __LINE__);
+			pr_debug("page write failed at %s %d\n", __func__, __LINE__);
 			goto exit;
 		}
 	}
@@ -138,7 +140,7 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 		ret = _PageWrite(padapter, page, bufferPtr+offset, remainSize);
 
 		if (ret == _FAIL) {
-			printk("====>%s %d\n", __func__, __LINE__);
+			pr_debug("remaining page write failed at %s %d\n", __func__, __LINE__);
 			goto exit;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d18fde4e5d6c..b845089e8d8e 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -72,7 +72,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 	err = sdio_claim_irq(func, &sd_sync_int_hdl);
 	if (err) {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
-		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
+		pr_crit("%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
 	} else {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_cnt++;
 		dvobj->irq_alloc = 1;
-- 
2.34.1

