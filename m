Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C02B70
	for <linux-staging@lists.linux.dev>; Sun, 20 Jun 2021 17:53:18 +0000 (UTC)
Received: from dslb-084-059-235-131.084.059.pools.vodafone-ip.de ([84.59.235.131] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lv1dE-00012S-JA; Sun, 20 Jun 2021 19:53:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/13] staging: rtl8188eu: handle errors from dev_alloc_name
Date: Sun, 20 Jun 2021 19:52:49 +0200
Message-Id: <20210620175301.14988-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fail the usb interface initialization if dev_alloc_name returns an error.

Other wlan drivers like natsemi or atmel use the same error handling.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 5ca54dc36fa9..ee209b2fe4fe 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -387,8 +387,11 @@ static int rtw_usb_if1_init(struct usb_interface *pusb_intf)
 		pr_debug("can't get autopm:\n");
 
 	/*  alloc dev name after read efuse. */
-	if (dev_alloc_name(pnetdev, padapter->registrypriv.ifname) < 0)
+	err = dev_alloc_name(pnetdev, padapter->registrypriv.ifname);
+	if (err < 0) {
 		RT_TRACE(_module_os_intfs_c_, _drv_err_, ("dev_alloc_name, fail!\n"));
+		goto free_hal_data;
+	}
 
 	netif_carrier_off(pnetdev);
 
-- 
2.20.1

