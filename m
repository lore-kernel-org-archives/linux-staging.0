Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF3B2CA3
	for <linux-staging@lists.linux.dev>; Sat, 15 Jan 2022 16:56:02 +0000 (UTC)
Received: from dslb-178-004-201-171.178.004.pools.vodafone-ip.de ([178.4.201.171] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n8mLP-0005N8-F2; Sat, 15 Jan 2022 17:55:59 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/11] staging: r8188eu: remove rtw_netif_stop_queue wrapper
Date: Sat, 15 Jan 2022 17:55:35 +0100
Message-Id: <20220115165536.231210-11-martin@kaiser.cx>
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

Remove the rtw_netif_stop_queue wrapper function. Call
netif_tx_stop_all_queues directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/osdep_service.h | 5 -----
 drivers/staging/r8188eu/os_dep/os_intfs.c       | 4 ++--
 drivers/staging/r8188eu/os_dep/usb_intf.c       | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 51a22ffe41e2..fca8f3d116c2 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -67,11 +67,6 @@ static inline int rtw_netif_queue_stopped(struct net_device *pnetdev)
 		netif_tx_queue_stopped(netdev_get_tx_queue(pnetdev, 3));
 }
 
-static inline void rtw_netif_stop_queue(struct net_device *pnetdev)
-{
-	netif_tx_stop_all_queues(pnetdev);
-}
-
 extern int RTW_STATUS_CODE(int error_code);
 
 void *rtw_malloc2d(int h, int w, int size);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 96b49cee3ac4..ef4ba0f22c09 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -667,7 +667,7 @@ int _netdev_open(struct net_device *pnetdev)
 netdev_open_error:
 	padapter->bup = false;
 	netif_carrier_off(pnetdev);
-	rtw_netif_stop_queue(pnetdev);
+	netif_tx_stop_all_queues(pnetdev);
 	DBG_88E("-88eu_drv - drv_open fail, bup =%d\n", padapter->bup);
 	return -1;
 }
@@ -769,7 +769,7 @@ int netdev_close(struct net_device *pnetdev)
 		/* s1. */
 		if (pnetdev) {
 			if (!rtw_netif_queue_stopped(pnetdev))
-				rtw_netif_stop_queue(pnetdev);
+				netif_tx_stop_all_queues(pnetdev);
 		}
 
 		/* s2. */
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 91792dfd3bbe..1b1b8bb165ba 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -236,7 +236,7 @@ static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
 	/* s1. */
 	if (pnetdev) {
 		netif_carrier_off(pnetdev);
-		rtw_netif_stop_queue(pnetdev);
+		netif_tx_stop_all_queues(pnetdev);
 	}
 
 	/* s2. */
-- 
2.30.2

