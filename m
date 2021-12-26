Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52FB2CA2
	for <linux-staging@lists.linux.dev>; Sun, 26 Dec 2021 21:25:51 +0000 (UTC)
Received: from dslb-188-097-047-111.188.097.pools.vodafone-ip.de ([188.97.47.111] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1n1b1Y-0000qQ-TA; Sun, 26 Dec 2021 22:25:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/10] staging: r8188eu: remove private ioctls that return -1
Date: Sun, 26 Dec 2021 22:25:30 +0100
Message-Id: <20211226212535.197989-6-martin@kaiser.cx>
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

Remove the private ioctls that are mapped to rtw_wx_priv_null.
rtw_wx_priv_null itself can also be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index b1f4f5ae71c1..db88a78b1c87 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2090,12 +2090,6 @@ static int rtw_wx_write_rf(struct net_device *dev,
 	return 0;
 }
 
-static int rtw_wx_priv_null(struct net_device *dev, struct iw_request_info *a,
-		 union iwreq_data *wrqu, char *b)
-{
-	return -1;
-}
-
 static int rtw_wx_set_channel_plan(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
@@ -4385,9 +4379,9 @@ NULL,					/* 0x03 */
 	rtw_tdls_get,			/* 0x15 */
 
 	rtw_pm_set,			/* 0x16 */
-	rtw_wx_priv_null,		/* 0x17 */
+	NULL,				/* 0x17 */
 	rtw_rereg_nd_name,		/* 0x18 */
-	rtw_wx_priv_null,		/* 0x19 */
+	NULL,				/* 0x19 */
 
 	NULL,				/* 0x1A */
 	NULL,				/* 0x1B */
-- 
2.30.2

