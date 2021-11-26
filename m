Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6852C82
	for <linux-staging@lists.linux.dev>; Fri, 26 Nov 2021 13:04:21 +0000 (UTC)
Received: from dslb-178-004-171-146.178.004.pools.vodafone-ip.de ([178.4.171.146] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mqatm-0006Hl-BI; Fri, 26 Nov 2021 14:04:18 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 1/4] staging: r8188eu: remove pm_netdev_open
Date: Fri, 26 Nov 2021 14:03:57 +0100
Message-Id: <20211126130400.26151-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211126130400.26151-1-martin@kaiser.cx>
References: <20211125164745.8188-1-martin@kaiser.cx>
 <20211126130400.26151-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only caller of pm_netdev_open sets bnormal to true. In this case,
pm_netdev_open just calls netdev_open.

Remove pm_netdev_open and call netdev_open directly.

Reviewed-by: Michael Straube <straube.linux@gmail.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
v2:
 - add Reviewed-by

 drivers/staging/r8188eu/include/usb_osintf.h |  1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c    | 11 -----------
 drivers/staging/r8188eu/os_dep/usb_intf.c    |  2 +-
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/include/usb_osintf.h b/drivers/staging/r8188eu/include/usb_osintf.h
index 624298b4bd0b..3e777ca52745 100644
--- a/drivers/staging/r8188eu/include/usb_osintf.h
+++ b/drivers/staging/r8188eu/include/usb_osintf.h
@@ -16,7 +16,6 @@ extern int rtw_mc2u_disable;
 u8 usbvendorrequest(struct dvobj_priv *pdvobjpriv, enum bt_usb_request brequest,
 		    enum rt_usb_wvalue wvalue, u8 windex, void *data,
 		    u8 datalen, u8 isdirectionin);
-int pm_netdev_open(struct net_device *pnetdev, u8 bnormal);
 void netdev_br_init(struct net_device *netdev);
 void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb);
 void *scdb_findEntry(struct adapter *priv, unsigned char *ipAddr);
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index 5a5f182d30c9..397981bc9a62 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -760,17 +760,6 @@ void rtw_ips_dev_unload(struct adapter *padapter)
 		rtw_hal_deinit(padapter);
 }
 
-int pm_netdev_open(struct net_device *pnetdev, u8 bnormal)
-{
-	int status;
-
-	if (bnormal)
-		status = netdev_open(pnetdev);
-	else
-		status =  (_SUCCESS == ips_netdrv_open((struct adapter *)rtw_netdev_priv(pnetdev))) ? (0) : (-1);
-	return status;
-}
-
 int netdev_close(struct net_device *pnetdev)
 {
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(pnetdev);
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index ba74cfc9a523..e66046c82973 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -297,7 +297,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
 		pwrpriv->bkeepfwalive = false;
 
 	DBG_88E("bkeepfwalive(%x)\n", pwrpriv->bkeepfwalive);
-	if (pm_netdev_open(pnetdev, true) != 0) {
+	if (netdev_open(pnetdev) != 0) {
 		mutex_unlock(&pwrpriv->lock);
 		goto exit;
 	}
-- 
2.20.1

