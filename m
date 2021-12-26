Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E9E2CA2
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 21:25:50 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1b1X-0000qQ-AZ; Sun, 26 Dec 2021 22:25:47 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 03/10] staging: r8188eu: remove the private drvext_hdl ioctl
Date: Sun, 26 Dec 2021 22:25:28 +0100
Message-Id: <20211226212535.197989-4-martin@kaiser.cx>
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

Remove the private drvext_hdl ioctl, it is mapped to an empty function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index bc23754c7f5c..761511bbb0ad 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2126,16 +2126,6 @@ static int rtw_wx_set_mtk_wps_ie(struct net_device *dev,
 	return 0;
 }
 
-/*
- *	For all data larger than 16 octets, we need to use a
- *	pointer to memory allocated in user space.
- */
-static  int rtw_drvext_hdl(struct net_device *dev, struct iw_request_info *info,
-						union iwreq_data *wrqu, char *extra)
-{
-	return 0;
-}
-
 static int rtw_get_ap_info(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
@@ -4376,7 +4366,7 @@ static const struct iw_priv_args rtw_private_args[] = {
 static iw_handler rtw_private_handler[] = {
 rtw_wx_write32,				/* 0x00 */
 rtw_wx_read32,				/* 0x01 */
-rtw_drvext_hdl,				/* 0x02 */
+	NULL,				/* 0x02 */
 NULL,					/* 0x03 */
 /*  for MM DTV platform */
 	rtw_get_ap_info,		/* 0x04 */
-- 
2.30.2

