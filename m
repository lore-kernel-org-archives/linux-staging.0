Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB6C4A0D
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 19:03:02 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l8so7358028wmi.2
        for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 12:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IH6I6NcjzPKjFPQf55rCYBqtWBzYJLRWJqZUybSFisQ=;
        b=SLDB+E6HI3mVhaxoZxkdrBbjmiTplPkAeBxrHHgklFWoNfBi+Ez2BIF4hXY/xMXYfb
         63a2uPrjxyD4qajLS8etlnj11O/Lw1K5LmvYxdhlRLN8SyjvDdzaVPj4YDmHco1njJWz
         8pDhszT9DWtRxau4UAAauOhBZdVkYcEzOJzD22ZpB09nmTqXkNDmvU34yOqRKMYgBsja
         mTdiYhW0H630TMfRif3kZVoplRWAgxCiZDVBWCLbvGcM7ci1XOwjhn4wKOx4U8/LHnjz
         hl9sckIoDG4elVElLba4+FHa4m9PZqKcoAQ4rKsFPvFlbLiKYVGNCa7IHuaxWfh8sxEh
         JvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH6I6NcjzPKjFPQf55rCYBqtWBzYJLRWJqZUybSFisQ=;
        b=hVYbm0WuSvkIIr+jhuCPiOSaHJmaU7Lt+qabJcB1ejc7Y7DGZcYQgVhg4qAcsW85eU
         bRucQooidJU45cptiXBHJh5LLhg2+VpXE8NyCz1S2Xjpa3o+2rfy5KvLNiYaqTPUkvSJ
         I3V1CO6VmDaLOADC9NxcURWKp3fATczBH5Se7Eb3tEOlnFSsNRUypXr5m5xbOwXr8rix
         IgKNsWnC48ILKtbNu1EdPcZ4B5O05e0u7UsAR/fk8DUKZFqJ/G8j9wyvHvn2GAaipIkZ
         SDNXWyHRfQBmiP13IR6gDytXueQbUSpvZGxg3IyVYC8mA3orvCqx5YOZlXasFTP3s05m
         jnMg==
X-Gm-Message-State: ACrzQf3S1AW4HxkWDqJA4X8HXJrKsNypuNXjsxmgwh7GT7xKG+iezXaX
	41CKXdmlifIPmm+YV9k6hEM=
X-Google-Smtp-Source: AMsMyM4qZY1iV7wZSdC8XvhQD27cyJst3gKx9MtPbnhPZejYFK2ZBJJsDmzhOF1N/NftEn4Rei8o5g==
X-Received: by 2002:a05:600c:154e:b0:3b4:bf17:32fc with SMTP id f14-20020a05600c154e00b003b4bf1732fcmr21269440wmg.70.1665428580308;
        Mon, 10 Oct 2022 12:03:00 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b003a531c7aa66sm11786569wmq.1.2022.10.10.12.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:02:59 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH] staging: rtl8192e: Remove single statement braces
Date: Mon, 10 Oct 2022 20:02:51 +0100
Message-Id: <20221010190252.12402-1-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces around single line statement, to resolve checkpatch.pl
warnings "braces {} are not necessary for single statement blocks"

Signed-off-by: Dragan Cvetic <dragan.m.cvetic@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 702551056227..d7bfaf68291c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -267,10 +267,8 @@ static void _rtl92e_dm_check_ac_dc_power(struct net_device *dev)
 			"PATH=/usr/bin:/bin",
 			 NULL};
 
-	if (priv->ResetProgress == RESET_TYPE_SILENT) {
+	if (priv->ResetProgress == RESET_TYPE_SILENT)
 		return;
-	}
-
 	if (priv->rtllib->state != RTLLIB_LINKED)
 		return;
 	call_usermodehelper(ac_dc_script, argv, envp, UMH_WAIT_PROC);
@@ -330,9 +328,8 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 	bool bshort_gi_enabled = false;
 	static u8 ping_rssi_state;
 
-	if (!priv->up) {
+	if (!priv->up)
 		return;
-	}
 
 	if (pra->rate_adaptive_disabled)
 		return;
@@ -777,9 +774,8 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 		tmpRegA = rtl92e_get_bb_reg(dev, rOFDM0_XATxIQImbalance,
 					    bMaskDWord);
 		for (i = 0; i < OFDM_Table_Length; i++) {
-			if (tmpRegA == OFDMSwingTable[i]) {
+			if (tmpRegA == OFDMSwingTable[i])
 				priv->OFDM_index[0] = i;
-			}
 		}
 
 		TempCCk = rtl92e_get_bb_reg(dev, rCCK0_TxFilter1, bMaskByte2);
@@ -1066,9 +1062,8 @@ void rtl92e_dm_restore_state(struct net_device *dev)
 	u32	reg_ratr = priv->rate_adaptive.last_ratr;
 	u32 ratr_value;
 
-	if (!priv->up) {
+	if (!priv->up)
 		return;
-	}
 
 	if (priv->rate_adaptive.rate_adaptive_disabled)
 		return;
-- 
2.25.1

