Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19CA2CA4
	for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 16:56:00 +0000 (UTC)
Received: from dslb-178-004-201-171.178.004.pools.vodafone-ip.de ([178.4.201.171] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n8mLN-0005N8-PX; Sat, 15 Jan 2022 17:55:57 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/11] staging: r8188eu: remove rtw_netif_start_queue wrapper
Date: Sat, 15 Jan 2022 17:55:34 +0100
Message-Id: <20220115165536.231210-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220115165536.231210-1-martin@kaiser.cx>
References: <20220115165536.231210-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the rtw_netif_start_queue wrapper function. Call
netif_tx_start_all_queues directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/osdep_service.h | 5 -----
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index b8f983a1254e..51a22ffe41e2 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -67,11 +67,6 @@ static inline int rtw_netif_queue_stopped(struct net_device *pnetdev)
 		netif_tx_queue_stopped(netdev_get_tx_queue(pnetdev, 3));
 }
 
-static inline void rtw_netif_start_queue(struct net_device *pnetdev)
-{
-	netif_tx_start_all_queues(pnetdev);
-}
-
 static inline void rtw_netif_stop_queue(struct net_device *pnetdev)
 {
 	netif_tx_stop_all_queues(pnetdev);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 2e4ad090c77c..96b49cee3ac4 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -654,7 +654,7 @@ int _netdev_open(struct net_device *pnetdev)
 	rtw_set_pwr_state_check_timer(&padapter->pwrctrlpriv);
 
 	if (!rtw_netif_queue_stopped(pnetdev))
-		rtw_netif_start_queue(pnetdev);
+		netif_tx_start_all_queues(pnetdev);
 	else
 		netif_tx_wake_all_queues(pnetdev);
 
-- 
2.30.2

