Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDD32CA1
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 21:25:54 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1b1b-0000qQ-VS; Sun, 26 Dec 2021 22:25:52 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/10] staging: r8188eu: remove the private "test" ioctl
Date: Sun, 26 Dec 2021 22:25:34 +0100
Message-Id: <20211226212535.197989-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211226212535.197989-1-martin@kaiser.cx>
References: <20211226212535.197989-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the private "test" ioctl. It copies data from user space,
this data is not used.

We can now remove a number of NULL entries at the end of the private
ioctl list.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 46 --------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 911f10627551..c08b60ec1e64 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -4178,43 +4178,6 @@ static int rtw_pm_set(struct net_device *dev,
 
 extern int wifirate2_ratetbl_inx(unsigned char rate);
 
-static int rtw_test(
-	struct net_device *dev,
-	struct iw_request_info *info,
-	union iwreq_data *wrqu, char *extra)
-{
-	u32 len;
-	u8 *pbuf, *pch;
-	char *ptmp;
-	u8 *delim = ",";
-
-	DBG_88E("+%s\n", __func__);
-	len = wrqu->data.length;
-
-	pbuf = kzalloc(len, GFP_KERNEL);
-	if (!pbuf) {
-		DBG_88E("%s: no memory!\n", __func__);
-		return -ENOMEM;
-	}
-
-	if (copy_from_user(pbuf, wrqu->data.pointer, len)) {
-		kfree(pbuf);
-		DBG_88E("%s: copy from user fail!\n", __func__);
-		return -EFAULT;
-	}
-	DBG_88E("%s: string =\"%s\"\n", __func__, pbuf);
-
-	ptmp = (char *)pbuf;
-	pch = strsep(&ptmp, delim);
-	if (!pch || strlen(pch) == 0) {
-		kfree(pbuf);
-		DBG_88E("%s: parameter error(level 1)!\n", __func__);
-		return -EFAULT;
-	}
-	kfree(pbuf);
-	return 0;
-}
-
 static iw_handler rtw_handlers[] = {
 	IW_HANDLER(SIOCGIWNAME, rtw_wx_get_name),
 	IW_HANDLER(SIOCGIWFREQ, rtw_wx_get_freq),
@@ -4307,9 +4270,6 @@ static const struct iw_priv_args rtw_private_args[] = {
 	},
 
 	{SIOCIWFIRSTPRIV + 0x18, IW_PRIV_TYPE_CHAR | IFNAMSIZ, 0, "rereg_nd_name"},
-
-	{SIOCIWFIRSTPRIV + 0x1D, IW_PRIV_TYPE_CHAR | 40, IW_PRIV_TYPE_CHAR | 0x7FF, "test"
-	},
 };
 
 static iw_handler rtw_private_handler[] = {
@@ -4347,12 +4307,6 @@ NULL,					/* 0x03 */
 	rtw_pm_set,			/* 0x16 */
 	NULL,				/* 0x17 */
 	rtw_rereg_nd_name,		/* 0x18 */
-	NULL,				/* 0x19 */
-
-	NULL,				/* 0x1A */
-	NULL,				/* 0x1B */
-	NULL,				/*  0x1C is reserved for hostapd */
-	rtw_test,			/*  0x1D */
 };
 
 static struct iw_statistics *rtw_get_wireless_stats(struct net_device *dev)
-- 
2.30.2

