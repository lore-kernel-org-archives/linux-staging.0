Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9808B38F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FNlMaNDN"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5221bd8f62eso776980a12.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619081; x=1697223881; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YfQMCkdJny7ABVgnCi1T0mf+3QH6oGYzepXmVa+U+pQ=;
        b=FNlMaNDN7vMqz3rrknme//JQguOEeazS6WBFBtR0fphb7iqb0SFzeUU/Z16U10nneG
         RaKbbR4inanGzJjSUcgaXKBI1iiYWd4Wks+xAxCFwemCbljH2FRfady/8nPdJytJ8v15
         EDNHgru2eUi+tDHCXKsTXvesKzSBcz8afpyUBdNdQf0gnnwRal+EeXn7jhRLynYKLhKB
         lQGvJ7Oxwt/NEkJKyxBhMVix3eFiKPrSXjdDrw1u4sKbviwn03HN6IdMlYEDxtis2mIU
         fh7JqkfsbEBSxzHOfo93CoIq/1r3D9TIVYKyS9KANiZEM9ywZkaCbOJTB7yRkNM+2oPh
         rknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619081; x=1697223881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfQMCkdJny7ABVgnCi1T0mf+3QH6oGYzepXmVa+U+pQ=;
        b=K6js8xVL88L/Y3WtbH6Yb00br45DJfqgW+i4rhAyTe5Pg81CQTJH0ZiOuC+5XHpHQA
         gq7grVUkBQdUBxt5lleDsGSbXlbXJkBN/SisQHu4ZnoDPHZW8JELD9G/SuNDqZHL6kUE
         qem7N1pvWDDFEMHuZfsf/1CMgCODX5FSU2q9x8inwXhDYxZYaPl732plOe/S3qJUQ1Ir
         CKbW4m+koMbOcb4BZsBDSZxSSJdN1lVl/KokX62C0vJgz+4NWAfbIz+s4SRbRun/WwW5
         xA5HGYL0MbfGnDaN6gB/B8IAaVY54M1KTt/1t0nkyK3yYZI1WbxCS0GlaDWLcfxAS65e
         1Stw==
X-Gm-Message-State: AOJu0YwOYqf1PQXKJghOfYeAwCm1kthZ5/DQhg9o4/rw7TpjLqME1bCg
	yLIIIit8brRdCNlaSqdPATsc72zjvk0=
X-Google-Smtp-Source: AGHT+IGfUdlu6WLFYTTHiQQyc65bESgM7TGzc0IjN0hdMypUa3bRKUZizsSthk0rXiE6ydKb64e0vA==
X-Received: by 2002:a05:6402:190f:b0:523:220e:a6ca with SMTP id e15-20020a056402190f00b00523220ea6camr9284075edz.3.1696619080370;
        Fri, 06 Oct 2023 12:04:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id m10-20020aa7c2ca000000b00537fee52351sm2942875edp.28.2023.10.06.12.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:04:40 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:04:38 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/10] staging: rtl8192e: Remove function
 _rtl92e_wx_set_force_lps()
Message-ID: <833ccd9d1eee1a350f7801d86116e465b3713327.1696548527.git.philipp.g.hortmann@gmail.com>
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

Remove function _rtl92e_wx_set_force_lps() as this functionality is not
commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.h |  1 -
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 23 +-------------------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
index 922231274f4b..4b2ee1684dac 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.h
@@ -370,7 +370,6 @@ struct r8192_priv {
 
 	u16		tx_counter;
 	u16		rx_ctr;
-	bool		force_lps;
 };
 
 extern const struct ethtool_ops rtl819x_ethtool_ops;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index c367e4fa2af1..a85caabcaf6c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -133,7 +133,7 @@ static int _rtl92e_wx_adapter_power_status(struct net_device *dev,
 
 	mutex_lock(&priv->wx_mutex);
 
-	if (*extra || priv->force_lps) {
+	if (*extra) {
 		priv->ps_force = false;
 		psc->bLeisurePs = true;
 	} else {
@@ -169,22 +169,6 @@ static int _rtl92e_wx_set_lps_awake_interval(struct net_device *dev,
 	return 0;
 }
 
-static int _rtl92e_wx_set_force_lps(struct net_device *dev,
-				    struct iw_request_info *info,
-				    union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-
-	mutex_lock(&priv->wx_mutex);
-
-	netdev_info(dev,
-		    "%s(): force LPS ! extra is %d (1 is open 0 is close)\n",
-		    __func__, *extra);
-	priv->force_lps = *extra;
-	mutex_unlock(&priv->wx_mutex);
-	return 0;
-}
-
 static int _rtl92e_wx_set_debug(struct net_device *dev,
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
@@ -970,10 +954,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 		SIOCIWFIRSTPRIV + 0xa,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
 		"lps_interv"
-	}, {
-		SIOCIWFIRSTPRIV + 0xb,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
-		"lps_force"
 	}
 
 };
@@ -990,7 +970,6 @@ static iw_handler r8192_private_handler[] = {
 	(iw_handler)NULL,
 	(iw_handler)NULL,
 	(iw_handler)_rtl92e_wx_set_lps_awake_interval,
-	(iw_handler)_rtl92e_wx_set_force_lps,
 };
 
 static struct iw_statistics *_rtl92e_get_wireless_stats(struct net_device *dev)
-- 
2.42.0

