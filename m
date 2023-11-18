Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66506FBF1
	for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f6AzF71w"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-9dd9808c308so84040866b.0
        for <linux-staging@lists.linux.dev>; Sat, 18 Nov 2023 00:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700297467; x=1700902267; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=paSTu0WaDDknunnGESBB1JuMqk8D4OMu6cj43zrhMCg=;
        b=f6AzF71wk1uCmRrUZjik/6mjvoDwfVNM94zdL8x/IMrtvnBwiXDbb4Jo9zbqSA15ml
         6CypNRFy8+DDvTVumqR+dnkXAvJebWODGAYAeMIva3w4iVQPXPDHnqJ+Xj6FHBayHlO8
         E2002nZCmtkpW3yHq0Pl6YGGGhwT8Hb8hHm90wg32pWsUoGijfNXcxVyeI+qKCvA+RTN
         61jc2Xk/E4jqUKy6SaZLZ6aezLDEBzvrdURs/+FZs5HfUdFv1ILOnVKhC0IZAihoyZud
         92y+hRgqmgmVl9ZD1iok8WLhHbirymHC4DX03ZpIb1cF3Et2t2wFh2mEhi7rwsX6ph1W
         k/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700297467; x=1700902267;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=paSTu0WaDDknunnGESBB1JuMqk8D4OMu6cj43zrhMCg=;
        b=FRiQXDJLOK5ZJHCQLiCm1NNU2MgW+T/C39r+WZPVeN7yHYRMv7uGxN71k6e2L7Q5KJ
         3Nmc/VeMeflUXu1Lk/s+I8gIMrM5Rb/5qb/rG+0SUm58bNp0Cxgv6+P6e4pnpzyG9Sde
         klKQzyonEtDLBM2SC2gJtC8igV6j7O0JhnrsvVcPymiWfqbC5GZXg8YOY+W8zkMbqMaN
         4d5MOEjznHWUd0No1FN9WngnjRgQ/5Bqbh4uv4VNR9PBe0Gs1+x9I+EAokCWNyczKac6
         SHM5Brs/bPSaWUDF1ezG7DoaKr0HRqCorhDs2e6/2ja/5LiSZ1Y0VSNttoI7YIPSZLiC
         cruA==
X-Gm-Message-State: AOJu0YzGmWraY/JxQdqCOLUs2GIhISTL4XQN/0pvD/1W6m6XxSwTMNLa
	BgN/Lgi74aPVf6GqEvIkZ8s=
X-Google-Smtp-Source: AGHT+IEWpkgxkoy1xOUSJLtY2Vdy5FLz88TbjdaC1hbBUqnyKhSWmglq4dEfcaubqhyNZsM203tWFw==
X-Received: by 2002:a05:6402:22a2:b0:548:15d1:4ac with SMTP id cx2-20020a05640222a200b0054815d104acmr1154348edb.4.1700297467345;
        Sat, 18 Nov 2023 00:51:07 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57ba2f20.dip0.t-ipconnect.de. [87.186.47.32])
        by smtp.gmail.com with ESMTPSA id n6-20020aa7c786000000b005434095b179sm1493207eds.92.2023.11.18.00.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 00:51:07 -0800 (PST)
Date: Sat, 18 Nov 2023 09:51:05 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Remove unused return value of
 rtl92e_set_channel()
Message-ID: <0c0e7c72a10731ae7ed49c8161136b0f0b63d7a0.1700296319.git.philipp.g.hortmann@gmail.com>
References: <cover.1700296319.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1700296319.git.philipp.g.hortmann@gmail.com>

Remove unused return value of rtl92e_set_channel().

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ++++++------
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h |  2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h   |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 4d12d7385041..e1bd4d67e862 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -671,16 +671,16 @@ static void _rtl92e_phy_switch_channel_work_item(struct net_device *dev)
 	_rtl92e_phy_switch_channel(dev, priv->chan);
 }
 
-u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
+void rtl92e_set_channel(struct net_device *dev, u8 channel)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
 	if (!priv->up) {
 		netdev_err(dev, "%s(): Driver is not initialized\n", __func__);
-		return false;
+		return;
 	}
 	if (priv->sw_chnl_in_progress)
-		return false;
+		return;
 
 	switch (priv->rtllib->mode) {
 	case WIRELESS_MODE_B:
@@ -688,7 +688,7 @@ u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
 			netdev_warn(dev,
 				    "Channel %d not available in 802.11b.\n",
 				    channel);
-			return false;
+			return;
 		}
 		break;
 	case WIRELESS_MODE_G:
@@ -697,7 +697,7 @@ u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
 			netdev_warn(dev,
 				    "Channel %d not available in 802.11g.\n",
 				    channel);
-			return false;
+			return;
 		}
 		break;
 	}
@@ -714,7 +714,7 @@ u8 rtl92e_set_channel(struct net_device *dev, u8 channel)
 	if (priv->up)
 		_rtl92e_phy_switch_channel_work_item(dev);
 	priv->sw_chnl_in_progress = false;
-	return true;
+	return;
 }
 
 static void _rtl92e_cck_tx_power_track_bw_switch_tssi(struct net_device *dev)
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
index 6c4c33ded6a9..ff4b4004b0d0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h
@@ -41,7 +41,7 @@ void rtl92e_get_tx_power(struct net_device *dev);
 void rtl92e_set_tx_power(struct net_device *dev, u8 channel);
 u8 rtl92e_config_rf_path(struct net_device *dev, enum rf90_radio_path eRFPath);
 
-u8 rtl92e_set_channel(struct net_device *dev, u8 channel);
+void rtl92e_set_channel(struct net_device *dev, u8 channel);
 void rtl92e_set_bw_mode(struct net_device *dev,
 			enum ht_channel_width bandwidth,
 			enum ht_extchnl_offset Offset);
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index a4afbf3e934d..9b0be6dff627 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -228,7 +228,7 @@ struct r8192_priv {
 	struct rt_stats stats;
 	struct iw_statistics			wstats;
 
-	u8 (*rf_set_chan)(struct net_device *dev, u8 ch);
+	void (*rf_set_chan)(struct net_device *dev, u8 ch);
 
 	struct rx_desc *rx_ring;
 	struct sk_buff	*rx_buf[MAX_RX_COUNT];
-- 
2.42.0

