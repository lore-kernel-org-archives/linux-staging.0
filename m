Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6F2F3B
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 20:07:53 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nejHJ-0005wN-OK; Wed, 13 Apr 2022 22:07:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: use ieee80211 helper to read the qos tid
Date: Wed, 13 Apr 2022 22:07:39 +0200
Message-Id: <20220413200742.276806-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220413200742.276806-1-martin@kaiser.cx>
References: <20220413200742.276806-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the driver-specific GetPriority macro with ieee80211_get_tid,
which does exactly the same thing.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 2 +-
 drivers/staging/r8188eu/include/wifi.h  | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 91a6e0f035f4..16224476d18a 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -978,7 +978,7 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	pattrib->ack_policy = 0;
 	/* parsing QC field */
 	if (pattrib->qos) {
-		pattrib->priority = GetPriority((ptr + 24));
+		pattrib->priority = ieee80211_get_tid(hdr);
 		pattrib->ack_policy = GetAckpolicy((ptr + 24));
 		pattrib->amsdu = GetAMsdu((ptr + 24));
 		pattrib->hdrlen = 26;
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index b26770e91fc0..0254310bdf44 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -211,8 +211,6 @@ enum WIFI_REG_DOMAIN {
 #define SetPriority(pbuf, tid)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf)
 
-#define GetPriority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
-
 #define SetEOSP(pbuf, eosp)	\
 		*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4)
 
-- 
2.30.2

