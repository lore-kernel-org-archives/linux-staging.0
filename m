Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BDA38386
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308302; cv=none; b=OMQXYCJFe+wAtliSbOT1DefIDM9Sj/UO0ex1KnvWT2ant1HF++hROn9DVAMLTod0vsYJAUlpI81KAXkzvMakliZQ1IFSJUNB+4rJ8iY/VikZ0hBaYNWU2C1txssuIm0Ugf8PXWIC+/H4WZakVj6WkUnAOy3Low+emXBzOS9XNWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308302; c=relaxed/simple;
	bh=F30tm/e3g8v+2w4H9XqzdHYCd4VIxN5NuiWrZe5HNFs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hT+hZV/lmKJO8DSR2ov5b2ynFIyqLefm5w3Jf0IqS1eHdqenNbe4pIgGNzGRtvkJYaZzF8IZheyetqwVv/qdSQ+wqbcUJk+6S98+wGuis66pA4w5qkUcpQZWPyGFm+mzA6O3Ellv7jTefklDf5x/3PDUtimcoikydGXnxjz+FrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=e/0CNoLJ; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="e/0CNoLJ"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d730b6943bso5977795ad.2
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308300; x=1706913100; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmD7njZV+9GeCGUWgd9hXwhxj2qbFui5fbBAr2B6Sn0=;
        b=e/0CNoLJWUrmDp1PnLexMDzGfOi9pPoF20iJ820UJF096L61DbQzLBKgS9BBFZeHD8
         EZzmjETcb8/be7iWIxQTHi+r7gS+zfYq3bg16YwIQ4j+TSkHAlNajDLQQN8x8tK/nQtS
         89Ywl7x7XdtydBQx5fIqJBnBNlyUB1oY4XV9YYGxU2AyNkN7rz2bmdKdgCChLKqKu1LH
         XwAekiIXg11JJ6/UhuSdUfj+i73LKiGdK3rvbwESOQlSa56ocdTsJ8F1uUEU7CYsgh5W
         pPSdSsNseFkVU/cQ4ORE0Df0PSX9pYcchfgCx5qHbrba26d2gbE8oyLo/zieXUhEXhrv
         AmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308300; x=1706913100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmD7njZV+9GeCGUWgd9hXwhxj2qbFui5fbBAr2B6Sn0=;
        b=kd36oqWz6erXfKRLdsZvHteIxwTZlDZ5PoF170uf+VNHqZ11+s5y2a1QH3PA2uVsOB
         yAASIb4shQKusCFBmVoCTQnq2ANIj6hvJiq7+579DTsKUfjdssIMSC3+bWQdFOxKCKlL
         fyfiKIuTZW+OtN1r37rkMs4O0PxufkToSyg6/tCdQ9A3W8kGkEe+UDmN29CruyQ3F5FL
         0aSmqHjBBIdgeU7xkxF1hoGoSgLUy9NooY7Ap+LM7jT11vmPx+PhC4n6HNjUFWKPnC/O
         p4aNDNRFadakocc/5dLBZQHhxdPLTVXcOzspyeIJJAHnR1iABbFAqdrhFW9xIGIXTlOc
         vUBw==
X-Gm-Message-State: AOJu0YyEdH8u3siSa1rHaFK3JBpG351TrWH0pHRmFulMjMhUGnpQITvK
	JsA7tZGLrWWfyJpK0Y6VJhJcZ8XLSPUwP90vPtRRShdOIohsvtkjIL4QKMCofmKw48u+l98NxtL
	J
X-Google-Smtp-Source: AGHT+IGTnNV9dHo4NBiNkbq1PjrzoehYksQ+F5SIYChl3o0QydO1XSBR/FR8v8az3FEiAO2Pu3FloA==
X-Received: by 2002:a17:902:7485:b0:1d7:4cda:bea1 with SMTP id h5-20020a170902748500b001d74cdabea1mr459256pll.73.1706308300375;
        Fri, 26 Jan 2024 14:31:40 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:39 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 04/18] Staging: rtl8192e: Rename variable LPSDelayCnt
Date: Fri, 26 Jan 2024 14:30:52 -0800
Message-Id: <20240126223106.986093-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable LPSDelayCnt to lps_delay_cnt to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 4 ++--
 drivers/staging/rtl8192e/rtllib_tx.c         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 76aacd27e157..f986dbb215e4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -705,7 +705,7 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->hw_rf_off_action = 0;
 	priv->set_rf_pwr_state_in_progress = false;
 	priv->rtllib->pwr_save_ctrl.bLeisurePs = true;
-	priv->rtllib->LPSDelayCnt = 0;
+	priv->rtllib->lps_delay_cnt = 0;
 	priv->rtllib->sta_sleep = LPS_IS_WAKE;
 	priv->rtllib->rf_power_state = rf_on;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 94f370b40378..0a366874a827 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1375,7 +1375,7 @@ struct rtllib_device {
 	/* for PS mode */
 	unsigned long last_rx_ps_time;
 	bool			awake_pkt_sent;
-	u8			LPSDelayCnt;
+	u8			lps_delay_cnt;
 
 	/* used if IEEE_SOFTMAC_SINGLE_QUEUE is set */
 	struct sk_buff *mgmt_queue_ring[MGMT_QUEUE_NUM];
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 8a60bf3b7079..b5cd030f28c8 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1351,8 +1351,8 @@ static short rtllib_sta_ps_sleep(struct rtllib_device *ieee, u64 *time)
 	u8 dtim;
 	struct rt_pwr_save_ctrl *psc = &ieee->pwr_save_ctrl;
 
-	if (ieee->LPSDelayCnt) {
-		ieee->LPSDelayCnt--;
+	if (ieee->lps_delay_cnt) {
+		ieee->lps_delay_cnt--;
 		return 0;
 	}
 
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index b82f3415085b..e61eb6e87ab4 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -595,14 +595,14 @@ static int rtllib_xmit_inter(struct sk_buff *skb, struct net_device *dev)
 				   ((((u8 *)udp)[1] == 67) &&
 				   (((u8 *)udp)[3] == 68))) {
 					bdhcp = true;
-					ieee->LPSDelayCnt = 200;
+					ieee->lps_delay_cnt = 200;
 				}
 			}
 		} else if (ether_type == ETH_P_ARP) {
 			netdev_info(ieee->dev,
 				    "=================>DHCP Protocol start tx ARP pkt!!\n");
 			bdhcp = true;
-			ieee->LPSDelayCnt =
+			ieee->lps_delay_cnt =
 				 ieee->current_network.tim.tim_count;
 		}
 	}
-- 
2.39.2

