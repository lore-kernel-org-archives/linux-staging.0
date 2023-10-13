Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF246134DC
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 14:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V12IEaIF"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40651b22977so5491695e9.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697208247; x=1697813047; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2pr0IzxvU4PJX3BEoAev8yksHWUcNoh24JtDBC0yvj8=;
        b=V12IEaIFW8ek2aycAfPyIPaOXWKMyKGnt3Dh/BII7eYFpYNxFgOM38V9gLmRO83Uw5
         ncJbN+7NlyFXvHa6BIPQTpLx5vAINDh8fEZNxjvkXuGIfYu3cX8hh/F+qki9QXqi6rC8
         +i5JRrjwf8VfosGXnF7CtA4AHFT065eyLs3UbvXXBkEDjcQzIChNG+kDIfhBO8hbHDWE
         ELpkqGZMjmM0OoYrxLTHCZtTiJW6aztor6nSwkjklbxvbSNrR1rOquzxRrV5BBrq7LFn
         HjIEeJFFVNHwZLa6T2IT8nM725c2Bc0+0QkTr+AW7SNAqnPrsWIdvRzwa1+Gf6tU81IN
         HEtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697208247; x=1697813047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pr0IzxvU4PJX3BEoAev8yksHWUcNoh24JtDBC0yvj8=;
        b=bdQR9XH09EzdakHHRDV8gbT5k7QqsgP6Y3Y5QPP07Uq/H3t/Gm0pBb6A4aln+bTGWX
         75V/kcMecOy6r63hm/NB/iKSxu1g0+IhKuB2htkqXfFvK1FDE+pssSgKEMqMnYWlPlPi
         CY3SMzEwvC/2BCvcWwzi7qU7TF7iI9LBzgYMAxM+Ak/dqdJcPXbX7yxvKQodQmk2w1XL
         1Hcz9+M4GpKDdRdW4UiMHU9rBUuXxMOTvcT0vxpUXarVkUyJCe8xpqkA6C7cdTsG1xpp
         acPJinJ3sBCE82j52+sCtqRswHRLSTwIaiyxGza4WLUO84XuwW130KFQj6adp5Gz+WJB
         yy0Q==
X-Gm-Message-State: AOJu0Yx9t3zKCTAIz0FtelPJourZOCCVgSpeX8Gi6MLd7gq6wq1FjaeB
	ttB/5lCtKmED+SdbLdadOlxPbNBhuYw=
X-Google-Smtp-Source: AGHT+IHtZomzfKRt/2/71UhVOm+Uh/gqPQFN82UqGQjXbQNaaKC0vahQ2HX9x92+okKCLYnYUJrtcQ==
X-Received: by 2002:a05:600c:3c96:b0:403:334:fb0d with SMTP id bg22-20020a05600c3c9600b004030334fb0dmr24327640wmb.4.1697208246738;
        Fri, 13 Oct 2023 07:44:06 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c35cf00b00401e32b25adsm333362wmq.4.2023.10.13.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 07:44:06 -0700 (PDT)
Date: Fri, 13 Oct 2023 16:44:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] staging: rtl8192e: Remove
 _rtl92e_dm_ctrl_initgain_byrssi_false_alarm()
Message-ID: <80a5a0b67d9d225a58c96781c33e2216c0ea1c6e.1697127817.git.philipp.g.hortmann@gmail.com>
References: <cover.1697127817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697127817.git.philipp.g.hortmann@gmail.com>

Remove function _rtl92e_dm_ctrl_initgain_byrssi_false_alarm() as it is
unused. Remove in above function called function
_rtl92e_dm_ctrl_initgain_byrssi_highpwr() as well.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 115 ---------------------
 1 file changed, 115 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 2bbc6a67188c..e69c22e5d205 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -163,9 +163,7 @@ static	void	_rtl92e_dm_check_tx_power_tracking(struct net_device *dev);
 
 static void _rtl92e_dm_dig_init(struct net_device *dev);
 static void _rtl92e_dm_ctrl_initgain_byrssi(struct net_device *dev);
-static void _rtl92e_dm_ctrl_initgain_byrssi_highpwr(struct net_device *dev);
 static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev);
-static void _rtl92e_dm_ctrl_initgain_byrssi_false_alarm(struct net_device *dev);
 static void _rtl92e_dm_initial_gain(struct net_device *dev);
 static void _rtl92e_dm_pd_th(struct net_device *dev);
 static void _rtl92e_dm_cs_ratio(struct net_device *dev);
@@ -987,119 +985,6 @@ static void _rtl92e_dm_ctrl_initgain_byrssi_driver(struct net_device *dev)
 	dm_digtable.pre_sta_connect_state = dm_digtable.cur_sta_connect_state;
 }
 
-static void _rtl92e_dm_ctrl_initgain_byrssi_false_alarm(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	u8 i;
-
-	if (dm_digtable.dig_algorithm_switch) {
-		dm_digtable.dig_state = DM_STA_DIG_MAX;
-		for (i = 0; i < 3; i++)
-			rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x1);
-		dm_digtable.dig_algorithm_switch = 0;
-	}
-
-	if (priv->rtllib->link_state != MAC80211_LINKED)
-		return;
-
-	if ((priv->undecorated_smoothed_pwdb > dm_digtable.rssi_low_thresh) &&
-		(priv->undecorated_smoothed_pwdb < dm_digtable.rssi_high_thresh))
-		return;
-	if (priv->undecorated_smoothed_pwdb <= dm_digtable.rssi_low_thresh) {
-		if (dm_digtable.dig_state == DM_STA_DIG_OFF)
-			return;
-
-		dm_digtable.dig_highpwr_state = DM_STA_DIG_MAX;
-		dm_digtable.dig_state = DM_STA_DIG_OFF;
-
-		rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x8);
-
-		rtl92e_writeb(dev, rOFDM0_XAAGCCore1, 0x17);
-		rtl92e_writeb(dev, rOFDM0_XBAGCCore1, 0x17);
-		rtl92e_writeb(dev, rOFDM0_XCAGCCore1, 0x17);
-		rtl92e_writeb(dev, rOFDM0_XDAGCCore1, 0x17);
-
-		if (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20)
-			rtl92e_writeb(dev, (rOFDM0_XATxAFE + 3), 0x00);
-		else
-			rtl92e_writeb(dev, rOFDM0_RxDetector1, 0x42);
-
-		rtl92e_writeb(dev, 0xa0a, 0x08);
-
-		return;
-	}
-
-	if (priv->undecorated_smoothed_pwdb >= dm_digtable.rssi_high_thresh) {
-		u8 reset_flag = 0;
-
-		if (dm_digtable.dig_state == DM_STA_DIG_ON) {
-			_rtl92e_dm_ctrl_initgain_byrssi_highpwr(dev);
-			return;
-		}
-
-		dm_digtable.dig_state = DM_STA_DIG_ON;
-
-		if (reset_flag == 1) {
-			rtl92e_writeb(dev, rOFDM0_XAAGCCore1, 0x2c);
-			rtl92e_writeb(dev, rOFDM0_XBAGCCore1, 0x2c);
-			rtl92e_writeb(dev, rOFDM0_XCAGCCore1, 0x2c);
-			rtl92e_writeb(dev, rOFDM0_XDAGCCore1, 0x2c);
-		} else {
-			rtl92e_writeb(dev, rOFDM0_XAAGCCore1, 0x20);
-			rtl92e_writeb(dev, rOFDM0_XBAGCCore1, 0x20);
-			rtl92e_writeb(dev, rOFDM0_XCAGCCore1, 0x20);
-			rtl92e_writeb(dev, rOFDM0_XDAGCCore1, 0x20);
-		}
-
-		if (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20)
-			rtl92e_writeb(dev, (rOFDM0_XATxAFE + 3), 0x20);
-		else
-			rtl92e_writeb(dev, rOFDM0_RxDetector1, 0x44);
-
-		rtl92e_writeb(dev, 0xa0a, 0xcd);
-
-		rtl92e_set_bb_reg(dev, UFWP, bMaskByte1, 0x1);
-	}
-	_rtl92e_dm_ctrl_initgain_byrssi_highpwr(dev);
-}
-
-static void _rtl92e_dm_ctrl_initgain_byrssi_highpwr(struct net_device *dev)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	if ((priv->undecorated_smoothed_pwdb >
-	     dm_digtable.rssi_high_power_lowthresh) &&
-	    (priv->undecorated_smoothed_pwdb <
-	     dm_digtable.rssi_high_power_highthresh))
-		return;
-
-	if (priv->undecorated_smoothed_pwdb >=
-	    dm_digtable.rssi_high_power_highthresh) {
-		if (dm_digtable.dig_highpwr_state == DM_STA_DIG_ON)
-			return;
-		dm_digtable.dig_highpwr_state = DM_STA_DIG_ON;
-
-		if (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20)
-			rtl92e_writeb(dev, (rOFDM0_XATxAFE + 3), 0x10);
-		else
-			rtl92e_writeb(dev, rOFDM0_RxDetector1, 0x43);
-	} else {
-		if (dm_digtable.dig_highpwr_state == DM_STA_DIG_OFF)
-			return;
-		dm_digtable.dig_highpwr_state = DM_STA_DIG_OFF;
-
-		if ((priv->undecorated_smoothed_pwdb <
-		     dm_digtable.rssi_high_power_lowthresh) &&
-		    (priv->undecorated_smoothed_pwdb >=
-		    dm_digtable.rssi_high_thresh)) {
-			if (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20)
-				rtl92e_writeb(dev, (rOFDM0_XATxAFE + 3), 0x20);
-			else
-				rtl92e_writeb(dev, rOFDM0_RxDetector1, 0x44);
-		}
-	}
-}
-
 static void _rtl92e_dm_initial_gain(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-- 
2.42.0

