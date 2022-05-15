Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC62EA57
	for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 15:54:11 +0000 (UTC)
Received: from dslb-188-096-141-066.188.096.pools.vodafone-ip.de ([188.96.141.66] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nqGZL-0006NT-SG; Sun, 15 May 2022 17:54:07 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/5] staging: r8188eu: use ieee80211 helper to check for beacon
Date: Sun, 15 May 2022 17:53:57 +0200
Message-Id: <20220515155401.352742-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220515155401.352742-1-martin@kaiser.cx>
References: <20220515155401.352742-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the ieee80211_is_beacon helper to check if the incoming frame is a
beacon frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index 7e50a42b6f75..dff0cba751df 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -128,9 +128,7 @@ void update_recvframe_phyinfo_88e(struct recv_frame *precvframe, struct phy_stat
 				 (!memcmp(get_da(wlanhdr),
 				  myid(&padapter->eeprompriv), ETH_ALEN));
 
-	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID &&
-				 (GetFrameSubType(wlanhdr) == WIFI_BEACON);
-
+	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID && ieee80211_is_beacon(fc);
 	if (pkt_info.bPacketBeacon) {
 		if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE))
 			sa = padapter->mlmepriv.cur_network.network.MacAddress;
-- 
2.30.2

