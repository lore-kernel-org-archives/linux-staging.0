Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5524A91
	for <linux-staging@lists.linux.dev>; Sun, 27 Feb 2022 16:42:16 +0000 (UTC)
Received: from ipservice-092-217-088-081.092.217.pools.vodafone-ip.de ([92.217.88.81] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nOMcf-0005Z9-M5; Sun, 27 Feb 2022 17:42:13 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 8/8] staging: r8188eu: use ieee80211 helper to read the "order" bit
Date: Sun, 27 Feb 2022 17:41:47 +0100
Message-Id: <20220227164147.1168847-9-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220227164147.1168847-1-martin@kaiser.cx>
References: <20220218135038.908307-1-martin@kaiser.cx>
 <20220227164147.1168847-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ieee80211 helper to read the "order" bit. The driver-specific
macro GetOrder can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index b245b0d54973..d77d983510a0 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1084,7 +1084,7 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	pattrib->mfrag = ieee80211_has_morefrags(fc);
 	pattrib->mdata = ieee80211_has_moredata(fc);
 	pattrib->privacy = ieee80211_has_protected(fc);
-	pattrib->order = GetOrder(ptr);
+	pattrib->order = ieee80211_has_order(fc);
 
 	/* Dump rx packets */
 	GetHalDefVar8188EUsb(adapter, HAL_DEF_DBG_DUMP_RXPKT, &bDumpRxPkt);
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 336c32470150..39b7a596e4c1 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -217,9 +217,6 @@ enum WIFI_REG_DOMAIN {
 #define ClearPrivacy(pbuf)	\
 	*(__le16 *)(pbuf) &= (~cpu_to_le16(_PRIVACY_))
 
-#define GetOrder(pbuf)					\
-	(((*(__le16 *)(pbuf)) & cpu_to_le16(_ORDER_)) != 0)
-
 #define GetFrameType(pbuf)				\
 	(le16_to_cpu(*(__le16 *)(pbuf)) & (BIT(3) | BIT(2)))
 
-- 
2.30.2

