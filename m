Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D63B53A7
	for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 19:58:55 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id b7so9093968wrt.3
        for <linux-staging@lists.linux.dev>; Wed, 18 Jan 2023 11:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nlnWE97X7ngzLnnfQ6OGCJ3cG9f4033Cw5LbKPBWyJ4=;
        b=kX2ZX4Fxg4qvkkLSmoZZxYqDqA66XQjI53km5A26ttfXuWqV/gq0dEli7OChN4cWzD
         9aFLa8aTGGHbtOgwjARDo5Qm8BOxvSCyK/yvJg6m3tL6cakS4WUyG1ofyTgJKndQOAKQ
         b1GJ5ZoVxbNppx5gHHh/MbGKdLkHsuQaGagkSaVazkyn5VH2FbXYa10BmXGhblbOQdhg
         QFOeUTjyTuSXvvPjIhrKDChSPYVdJRLxT9qA2z34L4tueWc+447yIl+BKwMWVi76/Gfx
         +Qw6f/FGujkhRgsDbBdpzl4Zp27eZ1nB/SAc/V5PPHB5iuuCy64i6isdFn0Swh9S6t7C
         WdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlnWE97X7ngzLnnfQ6OGCJ3cG9f4033Cw5LbKPBWyJ4=;
        b=57fokXpUD4nMQL4fWElPJMYxsW8YPKHOsqx92gQBleNBjVPwWPYu77yKPluSBggJ8k
         yT6KyHAAIuPYUbgPFb71u8aoeWCRkXrkv2/mIT3Tc1TaDHwHLE/meZ/H63fnWYKYRd6l
         jp/IgHAXHmvoeCGTcKP6drhgh5CyjeTy1qdb1u1876Cw9omsIr1BiHTr9Hb/ELivxe4m
         zQlIO2GrguYJReSSx1USSTbCJqzqTfZXkfPbsTSDgJ+UxdcDZOlHt/+IphQbF5Me47YK
         AZteFDWqu6bjsGXGHMpuuGVzKF5WofhGK/yZlEruWvOYkPkThApppYgVSGTCpZnUhWZZ
         XqJw==
X-Gm-Message-State: AFqh2kqAqDq6nWLGA1Lv2kXD1sm8v3Ug4A8Qzu0BBDY45gvf4r0BkAGc
	fMXBWLBzfkBrq+KhhRRGMnw=
X-Google-Smtp-Source: AMrXdXuzecd1kmyKEw0Neq3/2RZQ24KAMM+UXq1YMkyVNDlR+cGonMjw5dv2LW9jVOvahpo6wL28oA==
X-Received: by 2002:a05:6000:25c:b0:254:e300:df15 with SMTP id m28-20020a056000025c00b00254e300df15mr1608827wrz.1.1674071933860;
        Wed, 18 Jan 2023 11:58:53 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id c6-20020adffb06000000b002423620d356sm11920786wrr.35.2023.01.18.11.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 11:58:53 -0800 (PST)
Date: Wed, 18 Jan 2023 20:58:51 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] staging: rtl8192e: Rename LastRxDescTSF, LoopbackMode
 and pFirmware
Message-ID: <d6c77644d5602ad6e5b4889336a1a4700401321d.1674071236.git.philipp.g.hortmann@gmail.com>
References: <cover.1674071236.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674071236.git.philipp.g.hortmann@gmail.com>

Rename variable LastRxDescTSF to last_rx_desc_tsf, LoopbackMode to
loopback_mode and pFirmware to fw_info to avoid CamelCase which is not
accepted by checkpatch.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c     | 14 +++++++-------
 .../staging/rtl8192e/rtl8192e/r8192E_firmware.c    |  4 ++--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c       | 12 ++++++------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h       |  6 +++---
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b0f33fbffa42..a0678c6bac72 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -619,16 +619,16 @@ bool rtl92e_start_adapter(struct net_device *dev)
 		rtl92e_writeb(dev, ANAPAR, 0x37);
 		mdelay(500);
 	}
-	priv->pFirmware->status = FW_STATUS_0_INIT;
+	priv->fw_info->status = FW_STATUS_0_INIT;
 
 	ulRegRead = rtl92e_readl(dev, CPU_GEN);
-	if (priv->pFirmware->status == FW_STATUS_0_INIT)
+	if (priv->fw_info->status == FW_STATUS_0_INIT)
 		ulRegRead |= CPU_GEN_SYSTEM_RESET;
-	else if (priv->pFirmware->status == FW_STATUS_5_READY)
+	else if (priv->fw_info->status == FW_STATUS_5_READY)
 		ulRegRead |= CPU_GEN_FIRMWARE_RESET;
 	else
 		netdev_err(dev, "%s(): undefined firmware state: %d.\n",
-			   __func__, priv->pFirmware->status);
+			   __func__, priv->fw_info->status);
 
 	rtl92e_writel(dev, CPU_GEN, ulRegRead);
 
@@ -647,13 +647,13 @@ bool rtl92e_start_adapter(struct net_device *dev)
 		return rtStatus;
 	}
 
-	priv->LoopbackMode = RTL819X_NO_LOOPBACK;
+	priv->loopback_mode = RTL819X_NO_LOOPBACK;
 	if (priv->rst_progress == RESET_TYPE_NORESET) {
 		ulRegRead = rtl92e_readl(dev, CPU_GEN);
-		if (priv->LoopbackMode == RTL819X_NO_LOOPBACK)
+		if (priv->loopback_mode == RTL819X_NO_LOOPBACK)
 			ulRegRead = (ulRegRead & CPU_GEN_NO_LOOPBACK_MSK) |
 				    CPU_GEN_NO_LOOPBACK_SET;
-		else if (priv->LoopbackMode == RTL819X_MAC_LOOPBACK)
+		else if (priv->loopback_mode == RTL819X_MAC_LOOPBACK)
 			ulRegRead |= CPU_CCK_LOOPBACK;
 		else
 			netdev_err(dev, "%s: Invalid loopback mode setting.\n",
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
index 789d288d7503..b011ec8c8a41 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_firmware.c
@@ -51,7 +51,7 @@ static bool _rtl92e_fw_check_ready(struct net_device *dev,
 				   u8 load_fw_status)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rt_firmware *pfirmware = priv->pFirmware;
+	struct rt_firmware *pfirmware = priv->fw_info;
 	bool rt_status  = true;
 
 	switch (load_fw_status) {
@@ -134,7 +134,7 @@ bool rtl92e_init_fw(struct net_device *dev)
 	enum opt_rst_type rst_opt = OPT_SYSTEM_RESET;
 	enum firmware_init_step starting_state = FW_INIT_STEP0_BOOT;
 
-	struct rt_firmware *pfirmware = priv->pFirmware;
+	struct rt_firmware *pfirmware = priv->fw_info;
 
 	netdev_dbg(dev, " PlatformInitFirmware()==>\n");
 
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 8e1180b75d38..7a89381bae50 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -891,8 +891,8 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 
 	priv->card_type = PCI;
 
-	priv->pFirmware = vzalloc(sizeof(struct rt_firmware));
-	if (!priv->pFirmware)
+	priv->fw_info = vzalloc(sizeof(struct rt_firmware));
+	if (!priv->fw_info)
 		netdev_err(dev,
 			   "rtl8192e: Unable to allocate space for firmware\n");
 
@@ -1807,9 +1807,9 @@ void rtl92e_update_rx_pkt_timestamp(struct net_device *dev,
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	if (stats->bIsAMPDU && !stats->bFirstMPDU)
-		stats->mac_time = priv->LastRxDescTSF;
+		stats->mac_time = priv->last_rx_desc_tsf;
 	else
-		priv->LastRxDescTSF = stats->mac_time;
+		priv->last_rx_desc_tsf = stats->mac_time;
 }
 
 long rtl92e_translate_to_dbm(struct r8192_priv *priv, u8 signal_strength_index)
@@ -2386,8 +2386,8 @@ static void _rtl92e_pci_disconnect(struct pci_dev *pdev)
 		priv->polling_timer_on = 0;
 		_rtl92e_down(dev, true);
 		rtl92e_dm_deinit(dev);
-		vfree(priv->pFirmware);
-		priv->pFirmware = NULL;
+		vfree(priv->fw_info);
+		priv->fw_info = NULL;
 		_rtl92e_free_rx_ring(dev);
 		for (i = 0; i < MAX_TX_QUEUE_COUNT; i++)
 			_rtl92e_free_tx_ring(dev, i);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 8de726de57f4..da10835a987e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -325,8 +325,8 @@ struct r8192_priv {
 	struct bb_reg_definition PHYRegDef[4];
 	struct rate_adaptive rate_adaptive;
 
-	struct rt_firmware			*pFirmware;
-	enum rtl819x_loopback LoopbackMode;
+	struct rt_firmware *fw_info;
+	enum rtl819x_loopback loopback_mode;
 
 	struct timer_list			watch_dog_timer;
 	struct timer_list			fsync_timer;
@@ -360,7 +360,7 @@ struct r8192_priv {
 	int		rxringcount;
 	u16		rxbuffersize;
 
-	u64		LastRxDescTSF;
+	u64 last_rx_desc_tsf;
 
 	u32 receive_config;
 	u8		retry_data;
-- 
2.39.0

