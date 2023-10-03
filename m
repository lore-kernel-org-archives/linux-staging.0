Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC4E3CCF9
	for <linux-staging@lists.linux.dev>; Tue,  3 Oct 2023 19:34:10 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-9ae3d7eb7e0so45045066b.0
        for <linux-staging@lists.linux.dev>; Tue, 03 Oct 2023 12:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696361649; x=1696966449; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WUj0EUzF8U/cERPhR5EBlsdUDyXZHpv8WU11BXIk4f0=;
        b=bU0Ef7tC2RzW/3mH/lWWPI4hfOwj6yqaByTHE5de1m3CFZz36+GihuUXGoRFUN6rQ/
         T6yEt362laRpq3WF61667WtwHnnYFRtrLwKv030EOP/jdbysf4xOfD2SAWOqlSFCzEeU
         qC+yd1AbclTHsRe9Nl0HszkiKdlN8Em+3+gTZNqTYctqstyW8oH1/uD11btV5C4JQkam
         rqWz361pKKfKxXCf61CRH8VwcT/T3Gq9gOpExEpBqrOrqnCLIflLwq7vxNFJtX9/pXyb
         AVx07xrPk9pnq4A+iqDW8KU3qwtmqnqhkWS9MMRaX4l3Bpa73OBBseH6G7fdM5EbhK7T
         G0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696361649; x=1696966449;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUj0EUzF8U/cERPhR5EBlsdUDyXZHpv8WU11BXIk4f0=;
        b=RZgTDoN/gLd8oibujyMHdO7HFeJlO3PYgsQmc9g6R0YbKI7Z/3QW4DBL3z06DDL6C8
         GNXP+KKcAhrV0c4wd03Bw+YCjVuEWUb9kSjSHBuIbbtNFa3K/hMN9+uDyF3Tap+b4+5Z
         HGZxWmwsY1MTM6NGILijDmIffoAD1diyRKa2OyP3jAYuY7iXiBa6ji5MrTGzK+AYC2mV
         FycxRrLNBrEfRmJIqPvLccw8gtAPCpvkBAFEUCLZISu386U0E89OKKhGPqUIIzyIdt5j
         XUE99Bd+JOAtmE2Pcv2yMbQZViJ/t4xUEMthww/s8Yo1ZWg5CWs5sKG1fZODb2he2KLu
         xpSA==
X-Gm-Message-State: AOJu0Yxh3tHa9qLjylalYmgVEzxO054TBwCouLpLwyImJO5+Yv2WrgZV
	kXilQiB1JPzj/vUXVt/8b7c=
X-Google-Smtp-Source: AGHT+IH4KmJJDaDE1n/5ieqYpG2Po1NFW6luZ6E4c+g8/Fggj169fBjpQzmYsbcPblvsSPbUPt/9pg==
X-Received: by 2002:a17:906:2254:b0:9b2:bf2d:6b65 with SMTP id 20-20020a170906225400b009b2bf2d6b65mr101253ejr.4.1696361649103;
        Tue, 03 Oct 2023 12:34:09 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id os25-20020a170906af7900b009934855d8f1sm1536778ejb.34.2023.10.03.12.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 12:34:08 -0700 (PDT)
Date: Tue, 3 Oct 2023 21:34:07 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] staging: rtl8192e: Remove constant variable
 net_promiscuous_md
Message-ID: <84a9865f763feeaaa51ce9abecf76c848e13580e.1696360404.git.philipp.g.hortmann@gmail.com>
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

Remove variable net_promiscuous_md as it is set to 0 and unchanged. The
equations result accordingly. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 8 ++------
 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c   | 4 +---
 drivers/staging/rtl8192e/rtllib.h            | 1 -
 drivers/staging/rtl8192e/rtllib_rx.c         | 8 ++------
 4 files changed, 5 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ef17472bea05..f46cb152930a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -739,7 +739,6 @@ static void _rtl92e_init_priv_variable(struct net_device *dev)
 	priv->chan = 1;
 	priv->rtllib->mode = WIRELESS_MODE_AUTO;
 	priv->rtllib->iw_mode = IW_MODE_INFRA;
-	priv->rtllib->net_promiscuous_md = false;
 	priv->rtllib->ieee_up = 0;
 	priv->retry_rts = DEFAULT_RETRY_RTS;
 	priv->retry_data = DEFAULT_RETRY_DATA;
@@ -1030,15 +1029,12 @@ static void _rtl92e_watchdog_wq_cb(void *data)
 		     MAC80211_NOLINK) &&
 		     (ieee->rf_power_state == rf_on) && !ieee->is_set_key &&
 		     (!ieee->proto_stoppping) && !ieee->wx_set_enc) {
-			if ((ieee->pwr_save_ctrl.ReturnPoint ==
-			     IPS_CALLBACK_NONE) &&
-			     (!ieee->net_promiscuous_md)) {
+			if (ieee->pwr_save_ctrl.ReturnPoint == IPS_CALLBACK_NONE) {
 				rtl92e_ips_enter(dev);
 			}
 		}
 	}
-	if ((ieee->link_state == MAC80211_LINKED) && (ieee->iw_mode ==
-	     IW_MODE_INFRA) && (!ieee->net_promiscuous_md)) {
+	if ((ieee->link_state == MAC80211_LINKED) && (ieee->iw_mode == IW_MODE_INFRA)) {
 		if (ieee->link_detect_info.NumRxOkInPeriod > 100 ||
 		ieee->link_detect_info.NumTxOkInPeriod > 100)
 			bBusyTraffic = true;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index d0b68b258af7..c367e4fa2af1 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -209,7 +209,6 @@ static int _rtl92e_wx_set_mode(struct net_device *dev,
 			       union iwreq_data *wrqu, char *b)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
-	struct rtllib_device *ieee = netdev_priv_rsl(dev);
 
 	enum rt_rf_power_state rt_state;
 	int ret;
@@ -218,8 +217,7 @@ static int _rtl92e_wx_set_mode(struct net_device *dev,
 		return 0;
 	rt_state = priv->rtllib->rf_power_state;
 	mutex_lock(&priv->wx_mutex);
-	if (wrqu->mode == IW_MODE_MONITOR ||
-	    ieee->net_promiscuous_md) {
+	if (wrqu->mode == IW_MODE_MONITOR) {
 		if (rt_state == rf_off) {
 			if (priv->rtllib->rf_off_reason >
 			    RF_CHANGE_BY_IPS) {
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 97bb00bdbf4d..6d54c03f5680 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1253,7 +1253,6 @@ struct rtllib_device {
 	int scan_age;
 
 	int iw_mode; /* operating mode (IW_MODE_*) */
-	bool net_promiscuous_md;
 
 	spinlock_t lock;
 	spinlock_t wpax_suitlist_lock;
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f03ec5f53b34..9a5fdf16f6a1 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1255,12 +1255,8 @@ static int rtllib_rx_InfraAdhoc(struct rtllib_device *ieee, struct sk_buff *skb,
 	/*Filter pkt not to me*/
 	multicast = is_multicast_ether_addr(hdr->addr1);
 	unicast = !multicast;
-	if (unicast && !ether_addr_equal(dev->dev_addr, hdr->addr1)) {
-		if (ieee->net_promiscuous_md)
-			bToOtherSTA = true;
-		else
-			goto rx_dropped;
-	}
+	if (unicast && !ether_addr_equal(dev->dev_addr, hdr->addr1))
+		goto rx_dropped;
 
 	/*Filter pkt has too small length */
 	hdrlen = rtllib_rx_get_hdrlen(ieee, skb, rx_stats);
-- 
2.42.0

