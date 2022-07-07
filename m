Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4824D28F2
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 19:49:33 +0000 (UTC)
Received: from dslb-188-097-214-244.188.097.pools.vodafone-ip.de ([188.97.214.244] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o9XV4-0008AP-JN; Thu, 07 Jul 2022 21:49:22 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/2] staging: r8188eu: pattrib addresses were already set by the caller
Date: Thu,  7 Jul 2022 21:49:14 +0200
Message-Id: <20220707194914.63794-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220707194914.63794-1-martin@kaiser.cx>
References: <20220707194914.63794-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not set pattrib's src, dst, bssid, ra and ta again in
sta2sta_data_frame.

sta2sta_data_frame is called from validate_recv_data_frame when both to_ds
and from_ds are 0. All pattrib address fields have already been set to the
correct addresses when sta2sta_data_frame is called.

        memcpy(pattrib->dst, ieee80211_get_DA(hdr), ETH_ALEN);
            ieee80211_get_DA returns addr1 if to_ds and from_ds are 0

        memcpy(pattrib->src, ieee80211_get_SA(hdr), ETH_ALEN);
            ieee80211_get_SA returns addr2 if to_ds and from_ds are 0

        memcpy(pattrib->ra, hdr->addr1, ETH_ALEN);
        memcpy(pattrib->ta, hdr->addr2, ETH_ALEN);
            For pattrib->dst == addr1, pattrib->src == addr2, these
            assignments match those in sta2sta_data_frame that this
            patch removes.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 6a2a1b1664ac..e5a7b7dfc387 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -559,7 +559,6 @@ static void count_rx_stats(struct adapter *padapter, struct recv_frame *prframe,
 static int sta2sta_data_frame(struct adapter *adapter,
 			      struct recv_frame *precv_frame, struct sta_info **psta)
 {
-	u8 *ptr = precv_frame->rx_data;
 	int ret = _SUCCESS;
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
 	struct	sta_priv *pstapriv = &adapter->stapriv;
@@ -614,12 +613,6 @@ static int sta2sta_data_frame(struct adapter *adapter,
 			sta_addr = pattrib->src;
 		}
 	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
-		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
-		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
-		memcpy(pattrib->ta, pattrib->src, ETH_ALEN);
-
 		sta_addr = mybssid;
 	} else {
 		ret  = _FAIL;
-- 
2.30.2

