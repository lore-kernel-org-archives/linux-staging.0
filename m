Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0468814AB8
	for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 15:09:47 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1ab032d9266so68781695ad.0
        for <linux-staging@lists.linux.dev>; Wed, 10 May 2023 08:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683731387; x=1686323387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2MdUvkOQf/H6u+bsf32R+0B6I/OaVbOPJFXkpsnz650=;
        b=XceF3oromGb5RS/guK2wNN+F2+fqB6JGxs7JAUfy+IEbKlO7bEtxA6sXW708RRTFWP
         ZqnxwP405zkdO0YTUCrGlt/lBHeiWf0E4tUX1GA+PCCAPYxJonNfE5GpahOwbHlqAj+3
         il9lkE7h45xz7Wcv/OZancE5Se6+GhgCnxaCYqcGYmHbFQJRJw+O+axe9tF1tn/T5/4Y
         qj3h0h39+rZHEOEs/Lhz4DUAnZQaleeubwdAATBlQqxi4QG787tbarETiRuOPQByXxdX
         GkLgea/YP03ocP4r7LJBMAcxzqi9T65axWaC7446iyfMeCMPU2/KqoRWejisvI539GxW
         47ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683731387; x=1686323387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MdUvkOQf/H6u+bsf32R+0B6I/OaVbOPJFXkpsnz650=;
        b=EdMbKIvXzChaGTT368WPA2s6tes76nguCA8Ba1TLwLsaGWrMnBBxziSCzFZAJ54jXH
         rsq4AmqtUQmMFyTPJjhorIlnsLaZ9hU/BuNy9+DJjDvw48AfXRgw6TSN8JY1x8KD33Mf
         HMIZmQBTDJffcvALBcRnp5RTlwuZawrItQloZCN3Svyivh1DLA+2044h1UMQ4kdR4Jr7
         UpCbcGoFjxt3YTSxA6BcbJS2rD//Ka1ZFVLCaw/i7P+w+Ro6RSsCqMmcq3fpQdQTc8gA
         i3+SUJSf0W5mD10ztWF2ZP0C5TZhD3cEVqxf5RMOPtn380g1TG/i/mY3Wdsq26Mpl4dH
         W+pQ==
X-Gm-Message-State: AC+VfDwvGx6rtv2lDH2vw5B+5FxBmJNc2ge6L62281alFYLA+p6h7IrC
	+INt2952gZbvavrcTP5uynU=
X-Google-Smtp-Source: ACHHUZ5h/G3A7pgdl0GfHmqF4GkzWayqzY9cVOhrOcG4jGAppA16m8qxu+4Svg3UWJ/bUXfGwNxSwA==
X-Received: by 2002:a17:902:c94b:b0:1ab:14f2:e7e6 with SMTP id i11-20020a170902c94b00b001ab14f2e7e6mr21581496pla.65.1683731387410;
        Wed, 10 May 2023 08:09:47 -0700 (PDT)
Received: from pop-os.localdomain ([103.251.210.208])
        by smtp.gmail.com with ESMTPSA id m2-20020a1709026bc200b001a045f45d49sm3869439plt.281.2023.05.10.08.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 08:09:47 -0700 (PDT)
Date: Wed, 10 May 2023 20:39:42 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8192e: Rename tmpCCK20Mindex and
 tmpCCK40Mindex
Message-ID: <3e8b6cd85e6e4fcc934cc1d813f5f594cef8ff92.1683730854.git.yogi.kernel@gmail.com>
References: <cover.1683730854.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683730854.git.yogi.kernel@gmail.com>

Rename variable tmpCCK20Mindex to tmp_cck_20m_index and
tmpCCK40Mindex to tmp_cck_40m_index to avoid CamelCase which
is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 117c0538cf5f..a44be3f810ab 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -658,7 +658,7 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 #define ThermalMeterVal	9
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u32 tmp_reg, tmp_cck;
-	u8 tmp_ofdm_index, tmp_cck_index, tmpCCK20Mindex, tmpCCK40Mindex, tmpval;
+	u8 tmp_ofdm_index, tmp_cck_index, tmp_cck_20m_index, tmp_cck_40m_index, tmpval;
 	int i = 0, CCKSwingNeedUpdate = 0;
 
 	if (!priv->tx_pwr_tracking_init) {
@@ -689,33 +689,33 @@ static void _rtl92e_dm_tx_power_tracking_cb_thermal(struct net_device *dev)
 	priv->thermal_meter[1] = ThermalMeterVal;
 
 	if (priv->thermal_meter[0] >= (u8)tmp_reg) {
-		tmp_ofdm_index = tmpCCK20Mindex = 6+(priv->thermal_meter[0] -
+		tmp_ofdm_index = tmp_cck_20m_index = 6+(priv->thermal_meter[0] -
 			      (u8)tmp_reg);
-		tmpCCK40Mindex = tmpCCK20Mindex - 6;
+		tmp_cck_40m_index = tmp_cck_20m_index - 6;
 		if (tmp_ofdm_index >= OFDM_TABLE_LEN)
 			tmp_ofdm_index = OFDM_TABLE_LEN - 1;
-		if (tmpCCK20Mindex >= CCK_TABLE_LEN)
-			tmpCCK20Mindex = CCK_TABLE_LEN - 1;
-		if (tmpCCK40Mindex >= CCK_TABLE_LEN)
-			tmpCCK40Mindex = CCK_TABLE_LEN - 1;
+		if (tmp_cck_20m_index >= CCK_TABLE_LEN)
+			tmp_cck_20m_index = CCK_TABLE_LEN - 1;
+		if (tmp_cck_40m_index >= CCK_TABLE_LEN)
+			tmp_cck_40m_index = CCK_TABLE_LEN - 1;
 	} else {
 		tmpval = (u8)tmp_reg - priv->thermal_meter[0];
 		if (tmpval >= 6) {
 			tmp_ofdm_index = 0;
-			tmpCCK20Mindex = 0;
+			tmp_cck_20m_index = 0;
 		} else {
 			tmp_ofdm_index = 6 - tmpval;
-			tmpCCK20Mindex = 6 - tmpval;
+			tmp_cck_20m_index = 6 - tmpval;
 		}
-		tmpCCK40Mindex = 0;
+		tmp_cck_40m_index = 0;
 	}
 	if (priv->current_chnl_bw != HT_CHANNEL_WIDTH_20)
-		tmp_cck_index = tmpCCK40Mindex;
+		tmp_cck_index = tmp_cck_40m_index;
 	else
-		tmp_cck_index = tmpCCK20Mindex;
+		tmp_cck_index = tmp_cck_20m_index;
 
-	priv->rec_cck_20m_idx = tmpCCK20Mindex;
-	priv->rec_cck_40m_idx = tmpCCK40Mindex;
+	priv->rec_cck_20m_idx = tmp_cck_20m_index;
+	priv->rec_cck_40m_idx = tmp_cck_40m_index;
 
 	if (priv->rtllib->current_network.channel == 14 &&
 	    !priv->bcck_in_ch14) {
-- 
2.34.1

