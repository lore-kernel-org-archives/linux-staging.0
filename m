Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1E32915
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:51:06 +0000 (UTC)
Received: from ipservice-092-217-079-029.092.217.pools.vodafone-ip.de ([92.217.79.29] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nUE88-00084h-8Z; Tue, 15 Mar 2022 21:50:56 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 1/6] staging: r8188eu: remove unnecessary initializations
Date: Tue, 15 Mar 2022 21:50:36 +0100
Message-Id: <20220315205041.2714168-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315205041.2714168-1-martin@kaiser.cx>
References: <20220315205041.2714168-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not initialise bPacketMatchBSSID, bPacketToSelf and bPacketBeacon to
false at the start of update_recvframe_phyinfo_88e. All of them are set to
their actual values before they're used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
index b4c9738ed868..387af789797d 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_rxdesc.c
@@ -118,10 +118,6 @@ void update_recvframe_phyinfo_88e(struct recv_frame *precvframe, struct phy_stat
 	struct sta_priv *pstapriv;
 	struct sta_info *psta;
 
-	pkt_info.bPacketMatchBSSID = false;
-	pkt_info.bPacketToSelf = false;
-	pkt_info.bPacketBeacon = false;
-
 	pkt_info.bPacketMatchBSSID = ((!IsFrameTypeCtrl(wlanhdr)) &&
 		!pattrib->icv_err && !pattrib->crc_err &&
 		!memcmp(get_hdr_bssid(wlanhdr),
-- 
2.30.2

