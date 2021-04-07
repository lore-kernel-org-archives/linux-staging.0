Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9729B6D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:06:05 +0000 (UTC)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUBcx-0001Q6-IN; Wed, 07 Apr 2021 19:06:03 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/10] staging: rtl8188eu: rtw_usb_if1_init needs no dvobj parameter
Date: Wed,  7 Apr 2021 19:05:29 +0200
Message-Id: <20210407170531.29356-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407170531.29356-1-martin@kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_usb_if1_init receives a pointer to struct usb_interface. dvobj is the
interface data for this interface.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index f173db5e7db9..301dab65b571 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -322,9 +322,9 @@ static int rtw_resume(struct usb_interface *pusb_intf)
  *        We accept the new device by returning 0.
  */
 
-static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
-					struct usb_interface *pusb_intf)
+static struct adapter *rtw_usb_if1_init(struct usb_interface *pusb_intf)
 {
+	struct dvobj_priv *dvobj = usb_get_intfdata(pusb_intf);
 	struct adapter *padapter;
 	struct net_device *pnetdev;
 	struct net_device *pmondev;
@@ -460,7 +460,7 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
 		goto exit;
 	}
 
-	if (!rtw_usb_if1_init(dvobj, pusb_intf)) {
+	if (!rtw_usb_if1_init(pusb_intf)) {
 		pr_debug("rtw_usb_if1_init failed\n");
 		goto free_dvobj;
 	}
-- 
2.20.1

