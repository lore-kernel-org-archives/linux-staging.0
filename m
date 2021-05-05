Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C06F70
	for <linux-staging@lists.linux.dev>; Wed,  5 May 2021 20:43:38 +0000 (UTC)
Received: from dslb-188-104-057-152.188.104.pools.vodafone-ip.de ([188.104.57.152] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1leO6J-0003aS-1u; Wed, 05 May 2021 22:26:31 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/6] staging: rtl8188eu: make rtw_android_cmdstr_to_num static
Date: Wed,  5 May 2021 22:26:17 +0200
Message-Id: <20210505202622.11087-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This function is used only in rtw_android.c.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/include/rtw_android.h | 1 -
 drivers/staging/rtl8188eu/os_dep/rtw_android.c  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_android.h b/drivers/staging/rtl8188eu/include/rtw_android.h
index d7ca7c2fb118..2c26993b8205 100644
--- a/drivers/staging/rtl8188eu/include/rtw_android.h
+++ b/drivers/staging/rtl8188eu/include/rtw_android.h
@@ -45,7 +45,6 @@ enum ANDROID_WIFI_CMD {
 	ANDROID_WIFI_CMD_MAX
 };
 
-int rtw_android_cmdstr_to_num(char *cmdstr);
 int rtw_android_priv_cmd(struct net_device *net, struct ifreq *ifr, int cmd);
 
 #endif /* __RTW_ANDROID_H__ */
diff --git a/drivers/staging/rtl8188eu/os_dep/rtw_android.c b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
index f1470ac56874..99475be30702 100644
--- a/drivers/staging/rtl8188eu/os_dep/rtw_android.c
+++ b/drivers/staging/rtl8188eu/os_dep/rtw_android.c
@@ -52,7 +52,7 @@ struct android_wifi_priv_cmd {
 	int total_len;
 };
 
-int rtw_android_cmdstr_to_num(char *cmdstr)
+static int rtw_android_cmdstr_to_num(char *cmdstr)
 {
 	int cmd_num;
 
-- 
2.20.1

