Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8AF1FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:54:52 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V3-0008D7-Jp; Sun, 03 Apr 2022 18:54:49 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/11] staging: r8188eu: simplify error handling
Date: Sun,  3 Apr 2022 18:54:31 +0200
Message-Id: <20220403165438.357728-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220403165438.357728-1-martin@kaiser.cx>
References: <20220403165438.357728-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the error handling in validate_recv_data_frame. The function does
not have to do any cleanup for errors, we can return immediately.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 33 +++++++++----------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index c75b0592a63d..200d8c6c6e11 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -943,17 +943,15 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
 	struct rx_pkt_attrib	*pattrib = &precv_frame->attrib;
 	struct security_priv	*psecuritypriv = &adapter->securitypriv;
-	int ret = _SUCCESS;
+	int ret;
 
 	bretry = ieee80211_has_retry(hdr->frame_control);
 	pda = ieee80211_get_DA(hdr);
 	psa = ieee80211_get_SA(hdr);
-	pbssid = get_hdr_bssid(ptr);
 
-	if (!pbssid) {
-		ret = _FAIL;
-		goto exit;
-	}
+	pbssid = get_hdr_bssid(ptr);
+	if (!pbssid)
+		return _FAIL;
 
 	memcpy(pattrib->dst, pda, ETH_ALEN);
 	memcpy(pattrib->src, psa, ETH_ALEN);
@@ -986,16 +984,11 @@ static int validate_recv_data_frame(struct adapter *adapter,
 		break;
 	}
 
-	if (ret == _FAIL) {
-		goto exit;
-	} else if (ret == RTW_RX_HANDLED) {
-		goto exit;
-	}
+	if (ret == _FAIL || ret == RTW_RX_HANDLED)
+		return ret;
 
-	if (!psta) {
-		ret = _FAIL;
-		goto exit;
-	}
+	if (!psta)
+		return _FAIL;
 
 	/* psta->rssi = prxcmd->rssi; */
 	/* psta->signal_quality = prxcmd->sq; */
@@ -1023,10 +1016,8 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	precv_frame->preorder_ctrl = &psta->recvreorder_ctrl[pattrib->priority];
 
 	/*  decache, drop duplicate recv packets */
-	if (recv_decache(precv_frame, bretry, &psta->sta_recvpriv.rxcache) == _FAIL) {
-		ret = _FAIL;
-		goto exit;
-	}
+	if (recv_decache(precv_frame, bretry, &psta->sta_recvpriv.rxcache) == _FAIL)
+		return _FAIL;
 
 	if (pattrib->privacy) {
 		GET_ENCRY_ALGO(psecuritypriv, psta, pattrib->encrypt, is_multicast_ether_addr(pattrib->ra));
@@ -1038,9 +1029,7 @@ static int validate_recv_data_frame(struct adapter *adapter,
 		pattrib->icv_len = 0;
 	}
 
-exit:
-
-	return ret;
+	return _SUCCESS;
 }
 
 static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv_frame)
-- 
2.30.2

