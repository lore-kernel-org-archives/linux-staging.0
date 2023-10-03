Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9DC38DE6
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:50 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-9b2d64c9307so53327766b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361629; x=1696966429; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o0RrMuYVrq3C/m7QhaLpLvy+gp+gXjLQFOpM9VmMeE8=;
        b=ZhMD50lOS/UoqaW+7u1Km7T/NLyp3NBRYVx22dQ6khFy30lp+z+ZWi8BAPjRMSioSi
         opGYja01qslD0IJhIip9Ped15TcLInF88Kl1uBg65SWk7HhTMwaPEka8oSq6i/6WYQI+
         YgGuLUGNvgRi0H3PRRsnqelz8EO4X5DWea9wGcs8DzoWXXIvLyoABxXcKKlq4hTsESn8
         mEDZ4m+l2CsilgmBW/EjnSRa/fWB6/Podelx5di2EwJKNuGvnDwnkXEJqr6/lYRQD5+r
         XhRedMfcou6OK7oGJq4lV41sme7by0k1vuRDR1NC4bNlYT3B88/HGnjcDBuf/wHQ1CJX
         +C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361629; x=1696966429;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0RrMuYVrq3C/m7QhaLpLvy+gp+gXjLQFOpM9VmMeE8=;
        b=VYOO4Fh2NTshdgpK5KVluQ4LC/KyklwQYXNDZ08tcMahUpYJKeGFPLxlN8guR78xl8
         +GNvNbgoFt/t1uHbNa3ugb8gsCbtWmZrqUCJOWtLWJ97eoRuiRbRgowi7Ce4+CknsW2P
         A9SM1FetY97PdJFNejfP/8z4VfXKi3G9/T6AmEyKTosSW2vNVztdUBXqU0fcL5NRAXJQ
         8ZIuf1zdKQN2DtFQW3D/ie1ti/Lva4hOHws556ck6uFaFSFWHChxLweYO61xoTfCUzzt
         7d3lCptKVchqGqyqLBpn65+48vZzirs5dPzsoWsNN0bzmHQlfxlUxToWyEgnRqlma29f
         4Z4g==
X-Gm-Message-State: AOJu0YyvsX3EhNknbKO0nUl6m/UI6kNajDMGDU9QMuF1UMorg81Yf97T
	5ezV3smnL55yfw7EKaspZqU=
X-Google-Smtp-Source: AGHT+IHobplVFBd7oTI8JXZLs5UOsJpJEOw3+xuRTqAxwNWNs97e7p5j/GdH4pDpzGTJdRNktyW79g==
X-Received: by 2002:a17:906:29a:b0:9a6:ae76:d6ae with SMTP id 26-20020a170906029a00b009a6ae76d6aemr101117ejf.3.1696361629349;
        Tue, 03 Oct 2023 12:33:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id kj6-20020a170907764600b009b2c9476726sm1535909ejc.21.2023.10.03.12.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:49 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:33:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] staging: rtl8192e: Remove function
 _rtl92e_wx_get_promisc_mode()
Message-ID: <8b1735a3f249b1cf73189e98a07e134c5cd50974.1696360404.git.philipp.g.hortmann@gmail.com>
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

Remove function _rtl92e_wx_get_promisc_mode() as this functionality is
not commonly used and the tool to access it is deprecated.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 34 ----------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 2f5acdd71339..d0b68b258af7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -918,25 +918,6 @@ static int _rtl92e_wx_get_gen_ie(struct net_device *dev,
 	return ret;
 }
 
-static int _rtl92e_wx_get_promisc_mode(struct net_device *dev,
-				       struct iw_request_info *info,
-				       union iwreq_data *wrqu, char *extra)
-{
-	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rtllib_device *ieee = priv->rtllib;
-
-	mutex_lock(&priv->wx_mutex);
-
-	snprintf(extra, 45, "PromiscuousMode:%d, FilterSrcSTAFrame:%d",
-		 ieee->intel_promiscuous_md_info.promiscuous_on,
-		 ieee->intel_promiscuous_md_info.fltr_src_sta_frame);
-	wrqu->data.length = strlen(extra) + 1;
-
-	mutex_unlock(&priv->wx_mutex);
-
-	return 0;
-}
-
 #define IW_IOCTL(x) ((x) - SIOCSIWCOMMIT)
 static iw_handler r8192_wx_handlers[] = {
 	[IW_IOCTL(SIOCGIWNAME)] = _rtl92e_wx_get_name,
@@ -995,9 +976,6 @@ static const struct iw_priv_args r8192_private_args[] = {
 		SIOCIWFIRSTPRIV + 0xb,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, IW_PRIV_TYPE_NONE,
 		"lps_force"
-	}, {
-		SIOCIWFIRSTPRIV + 0x17,
-		0, IW_PRIV_TYPE_CHAR | IW_PRIV_SIZE_FIXED | 45, "getpromisc"
 	}
 
 };
@@ -1015,18 +993,6 @@ static iw_handler r8192_private_handler[] = {
 	(iw_handler)NULL,
 	(iw_handler)_rtl92e_wx_set_lps_awake_interval,
 	(iw_handler)_rtl92e_wx_set_force_lps,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)NULL,
-	(iw_handler)_rtl92e_wx_get_promisc_mode,
 };
 
 static struct iw_statistics *_rtl92e_get_wireless_stats(struct net_device *dev)
-- 
2.42.0

