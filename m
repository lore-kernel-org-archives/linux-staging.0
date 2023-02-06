Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DD2610D
	for <linux-staging@lists.linux.dev>; Mon,  6 Feb 2023 20:18:17 +0000 (UTC)
Received: from ipservice-092-217-084-033.092.217.pools.vodafone-ip.de ([92.217.84.33] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pP7wK-0007ps-53; Mon, 06 Feb 2023 21:18:12 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/6] staging: r8188eu: remove intf_stop pointer
Date: Mon,  6 Feb 2023 21:18:00 +0100
Message-Id: <20230206201800.139195-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230206201800.139195-1-martin@kaiser.cx>
References: <20230206201800.139195-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the intf_stop pointer that points to a media-specific stop
function. The r8188eu driver supports only usb.

For usb drivers, intf_stop points to usb_intf_stop, which is only
two lines long.  We can remove intf_stop and usb_intf_stop and call
the two cancel functions directly.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h |  1 -
 drivers/staging/r8188eu/os_dep/os_intfs.c   |  4 ++--
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 18 +++---------------
 3 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 40f13f185895..159990facb8a 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -171,7 +171,6 @@ struct adapter {
 	s8	signal_strength;
 
 	void *cmdThread;
-	void (*intf_stop)(struct adapter *adapter);
 	struct  net_device *pnetdev;
 
 	/*  used by rtw_rereg_nd_name related function */
diff --git a/drivers/staging/r8188eu/os_dep/os_intfs.c b/drivers/staging/r8188eu/os_dep/os_intfs.c
index bd3c17f580c8..dc419fd1ffa5 100644
--- a/drivers/staging/r8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/r8188eu/os_dep/os_intfs.c
@@ -761,8 +761,8 @@ void rtw_ips_dev_unload(struct adapter *padapter)
 {
 	rtw_fifo_cleanup(padapter);
 
-	if (padapter->intf_stop)
-		padapter->intf_stop(padapter);
+	rtw_read_port_cancel(padapter);
+	rtw_write_port_cancel(padapter);
 
 	/* s5. */
 	if (!padapter->bSurpriseRemoved)
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index ca9a7c0e5159..74a16d1757ce 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -152,17 +152,6 @@ static void usb_dvobj_deinit(struct usb_interface *usb_intf)
 
 }
 
-static void usb_intf_stop(struct adapter *padapter)
-{
-	/* cancel in irp */
-	rtw_read_port_cancel(padapter);
-
-	/* cancel out irp */
-	rtw_write_port_cancel(padapter);
-
-	/* todo:cancel other irps */
-}
-
 static void rtw_dev_unload(struct adapter *padapter)
 {
 	if (padapter->bup) {
@@ -170,8 +159,9 @@ static void rtw_dev_unload(struct adapter *padapter)
 		if (padapter->xmitpriv.ack_tx)
 			rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_DRV_STOP);
 		/* s3. */
-		if (padapter->intf_stop)
-			padapter->intf_stop(padapter);
+		rtw_read_port_cancel(padapter);
+		rtw_write_port_cancel(padapter);
+
 		/* s4. */
 		rtw_stop_drv_threads(padapter);
 
@@ -308,8 +298,6 @@ static int rtw_usb_if1_init(struct dvobj_priv *dvobj, struct usb_interface *pusb
 	SET_NETDEV_DEV(pnetdev, dvobj_to_dev(dvobj));
 	padapter = rtw_netdev_priv(pnetdev);
 
-	padapter->intf_stop = &usb_intf_stop;
-
 	/* step read_chip_version */
 	rtl8188e_read_chip_version(padapter);
 
-- 
2.30.2

