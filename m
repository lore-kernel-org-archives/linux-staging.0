Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1F9443D
	for <linux-staging@lists.linux.dev>; Mon, 31 Oct 2022 20:54:56 +0000 (UTC)
Received: from dslb-084-059-234-234.084.059.pools.vodafone-ip.de ([84.59.234.234] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opbo5-0006z9-R0; Mon, 31 Oct 2022 21:54:53 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Joe Perches <joe@perches.com>
Subject: [PATCH 1/3] staging: r8188eu: use ether_addr_equal for address comparison
Date: Mon, 31 Oct 2022 21:54:10 +0100
Message-Id: <20221031205412.124871-2-martin@kaiser.cx>
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

We can use ether_addr_equal instead of memcmp in
update_recvframe_phyinfo_88e for comparing the incoming frame's
destination address with our local address.

Both struct ieee80211_hdr and struct eeprom_priv's mac_addr component are
2-byte aligned.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index f01ae71bcdb1..10bb2e602984 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -126,8 +126,8 @@ void update_recvframe_phyinfo_88e(struct recv_frame *precvframe, struct phy_stat
 		 get_bssid(&padapter->mlmepriv), ETH_ALEN));
 
 	pkt_info.bPacketToSelf = pkt_info.bPacketMatchBSSID &&
-				 (!memcmp(ieee80211_get_DA(hdr),
-				  myid(&padapter->eeprompriv), ETH_ALEN));
+				 ether_addr_equal(ieee80211_get_DA(hdr),
+						  myid(&padapter->eeprompriv));
 
 	pkt_info.bPacketBeacon = pkt_info.bPacketMatchBSSID && ieee80211_is_beacon(fc);
 	if (pkt_info.bPacketBeacon) {
-- 
2.30.2

