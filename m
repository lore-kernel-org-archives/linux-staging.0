Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584027C
	for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 14:52:40 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-256531ad335so856437a91.0
        for <linux-staging@lists.linux.dev>; Sun, 28 May 2023 07:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685285560; x=1687877560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRB64WwQ13PETFGobSFGuFSAiAnCJdGoGNc6vJQKRDY=;
        b=DtCTlEpkzw0Agtsg7AhmIGhdzot0PT0VAAEEjzLp746i7Qj3vC67EK9EX+ErOfJz4c
         lf66Awib3+34g/ogoZ3OmgBXomAmxIJja8ktWr7wniHTjret40PWuPZY2rI/+Yr2njFU
         TrXoDvT/m4+HOCNuMC2HXKoY/r0LaK2I2MPplFtGwmCM5fsODarTLGdBlHhxrYeJCYCf
         FPrLWapm3XOOJPQ9DlNVY76oW0ypJRMkENq8cMjcBL73a3MYdqklq022htWQVTQ6Sr2w
         OGaVCEoM7gcJ3crZ84OsW7xsG0qQD6MD7jTEKJLftPt8tt69jbhEojRvMDYvT9xKR8Ni
         QxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685285560; x=1687877560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRB64WwQ13PETFGobSFGuFSAiAnCJdGoGNc6vJQKRDY=;
        b=CXOmwQNbdePw0nfM7cWj0fc3EF25B5mBQP5+Mk5GK9yUg3U0HZulgvAr6kMFn77tDb
         6ebu21Aoe9xJqpNXNMlGjXHz9KJyMoZ2BviNPz4JtCA9eWmxBCqanYT3pjzroMUB3uKW
         KT47k2+o7xgFF7BpzZgjQTi5gaUURuQgfrw7D1jr84BLL6wW/U7Se6TdqMIUftdfy1qe
         jMESI75rZeyZakjPkzs/Q3Tw5Y8Iu9UKFAIAq3g87xWLQgI0CyRnvEChU6C8ozhSiry4
         fp/5B7jH5kxxMoO7/9ggUa+dSraS7rCGntwrJvgxI4KdoppGdybzJ8KzgwI5PrZdPYgE
         9ULw==
X-Gm-Message-State: AC+VfDz/OAMXj+L3YgOhK1ATwwU1JihZafRuyMy8AyZgk0Ig6GykCkNZ
	BxY8vs5U84W/NoupwF5FOu4=
X-Google-Smtp-Source: ACHHUZ6jM2pi2FbT4a3ULxgqpYpT+ItXWP9QYW9icVCsawynfp3SKquIksGdzpd91JYEkb7Loij2EA==
X-Received: by 2002:a17:90b:1e49:b0:255:f114:fa9f with SMTP id pi9-20020a17090b1e4900b00255f114fa9fmr7962201pjb.3.1685285559671;
        Sun, 28 May 2023 07:52:39 -0700 (PDT)
Received: from yogi-Zephyrus ([103.251.210.199])
        by smtp.gmail.com with ESMTPSA id 17-20020a17090a01d100b0025671de4606sm991511pjd.4.2023.05.28.07.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 07:52:39 -0700 (PDT)
Date: Sun, 28 May 2023 20:22:35 +0530
From: Yogesh Hegde <yogi.kernel@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8192e: Rename variable LeisurePSLeave
Message-ID: <05f947b414f50d6f9e1be3de1216da777173d6ba.1685284727.git.yogi.kernel@gmail.com>
References: <cover.1685284727.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1685284727.git.yogi.kernel@gmail.com>

Rename variable LeisurePSLeave to leisure_ps_leave to avoid
CamelCase which is not accepted by checkpatch.

Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c         | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 68e921a3a0a8..b82d2b7aa26c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -717,7 +717,7 @@ static void _rtl92e_init_priv_handler(struct net_device *dev)
 	priv->rtllib->handle_assoc_response	= _rtl92e_handle_assoc_response;
 	priv->rtllib->handle_beacon		= _rtl92e_handle_beacon;
 	priv->rtllib->set_wireless_mode		= rtl92e_set_wireless_mode;
-	priv->rtllib->LeisurePSLeave		= rtl92e_leisure_ps_leave;
+	priv->rtllib->leisure_ps_leave		= rtl92e_leisure_ps_leave;
 	priv->rtllib->set_bw_mode_handler	= rtl92e_set_bw_mode;
 	priv->rf_set_chan			= rtl92e_set_channel;
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c30821a746c0..03898efea12d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1723,7 +1723,7 @@ struct rtllib_device {
 
 	void (*rtllib_ips_leave_wq)(struct net_device *dev);
 	void (*rtllib_ips_leave)(struct net_device *dev);
-	void (*LeisurePSLeave)(struct net_device *dev);
+	void (*leisure_ps_leave)(struct net_device *dev);
 
 	/* This must be the last item so that it points to the data
 	 * allocated beyond this structure by alloc_rtllib
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d44bf261de54..36bb2d24521f 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1212,7 +1212,7 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
 			    (ieee->link_detect_info.NumRxUnicastOkInPeriod > 2)) {
-				ieee->LeisurePSLeave(ieee->dev);
+				ieee->leisure_ps_leave(ieee->dev);
 			}
 		}
 	}
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 07a3d0c0f0e0..4630976132ba 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -340,7 +340,7 @@ void rtllib_wx_sync_scan_wq(void *data)
 
 	chan = ieee->current_network.channel;
 
-	ieee->LeisurePSLeave(ieee->dev);
+	ieee->leisure_ps_leave(ieee->dev);
 	/* notify AP to be in PS mode */
 	rtllib_sta_ps_send_null_frame(ieee, 1);
 	rtllib_sta_ps_send_null_frame(ieee, 1);
-- 
2.25.1

