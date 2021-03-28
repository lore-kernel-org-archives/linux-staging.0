Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55ED70
	for <linux-staging@lists.linux.dev>; Sun, 28 Mar 2021 17:52:30 +0000 (UTC)
Received: from ipservice-092-217-065-008.092.217.pools.vodafone-ip.de ([92.217.65.8] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lQZaH-00032y-CK; Sun, 28 Mar 2021 19:52:21 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: rtl8188eu: (trivial) remove a duplicate comment
Date: Sun, 28 Mar 2021 19:52:00 +0200
Message-Id: <20210328175200.27069-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Keep the one that shows the wakeup capability.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 91a3d34a1050..e18f1fff59ca 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -377,7 +377,6 @@ static struct adapter *rtw_usb_if1_init(struct dvobj_priv *dvobj,
 		dvobj->pusbdev->do_remote_wakeup = 1;
 		pusb_intf->needs_remote_wakeup = 1;
 		device_init_wakeup(&pusb_intf->dev, 1);
-		pr_debug("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~~~~\n");
 		pr_debug("\n  padapter->pwrctrlpriv.bSupportRemoteWakeup~~~[%d]~~~\n",
 			 device_may_wakeup(&pusb_intf->dev));
 	}
-- 
2.20.1

