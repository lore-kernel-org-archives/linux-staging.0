Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FC470
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 17:53:25 +0000 (UTC)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lv1dL-00012S-GI; Sun, 20 Jun 2021 19:53:23 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/13] staging: rtl8188eu: remove RT_TRACE prints from usb_intf.c
Date: Sun, 20 Jun 2021 19:52:50 +0200
Message-Id: <20210620175301.14988-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210620175301.14988-1-martin@kaiser.cx>
References: <20210620175301.14988-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eventually, all driver-specific debug prints should be removed.
Take another step in that direction.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 28 +--------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index ee209b2fe4fe..b7e2692c35f3 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -143,16 +143,6 @@ static void usb_dvobj_deinit(struct usb_interface *usb_intf)
 
 void usb_intf_stop(struct adapter *padapter)
 {
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("+%s\n", __func__));
-
-	/* disable_hw_interrupt */
-	if (!padapter->bSurpriseRemoved) {
-		/* device still exists, so driver can do i/o operation */
-		/* TODO: */
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			 ("SurpriseRemoved == false\n"));
-	}
-
 	/* cancel in irp */
 	rtw_hal_inirp_deinit(padapter);
 
@@ -160,14 +150,10 @@ void usb_intf_stop(struct adapter *padapter)
 	usb_write_port_cancel(padapter);
 
 	/* todo:cancel other irps */
-
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("-%s\n", __func__));
 }
 
 static void rtw_dev_unload(struct adapter *padapter)
 {
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("+%s\n", __func__));
-
 	if (padapter->bup) {
 		pr_debug("===> %s\n", __func__);
 		padapter->bDriverStopped = true;
@@ -186,14 +172,9 @@ static void rtw_dev_unload(struct adapter *padapter)
 		}
 
 		padapter->bup = false;
-	} else {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			 ("r871x_dev_unload():padapter->bup == false\n"));
 	}
 
 	pr_debug("<=== %s\n", __func__);
-
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("-%s\n", __func__));
 }
 
 static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
@@ -366,8 +347,6 @@ static int rtw_usb_if1_init(struct usb_interface *pusb_intf)
 
 	/* step 5. */
 	if (rtw_init_drv_sw(padapter) == _FAIL) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_,
-			 ("Initialize driver software resource Failed!\n"));
 		err = -ENOMEM;
 		goto free_hal_data;
 	}
@@ -388,10 +367,8 @@ static int rtw_usb_if1_init(struct usb_interface *pusb_intf)
 
 	/*  alloc dev name after read efuse. */
 	err = dev_alloc_name(pnetdev, padapter->registrypriv.ifname);
-	if (err < 0) {
-		RT_TRACE(_module_os_intfs_c_, _drv_err_, ("dev_alloc_name, fail!\n"));
+	if (err < 0)
 		goto free_hal_data;
-	}
 
 	netif_carrier_off(pnetdev);
 
@@ -403,7 +380,6 @@ static int rtw_usb_if1_init(struct usb_interface *pusb_intf)
 	/* step 6. Tell the network stack we exist */
 	err = register_netdev(pnetdev);
 	if (err) {
-		RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("register_netdev() failed\n"));
 		goto free_hal_data;
 	}
 
@@ -480,7 +456,6 @@ static void rtw_dev_remove(struct usb_interface *pusb_intf)
 	struct adapter *padapter = dvobj->if1;
 
 	pr_debug("+%s\n", __func__);
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("+dev_remove()\n"));
 
 	if (!pusb_intf->unregistering)
 		padapter->bSurpriseRemoved = true;
@@ -494,7 +469,6 @@ static void rtw_dev_remove(struct usb_interface *pusb_intf)
 
 	usb_dvobj_deinit(pusb_intf);
 
-	RT_TRACE(_module_hci_intfs_c_, _drv_err_, ("-dev_remove()\n"));
 	pr_debug("-r871xu_dev_remove, done\n");
 }
 
-- 
2.20.1

