Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6728B2C81
	for <linux-staging@lists.linux.dev>; Sun, 10 Oct 2021 17:52:37 +0000 (UTC)
Received: from dslb-188-104-061-167.188.104.pools.vodafone-ip.de ([188.104.61.167] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mZczs-0001WC-IT; Sun, 10 Oct 2021 19:52:28 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/11] staging: r8188eu: remove specific device table
Date: Sun, 10 Oct 2021 19:51:55 +0200
Message-Id: <20211010175204.24029-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211010175204.24029-1-martin@kaiser.cx>
References: <20211010175204.24029-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver implements a mechanism to set additional configuration flags
per supported usb device.

None of the supported devices uses these additional flags. Remove the data
types and the code to process the flags.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/include/drv_types.h | 13 ---------
 drivers/staging/r8188eu/os_dep/usb_intf.c   | 29 ---------------------
 2 files changed, 42 deletions(-)

diff --git a/drivers/staging/r8188eu/include/drv_types.h b/drivers/staging/r8188eu/include/drv_types.h
index ce88575a8726..3e4928320f17 100644
--- a/drivers/staging/r8188eu/include/drv_types.h
+++ b/drivers/staging/r8188eu/include/drv_types.h
@@ -37,19 +37,6 @@
 
 #define DRIVERVERSION	"v4.1.4_6773.20130222"
 
-#define SPEC_DEV_ID_NONE		BIT(0)
-#define SPEC_DEV_ID_DISABLE_HT		BIT(1)
-#define SPEC_DEV_ID_ENABLE_PS		BIT(2)
-#define SPEC_DEV_ID_RF_CONFIG_1T1R	BIT(3)
-#define SPEC_DEV_ID_RF_CONFIG_2T2R	BIT(4)
-#define SPEC_DEV_ID_ASSIGN_IFNAME	BIT(5)
-
-struct specific_device_id {
-	u32		flags;
-	u16		idVendor;
-	u16		idProduct;
-};
-
 struct registry_priv {
 	u8	chip_version;
 	u8	rfintfs;
diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 664ffaba589b..4b8a3e821b74 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -49,10 +49,6 @@ static struct usb_device_id rtw_usb_id_tbl[] = {
 
 MODULE_DEVICE_TABLE(usb, rtw_usb_id_tbl);
 
-static struct specific_device_id specific_device_id_tbl[] = {
-	{}		/* empty table for now */
-};
-
 struct rtw_usb_drv {
 	struct usb_driver usbdrv;
 	int drv_registered;
@@ -212,28 +208,6 @@ static void rtw_dev_unload(struct adapter *padapter)
 	DBG_88E("<=== rtw_dev_unload\n");
 }
 
-static void process_spec_devid(const struct usb_device_id *pdid)
-{
-	u16 vid, pid;
-	u32 flags;
-	int i;
-	int num = sizeof(specific_device_id_tbl) /
-		  sizeof(struct specific_device_id);
-
-	for (i = 0; i < num; i++) {
-		vid = specific_device_id_tbl[i].idVendor;
-		pid = specific_device_id_tbl[i].idProduct;
-		flags = specific_device_id_tbl[i].flags;
-
-		if ((pdid->idVendor == vid) && (pdid->idProduct == pid) &&
-		    (flags & SPEC_DEV_ID_DISABLE_HT)) {
-			rtw_ht_enable = 0;
-			rtw_cbw40_enable = 0;
-			rtw_ampdu_enable = 0;
-		}
-	}
-}
-
 static int rtw_suspend(struct usb_interface *pusb_intf, pm_message_t message)
 {
 	struct dvobj_priv *dvobj = usb_get_intfdata(pusb_intf);
@@ -499,9 +473,6 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
 	struct adapter *if1 = NULL;
 	struct dvobj_priv *dvobj;
 
-	/* step 0. */
-	process_spec_devid(pdid);
-
 	/* Initialize dvobj_priv */
 	dvobj = usb_dvobj_init(pusb_intf);
 	if (!dvobj)
-- 
2.20.1

