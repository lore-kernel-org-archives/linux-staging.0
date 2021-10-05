Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F112C81
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 20:08:53 +0000 (UTC)
Received: from ipservice-092-217-085-112.092.217.pools.vodafone-ip.de ([92.217.85.112] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mXqk6-000847-LZ; Tue, 05 Oct 2021 22:08:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 7/9] staging: r8188eu: chip_type is write-only
Date: Tue,  5 Oct 2021 22:08:19 +0200
Message-Id: <20211005200821.19783-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211005200821.19783-1-martin@kaiser.cx>
References: <20211005200821.19783-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

chip_type in struct adapter is never read. Remove the component
and the code to initialise it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/usb_ops_linux.c |  6 ------
 drivers/staging/r8188eu/include/drv_types.h |  1 -
 drivers/staging/r8188eu/include/hal_intf.h  | 10 ----------
 drivers/staging/r8188eu/include/usb_ops.h   |  3 ---
 drivers/staging/r8188eu/os_dep/usb_intf.c   |  7 -------
 5 files changed, 27 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 9544300fab65..4c1974cc9a16 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -558,9 +558,3 @@ void rtl8188eu_xmit_tasklet(unsigned long priv)
 			break;
 	}
 }
-
-void rtl8188eu_set_hw_type(struct adapter *adapt)
-{
-	adapt->chip_type = RTL8188E;
-	DBG_88E("CHIP TYPE: RTL8188E\n");
-}
diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index 9fa561ad340b..9b9f7d89519c 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -205,7 +205,6 @@ struct adapter {
 			     * replace module. */
 	int	pid[3];/* process id from UI, 0:wps, 1:hostapd, 2:dhcpcd */
 	int	bDongle;/* build-in module or external dongle */
-	u16	chip_type;
 	u16	interface_type;/* USB,SDIO,SPI,PCI */
 
 	struct dvobj_priv *dvobj;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index ee8e67dafe7c..89bd6f4b06e2 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -15,16 +15,6 @@ enum RTL871X_HCI_TYPE {
 	RTW_GSPI	= BIT(3),
 };
 
-enum _CHIP_TYPE {
-	NULL_CHIP_TYPE,
-	RTL8712_8188S_8191S_8192S,
-	RTL8188C_8192C,
-	RTL8192D,
-	RTL8723A,
-	RTL8188E,
-	MAX_CHIP_TYPE
-};
-
 enum hw_variables {
 	HW_VAR_MEDIA_STATUS,
 	HW_VAR_MEDIA_STATUS1,
diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
index 1939b781b097..0a1155bbc7b8 100644
--- a/drivers/staging/r8188eu/include/usb_ops.h
+++ b/drivers/staging/r8188eu/include/usb_ops.h
@@ -19,9 +19,6 @@
 
 #include "usb_ops_linux.h"
 
-void rtl8188eu_set_hw_type(struct adapter *padapter);
-#define hal_set_hw_type rtl8188eu_set_hw_type
-
 /*
  * Increase and check if the continual_urb_error of this @param dvobjprivei
  * is larger than MAX_CONTINUAL_URB_ERR
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index b5e0c6561108..193b5faac56a 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -172,12 +172,6 @@ static void usb_dvobj_deinit(struct usb_interface *usb_intf)
 
 }
 
-static void chip_by_usb_id(struct adapter *padapter)
-{
-	padapter->chip_type = NULL_CHIP_TYPE;
-	hal_set_hw_type(padapter);
-}
-
 static void usb_intf_start(struct adapter *padapter)
 {
 	rtl8188eu_inirp_init(padapter);
@@ -387,7 +381,6 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 
 	/* step 1-1., decide the chip_type via vid/pid */
 	padapter->interface_type = RTW_USB;
-	chip_by_usb_id(padapter);
 
 	if (rtw_handle_dualmac(padapter, 1) != _SUCCESS)
 		goto free_adapter;
-- 
2.20.1

