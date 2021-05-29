Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33156D14
	for <linux-staging@lists.linux.dev>; Sat, 29 May 2021 12:14:34 +0000 (UTC)
Received: from dslb-188-096-150-056.188.096.pools.vodafone-ip.de ([188.96.150.56] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1lmxrN-00023z-1B; Sat, 29 May 2021 14:14:33 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/3] staging: rtl8188eu: remove dummy setfreq handler
Date: Sat, 29 May 2021 14:13:46 +0200
Message-Id: <20210529121346.8422-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210529121346.8422-1-martin@kaiser.cx>
References: <20210529121346.8422-1-martin@kaiser.cx>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The setfreq handler contains only a debug print. It returns success
although the frequency wasn't set.

Remove this handler and inform callers that this driver does not
support setfreq.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/rtl8188eu/os_dep/ioctl_linux.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
index 78699999c4fe..ebd61ba93ef0 100644
--- a/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/ioctl_linux.c
@@ -667,14 +667,6 @@ static int rtw_wx_get_name(struct net_device *dev,
 	return 0;
 }
 
-static int rtw_wx_set_freq(struct net_device *dev,
-			   struct iw_request_info *info,
-			   union iwreq_data *wrqu, char *extra)
-{
-	RT_TRACE(_module_rtl871x_mlme_c_, _drv_notice_, ("+%s\n", __func__));
-	return 0;
-}
-
 static int rtw_wx_get_freq(struct net_device *dev,
 			   struct iw_request_info *info,
 			   union iwreq_data *wrqu, char *extra)
@@ -2894,7 +2886,6 @@ static int rtw_wx_set_priv(struct net_device *dev,
 
 static iw_handler rtw_handlers[] = {
 	IW_HANDLER(SIOCGIWNAME, rtw_wx_get_name),
-	IW_HANDLER(SIOCSIWFREQ, rtw_wx_set_freq),
 	IW_HANDLER(SIOCGIWFREQ, rtw_wx_get_freq),
 	IW_HANDLER(SIOCSIWMODE, rtw_wx_set_mode),
 	IW_HANDLER(SIOCGIWMODE, rtw_wx_get_mode),
-- 
2.20.1

