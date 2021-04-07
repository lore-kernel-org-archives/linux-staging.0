Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7846D0D
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 17:06:01 +0000 (UTC)
Received: from ipservice-092-217-079-185.092.217.pools.vodafone-ip.de ([92.217.79.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lUBct-0001Q6-Qy; Wed, 07 Apr 2021 19:05:59 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/10] staging: rtl8188eu: remove unnecessary variable
Date: Wed,  7 Apr 2021 19:05:28 +0200
Message-Id: <20210407170531.29356-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210407170531.29356-1-martin@kaiser.cx>
References: <20210407170531.29356-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We just want to check if rtw_usb_if1_init returns NULL, which means there
was an error.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index fba0af36d302..f173db5e7db9 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -450,7 +450,6 @@ static void rtw_usb_if1_deinit(struct adapter *if1)
 
 static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device_id *pdid)
 {
-	struct adapter *if1 = NULL;
 	struct dvobj_priv *dvobj;
 
 	/* Initialize dvobj_priv */
@@ -461,9 +460,8 @@ static int rtw_drv_init(struct usb_interface *pusb_intf, const struct usb_device
 		goto exit;
 	}
 
-	if1 = rtw_usb_if1_init(dvobj, pusb_intf);
-	if (!if1) {
-		pr_debug("rtw_init_primarystruct adapter Failed!\n");
+	if (!rtw_usb_if1_init(dvobj, pusb_intf)) {
+		pr_debug("rtw_usb_if1_init failed\n");
 		goto free_dvobj;
 	}
 
-- 
2.20.1

