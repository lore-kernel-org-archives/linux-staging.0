Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056D92576B
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 02:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="kL15pU1z"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d3cfb1568eso20520495ad.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 18:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1703296803; x=1703901603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2H+OHqcZ1Qbv0b8tU4ea3tj5qRZ9izHgVmq1IeQAcM=;
        b=kL15pU1zyF/x9nFMtrTLJslVRldV61tMeiqM0lzYum59lTl5SvNzTBif9VjbGhs7XO
         aMGxufTuS4fMbCpUbssZYbddtDtpT3sCOKXjzOzMi2IbntC1ok477lKFt0NIxTOAcZnm
         h5s6fxZaJwtgo4INbYO6E/e6mSaAgfn1gerl4ZAqIKDyDCe2bDPvINR56TrrWcM5okQA
         RqaT2RJoXEJqshY6C0UWo2OaPMEy+3yMyxZ/N0hQIOyReQ7z9DQda2z6KbUhiOC8IKxx
         iHWmT2lOzj/4U+WAYVpWnp7WDNzl9q/6ct1+JmxiYUIihHrFEphJ73vehI3DqoZrk+Qk
         NkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703296803; x=1703901603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2H+OHqcZ1Qbv0b8tU4ea3tj5qRZ9izHgVmq1IeQAcM=;
        b=oZdOT/NgYcwYQnw1dFkdr5V3YnBcMzq0j199lBBDyHSrzgEV289dBfgkVuCB7RFfK6
         eWz8rBv6ksC55LwevLgX2yILu3Bw9+QpYtP7AXa3Kc9zgjuPu3EgJsL61tVhbZENSroE
         ohGf4vUOwl+1i4P9r2xHCxmMxB9Xi4k38YU7myL6TQPI/Qivcwh6YVIvcyYELr1rihHe
         1S7mxQofYvEwVexmWNzgdOCw35Qs4WxJGseshTi1sst0w3QYrLhiInBqXdgFeABFMaJy
         ppYvJrAZjhFYWYHgrasii3hDBDkUdBpsLVxebuawkzRc25aaq/EU86FMTaCjFbdE+cNZ
         PhtQ==
X-Gm-Message-State: AOJu0YyOdrSm83LrVPNKs9P9jHFe6H2NzlhPz8/bMZtti8EEE56OU47h
	KVptGXuQDDesI0VZLzLqQZQllWmw6f0eBg==
X-Google-Smtp-Source: AGHT+IFkqfe8NiWQa0TXGYHrThu8cR7iGPzH1UBbzR6d8nUNye/eDowNAjxRbYGH+MNDemw+4SNRyA==
X-Received: by 2002:a17:903:485:b0:1d3:ee1f:ce54 with SMTP id jj5-20020a170903048500b001d3ee1fce54mr2191383plb.89.1703296803429;
        Fri, 22 Dec 2023 18:00:03 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kg15-20020a170903060f00b001d3edef115dsm4106546plb.20.2023.12.22.18.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 18:00:02 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 20/20] Staging: rtl8192e: Rename function rtllib_DisableNetMonitorMode()
Date: Fri, 22 Dec 2023 17:59:42 -0800
Message-Id: <20231223015942.418263-21-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231223015942.418263-1-tdavies@darkphysics.net>
References: <20231223015942.418263-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_DisableNetMonitorMode to rtllib_disable_net_monitor_mode
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h            | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac.c    | 2 +-
 drivers/staging/rtl8192e/rtllib_softmac_wx.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0158b5595c3c..d6cd0e0785c4 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1678,7 +1678,7 @@ void rtllib_start_protocol(struct rtllib_device *ieee);
 void rtllib_stop_protocol(struct rtllib_device *ieee);
 
 void rtllib_EnableNetMonitorMode(struct net_device *dev, bool init_state);
-void rtllib_DisableNetMonitorMode(struct net_device *dev, bool init_state);
+void rtllib_disable_net_monitor_mode(struct net_device *dev, bool init_state);
 
 void rtllib_softmac_stop_protocol(struct rtllib_device *ieee);
 void rtllib_softmac_start_protocol(struct rtllib_device *ieee);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index ec7bf27820c6..e3d51355dab3 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -361,7 +361,7 @@ void rtllib_EnableNetMonitorMode(struct net_device *dev,
 /* Disables network monitor mode. Only packets destinated to
  * us will be received.
  */
-void rtllib_DisableNetMonitorMode(struct net_device *dev,
+void rtllib_disable_net_monitor_mode(struct net_device *dev,
 		bool init_state)
 {
 	struct rtllib_device *ieee = netdev_priv_rsl(dev);
diff --git a/drivers/staging/rtl8192e/rtllib_softmac_wx.c b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
index 5d165d0b134d..eb331cbb9850 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac_wx.c
@@ -270,7 +270,7 @@ int rtllib_wx_set_mode(struct rtllib_device *ieee, struct iw_request_info *a,
 	} else {
 		ieee->dev->type = ARPHRD_ETHER;
 		if (ieee->iw_mode == IW_MODE_MONITOR)
-			rtllib_DisableNetMonitorMode(ieee->dev, false);
+			rtllib_disable_net_monitor_mode(ieee->dev, false);
 	}
 
 	if (!ieee->proto_started) {
-- 
2.39.2

