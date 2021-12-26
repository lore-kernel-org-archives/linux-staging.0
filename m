Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965432CA1
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 21:25:49 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1b1W-0000qQ-G3; Sun, 26 Dec 2021 22:25:46 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 02/10] staging: r8188eu: remove the private ioctl "get sensitivity"
Date: Sun, 26 Dec 2021 22:25:27 +0100
Message-Id: <20211226212535.197989-3-martin@kaiser.cx>
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

Remove the private ioctl "get sensitivity", it is mapped to an empty
function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index ea8858213771..bc23754c7f5c 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2119,13 +2119,6 @@ static int rtw_wx_set_mtk_wps_probe_ie(struct net_device *dev,
 	return 0;
 }
 
-static int rtw_wx_get_sensitivity(struct net_device *dev,
-				struct iw_request_info *info,
-				union iwreq_data *wrqu, char *buf)
-{
-	return 0;
-}
-
 static int rtw_wx_set_mtk_wps_ie(struct net_device *dev,
 				struct iw_request_info *info,
 				union iwreq_data *wrqu, char *extra)
@@ -4323,10 +4316,6 @@ static const struct iw_priv_args rtw_private_args[] = {
 		SIOCIWFIRSTPRIV + 0x6,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "wps_start"
 	},
-	{
-		SIOCIWFIRSTPRIV + 0x7,
-		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "get_sensitivity"
-	},
 	{
 		SIOCIWFIRSTPRIV + 0x8,
 		IW_PRIV_TYPE_INT | IW_PRIV_SIZE_FIXED | 1, 0, "wps_prob_req_ie"
@@ -4395,7 +4384,7 @@ NULL,					/* 0x03 */
 	rtw_set_pid,			/* 0x05 */
 	rtw_wps_start,			/* 0x06 */
 
-	rtw_wx_get_sensitivity,		/* 0x07 */
+	NULL,				/* 0x07 */
 	rtw_wx_set_mtk_wps_probe_ie,	/* 0x08 */
 	rtw_wx_set_mtk_wps_ie,		/* 0x09 */
 
-- 
2.30.2

