Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516F172
	for <linux-staging@lists.linux.dev>; Wed, 11 Aug 2021 20:15:21 +0000 (UTC)
Received: from dslb-094-219-033-123.094.219.pools.vodafone-ip.de ([94.219.33.123] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mDud9-0004sF-Tv; Wed, 11 Aug 2021 22:15:15 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/5] staging: r8188eu: remove unused function parameters
Date: Wed, 11 Aug 2021 22:14:47 +0200
Message-Id: <20210811201450.31366-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210811201450.31366-1-martin@kaiser.cx>
References: <20210811201450.31366-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_usb_if1_init and chip_by_usb_id do not need a
struct usb_device_id parameter.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 8f1e33d2fff7..4bf89b78a74a 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -250,8 +250,7 @@ static void usb_dvobj_deinit(struct usb_interface *usb_intf)
 
 }
 
-static void chip_by_usb_id(struct adapter *padapter,
-			   const struct usb_device_id *pdid)
+static void chip_by_usb_id(struct adapter *padapter)
 {
 	padapter->chip_type = NULL_CHIP_TYPE;
 	hal_set_hw_type(padapter);
@@ -569,7 +568,7 @@ int rtw_resume_process(struct adapter *padapter)
  */
 
 static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
-	struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
+	struct usb_interface *pusb_intf)
 {
 	struct adapter *padapter = NULL;
 	struct net_device *pnetdev = NULL;
@@ -587,7 +586,7 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 
 	/* step 1-1., decide the chip_type via vid/pid */
 	padapter->interface_type = RTW_USB;
-	chip_by_usb_id(padapter, pdid);
+	chip_by_usb_id(padapter);
 
 	if (rtw_handle_dualmac(padapter, 1) != _SUCCESS)
 		goto free_adapter;
@@ -722,7 +721,7 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
 	if (!dvobj)
 		goto exit;
 
-	if1 = rtw_usb_if1_init(dvobj, pusb_intf, pdid);
+	if1 = rtw_usb_if1_init(dvobj, pusb_intf);
 	if (!if1) {
 		DBG_88E("rtw_init_primarystruct adapter Failed!\n");
 		goto free_dvobj;
-- 
2.20.1

