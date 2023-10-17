Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E381154AD;
	Tue, 17 Oct 2023 07:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NymHn4w+"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5a7afd45199so67867977b3.0;
        Tue, 17 Oct 2023 00:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697526451; x=1698131251; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+MME868h1wd91xe1rhnn2WNwXkREseRwBcc3YMwtj0=;
        b=NymHn4w+2P50X+8EDRb/40NLM6YoezEsFY2/cDNjoODWPmYcAzdf08/2yDC6DQxRhX
         ivFBP2PkwhyrtwqZR/dP6aTKd+q147o4WSH5HQfXhrELmm7p5iB2AMUUdotVnxBFefj/
         1kmSSbEtxMZBi2q5xYRMX95ELcWs2Taz4OKGAEvQTcDw97eef0fwZZm+bzCk7bPdUEVW
         NYtRqQ0vDLXq3ka4udWobvs4XvFmhHc22X3X+lLwhyjIXhZNBMwxj2PUe7hqzkpchK0Z
         BqpIU2hlBGAc6vXNzXNNgh4ijDW0jDRULE7pZgiAPqlEl3Wh5UhMUnOFchPxZjwD7MjI
         sCvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697526451; x=1698131251;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+MME868h1wd91xe1rhnn2WNwXkREseRwBcc3YMwtj0=;
        b=sKAzCWq1E9aQszBIzFhyqxq/zXGUtiWeXzudIqAf20wc/643PaYzu9rrFbVjMFJO90
         1mIf/bLb/z4XXiN5l/nYVzWAcFg6n4addYiSUojdCCx1FRqTH6FPG1dmD/3LqvN6fa5W
         KTRvJTXON/J2xyGbh5YQZGRESkeMbX7miP37t0cfOzgjpKzaE7aa4ovp/YAPKkg6BmHO
         k3p1qRJeMZijIAZZv9wMCepy9rFbDFMj3WIxJUsrvnl8fZuX3R0D8jW3T6/aF+3xgJed
         5PSkwHN8T2CBgI2joyRPMhOSyNsG1pnvPKAz7zaxY0zjQTq6/zBVR+jQj/Vc9N+S80cv
         QvWQ==
X-Gm-Message-State: AOJu0YyP/dDQu9Qu7SagZivvUqrJ/U93Zy47hibIUnXdjt2ZUKNsr7oZ
	adafnKGjxD0JzK08G8YjOL8=
X-Google-Smtp-Source: AGHT+IFl1M3MVlLvmISOHUQp89Rw4sS008RqeqUKJeBtDT6cez8RBeiVuZU9bURBTYL37a8+UzkZkA==
X-Received: by 2002:a81:5e02:0:b0:589:b3c6:95ff with SMTP id s2-20020a815e02000000b00589b3c695ffmr1967398ywb.36.1697526451097;
        Tue, 17 Oct 2023 00:07:31 -0700 (PDT)
Received: from lab-ubuntu ([41.90.67.11])
        by smtp.gmail.com with ESMTPSA id w131-20020a0dd489000000b00594fff48796sm384895ywd.75.2023.10.17.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 00:07:30 -0700 (PDT)
Date: Tue, 17 Oct 2023 10:07:28 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Calvince Otieno <calvncce@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Deepak R Varma <drv@mailo.com>, Simon Horman <horms@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: coding style corrections
Message-ID: <ZS4ysMWnjvWmnPvI@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch brings the codebase in compliance with the Linux kernel coding
style guidelines, as outlined in the document at
https://www.kernel.org/doc/html/latest/process/coding-style.html.

Changes Made:
- Adjusted line lengths to a maximum of 80 characters

The guide states that the preferred limit on the length of a single
line is 80 columns. Statements longer than 80 columns should be broken
into sensible chunks, unless exceeding 80 columns significantly increases
readability and does not hide information.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/p80211netdev.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index 8634fc89a6c2..caa8dd0ab8c2 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -77,10 +77,11 @@ static int p80211knetdev_stop(struct net_device *netdev);
 static netdev_tx_t p80211knetdev_hard_start_xmit(struct sk_buff *skb,
 						 struct net_device *netdev);
 static void p80211knetdev_set_multicast_list(struct net_device *dev);
-static int p80211knetdev_siocdevprivate(struct net_device *dev, struct ifreq *ifr,
-					void __user *data, int cmd);
+static int p80211knetdev_siocdevprivate(struct net_device *dev,
+					struct ifreq *ifr, void __user *data, int cmd);
 static int p80211knetdev_set_mac_address(struct net_device *dev, void *addr);
-static void p80211knetdev_tx_timeout(struct net_device *netdev, unsigned int txqueue);
+static void p80211knetdev_tx_timeout(struct net_device *netdev,
+				     unsigned int txqueue);
 static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc);
 
 int wlan_watchdog = 5000;
@@ -343,7 +344,8 @@ static netdev_tx_t p80211knetdev_hard_start_xmit(struct sk_buff *skb,
 		 */
 		if (be16_to_cpu(skb->protocol) != ETH_P_80211_RAW) {
 			netif_start_queue(wlandev->netdev);
-			netdev_notice(netdev, "Tx attempt prior to association, frame dropped.\n");
+			netdev_notice(netdev,
+				      "Tx attempt prior to association, frame dropped.\n");
 			netdev->stats.tx_dropped++;
 			result = 0;
 			goto failed;
@@ -591,7 +593,8 @@ static int p80211knetdev_set_mac_address(struct net_device *dev, void *addr)
 	 * change the netdev address
 	 */
 	if (result != 0 || resultcode->data != P80211ENUM_resultcode_success) {
-		netdev_err(dev, "Low-level driver failed dot11req_mibset(dot11MACAddress).\n");
+		netdev_err(dev,
+			   "Low-level driver failed dot11req_mibset(dot11MACAddress).\n");
 		result = -EADDRNOTAVAIL;
 	} else {
 		/* everything's ok, change the addr in netdev */
@@ -974,7 +977,8 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
 	return drop;
 }
 
-static void p80211knetdev_tx_timeout(struct net_device *netdev, unsigned int txqueue)
+static void p80211knetdev_tx_timeout(struct net_device *netdev,
+				     unsigned int txqueue)
 {
 	struct wlandevice *wlandev = netdev->ml_priv;
 
-- 
2.34.1

