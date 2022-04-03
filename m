Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426831FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:45:56 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3ME-00085T-PF; Sun, 03 Apr 2022 18:45:42 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: use ieee80211 structs for addresses
Date: Sun,  3 Apr 2022 18:45:25 +0200
Message-Id: <20220403164526.357371-5-martin@kaiser.cx>
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

Map the incoming frame data to a struct ieee80211_hdr and extract
the addresses.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 39834771519f..a8ab1be33cfb 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -801,22 +801,21 @@ static void validate_recv_ctrl_frame(struct adapter *padapter,
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	u8 *pframe = precv_frame->rx_data;
-	__le16 fc = *(__le16 *)pframe;
-	/* uint len = precv_frame->len; */
 	u16 aid;
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
 	u8 wmmps_ac;
 	struct sta_info *psta;
 
 	/* receive the frames that ra(a1) is my address */
-	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN))
+	if (memcmp(hdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN))
 		return;
 
 	/* only handle ps-poll */
-	if (!ieee80211_is_pspoll(fc))
+	if (!ieee80211_is_pspoll(hdr->frame_control))
 		return;
 
 	aid = GetAid(pframe);
-	psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+	psta = rtw_get_stainfo(pstapriv, hdr->addr2);
 
 	if (!psta || psta->aid != aid)
 		return;
-- 
2.30.2

