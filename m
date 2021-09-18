Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7298A3FC0
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:58:02 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id t8so12254810wri.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WazdEIYeLgC2M4P5etlF3fDRYMwlRfcJ++AuT25IEsI=;
        b=W+Dm+C3Q7of3Qw7mHYT7J9vGmfXKCzeSr0tEsQn2RP2LvF4kvzh2n7vnZgEKiIwO5l
         H7PKh3iuiwA81SA5UaKcVwCz66fVcnG5H6TrzoW1msXGs5pzLY/y1FOWuGI/q+b4eALN
         VIqfj/I+aiJbOJdhJEU04MDGXZeXvfJRCMao/3GewHq1kAw//idu8yzIrsuMOf1SCQWo
         kPFlkUvEO8dV82j1lDcnuFHLpinmoITUZrWkxukH/DKrJtQU++4FcYrniO39+sT54ekz
         VJFUC5+O/SmNET1kOeu6zl6ZkDBRKWjQbnHkgRTG+BO/klJqgyrukadcn0FEgKdtkisW
         zhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WazdEIYeLgC2M4P5etlF3fDRYMwlRfcJ++AuT25IEsI=;
        b=Ah9AioKgU9n8Es9hy25pJIIbR8EpJor5V9p3o8mYJCgceI/SthZXfKQVcgkhj26Rn3
         OV/F0e0bDJGdOFiKFQ9sv0DRo9X89/ua9BKMU+P9ubj7vg8t2FmBbRk656AKAevlDLWf
         OF0Pzr6jh5+CjMhgwEPAcU7B28ME84lY0I+iL5nLbWchcaG1Ms3lHWO29pPzOpKlBvfq
         iboYH+naNC/MRp+YQRRzYS6Vg96XCPlXlH/DhnAU0/eNo6HN7b9wFBMzLK0CJX9HF7uO
         2U4olQdifPV9Jf28RN6tJdhUnCIROCxLfOY3HSp4lR4Es/pYKAUsudOpeYaeGmvHI0hy
         C23Q==
X-Gm-Message-State: AOAM533F8ZPiXrBcR+sBPFRVjNxiTvWQ+8RwiJY1B+V7Cja8SZJvENgg
	Jm/eXwEZUwJ3Ci/kR1LkBls=
X-Google-Smtp-Source: ABdhPJwJerEZSe2Z/YPWpy+EOUby8Ty/a2y19pLYcJhM8lPU4HOSnRRhHs1JH9F/U8uhhA2JI3rZxg==
X-Received: by 2002:a5d:630a:: with SMTP id i10mr17455591wru.178.1631959080914;
        Sat, 18 Sep 2021 02:58:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:58:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/8] staging: r8188eu: remove rtw_IOL_cmd_tx_pkt_buf_dump()
Date: Sat, 18 Sep 2021 11:57:25 +0200
Message-Id: <20210918095727.13591-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918095727.13591-1-straube.linux@gmail.com>
References: <20210918095727.13591-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_IOL_cmd_tx_pkt_buf_dump() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/hal/rtl8188e_hal_init.c   | 32 -------------------
 .../staging/r8188eu/include/rtl8188e_hal.h    |  1 -
 2 files changed, 33 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index b271b2e54d0f..ef165ad98269 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -336,38 +336,6 @@ int rtl8188e_IOL_exec_cmds_sync(struct adapter *adapter, struct xmit_frame *xmit
 	return ret;
 }
 
-void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter *Adapter, int data_len)
-{
-	u32 fifo_data, reg_140;
-	u32 addr, rstatus, loop = 0;
-	u16 data_cnts = (data_len / 8) + 1;
-	u8 *pbuf = vzalloc(data_len + 10);
-	DBG_88E("###### %s ######\n", __func__);
-
-	rtw_write8(Adapter, REG_PKT_BUFF_ACCESS_CTRL, TXPKT_BUF_SELECT);
-	if (pbuf) {
-		for (addr = 0; addr < data_cnts; addr++) {
-			rtw_write32(Adapter, 0x140, addr);
-			rtw_usleep_os(2);
-			loop = 0;
-			do {
-				rstatus = (reg_140 = rtw_read32(Adapter, REG_PKTBUF_DBG_CTRL) & BIT(24));
-				if (rstatus) {
-					fifo_data = rtw_read32(Adapter, REG_PKTBUF_DBG_DATA_L);
-					memcpy(pbuf + (addr * 8), &fifo_data, 4);
-
-					fifo_data = rtw_read32(Adapter, REG_PKTBUF_DBG_DATA_H);
-					memcpy(pbuf + (addr * 8 + 4), &fifo_data, 4);
-				}
-				rtw_usleep_os(2);
-			} while (!rstatus && (loop++ < 10));
-		}
-		rtw_IOL_cmd_buf_dump(data_len, pbuf);
-		vfree(pbuf);
-	}
-	DBG_88E("###### %s ######\n", __func__);
-}
-
 static void _FWDownloadEnable(struct adapter *padapter, bool enable)
 {
 	u8 tmp;
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 24f21b1ed396..08dedf4c91b8 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -409,7 +409,6 @@ void Hal_ReadPowerSavingMode88E(struct adapter *pAdapter, u8 *hwinfo,
 
 void rtl8188e_read_chip_version(struct adapter *padapter);
 
-void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter  *Adapter, int len);
 s32 rtl8188e_iol_efuse_patch(struct adapter *padapter);
 void rtw_cancel_all_timer(struct adapter *padapter);
 void _ps_open_RF(struct adapter *adapt);
-- 
2.33.0

