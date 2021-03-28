Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD5270
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 17:55:09 +0000 (UTC)
Received: from ipservice-092-217-065-008.092.217.pools.vodafone-ip.de ([92.217.65.8] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lQZcw-00035s-Nz; Sun, 28 Mar 2021 19:55:06 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: rtl8188eu: remove unused function parameter
Date: Sun, 28 Mar 2021 19:54:46 +0200
Message-Id: <20210328175446.28063-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_usb_if1_init does not use its struct usb_device_id parameter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index e18f1fff59ca..fba0af36d302 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -323,8 +323,7 @@ static int rtw_resume(struct usb_interface *pusb_intf)
  */
 
 static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
-					struct usb_interface *pusb_intf,
-					const struct usb_device_id *pdid)
+					struct usb_interface *pusb_intf)
 {
 	struct adapter *padapter;
 	struct net_device *pnetdev;
@@ -462,7 +461,7 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
 		goto exit;
 	}
 
-	if1 = rtw_usb_if1_init(dvobj, pusb_intf, pdid);
+	if1 = rtw_usb_if1_init(dvobj, pusb_intf);
 	if (!if1) {
 		pr_debug("rtw_init_primarystruct adapter Failed!\n");
 		goto free_dvobj;
-- 
2.20.1

