Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D18C2CA1
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 16:18:27 +0000 (UTC)
Received: from ipservice-092-217-075-184.092.217.pools.vodafone-ip.de ([92.217.75.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nGkF6-0001bS-D9; Sun, 06 Feb 2022 17:18:24 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/14] staging: r8188eu: remove the global DriverState
Date: Sun,  6 Feb 2022 17:18:04 +0100
Message-Id: <20220206161809.423031-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206161809.423031-1-martin@kaiser.cx>
References: <20220206161809.423031-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DriverState in struct adapter is never set. It remains 0 (DRIVER_NORMAL)
all the time, DriverState != DRIVER_DISAPPEAR is always true.

Both DriverState and the check can be removed. enum driver_state contains
the possible values of DriverState. This enum can be removed as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 8 --------
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 8 +++-----
 2 files changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index a07bcf0b6358..1260cacbae64 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -159,15 +159,7 @@ static inline struct device *dvobj_to_dev(struct dvobj_priv *dvobj)
 	return &dvobj->pusbintf->dev;
 };
 
-enum driver_state {
-	DRIVER_NORMAL = 0,
-	DRIVER_DISAPPEAR = 1,
-	DRIVER_REPLACE_DONGLE = 2,
-};
-
 struct adapter {
-	int	DriverState;/* for disable driver using module, use dongle toi
-			     * replace module. */
 	int	pid[3];/* process id from UI, 0:wps, 1:hostapd, 2:dhcpcd */
 	int	bDongle;/* build-in module or external dongle */
 
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 1a67486ff5fb..b20d0eca12fa 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -454,11 +454,9 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
 
 	free_mlme_ap_info(if1);
 
-	if (if1->DriverState != DRIVER_DISAPPEAR) {
-		if (pnetdev) {
-			/* will call netdev_close() */
-			unregister_netdev(pnetdev);
-		}
+	if (pnetdev) {
+		/* will call netdev_close() */
+		unregister_netdev(pnetdev);
 	}
 	rtw_cancel_all_timer(if1);
 
-- 
2.30.2

