Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661A20ADD3
	for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 22:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730240151; cv=none; b=P44qmiYfA02pqxwlfe/gn82RhauMlQfxMRjEzpeEpErAw7FZt9qX8H9bAqCVbJMRcNQ+YFZ0p5quuVepCT7laU2x+2tHiv05bH4K3cx3o8BHdX723GrFyJx9rbC37bhbL0oOrO6a3MxqkK2nGeYoMRoAqM/DNvDXEGzM7jOF2+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730240151; c=relaxed/simple;
	bh=dJbjASoif9FFgsaTpGb3upzlwhk4ba+8m28qT0cbYFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cjdpxofP6iFnudWSxjZLkZpwYstY/hNBjFGcVdqZN9+qxgc2VluItzbXOS7zMEjNuwWH6cacDLRtmKikFpb4tpazkX+tZdG7DmhI3YOiLtVQiC9VIph8jB7N2datQw8IaMdLbJ5ayW2SmBgvJaQ7YksPfs2F5Wg48OGWcaybQzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WeyB5/l/; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WeyB5/l/"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-71e5a1c9071so4663146b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 29 Oct 2024 15:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730240149; x=1730844949; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AiQ9umpLp8PmqXW0LJaiGwFuDWWJXxc3XptWFETDc2o=;
        b=WeyB5/l/JyTHqaUeRHzbGXvB7jQrP7WrcKlzgUnbPjwcrp5g94p0iW/njeWGLRkr6X
         11wAJHLcOYdSmkLVaeFKzFdCX1bG4syMDf+5khOZzg3f0av0a5kS37uEGF6l94VT3avH
         KCzd1djSGN8B8p5FQdlm6ye46IqpJ+FF4EYqKUaCjocXMRvKer8rmbs0t46k1P6jiqUz
         458nhREPZnHVJWpui2hL3pp2p6fRHqQheItaj1H5GA4BsAbGHsv4Ma0PsLPl5BbcV8O+
         VOYiw5SN/K9Ptg71l1iLNbn3e4KNXvMZI7JiBP69D8T/3k9+RZv3+9jTp7KUKudpMIuV
         4cTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730240149; x=1730844949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AiQ9umpLp8PmqXW0LJaiGwFuDWWJXxc3XptWFETDc2o=;
        b=bH7zk30sJBgo7PrauSA+bdwWbSEMEluh9nKtn5ZGpg4uBfkew8fCxu9oySgDcSL/dg
         KRYUwhN092Jvel12L80NJBUAh4FPxGF737gmLuIyx0TFFFlOUEY+DAe5Op7q+M3jO4Oh
         QBzZFYsJ069vwLPLWt1RJQJOyXInv6BKOCoBPNr1d0QGcyVrI92uTGG8EFsVpI2B75ms
         OtkIywd4lfDwN+QN1XxRYQrrzwoXq7y4NLTiSK95yU6+76tuisaDXsGu4Fegph62CR73
         GBg3UIUNaSndQ1/Afgl0/k6q/TKmAjEmDjJk9b8wKqXOv8zKfuymazqgHqRgLRKXpCaq
         Alzw==
X-Forwarded-Encrypted: i=1; AJvYcCWa7Ak/zV77SeBNl5ug3UtdN6mNKyuu8NmyGPLvOT9P+JS+YuCZ+X7zZ8YmyDoyRRvAeOK2aYOw8wodFtjW@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh1fShJU9Iso0EM2yLXp0psXML1ArQXl6quw4djQ4PP/p52gTu
	zfZ09d4Sjp+t9LS/Ku9xSbInFgE7lQHVcg27PBU8PHHg26VfoqkP
X-Google-Smtp-Source: AGHT+IGAXDu33VSy6AmpYrrmbRN+KUjIPi5AXD52xVLWdJ732bmlPlpjGTmoutGCH6nNYRDxU9SfBw==
X-Received: by 2002:a05:6a00:1809:b0:71e:6bf1:158f with SMTP id d2e1a72fcca58-720ab492bf1mr1534141b3a.21.1730240148953;
        Tue, 29 Oct 2024 15:15:48 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:768d:7e1:4b86:da7d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e451sm8083744b3a.24.2024.10.29.15.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 15:15:48 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] staging: rtl8723bs: change remaining printk to proper api
Date: Tue, 29 Oct 2024 19:15:44 -0300
Message-Id: <20241029221544.112800-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
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
The previous discussion about broken code with -DDBG_RX_SIGNAL_DISPLAY_RAW_DATA and
a unused function will be submitted in future patches.
Tks and regards.
---
Changelog
v4 a few more replacements/remove debug line as suggested;
v3 https://lore.kernel.org/linux-staging/f61d8272-4af3-40d6-a333-e7731c3fc5ae@stanley.mountain/T/#med344b7d344044851e1c96d498512c907d8be0ab
v2 https://lore.kernel.org/linux-staging/20241022031825.309568-1-rodrigo.gobbi.7@gmail.com/T/#m4c2796a796d7e5b456975365147c51d7977e9e81
v1 https://lore.kernel.org/lkml/2024101608-daycare-exterior-31fd@gregkh/T/#m1b2b4fdb8a5eec605983c12ca211d394b66cc79f
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  6 +++---
 drivers/staging/rtl8723bs/hal/hal_com.c           |  7 +++----
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ++++++++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      |  2 +-
 4 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index bbdd5fce28a1..ac5066db4e78 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1870,10 +1870,10 @@ unsigned int OnAction_sa_query(struct adapter *padapter, union recv_frame *precv
 	if (0) {
 		int pp;
 
-		printk("pattrib->pktlen = %d =>", pattrib->pkt_len);
+		netdev_dbg(padapter->pnetdev, "pattrib->pktlen = %d =>", pattrib->pkt_len);
 		for (pp = 0; pp < pattrib->pkt_len; pp++)
-			printk(" %02x ", pframe[pp]);
-		printk("\n");
+			pr_cont(" %02x ", pframe[pp]);
+		pr_cont("\n");
 	}
 
 	return _SUCCESS;
diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index faa6ed2b320d..ed391ee16e4a 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -909,10 +909,9 @@ void rtw_dump_raw_rssi_info(struct adapter *padapter)
 
 	for (rf_path = 0; rf_path < pHalData->NumTotalRFPath; rf_path++) {
 		if (!isCCKrate) {
-			printk(", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
-			psample_pkt_rssi->ofdm_pwr[rf_path], psample_pkt_rssi->ofdm_snr[rf_path]);
-		} else {
-			printk("\n");
+			netdev_dbg(padapter->pnetdev, ", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",
+				   psample_pkt_rssi->ofdm_pwr[rf_path],
+				   psample_pkt_rssi->ofdm_snr[rf_path]);
 		}
 	}
 }
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 46962b003d17..a8ffa219fb2a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -60,7 +60,8 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 	for (i = 0; i < blockCount_p1; i++) {
 		ret = rtw_write32(padapter, (FW_8723B_START_ADDRESS + i * blockSize_p1), *((u32 *)(bufferPtr + i * blockSize_p1)));
 		if (ret == _FAIL) {
-			printk("====>%s %d i:%d\n", __func__, __LINE__, i);
+			netdev_dbg(padapter->pnetdev, "write failed at %s %d, block:%d\n",
+				   __func__, __LINE__, i);
 			goto exit;
 		}
 	}
@@ -83,7 +84,8 @@ static int _BlockWrite(struct adapter *padapter, void *buffer, u32 buffSize)
 			ret = rtw_write8(padapter, (FW_8723B_START_ADDRESS + offset + i), *(bufferPtr + offset + i));
 
 			if (ret == _FAIL) {
-				printk("====>%s %d i:%d\n", __func__, __LINE__, i);
+				netdev_dbg(padapter->pnetdev, "write failed at %s %d, block:%d\n",
+					   __func__, __LINE__, i);
 				goto exit;
 			}
 		}
@@ -125,7 +127,8 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 		ret = _PageWrite(padapter, page, bufferPtr+offset, MAX_DLFW_PAGE_SIZE);
 
 		if (ret == _FAIL) {
-			printk("====>%s %d\n", __func__, __LINE__);
+			netdev_dbg(padapter->pnetdev, "page write failed at %s %d\n",
+				   __func__, __LINE__);
 			goto exit;
 		}
 	}
@@ -136,7 +139,8 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
 		ret = _PageWrite(padapter, page, bufferPtr+offset, remainSize);
 
 		if (ret == _FAIL) {
-			printk("====>%s %d\n", __func__, __LINE__);
+			netdev_dbg(padapter->pnetdev, "remaining page write failed at %s %d\n",
+				   __func__, __LINE__);
 			goto exit;
 		}
 	}
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d18fde4e5d6c..76801a2d1cb3 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -72,7 +72,7 @@ static int sdio_alloc_irq(struct dvobj_priv *dvobj)
 	err = sdio_claim_irq(func, &sd_sync_int_hdl);
 	if (err) {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_error_cnt++;
-		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
+		netdev_crit(dvobj->if1->pnetdev, "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
 	} else {
 		dvobj->drv_dbg.dbg_sdio_alloc_irq_cnt++;
 		dvobj->irq_alloc = 1;
-- 
2.34.1

