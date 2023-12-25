Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7502A53E0A
	for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 20:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Izhaauqg"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3ba2dc0f6b7so3140306b6e.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Dec 2023 12:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703535801; x=1704140601; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cz8hG91T0FVlhJJL7ezEdRKii6A5vAGbqjcOF3Xr0Yo=;
        b=IzhaauqgTC8AImeZmqafjQlH4uvq2rL8PmfodXJt9DpsAhcfeqBpCo2kVmCby3JK68
         DalSA8FazkmIrS3TgjQts9GphI+SW0mq9hJfzCA9fpJHa+fD0UFnV1mwEsUbfXIf1PSK
         nJZz7W/HfzqJyltHFlzQIYyfL5uYFHqacc4LysQwa/qOHFLE/n6RA0DEcouikF2ZwKtr
         OlcyiBc2y8OvhYh6nBM88ZnxL+TxNsqcn14lPdOlpopYqnmWVw5KSALKCt1GoBH4HyNh
         iO6olhiPdiQ50tPcI6nZwUZmvAjL7NfqaYyMa6LlxuBJ9+Xukx8j8PFR7PTKUExkKHlG
         4y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703535801; x=1704140601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cz8hG91T0FVlhJJL7ezEdRKii6A5vAGbqjcOF3Xr0Yo=;
        b=iAaKyK1lGxHNJX0FbKnPnGTy5mB7sLBGVk/iW8dSPNLIp/i1xpmY7Lj8+Up9/Reze3
         Rd/by0TKq0flohpmjOTHBrIz1l0MDwK/l87Eq+GFn1LtugPQNIHvD3RjAEp0NoeHjbWJ
         cugGrQucFYPsp5Vu6Keugkjw7WNMi3t0ybGMAMS2JwlYuivN1NjCemLCyG+AIv1Q+MWf
         yh+E/uf7GT7BvHN7ett40IB4fO3hH2pEkdMYS5DfJ3DtDCl4ma6PgSveOktlFOIvVgt9
         Dxw1FAAL+2AQat07VcMtYcalu6fcaiH4RcLj8len1pyVsudts9TLWU41r/haO+yx1gDj
         W9Iw==
X-Gm-Message-State: AOJu0YwYzdoQm/x1yQfM28MSnugMA0KU2SVByOpKTHQV83r2e8AgM7B0
	OmqyCYUBOKkIeqtl1DjPwPCWqMViVzeKunaOyQZScwmpJ5A=
X-Google-Smtp-Source: AGHT+IF5aN1SmkVBKdNildtbgH7ZCUqUVEwwO5CvpL/TbdHrjZmOhcf9IEsYuOuFcl+8xBvuLajwrA==
X-Received: by 2002:a05:6358:6f8d:b0:170:e2dc:3e19 with SMTP id s13-20020a0563586f8d00b00170e2dc3e19mr5009259rwn.43.1703535801553;
        Mon, 25 Dec 2023 12:23:21 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id l17-20020a17090aaa9100b0028be5732f01sm8741246pjq.0.2023.12.25.12.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 12:23:20 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 4/6] Staging: rtl8192e: Rename function rtllib_EnableNetMonitorMode()
Date: Mon, 25 Dec 2023 12:23:12 -0800
Message-Id: <20231225202314.31869-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225202314.31869-1-tdavies@darkphysics.net>
References: <20231225202314.31869-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_EnableNetMonitorModeto to rtllib_enable_net_monitor_mode
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 42690b3d03bd..a2148bf0cea3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1677,7 +1677,7 @@ void rtllib_sta_ps_send_pspoll_frame(struct rtllib_device *ieee);
 void rtllib_start_protocol(struct rtllib_device *ieee);
 void rtllib_stop_protocol(struct rtllib_device *ieee);
 
-void rtllib_EnableNetMonitorMode(struct net_device *dev, bool init_state);
+void rtllib_enable_net_monitor_mode(struct net_device *dev, bool init_state);
 void rtllib_disable_net_monitor_mode(struct net_device *dev, bool init_state);
 
 void rtllib_softmac_stop_protocol(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9b00fb68f1a4..c0c33ae06908 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -348,7 +348,7 @@ static inline struct sk_buff *rtllib_probe_req(struct rtllib_device *ieee)
 }
 
 /* Enables network monitor mode, all rx packets will be received. */
-void rtllib_EnableNetMonitorMode(struct net_device *dev,
+void rtllib_enable_net_monitor_mode(struct net_device *dev,
 		bool init_state)
 {
 	struct rtllib_device *ieee = netdev_priv_rsl(dev);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index eb331cbb9850..2afa701e5445 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -266,7 +266,7 @@ int rtllib_wx_set_mode(struct rtllib_device *ieee, struct iw_request_info *a,
 
 	if (wrqu->mode == IW_MODE_MONITOR) {
 		ieee->dev->type = ARPHRD_IEEE80211;
-		rtllib_EnableNetMonitorMode(ieee->dev, false);
+		rtllib_enable_net_monitor_mode(ieee->dev, false);
 	} else {
 		ieee->dev->type = ARPHRD_ETHER;
 		if (ieee->iw_mode == IW_MODE_MONITOR)
-- 
2.39.2

