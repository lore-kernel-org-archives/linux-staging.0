Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C1A4D10A
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919969; cv=none; b=lXNMGd7SOLzX6z/FhoI/gIwbYt7zqwNIAfPrGPuZ0Apbcqm1E9QvK9fB0rEOwfvcwu9O6+orwdr0faeB/Cc7jWyiie9O0OIaVo5Z+CTZdx/BwkJd9pDYBp5gPMOhJb3bfKQKNogRcXWyBdx3rPC6cp5RCLN/2QkiQhGmfitkVmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919969; c=relaxed/simple;
	bh=Hb2gzq4riFTqoohaJYo7tJV4g6poU6GnyQ7xdS4Myh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Usd2pWu+uOl6s7DIGq41JCWvG6ylZiO6nOq4z8aGDGf+8M2IejHam1GSqG8z6HrH5p6ePFybTCr6X0z1w5RBd3dcX+pG3BaUwyyyfXrWA5J+lcsb8DwOgsDk/4EssqLtES292Plssr8GEKn7G3RWlwXiPJTQRcuYikgoj+ZIgp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=FEw9ONDC; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FEw9ONDC"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d94b222a3aso27431135ad.2
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919967; x=1709524767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V637UI8jqLYaoLt6Jphn/pSof6w0WRdDGgG+CHcmXrE=;
        b=FEw9ONDCfMbtx+bvx4BapPuoX+5OowKwjndbVlJFowgkySc8B6uDckhzLMKfnVVkdE
         o80RZxcwcsuZUlKz4WtstMXOslIOIHSflEjGIF3KiVtshdLF/zZr/f+iIuGG9z4eykbP
         0dIROO7rrb4tjOJqsCTOel1skACyAWTBu8M+JV3KWn9DU2jFpugo71i8POQrM6+evOnq
         RlYmIV5YEylprFTUUn/hF+odX1p8D7qoC2tDQWSOueEUjGigVeW/OuzUnVbcaMavl7J2
         fsN1VuoJeXhYloL9M7DlRU7S4wn/ZBOQBnya+OGCS7s2QtHgR5/cgk1nylqL0goU4LYO
         kqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919967; x=1709524767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V637UI8jqLYaoLt6Jphn/pSof6w0WRdDGgG+CHcmXrE=;
        b=PQF/arGYeZUHnZTC8T9jk1ZgEoodFRNBnQ+drzwZLjsQDGDam9XVGRzYYclkdnSRWC
         s+KzG27/mD88N3CY9w7GJ/nP967eypnEIBx3jUDCtdQLYzhTJaf2BuyGiLfNNdVpgMNP
         hvkQdxGMOABLUz7FQrxzFZv428YUV5Z/Sm9Mbe9uf+lZJlBpyYa7irHs929IJpdKj/NM
         4KBmES39nG8ndRe6Uk9PFHwuoYLm4SczJSojqdBcy4A3qQ5t9rTpsndHpLed+DDsogxQ
         Wph8uUGhL7F6xnhwbyLk73yxdr8FBHQmG/38omf6u0qHvDagHzSsiYfjN+HXhnmx00/j
         S2hA==
X-Gm-Message-State: AOJu0YyQZrR4jNqo052kWgHwDrzRbdILF8P6mcXSc6bctsEKwNBJrvPX
	V3thLwWGWv0tdv3HlOH4E2EzgmGv/cS3xzm9H8ojCEZoYF/vHnKu4SQmyu7zE9Y=
X-Google-Smtp-Source: AGHT+IENvooUMubg98bMfNVI0RvxJTLd2gooTD4DC84K+k6OwjgQott9+o1MVAglbzqDfP6OG4+szA==
X-Received: by 2002:a17:902:b60d:b0:1db:c71a:5693 with SMTP id b13-20020a170902b60d00b001dbc71a5693mr6408992pls.26.1708919967275;
        Sun, 25 Feb 2024 19:59:27 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id iy13-20020a170903130d00b001da105d6a83sm2893426plb.224.2024.02.25.19.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:59:26 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 8/8] Staging: rtl8192e: Rename function GetHalfNmodeSupportByAPsHandler()
Date: Sun, 25 Feb 2024 19:59:15 -0800
Message-Id: <20240226035915.370478-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035915.370478-1-tdavies@darkphysics.net>
References: <20240226035915.370478-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function GetHalfNmodeSupportByAPsHandler to
get_half_nmode_support_by_aps_handler to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c   | 2 +-
 drivers/staging/rtl8192e/rtl819x_BAProc.c    | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c    | 8 ++++----
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index fc5014f719d7..50a4e1cb8c79 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -657,7 +657,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->ps_is_queue_empty = _rtl92e_is_tx_queue_empty;
 
 	priv->rtllib->get_nmode_support_by_sec_cfg = rtl92e_get_nmode_support_by_sec;
-	priv->rtllib->GetHalfNmodeSupportByAPsHandler =
+	priv->rtllib->get_half_nmode_support_by_aps_handler =
 						rtl92e_is_halfn_supported_by_ap;
 
 	priv->rtllib->set_hw_reg_handler = rtl92e_set_reg;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 57e1a361a7c9..047da39f730e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -354,7 +354,7 @@ static void _rtl92e_dm_check_rate_adaptive(struct net_device *dev)
 			}
 		}
 
-		if (priv->rtllib->GetHalfNmodeSupportByAPsHandler(dev))
+		if (priv->rtllib->get_half_nmode_support_by_aps_handler(dev))
 			target_ratr &=  0xf00fffff;
 
 		current_ratr = rtl92e_readl(dev, RATR0);
diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 04f3fb54d1b7..834329886ea2 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -276,7 +276,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 	ba->ba_timeout_value = *ba_timeout_value;
 	ba->ba_start_seq_ctrl = *ba_start_seq_ctrl;
 
-	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev) ||
+	if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev) ||
 	    (ieee->ht_info->iot_action & HT_IOT_ACT_ALLOW_PEER_AGG_ONE_PKT))
 		ba->ba_param_set.field.buffer_size = 1;
 	else
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index abc21ae49ff7..fa96a2c2c916 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -252,7 +252,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	}
 
 	cap_ele->AdvCoding		= 0;
-	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
+	if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev))
 		cap_ele->ChlWidth = 0;
 	else
 		cap_ele->ChlWidth = 1;
@@ -301,7 +301,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 		if (ht->iot_action & HT_IOT_ACT_DISABLE_RX_40MHZ_SHORT_GI)
 			cap_ele->ShortGI40Mhz		= 0;
 
-		if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev)) {
+		if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev)) {
 			cap_ele->ChlWidth = 0;
 			cap_ele->MCS[1] = 0;
 		}
@@ -408,7 +408,7 @@ static u8 ht_filter_mcs_rate(struct rtllib_device *ieee, u8 *pSupportMCS,
 
 	ht_pick_mcs_rate(ieee, pOperateMCS);
 
-	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
+	if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev))
 		pOperateMCS[1] = 0;
 
 	for (i = 2; i <= 15; i++)
@@ -666,7 +666,7 @@ void ht_set_connect_bw_mode(struct rtllib_device *ieee,
 {
 	struct rt_hi_throughput *ht_info = ieee->ht_info;
 
-	if (ieee->GetHalfNmodeSupportByAPsHandler(ieee->dev))
+	if (ieee->get_half_nmode_support_by_aps_handler(ieee->dev))
 		bandwidth = HT_CHANNEL_WIDTH_20;
 
 	if (ht_info->sw_bw_in_progress) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index fe850dbeaa02..38ae9d1b24c1 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1486,7 +1486,7 @@ struct rtllib_device {
 				    enum ht_extchnl_offset Offset);
 	bool (*get_nmode_support_by_sec_cfg)(struct net_device *dev);
 	void (*set_wireless_mode)(struct net_device *dev, u8 wireless_mode);
-	bool (*GetHalfNmodeSupportByAPsHandler)(struct net_device *dev);
+	bool (*get_half_nmode_support_by_aps_handler)(struct net_device *dev);
 	u8   (*rtllib_ap_sec_type)(struct rtllib_device *ieee);
 	void (*init_gain_handler)(struct net_device *dev, u8 Operation);
 	void (*ScanOperationBackupHandler)(struct net_device *dev,
-- 
2.39.2

