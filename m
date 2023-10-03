Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B038DE6
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:33:58 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-9ae3d4c136fso43735966b.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361637; x=1696966437; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=65qY9p1JHLXsscBYDiGb2B/qb5l0KlsXBI1MwO5lht4=;
        b=m9AtpMFfJ6FfGwvFFkkPEleS7TpPwAYWvjVNM2ZQpNitbK/qtX4d2U+nKom3Wic9/Y
         9ITqLRbWmsJXdrX6aeYvD+Ctw2NB/Ox/lKy1CEPrj4UA97mRXx0//ihB+ySu+A9k0uom
         FOVCE7bECgH2WwLYU3tWhCb/h69mjeOpNW5e8am+0qbCs15CY0ggn042s1GPtCz/YT/c
         DM4WZjPxH1d8yHFicLZ390fypdTs5x3NBDawrC1zIf9W4YWx45087LBoYDr6aGDcJzFC
         oB1O+fzpVNFkBgAjy/to4o13/TkGB5QY/ij93DTq78JIGoCninzJZt+aLogeMp97IBLQ
         05RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361637; x=1696966437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65qY9p1JHLXsscBYDiGb2B/qb5l0KlsXBI1MwO5lht4=;
        b=G+6gFb02cvCwJB1M3cyQwomDFFGBTd51AllJ6s0WMZsRK4+rf63v/XU2kXeA5N8vJ3
         7Wefnz14IdZKlnkCFlaivWAC3x2tM4KITrkxhMwcFMEzBxrqlo1pvzzr/74mhRwyMt5Q
         O9ZnZa9DdfTULYFrF8vttW9mtDn/eJMKJrE3WCQ0SH183k2IyNcSeAa8S6g/EKIwdrUf
         MPAiOEqZ0c0etTYifGWC5Ht+x3TTKrqVYJDzyh3B6C1o5QTl89EhWMX5RpR4oDawF30W
         BmbftgUg4/LQytFHmXqLqXVtxOC7J6km0rCnH4KddODK190tPZRZcpdWS4Eyb9ovdm/P
         Yf7w==
X-Gm-Message-State: AOJu0YxBhY1Y8EtW8a3HYhwP8mqbshL1c8s7kap8qkPQhP/n4MXitKkR
	hK4RxFUFG7yYZ98PdPIocwY=
X-Google-Smtp-Source: AGHT+IFm0kslgEQE8tTlmftu25T7l4uOUCBmcDzctq6F4trkmT85/5QpkQC8MDJIQln4FY8tpQR5jQ==
X-Received: by 2002:a17:906:2c9:b0:9a6:5340:c331 with SMTP id 9-20020a17090602c900b009a65340c331mr136764ejk.2.1696361637066;
        Tue, 03 Oct 2023 12:33:57 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id mb15-20020a170906eb0f00b00993470682e5sm1526372ejb.32.2023.10.03.12.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:33:56 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:33:55 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] staging: rtl8192e: Remove constant variable
 fltr_src_sta_frame
Message-ID: <1a37a8be464bb25531657aa7c868201676d7abb6.1696360404.git.philipp.g.hortmann@gmail.com>
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

Remove variable fltr_src_sta_frame as it is set to 0 and unchanged. The
equation results accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c |  2 --
 drivers/staging/rtl8192e/rtllib.h            |  1 -
 drivers/staging/rtl8192e/rtllib_rx.c         | 10 ----------
 3 files changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 9c872819969a..f15f73be41a2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -741,8 +741,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->rtllib->iw_mode = IW_MODE_INFRA;
 	priv->rtllib->net_promiscuous_md = false;
 	priv->rtllib->intel_promiscuous_md_info.promiscuous_on = false;
-	priv->rtllib->intel_promiscuous_md_info.fltr_src_sta_frame =
-								 false;
 	priv->rtllib->ieee_up = 0;
 	priv->retry_rts = DEFAULT_RETRY_RTS;
 	priv->retry_data = DEFAULT_RETRY_DATA;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a02e8c976ca0..748ae8d35c1a 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1177,7 +1177,6 @@ struct rt_pmkid_list {
 
 struct rt_intel_promisc_mode {
 	bool promiscuous_on;
-	bool fltr_src_sta_frame;
 };
 
 /*************** DRIVER STATUS   *****/
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index a7b6f837024d..1086dd0809be 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -956,16 +956,6 @@ static int rtllib_rx_data_filter(struct rtllib_device *ieee, struct ieee80211_hd
 		return -1;
 	}
 
-	/* Filter packets sent by an STA that will be forwarded by AP */
-	if (ieee->intel_promiscuous_md_info.promiscuous_on  &&
-		ieee->intel_promiscuous_md_info.fltr_src_sta_frame) {
-		if ((fc & IEEE80211_FCTL_TODS) && !(fc & IEEE80211_FCTL_FROMDS) &&
-		    !ether_addr_equal(dst, ieee->current_network.bssid) &&
-		    ether_addr_equal(bssid, ieee->current_network.bssid)) {
-			return -1;
-		}
-	}
-
 	/* Nullfunc frames may have PS-bit set, so they must be passed to
 	 * hostap_handle_sta_rx() before being dropped here.
 	 */
-- 
2.42.0

