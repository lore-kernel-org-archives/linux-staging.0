Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979E41FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:38:44 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3FC-00080j-6Z; Sun, 03 Apr 2022 18:38:26 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] staging: r8188eu: use ieee80211 helpers in validate_recv_mgnt_frame
Date: Sun,  3 Apr 2022 18:38:18 +0200
Message-Id: <20220403163818.357173-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403163818.357173-1-martin@kaiser.cx>
References: <20220403163818.357173-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ieee80211 helpers to detect the frame subtype in
and to parse mac addresses in validate_recv_mgnt_frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 8fa07d37d07b..1a79c3f46bbf 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -915,24 +915,24 @@ static void validate_recv_mgnt_frame(struct adapter *padapter,
 				     struct recv_frame *precv_frame)
 {
 	struct sta_info *psta;
+	struct ieee80211_hdr *hdr;
 
 	precv_frame = recvframe_chk_defrag(padapter, precv_frame);
 	if (!precv_frame)
 		return;
 
-	/* for rx pkt statistics */
-	psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(precv_frame->rx_data));
+	hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
+	psta = rtw_get_stainfo(&padapter->stapriv, hdr->addr2);
 	if (psta) {
 		psta->sta_stats.rx_mgnt_pkts++;
-		if (GetFrameSubType(precv_frame->rx_data) == WIFI_BEACON) {
+		if (ieee80211_is_beacon(hdr->frame_control))
 			psta->sta_stats.rx_beacon_pkts++;
-		} else if (GetFrameSubType(precv_frame->rx_data) == WIFI_PROBEREQ) {
+		else if (ieee80211_is_probe_req(hdr->frame_control))
 			psta->sta_stats.rx_probereq_pkts++;
-		} else if (GetFrameSubType(precv_frame->rx_data) == WIFI_PROBERSP) {
-			if (!memcmp(padapter->eeprompriv.mac_addr, GetAddr1Ptr(precv_frame->rx_data), ETH_ALEN))
+		else if (ieee80211_is_probe_resp(hdr->frame_control)) {
+			if (!memcmp(padapter->eeprompriv.mac_addr, hdr->addr1, ETH_ALEN))
 				psta->sta_stats.rx_probersp_pkts++;
-			else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->rx_data)) ||
-				 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->rx_data)))
+			else if (is_broadcast_mac_addr(hdr->addr1) || is_multicast_mac_addr(hdr->addr1))
 				psta->sta_stats.rx_probersp_bm_pkts++;
 			else
 				psta->sta_stats.rx_probersp_uo_pkts++;
-- 
2.30.2

