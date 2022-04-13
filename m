Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC15D2F32
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 20:07:54 +0000 (UTC)
Received: from dslb-178-004-174-121.178.004.pools.vodafone-ip.de ([178.4.174.121] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nejHL-0005wN-BK; Wed, 13 Apr 2022 22:07:51 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 3/4] staging: r8188eu: use ieee80211 helpers in mgt_dispatcher
Date: Wed, 13 Apr 2022 22:07:41 +0200
Message-Id: <20220413200742.276806-4-martin@kaiser.cx>
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

Use structs and functions from ieee80211.h in mgt_dispatcher to parse
the incoming frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index ba071de4c05c..b6ee6a24930a 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -396,14 +396,15 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 	struct mlme_handler *ptable;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	u8 *pframe = precv_frame->rx_data;
-	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, GetAddr2Ptr(pframe));
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
+	struct sta_info *psta = rtw_get_stainfo(&padapter->stapriv, hdr->addr2);
 
-	if (GetFrameType(pframe) != IEEE80211_FTYPE_MGMT)
+	if (!ieee80211_is_mgmt(hdr->frame_control))
 		return;
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-	    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
+	if (memcmp(hdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN) &&
+	    !is_broadcast_ether_addr(hdr->addr1))
 		return;
 
 	ptable = mlme_sta_tbl;
@@ -415,7 +416,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 	ptable += index;
 
 	if (psta) {
-		if (GetRetry(pframe)) {
+		if (ieee80211_has_retry(hdr->frame_control)) {
 			if (precv_frame->attrib.seq_num == psta->RxMgmtFrameSeqNum)
 				/* drop the duplicate management frame */
 				return;
@@ -423,7 +424,7 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 		psta->RxMgmtFrameSeqNum = precv_frame->attrib.seq_num;
 	}
 
-	if (GetFrameSubType(pframe) == WIFI_AUTH) {
+	if (ieee80211_is_auth(hdr->frame_control)) {
 		if (check_fwstate(pmlmepriv, WIFI_AP_STATE))
 			ptable->func = &OnAuth;
 		else
@@ -432,8 +433,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 
 	if (ptable->func) {
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
+		if (memcmp(hdr->addr1, myid(&padapter->eeprompriv), ETH_ALEN) &&
+		    !is_broadcast_ether_addr(hdr->addr1))
 			return;
 		ptable->func(padapter, precv_frame);
 	}
-- 
2.30.2

