Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A81FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:45:56 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3MF-00085T-Kf; Sun, 03 Apr 2022 18:45:43 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: use ieee80211 struct for aid
Date: Sun,  3 Apr 2022 18:45:26 +0200
Message-Id: <20220403164526.357371-6-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403164526.357371-1-martin@kaiser.cx>
References: <20220403164526.357371-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the GetAid macro and map the frame data to a struct
ieee80211_pspoll instead. We can then read the aid component.

psta->aid is in host endianness and has a 0x3FFF mask applied. We have to
convert our read value as well and apply the mask before we compare it to
psta->aid.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 7 ++-----
 drivers/staging/r8188eu/include/wifi.h  | 2 --
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index a8ab1be33cfb..9f0bb29c9c56 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -800,9 +800,8 @@ static void validate_recv_ctrl_frame(struct adapter *padapter,
 {
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	u8 *pframe = precv_frame->rx_data;
-	u16 aid;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
+	struct ieee80211_pspoll *pspoll = (struct ieee80211_pspoll *)hdr;
 	u8 wmmps_ac;
 	struct sta_info *psta;
 
@@ -814,10 +813,8 @@ static void validate_recv_ctrl_frame(struct adapter *padapter,
 	if (!ieee80211_is_pspoll(hdr->frame_control))
 		return;
 
-	aid = GetAid(pframe);
 	psta = rtw_get_stainfo(pstapriv, hdr->addr2);
-
-	if (!psta || psta->aid != aid)
+	if (!psta || psta->aid != (le16_to_cpu(pspoll->aid) & 0x3FFF))
 		return;
 
 	/* for rx pkt statistics */
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index e10cf17d6aa0..eb3cb1fb285f 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -228,8 +228,6 @@ enum WIFI_REG_DOMAIN {
 #define SetAMsdu(pbuf, amsdu)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16((amsdu & 1) << 7)
 
-#define GetAid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
-
 #define GetTid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) +	\
 			(((GetToDs(pbuf)<<1) | GetFrDs(pbuf)) == 3 ?	\
 			30 : 24))) & 0x000f)
-- 
2.30.2

