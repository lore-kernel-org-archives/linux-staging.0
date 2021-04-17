Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1E771
	for <linux-staging@lists.linux.dev>; Sat, 17 Apr 2021 18:01:02 +0000 (UTC)
Received: from ipservice-092-217-095-235.092.217.pools.vodafone-ip.de ([92.217.95.235] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lXpFb-0002pi-MM; Sat, 17 Apr 2021 20:00:59 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: rtl8188eu: remove constant variable and dead code
Date: Sat, 17 Apr 2021 20:00:35 +0200
Message-Id: <20210417180037.17806-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210417180037.17806-1-martin@kaiser.cx>
References: <20210417180037.17806-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

g_wifi_on is always true. Remove the variable and the code that would
be run only if g_wifi_on was false.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/rtw_android.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/rtw_android.c b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
index f5763a9d70c5..2d21767bc1a3 100644
--- a/drivers/staging/rtl8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
@@ -53,15 +53,9 @@ struct android_wifi_priv_cmd {
 };
 
 /**
- * Local (static) functions and variables
+ * Local (static) functions
  */
 
-/* Initialize g_wifi_on to 1 so dhd_bus_start will be called for the first
- * time (only) in dhd_open, subsequential wifi on will be handled by
- * wl_android_wifi_on
- */
-static int g_wifi_on = true;
-
 int rtw_android_cmdstr_to_num(char *cmdstr)
 {
 	int cmd_num;
@@ -154,12 +148,6 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 	case ANDROID_WIFI_CMD_SETFWPATH:
 		goto response;
 	}
-	if (!g_wifi_on) {
-		DBG_88E("%s: Ignore private cmd \"%s\" - iface %s is down\n",
-			__func__, command, ifr->ifr_name);
-		ret = 0;
-		goto free;
-	}
 	switch (cmd_num) {
 	case ANDROID_WIFI_CMD_STOP:
 		break;
@@ -244,7 +232,6 @@ int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd)
 	} else {
 		ret = bytes_written;
 	}
-free:
 	kfree(command);
 	return ret;
 }
-- 
2.20.1

