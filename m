Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16E03C1C
	for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 22:51:32 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id i203-20020a1c3bd4000000b003b3df9a5ecbso5322115wma.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Sep 2022 15:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=heMq8ZyNcby7A2cMF3qI/WZaLnJ9T+jpUMoUVSz+v/Q=;
        b=eT0jFR8ExgGkkw3jXjOsHCjkqf/punsrb1XIJ5x6mSgxSDmahwOF/et/MWA+50l4kW
         w8/nykJZTYoJfyOIuIJir9xSjF0wUz8eGR4h7JRLs7bW/y+M7A/0fTeat99zH9V/p0il
         EQqOjn78Z7KphXqYezcIIfTuQ0uDa2KkXf+BADX1Vapohvbjt6UYiS/7CsmAERn+ZeRi
         6avYoDhmetxD3TOQbm1P/S0My6VKDqmQvDtZsT0aeoAz4GQK5ltfyeKVr4mh/2ikgFcV
         jPa7P4mprdXyGAIyaUVHbSJC16b4PCdZlS+Rq87X7exBWSE942f0Kq/Nqhxf/EA8KxV9
         pMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=heMq8ZyNcby7A2cMF3qI/WZaLnJ9T+jpUMoUVSz+v/Q=;
        b=n2nfjwGRxCTBhg/Zzj5MJdUbpz9am9qoW3VxxVKbzZwhVZAG4keR9ZiMqBEXjl42wA
         jmnldX8eazAh4SDzuGpWk2Szf0+TBE00OfAyaB1deRCIiEDwddtY5j2Ye96kWYZHWQT6
         ntg6QLD2SIcoYyXVNxsb2M9drT14Nw8C1SKzuVk0o00YGs33CAVr/5f/zhg1hqLu4Ars
         guHnh4VjTuzCNd71EAxp35aBniMGm+jNd5PBLMzEHNdDSmQ6U9QP9QMeALvSYjUMY4Yt
         eob4iQDEqGBQVPVL9vGpu26BLelTDGAic2tx7M+hqWHFWl9LgKkaFxuV5ihTn2VgxBYZ
         n8sg==
X-Gm-Message-State: ACrzQf1czllNapDQhn4I1vZTe1GBCE2wMgpAZPaq4quAw7BpuJpYPwjE
	Qms1Agt22r9sgCmP4UBLL1c=
X-Google-Smtp-Source: AMsMyM5hJfDdbCxRzZdmGTtj+Cg22JT701S+ABKtsJzDOkw7JaxxGN2ZtCiWp+NgFF90PlI26RlBsw==
X-Received: by 2002:a05:600c:284:b0:3b5:3360:3f8c with SMTP id 4-20020a05600c028400b003b533603f8cmr29380wmk.83.1664059890910;
        Sat, 24 Sep 2022 15:51:30 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id bj4-20020a0560001e0400b0022a403954c3sm11143165wrb.42.2022.09.24.15.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Sep 2022 15:51:30 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH] staging: rtl8192e: Rename Tx_Retry_Count_Reg
Date: Sat, 24 Sep 2022 23:51:26 +0100
Message-Id: <20220924225126.10527-1-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename: Current_Tx_Rate_Reg to CURRENT_TX_RATE_REG, Initial_Tx_Rate_Reg to
INITIAL_TX_RATE_REG and Tx_Retry_Count_Reg to TX_RETRY_COUNT_REG to avoid
CamelCase which is not accepted by checkpatch.pl.

Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 11 +++--------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h |  6 +++---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 3ee52147960e..9fefa1a7ae75 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -2499,14 +2499,9 @@ static void _rtl92e_dm_check_txrateandretrycount(struct net_device *dev)
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
 
-	ieee->softmac_stats.CurrentShowTxate = rtl92e_readb(dev,
-						 Current_Tx_Rate_Reg);
-
-	ieee->softmac_stats.last_packet_rate = rtl92e_readb(dev,
-						 Initial_Tx_Rate_Reg);
-
-	ieee->softmac_stats.txretrycount = rtl92e_readl(dev,
-						 Tx_Retry_Count_Reg);
+	ieee->softmac_stats.CurrentShowTxate = rtl92e_readb(dev, CURRENT_TX_RATE_REG);
+	ieee->softmac_stats.last_packet_rate = rtl92e_readb(dev, INITIAL_TX_RATE_REG);
+	ieee->softmac_stats.txretrycount = rtl92e_readl(dev, TX_RETRY_COUNT_REG);
 }
 
 static void _rtl92e_dm_send_rssi_to_fw(struct net_device *dev)
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index ea1b14bbcdcd..51e295d389a8 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -42,9 +42,9 @@
 #define	 TX_POWER_ATHEROAP_THRESH_HIGH	   78
 #define		TX_POWER_ATHEROAP_THRESH_LOW		72
 
-#define			Current_Tx_Rate_Reg	 0x1e0
-#define			Initial_Tx_Rate_Reg	 0x1e1
-#define			Tx_Retry_Count_Reg	 0x1ac
+#define		CURRENT_TX_RATE_REG		0x1e0
+#define		INITIAL_TX_RATE_REG		0x1e1
+#define		TX_RETRY_COUNT_REG		0x1ac
 #define		RegC38_TH				 20
 
 #define		DM_Type_ByDriver		1
-- 
2.25.1

