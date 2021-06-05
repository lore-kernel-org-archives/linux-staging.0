Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F2C2FAF
	for <linux-staging@lists.linux.dev>; Sat,  5 Jun 2021 16:59:31 +0000 (UTC)
Received: from dslb-188-096-145-192.188.096.pools.vodafone-ip.de ([188.96.145.192] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lpZdx-0002hw-VM; Sat, 05 Jun 2021 18:59:30 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 9/9] staging: rtl8188eu: remove unused function parameter
Date: Sat,  5 Jun 2021 18:58:58 +0200
Message-Id: <20210605165858.3175-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210605165858.3175-1-martin@kaiser.cx>
References: <20210605165858.3175-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loadparam function does not need a struct net_device.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/os_intfs.c b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
index 9944011b52d3..870148020e61 100644
--- a/drivers/staging/rtl8188eu/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8188eu/os_dep/os_intfs.c
@@ -136,7 +136,7 @@ MODULE_PARM_DESC(monitor_enable, "Enable monitor interface (default: false)");
 
 static int netdev_close(struct net_device *pnetdev);
 
-static void loadparam(struct adapter *padapter, struct net_device *pnetdev)
+static void loadparam(struct adapter *padapter)
 {
 	struct registry_priv *registry_par = &padapter->registrypriv;
 
@@ -315,7 +315,7 @@ struct net_device *rtw_init_netdev(void)
 	pnetdev->watchdog_timeo = HZ * 3; /* 3 second timeout */
 	pnetdev->wireless_handlers = (struct iw_handler_def *)&rtw_handlers_def;
 
-	loadparam(padapter, pnetdev);
+	loadparam(padapter);
 	padapter->cmdThread = NULL;
 
 	return pnetdev;
-- 
2.20.1

