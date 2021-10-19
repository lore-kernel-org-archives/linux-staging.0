Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42342C9E
	for <linux-staging@lists.linux.dev>; Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AEE36136A;
	Tue, 19 Oct 2021 17:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634663569;
	bh=WfIwmh371a8qkk02UGe3MsTA+uaLWt338ofwUGG7Hh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D8NBMvrT/8skkCL+xeK2BA67XeI6a5ApeBWp3fGsdpQr5WQNgjzXbmBL01BxvGSKD
	 pjs2Sj3vmQQagptn3Uuo/1ztFOUGIaUBpTTCRY2G78SmuLnYfSr5c26Il+BSDfZFG5
	 O5wyUj/HerZAl1rqgZ5r+2T77VeLRYyH3Fw4VmXkSbC4BTMGrGQK9gQ+yEA7D3hHUI
	 i+BMY66yyMXoxClvg7w8GJXxLxnBny/oRN/WcjCQMMX0dMnfNvff0ecoMtZvJy86yO
	 aWMs30Qx/Iq1xQ+CpxrZfKtt1fcIY0fgqkXlulsIshQbBQ8l6pMNiHcgV557PQptQW
	 efDaY4jDno+QA==
From: Jakub Kicinski <kuba@kernel.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH 3/8] staging: use eth_hw_addr_set() for dev->addr_len cases
Date: Tue, 19 Oct 2021 10:12:38 -0700
Message-Id: <20211019171243.1412240-4-kuba@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211019171243.1412240-1-kuba@kernel.org>
References: <20211019171243.1412240-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert all staging drivers from memcpy(... dev->addr_len)
to eth_hw_addr_set():

  @@
  expression dev, np;
  @@
  - memcpy(dev->dev_addr, np, dev->addr_len)
  + eth_hw_addr_set(dev, np)

Manually confirmed these are all etherdevices.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/staging/ks7010/ks_wlan_net.c   |  2 +-
 drivers/staging/qlge/qlge_main.c       | 10 +++-------
 drivers/staging/wlan-ng/p80211netdev.c |  2 +-
 3 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/ks7010/ks_wlan_net.c b/drivers/staging/ks7010/ks_wlan_net.c
index 61d8f40e2739..7e8d37c169f0 100644
--- a/drivers/staging/ks7010/ks_wlan_net.c
+++ b/drivers/staging/ks7010/ks_wlan_net.c
@@ -2490,7 +2490,7 @@ int ks_wlan_set_mac_address(struct net_device *dev, void *addr)
 
 	if (netif_running(dev))
 		return -EBUSY;
-	memcpy(dev->dev_addr, mac_addr->sa_data, dev->addr_len);
+	eth_hw_addr_set(dev, mac_addr->sa_data);
 	ether_addr_copy(priv->eth_addr, mac_addr->sa_data);
 
 	priv->mac_address_valid = false;
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 8fcdf89da8aa..abb7844f92fb 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -724,9 +724,7 @@ static int qlge_get_8000_flash_params(struct qlge_adapter *qdev)
 		goto exit;
 	}
 
-	memcpy(qdev->ndev->dev_addr,
-	       mac_addr,
-	       qdev->ndev->addr_len);
+	eth_hw_addr_set(qdev->ndev, mac_addr);
 
 exit:
 	qlge_sem_unlock(qdev, SEM_FLASH_MASK);
@@ -774,9 +772,7 @@ static int qlge_get_8012_flash_params(struct qlge_adapter *qdev)
 		goto exit;
 	}
 
-	memcpy(qdev->ndev->dev_addr,
-	       qdev->flash.flash_params_8012.mac_addr,
-	       qdev->ndev->addr_len);
+	eth_hw_addr_set(qdev->ndev, qdev->flash.flash_params_8012.mac_addr);
 
 exit:
 	qlge_sem_unlock(qdev, SEM_FLASH_MASK);
@@ -4214,7 +4210,7 @@ static int qlge_set_mac_address(struct net_device *ndev, void *p)
 
 	if (!is_valid_ether_addr(addr->sa_data))
 		return -EADDRNOTAVAIL;
-	memcpy(ndev->dev_addr, addr->sa_data, ndev->addr_len);
+	eth_hw_addr_set(ndev, addr->sa_data);
 	/* Update local copy of current mac address. */
 	memcpy(qdev->current_mac_addr, ndev->dev_addr, ndev->addr_len);
 
diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index 07ed6c4cfdcc..255500448ad3 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -616,7 +616,7 @@ static int p80211knetdev_set_mac_address(struct net_device *dev, void *addr)
 		result = -EADDRNOTAVAIL;
 	} else {
 		/* everything's ok, change the addr in netdev */
-		memcpy(dev->dev_addr, new_addr->sa_data, dev->addr_len);
+		eth_hw_addr_set(dev, new_addr->sa_data);
 	}
 
 	return result;
-- 
2.31.1

