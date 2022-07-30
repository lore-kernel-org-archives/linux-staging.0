Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF493C20
	for <linux-staging@lists.linux.dev>; Sat, 30 Jul 2022 14:40:04 +0000 (UTC)
Received: from dslb-188-104-059-172.188.104.pools.vodafone-ip.de ([188.104.59.172] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oHndB-0004pM-S2; Sat, 30 Jul 2022 16:39:53 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: r8188eu: return an error code in rtw_usb_if1_init
Date: Sat, 30 Jul 2022 16:39:39 +0200
Message-Id: <20220730143939.671951-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220730143939.671951-1-martin@kaiser.cx>
References: <20220730143939.671951-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_usb_if1_init returns a pointer that isn't used by the caller. Return
an error code instead. We can then propagate errors from lower-level
functions like ReadAdapterInfo8188EU and fail the initialisation of the
driver with a proper error code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 44 ++++++++++++-----------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 4dbdffa4e293..db91f72dd40f 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -287,17 +287,17 @@ static int rtw_resume(struct usb_interface *pusb_intf)
  *        We accept the new device by returning 0.
  */
 
-static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
-	struct usb_interface *pusb_intf)
+static int rtw_usb_if1_init(struct dvobj_priv *dvobj, struct usb_interface *pusb_intf)
 {
 	struct adapter *padapter = NULL;
 	struct net_device *pnetdev = NULL;
 	struct io_priv *piopriv;
 	struct intf_hdl *pintf;
+	int ret;
 
 	padapter = vzalloc(sizeof(*padapter));
 	if (!padapter)
-		return NULL;
+		return -ENOMEM;
 
 	padapter->dvobj = dvobj;
 	dvobj->if1 = padapter;
@@ -309,8 +309,10 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	rtw_handle_dualmac(padapter, 1);
 
 	pnetdev = rtw_init_netdev(padapter);
-	if (!pnetdev)
+	if (!pnetdev) {
+		ret = -ENODEV;
 		goto handle_dualmac;
+	}
 	SET_NETDEV_DEV(pnetdev, dvobj_to_dev(dvobj));
 	padapter = rtw_netdev_priv(pnetdev);
 
@@ -331,12 +333,15 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	rtl8188eu_interface_configure(padapter);
 
 	/* step read efuse/eeprom data and get mac_addr */
-	if (ReadAdapterInfo8188EU(padapter) < 0)
+	ret = ReadAdapterInfo8188EU(padapter);
+	if (ret)
 		goto handle_dualmac;
 
 	/* step 5. */
-	if (rtw_init_drv_sw(padapter) == _FAIL)
+	if (rtw_init_drv_sw(padapter) == _FAIL) {
+		ret = -ENODEV;
 		goto handle_dualmac;
+	}
 
 #ifdef CONFIG_PM
 	if (padapter->pwrctrlpriv.bSupportRemoteWakeup) {
@@ -351,7 +356,8 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	usb_autopm_get_interface(pusb_intf);
 
 	/*  alloc dev name after read efuse. */
-	if (rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname) < 0)
+	ret = rtw_init_netdev_name(pnetdev, padapter->registrypriv.ifname);
+	if (ret)
 		goto free_drv_sw;
 	rtw_macaddr_cfg(padapter->eeprompriv.mac_addr);
 	rtw_init_wifidirect_addrs(padapter, padapter->eeprompriv.mac_addr,
@@ -359,10 +365,11 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	eth_hw_addr_set(pnetdev, padapter->eeprompriv.mac_addr);
 
 	/* step 6. Tell the network stack we exist */
-	if (register_netdev(pnetdev) != 0)
+	ret = register_netdev(pnetdev);
+	if (ret)
 		goto free_drv_sw;
 
-	return padapter;
+	return 0;
 
 free_drv_sw:
 	rtw_cancel_all_timer(padapter);
@@ -374,7 +381,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 	else
 		vfree(padapter);
 
-	return NULL;
+	return ret;
 }
 
 static void rtw_usb_if1_deinit(struct adapter *if1)
@@ -402,27 +409,24 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
 
 static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
 {
-	struct adapter *if1 = NULL;
 	struct dvobj_priv *dvobj;
+	int ret;
 
 	/* Initialize dvobj_priv */
 	dvobj = usb_dvobj_init(pusb_intf);
 	if (!dvobj)
-		goto err;
+		return -ENODEV;
 
-	if1 = rtw_usb_if1_init(dvobj, pusb_intf);
-	if (!if1)
-		goto free_dvobj;
+	ret = rtw_usb_if1_init(dvobj, pusb_intf);
+	if (ret) {
+		usb_dvobj_deinit(pusb_intf);
+		return ret;
+	}
 
 	if (ui_pid[1] != 0)
 		rtw_signal_process(ui_pid[1], SIGUSR2);
 
 	return 0;
-
-free_dvobj:
-	usb_dvobj_deinit(pusb_intf);
-err:
-	return -ENODEV;
 }
 
 /*
-- 
2.30.2

