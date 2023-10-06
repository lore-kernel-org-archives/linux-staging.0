Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4F338F98
	for <linux-staging@lists.linux.dev>; Fri,  6 Oct 2023 19:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+6P32Qs"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-53142351997so840033a12.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Oct 2023 12:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696619088; x=1697223888; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TR+CJlGMm2zmH2722XJ9+Q+Usd9T7hGbLEyurllWFf4=;
        b=B+6P32Qs53i5q2FlShvG4cWyiB/RtDo/l0nz2BPKnAbIdlgnNkO8CNVNJ4obRu0Ekr
         d94cpcQqHmHKWQSr/tIlQoDmZNQb1XhyKCjicgjGtcdNEM5DFgb2fpzE+PSrXzu2mZDg
         0ECVfOjIe+kKAIl6hUS5bidX8OrqJxk42ejd+vE2yFgUJsw0iLZ/LwlpqwjIOfwN72k1
         RZqLt4svbHJKsL3uplTdw/apUSQD2BIqMxS5R6NdutK/pLbb5boNA56uVpOILRIimwZd
         U07Z+6AOskWpCL1lYovRwhvUFxZCadUU/VbU3diYtj1jvoxUWydSxgYtGRznzNqyQt2x
         BzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696619088; x=1697223888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TR+CJlGMm2zmH2722XJ9+Q+Usd9T7hGbLEyurllWFf4=;
        b=DTMG7rs6ZbWA/22zuB0kdzWb5+lrjOlejae6Ixyru8FsM8OyKvgHSC1rwBYbjBFolo
         5nzNEwbwZyPDDayhMwGdiLO9g5yIut3STICdypa9j1auDnXs7Mf1O9ga3jnWECbIdUgF
         J3HWYOi8qPbwCeT96SHroDBkDJLQSqwnywoy4gvt3evP+5VCXohw+W+xV8bAWylt6s00
         ILsZ4Yyz4TX9hMM8ZKB725cEC1f+a1UhB133bu8tvhySHNuzungIhgK6wW+f3hCS4LKb
         aQWvZrHM1ydvuroUNP7Ew8iopbI8cZ2CLLYDO9y3tHMO+EPCuJMYWvYa0BqcPQd0zFiP
         uVrQ==
X-Gm-Message-State: AOJu0YzIUIFp8f97T5O9AVPa/C37GIMH5gPSvhFwoEUAenyx16zn6YIL
	EVk+jRWZgNEgOdeV0OujiV6ZdzS+jqA=
X-Google-Smtp-Source: AGHT+IFJa0rsAW6/pfcQurQ+spG1NdYAdUrIbUs5vicN0GDSE5zNFYUTcSuR4wBVRFeK4sa3k5roGA==
X-Received: by 2002:a05:6402:1d53:b0:522:580f:8304 with SMTP id dz19-20020a0564021d5300b00522580f8304mr8605911edb.1.1696619088133;
        Fri, 06 Oct 2023 12:04:48 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id p26-20020aa7d31a000000b00534ac155da7sm2951084edq.29.2023.10.06.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 12:04:47 -0700 (PDT)
Date: Fri, 6 Oct 2023 21:04:46 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Remove function
 _rtl92e_wx_set_lps_awake_interval()
Message-ID: <f0bce7933d3d3761ddc42ba64a4ce46827bd3304.1696548527.git.philipp.g.hortmann@gmail.com>
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

Remove function _rtl92e_wx_set_lps_awake_interval() as this functionality
is not commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 27 ----------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index a85caabcaf6c..35f25c60dfb9 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -150,25 +150,6 @@ static int _rtl92e_wx_adapter_power_status(struct net_device *dev,
 	return 0;
 }
 
-static int _rtl92e_wx_set_lps_awake_interval(struct net_device *dev,
-					     struct iw_request_info *info,
-					     union iwreq_data *wrqu,
-					     char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rt_pwr_save_ctrl *psc = (struct rt_pwr_save_ctrl *)
-					(&priv->rtllib->pwr_save_ctrl);
-
-	mutex_lock(&priv->wx_mutex);
-
-	netdev_info(dev, "%s(): set lps awake interval ! extra is %d\n",
-		    __func__, *extra);
-
-	psc->reg_max_lps_awake_intvl = *extra;
-	mutex_unlock(&priv->wx_mutex);
-	return 0;
-}
-
 static int _rtl92e_wx_set_debug(struct net_device *dev,
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
@@ -950,10 +931,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 		SIOCIWFIRSTPRIV + 0x6,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
 		"set_power"
-	}, {
-		SIOCIWFIRSTPRIV + 0xa,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
-		"lps_interv"
 	}
 
 };
@@ -966,10 +943,6 @@ static iw_handler r8192_private_handler[] = {
 	(iw_handler)NULL,
 	(iw_handler)NULL,
 	(iw_handler)_rtl92e_wx_adapter_power_status,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)_rtl92e_wx_set_lps_awake_interval,
 };
 
 static struct iw_statistics *_rtl92e_get_wireless_stats(struct net_device *dev)
-- 
2.42.0

