Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A5038DE6
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:09 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9b2d64c9307so53292466b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361587; x=1696966387; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0r3DREMiH6yQfDoDU6vaHZLHIyC1HQyFX1F4ZCsk8E0=;
        b=OSre2BQtAZcNojgoX/u7EYjnnZPmOkr/6cXv9sbnb16CECZCAlq6WATmltN0o+uUOY
         WUQZOqDvjad1aNvUuE0oCBYQmoeXr5DyGCdPtzaCwDW9RwX/fkPJnuHrLLwelWz/e1pA
         KG2WI/bgp9hefuJq0lLBvFI72F6VhWrCyyWdyURHOZbpobmIThCcgC82iaZFCLxrMJL6
         w1U6YsiDBdNItQxWGSdZoUFK7+pqO8pZVNe0nvmSLxEDhfAZFpeE9gSFpGrmP5hPNy4M
         +lNIZ3JtK/qZyS8zKgYt5Ma4UwB3EZxvvtgImIocPE8pD5BBBdVfxPNylXw8oFp/X8tV
         PGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361587; x=1696966387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0r3DREMiH6yQfDoDU6vaHZLHIyC1HQyFX1F4ZCsk8E0=;
        b=tVfdzsJpZdxrR88pqEYfhpWlVYHBaT+hchFHU7coCTv3iietAwizYmrp08583B6aKs
         tC9dk8nwiMp0spWtyWHnKEYLnefHgSuXUukfSzd+v5r3nQRPEnTARvSdBat80lpmDHCH
         lGCBSy4fGjnmeOYnARslzeQ+E/XS4Y53VnDqUkj6joXFpM8s96+y392m5mEsZWjUX+2v
         Zrezo8Y48NMlxAOhNDwXr87UQtwBCMbUia/7jyQOrrMXujMSqav6dZLa+Q9P32ybmwLw
         um0chcLmeRivQpmAdhf00pDLaomSsV1xokwzxjh0Hu3BaSOfd4OFo5zKQOlUPQzknPsz
         tOsg==
X-Gm-Message-State: AOJu0Yz0kMCOjAR2GHuh1U3crBSppH0bEmfrpPu5jCzthxAGDbYyubqv
	YYkh7JSHGrZWJYtSBPpT/ZZAxdTfigA=
X-Google-Smtp-Source: AGHT+IGL/Kojw0O9o6XKrJT+/wDlbuGiq4mxQwluohDgRPGLUuuz5BUJBo4NzFmgPQnSeIPqeaIt6w==
X-Received: by 2002:a17:906:5194:b0:9a1:b4f9:b1db with SMTP id y20-20020a170906519400b009a1b4f9b1dbmr154888ejk.1.1696361587272;
        Tue, 03 Oct 2023 12:33:07 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id va17-20020a17090711d100b009aa292a2df2sm1512913ejb.217.2023.10.03.12.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:07 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:33:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] staging: rtl8192e: Remove function
 _rtl92e_wx_set_rawtx()
Message-ID: <96196bf0f45934e8e49f1d185165e2a36f5bca7d.1696360403.git.philipp.g.hortmann@gmail.com>
References: <cover.1696360403.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696360403.git.philipp.g.hortmann@gmail.com>

Remove function _rtl92e_wx_set_rawtx() as this functionality is not
commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 24 +--------------
 drivers/staging/rtl8192e/rtllib.h            |  4 ---
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 32 --------------------
 3 files changed, 1 insertion(+), 59 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index e7be89833b59..f28e70a0da4f 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -122,25 +122,6 @@ static int _rtl92e_wx_get_power(struct net_device *dev,
 	return rtllib_wx_get_power(priv->rtllib, info, wrqu, extra);
 }
 
-static int _rtl92e_wx_set_rawtx(struct net_device *dev,
-				struct iw_request_info *info,
-				union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	int ret;
-
-	if (priv->hw_radio_off)
-		return 0;
-
-	mutex_lock(&priv->wx_mutex);
-
-	ret = rtllib_wx_set_rawtx(priv->rtllib, info, wrqu, extra);
-
-	mutex_unlock(&priv->wx_mutex);
-
-	return ret;
-}
-
 static int _rtl92e_wx_adapter_power_status(struct net_device *dev,
 					   struct iw_request_info *info,
 					   union iwreq_data *wrqu, char *extra)
@@ -1044,9 +1025,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 	}, {
 		SIOCIWFIRSTPRIV + 0x1,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "activescan"
-	}, {
-		SIOCIWFIRSTPRIV + 0x2,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "rawtx"
 	}, {
 		SIOCIWFIRSTPRIV + 0x6,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
@@ -1072,7 +1050,7 @@ static const struct iw_priv_args r8192_private_args[] = {
 static iw_handler r8192_private_handler[] = {
 	(iw_handler)_rtl92e_wx_set_debug,   /*SIOCIWSECONDPRIV*/
 	(iw_handler)_rtl92e_wx_set_scan_type,
-	(iw_handler)_rtl92e_wx_set_rawtx,
+	(iw_handler)NULL,
 	(iw_handler)NULL,
 	(iw_handler)NULL,
 	(iw_handler)NULL,
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index d3ac6ea71030..98b8b7db027e 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1755,10 +1755,6 @@ int rtllib_wx_get_freq(struct rtllib_device *ieee, struct iw_request_info *a,
 		       union iwreq_data *wrqu, char *b);
 void rtllib_wx_sync_scan_wq(void *data);
 
-int rtllib_wx_set_rawtx(struct rtllib_device *ieee,
-			struct iw_request_info *info,
-			union iwreq_data *wrqu, char *extra);
-
 int rtllib_wx_get_name(struct rtllib_device *ieee, struct iw_request_info *info,
 		       union iwreq_data *wrqu, char *extra);
 
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index bd2b8bba86eb..f32584291704 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -436,38 +436,6 @@ int rtllib_wx_get_mode(struct rtllib_device *ieee, struct iw_request_info *a,
 }
 EXPORT_SYMBOL(rtllib_wx_get_mode);
 
-int rtllib_wx_set_rawtx(struct rtllib_device *ieee,
-			struct iw_request_info *info,
-			union iwreq_data *wrqu, char *extra)
-{
-	int *parms = (int *)extra;
-	int enable = (parms[0] > 0);
-	short prev = ieee->raw_tx;
-
-	mutex_lock(&ieee->wx_mutex);
-
-	if (enable)
-		ieee->raw_tx = 1;
-	else
-		ieee->raw_tx = 0;
-
-	netdev_info(ieee->dev, "raw TX is %s\n",
-		    ieee->raw_tx ? "enabled" : "disabled");
-
-	if (ieee->iw_mode == IW_MODE_MONITOR) {
-		if (prev == 0 && ieee->raw_tx)
-			netif_carrier_on(ieee->dev);
-
-		if (prev && ieee->raw_tx == 1)
-			netif_carrier_off(ieee->dev);
-	}
-
-	mutex_unlock(&ieee->wx_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL(rtllib_wx_set_rawtx);
-
 int rtllib_wx_get_name(struct rtllib_device *ieee, struct iw_request_info *info,
 		       union iwreq_data *wrqu, char *extra)
 {
-- 
2.42.0

