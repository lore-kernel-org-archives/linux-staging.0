Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3AE2F21
	for <linux-staging@lists.linux.dev>; Wed,  9 Feb 2022 19:28:59 +0000 (UTC)
Received: from dslb-188-096-136-245.188.096.pools.vodafone-ip.de ([188.96.136.245] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nHse0-00049w-1Z; Wed, 09 Feb 2022 20:28:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: remove ishighspeed from dvobj_priv
Date: Wed,  9 Feb 2022 20:28:42 +0100
Message-Id: <20220209192842.99399-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no need to store the usb device speed in struct dvobj_priv.
We can read the speed from struct usb_device. dvobj_priv has a pointer
to the usb_device.

Reorder one if-statement to make the code clearer.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_iol.c       | 4 +++-
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 2 +-
 drivers/staging/r8188eu/hal/usb_halinit.c    | 6 +++---
 drivers/staging/r8188eu/include/drv_types.h  | 1 -
 drivers/staging/r8188eu/include/usb_ops.h    | 2 +-
 drivers/staging/r8188eu/os_dep/usb_intf.c    | 8 --------
 6 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_iol.c b/drivers/staging/r8188eu/core/rtw_iol.c
index 923da2a9f6ae..f5f03160759c 100644
--- a/drivers/staging/r8188eu/core/rtw_iol.c
+++ b/drivers/staging/r8188eu/core/rtw_iol.c
@@ -68,8 +68,10 @@ bool rtw_IOL_applied(struct adapter  *adapter)
 	if (1 == adapter->registrypriv.fw_iol)
 		return true;
 
-	if ((2 == adapter->registrypriv.fw_iol) && (!adapter_to_dvobj(adapter)->ishighspeed))
+	if ((2 == adapter->registrypriv.fw_iol) &&
+	    (adapter_to_dvobj(adapter)->pusbdev->speed != USB_SPEED_HIGH))
 		return true;
+
 	return false;
 }
 
diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 205a392a0ad3..f2555c97b0c4 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -403,7 +403,7 @@ s32 rtl8188eu_xmitframe_complete(struct adapter *adapt, struct xmit_priv *pxmitp
 	/*  dump frame variable */
 	u32 ff_hwaddr;
 
-	if (pdvobjpriv->ishighspeed)
+	if (pdvobjpriv->pusbdev->speed == USB_SPEED_HIGH)
 		bulksize = USB_HIGH_SPEED_BULK_SIZE;
 	else
 		bulksize = USB_FULL_SPEED_BULK_SIZE;
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 659e0f26db29..1f2c736c3bc4 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -99,10 +99,10 @@ static void _InitInterrupt(struct adapter *Adapter)
 	/*  1; Use bulk endpoint to upload interrupt pkt, */
 	usb_opt = rtw_read8(Adapter, REG_USB_SPECIAL_OPTION);
 
-	if (!adapter_to_dvobj(Adapter)->ishighspeed)
-		usb_opt = usb_opt & (~INT_BULK_SEL);
-	else
+	if (adapter_to_dvobj(Adapter)->pusbdev->speed == USB_SPEED_HIGH)
 		usb_opt = usb_opt | (INT_BULK_SEL);
+	else
+		usb_opt = usb_opt & (~INT_BULK_SEL);
 
 	rtw_write8(Adapter, REG_USB_SPECIAL_OPTION, usb_opt);
 }
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 618a6529192b..894e70a0d506 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -137,7 +137,6 @@ struct dvobj_priv {
 
 /*-------- below is for USB INTERFACE --------*/
 
-	u8	ishighspeed;
 	u8	RtNumOutPipes;
 
 	struct usb_interface *pusbintf;
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 0a1155bbc7b8..62e4706c0497 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -55,7 +55,7 @@ static inline u8 rtw_usb_bulk_size_boundary(struct adapter *padapter,
 	u8 rst = true;
 	struct dvobj_priv *pdvobjpriv = adapter_to_dvobj(padapter);
 
-	if (pdvobjpriv->ishighspeed)
+	if (pdvobjpriv->pusbdev->speed == USB_SPEED_HIGH)
 		rst = (0 == (buf_len) % USB_HIGH_SPEED_BULK_SIZE) ?
 		      true : false;
 	else
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 10c33e2ae3bc..cd7f28d25c47 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -117,14 +117,6 @@ static struct dvobj_priv *usb_dvobj_init(struct usb_interface *usb_intf)
 	if (rt_num_in_pipes != 1)
 		goto err;
 
-	if (pusbd->speed == USB_SPEED_HIGH) {
-		pdvobjpriv->ishighspeed = true;
-		DBG_88E("USB_SPEED_HIGH\n");
-	} else {
-		pdvobjpriv->ishighspeed = false;
-		DBG_88E("NON USB_SPEED_HIGH\n");
-	}
-
 	/* 3 misc */
 	rtw_reset_continual_urb_error(pdvobjpriv);
 
-- 
2.30.2

