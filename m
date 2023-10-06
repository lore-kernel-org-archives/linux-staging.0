Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8E93AC01
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLm3/UNG"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-9ae65c0e46fso98992066b.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619102; x=1697223902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twZki8w+uSIknxeG/1Xm/hRx3jP9PNleQggQAAtzt9M=;
        b=hLm3/UNGmMIMK5qikSCZhgX02TvD1IRrZT7VZZQbWom0osmcSRrjlRl0vqkdb/uxoZ
         nR1iNjBKE8grT+F6AhucJ2j8nX+1UdvU8XWk5umQ5AK12eE2bNlhU8Iu/kxwJTOjHMo+
         +Za1WSEC/h4LLYhw6bSrxCr6V1vIe2bkOhtJYLyKA8/xMCeT+VDd44tBTqeMg4G/ibwb
         UHDxwYBO6H1K1MLB/2x5yNNzB7dgsJ+MUuTb/guk6rz1xOtNCzutD11c7mi6ytK653YY
         X/7wN/2pumILZvLoyK/rGjiFAV8FM6J5AnYEFexLg/3jWTcaSuMCELi1hHVq0RX67fvG
         7qcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619102; x=1697223902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twZki8w+uSIknxeG/1Xm/hRx3jP9PNleQggQAAtzt9M=;
        b=BIBp/3En4jRuu4HdqMuypfRnjB8xmX75GXhIzlHCU+wZD3x3f2ZDsGK4DqttOMSov6
         XgGvEsVqD1XmpHNfvID0C2vrtoWTnvSlCDc4XYkudFwGysdHPKq+P5qzW1YMlwL3qDr+
         J27bikSb+NkcWSi/Ge+c6qPKTsguFlOT6lJyV2/IvTqEWyUkHHWasXM41HZ8VT6rFtgR
         MYeZXkaiQUB3gnjAntbBsAf2n5Ia+LmVmO3OU16EHQcr9f6kAvYMLaXXALFeecYos0eM
         YspgLCgIRsDCYODg9jMjUDpJXhHmOgQ8wq2YItP2HSDjoGoahWQ/Bgh2I5wtO6uRKtw2
         51rw==
X-Gm-Message-State: AOJu0YwtYnCR+EmwCF9kpQ4RizedkYdn1DOU9FrArTbU9trhlYtwD1Vy
	e9J0MEN8ngBRtMu5pRF/upoBgDdT1Ow=
X-Google-Smtp-Source: AGHT+IERjSYnMDWJyyNYqjqazcemZh6LO2GQiCT7dnPc+/TP9DrQk7KrxJUf/ZeoVvrVks/phO6LeA==
X-Received: by 2002:a17:906:7389:b0:9b2:71f2:bd11 with SMTP id f9-20020a170906738900b009b271f2bd11mr7155082ejl.4.1696619102334;
        Fri, 06 Oct 2023 12:05:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id e12-20020a17090681cc00b009a9fbeb15f2sm3291667ejx.62.2023.10.06.12.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:05:02 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:05:00 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 04/10] staging: rtl8192e: Remove function
 _rtl92e_wx_adapter_power_status()
Message-ID: <2fc8f18019c760125ae7c52c765271d2877c52bd.1696548527.git.philipp.g.hortmann@gmail.com>
References: <cover.1696548527.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1696548527.git.philipp.g.hortmann@gmail.com>

Remove function _rtl92e_wx_adapter_power_status() as this functionality
is not commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 37 ----------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 35f25c60dfb9..27309df925ba 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -122,34 +122,6 @@ static int _rtl92e_wx_get_power(struct net_device *dev,
 	return rtllib_wx_get_power(priv->rtllib, info, wrqu, extra);
 }
 
-static int _rtl92e_wx_adapter_power_status(struct net_device *dev,
-					   struct iw_request_info *info,
-					   union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rt_pwr_save_ctrl *psc = (struct rt_pwr_save_ctrl *)
-					(&priv->rtllib->pwr_save_ctrl);
-	struct rtllib_device *ieee = priv->rtllib;
-
-	mutex_lock(&priv->wx_mutex);
-
-	if (*extra) {
-		priv->ps_force = false;
-		psc->bLeisurePs = true;
-	} else {
-		if (priv->rtllib->link_state == MAC80211_LINKED)
-			rtl92e_leisure_ps_leave(dev);
-
-		priv->ps_force = true;
-		psc->bLeisurePs = false;
-		ieee->ps = *extra;
-	}
-
-	mutex_unlock(&priv->wx_mutex);
-
-	return 0;
-}
-
 static int _rtl92e_wx_set_debug(struct net_device *dev,
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
@@ -927,10 +899,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 	}, {
 		SIOCIWFIRSTPRIV + 0x1,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "activescan"
-	}, {
-		SIOCIWFIRSTPRIV + 0x6,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
-		"set_power"
 	}
 
 };
@@ -938,11 +906,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 static iw_handler r8192_private_handler[] = {
 	(iw_handler)_rtl92e_wx_set_debug,   /*SIOCIWSECONDPRIV*/
 	(iw_handler)_rtl92e_wx_set_scan_type,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)_rtl92e_wx_adapter_power_status,
 };
 
 static struct iw_statistics *_rtl92e_get_wireless_stats(struct net_device *dev)
-- 
2.42.0

