Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6871B155345
	for <linux-staging@lists.linux.dev>; Wed, 23 Oct 2024 23:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729725122; cv=none; b=fTvkTSd6HWDLL+GNCRRyqnbNemazyJFa0FIfqlByEhaZR6PQHCrYS1Ldo1prXCrM5uTk781dFffTi/QSxCmRt3nZaP+J3vP0udTjuEcZAmjJLcWFeQC8CnXrvhhFck9LYJOTjp6GLN5YAh2PgSCeoLE+tHasboFBgnONRAMLndI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729725122; c=relaxed/simple;
	bh=52yxQ09WqtOP8XWTM3BCpq4gMiDnmGK4/cPqR1ygOss=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WTV+fYPjfpTxFa3I1O5zVGY/2FuQI+oJoydoF1WSFGNVuUycCaHlta4HY3/nnC/HvWvVlhLNHvdriR8PDT8Ornt9buB5+Hhn3A0+6IQWGMpJB1i01aTAmeMOJzn733AUsZ1XKq4wLeBIJDgdeEvhp+QGgOoWEB2V7F2n1cgfWsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=liJqmhgf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="liJqmhgf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20c714cd9c8so2613795ad.0
        for <linux-staging@lists.linux.dev>; Wed, 23 Oct 2024 16:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729725120; x=1730329920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SU8yiz0V0vst08PcfWR+Gq/6ECQ78CI5BJYqXjnM518=;
        b=liJqmhgfTgUhfWkWMGEOh63DfgCyTtgZQ9VOHqyz46sS5KR/IxMUDpANpTfp+OIjeg
         +OUMcGJynq4eF2s0DSjd/PoeDaMQbMWzEDYv0jHMXoKzUo4sOuV7VmGAIZgDsJ/9HNAJ
         GPZhQ3MFiG5EMO7Rh/DGJ3xJnJa8+1WplNXa/Xc93grArZibAPmDAjNM0dmb0f0l0PRH
         EawMJFna38htOGY+izwfpMGvZkbht0JrgjFiD2ZzOaT2R51J0HCd416FQIyZMEgWALay
         oaWT2jvrVDaVFz6Xb8qx0yP6nFUuJdLScoCHpjASpVaZSucNG2/t+DlBn3a3FZ0vR3Bx
         ocSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729725120; x=1730329920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SU8yiz0V0vst08PcfWR+Gq/6ECQ78CI5BJYqXjnM518=;
        b=qD9CtH7W5YHa8rrIU0oTWOdg32x6jJvLS/v7Ktr7gu0hNxdMa2h9hJgziNsKNqQC8B
         2icx68/XjMtJJDwBsDJMpHaJ1PqJ1yBO+rKooL6XCk1cRnSLgjoLNN+9L8XSALCouZR5
         Gwv/dRPr3pD8b+PaJ9lvCQwefmMGpRL7hxC3HkZl4P1hDP42ctGMWvpgD1yviKjwE61d
         m3LBylYkNjbf8T+InkL2HAdAW3v52vgraAxeCBT/ILf+bCH5POPaBdY5N/B5GpsS46oj
         eDvQYPiSJdc8kOAp4rq/msQq4/vtVgOeF1SdiaGCLNtSpg5i6X4016+eOwcKwCsBdxCp
         6IJw==
X-Forwarded-Encrypted: i=1; AJvYcCX5rZcdjeR6SAPZ/u0SM34urro1eB/0ytVqHlVeUwlVsAmM34AohOnb5bUxxkqvYeb1rxb+okNKQBOTmhX2@lists.linux.dev
X-Gm-Message-State: AOJu0YynwW4NvCZtvN5sL3Zhn64fQ5xtM7zL4zmMut9LvkAlz5CxW+TP
	P1u9w2DuLroX73BHJUJgy16NvIKnyVd+cIDDZgA1ciqzTGT5UJ1u
X-Google-Smtp-Source: AGHT+IEflSLaad6uyDoEl+X0MW0rMClwemlGqgqmwWEmYqE2G4G794S+5c1kY+WTIzf2CIjykB6Pdg==
X-Received: by 2002:a17:903:32cf:b0:20b:775f:506d with SMTP id d9443c01a7336-20fa9e784f7mr55885225ad.34.1729725119640;
        Wed, 23 Oct 2024 16:11:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:97bb:b4e6:f236:f01a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee65c9sm62508675ad.22.2024.10.23.16.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 16:11:59 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: rtl8723bs: change remaining printk to proper api
Date: Wed, 23 Oct 2024 20:11:55 -0300
Message-Id: <20241023231155.16940-1-rodrigo.gobbi.7@gmail.com>
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
I didn't use the netdev_dbg() over drivers/staging/rtl8723bs/hal/hal_com.c
because I noticed now that rtw_dump_raw_rssi_info() and the hal file is a 
little broken with -DDBG_RX_SIGNAL_DISPLAY_RAW_DATA, maybe we can 
fix that in a next patch. 

Suggesting to keep the pr_debug() in the hal file for now.

Tks and regards.
---
Changelog
v3 additional changes to netdev_dbg() at rtl8723b_hal_init.c file
v2 https://lore.kernel.org/linux-staging/20241022031825.309568-1-rodrigo.gobbi.7@gmail.com/T/#m4c2796a796d7e5b456975365147c51d7977e9e81
v1 https://lore.kernel.org/lkml/2024101608-daycare-exterior-31fd@gregkh/T/#m1b2b4fdb8a5eec605983c12ca211d394b66cc79f
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     |  6 +++---
 drivers/staging/rtl8723bs/hal/hal_com.c           |  7 ++++---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 12 ++++++++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      |  2 +-
 4 files changed, 16 insertions(+), 11 deletions(-)

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
index faa6ed2b320d..5994e574ae99 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -909,10 +909,11 @@ void rtw_dump_raw_rssi_info(struct adapter *padapter)
 
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

