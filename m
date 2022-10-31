Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025AF443E
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 20:54:57 +0000 (UTC)
Received: from dslb-084-059-234-234.084.059.pools.vodafone-ip.de ([84.59.234.234] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opbo6-0006z9-US; Mon, 31 Oct 2022 21:54:55 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/3] staging: r8188eu: use hdr->frame_control instead of fc
Date: Mon, 31 Oct 2022 21:54:11 +0100
Message-Id: <20221031205412.124871-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221031205412.124871-1-martin@kaiser.cx>
References: <20221031205412.124871-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We can remove the fc variable in update_recvframe_phyinfo_88e and use
hdr->frame_control instead.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index 10bb2e602984..4e9d8c8285c4 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -114,13 +114,12 @@ void update_recvframe_phyinfo_88e(struct recv_frame *precvframe, struct phy_stat
 	struct hal_data_8188e *pHalData = &padapter->haldata;
 	struct phy_info *pPHYInfo  = &pattrib->phy_info;
 	u8 *wlanhdr = precvframe->rx_data;
-	__le16 fc = *(__le16 *)wlanhdr;
 	struct odm_per_pkt_info	pkt_info;
 	u8 *sa = NULL;
 	struct sta_priv *pstapriv;
 	struct sta_info *psta;
 
-	pkt_info.bPacketMatchBSSID = ((!ieee80211_is_ctl(fc)) &&
+	pkt_info.bPacketMatchBSSID = ((!ieee80211_is_ctl(hdr->frame_control)) &&
 		!pattrib->icv_err && !pattrib->crc_err &&
 		!memcmp(get_hdr_bssid(wlanhdr),
 		 get_bssid(&padapter->mlmepriv), ETH_ALEN));
@@ -129,7 +128,8 @@ void update_recvframe_phyinfo_88e(struct recv_frame *precvframe, struct phy_stat
 				 ether_addr_equal(ieee80211_get_DA(hdr),
 						  myid(&padapter->eeprompriv));
 
-	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID && ieee80211_is_beacon(fc);
+	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID &&
+				 ieee80211_is_beacon(hdr->frame_control);
 	if (pkt_info.bPacketBeacon) {
 		if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
 			sa = padapter->mlmepriv.cur_network.network.MacAddress;
-- 
2.30.2

