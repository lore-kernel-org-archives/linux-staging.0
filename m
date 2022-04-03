Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703E71FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:45:48 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3MC-00085T-2k; Sun, 03 Apr 2022 18:45:40 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/5] staging: r8188eu: make validate_recv_ctrl_frame return void
Date: Sun,  3 Apr 2022 18:45:22 +0200
Message-Id: <20220403164526.357371-2-martin@kaiser.cx>
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

Make validate_recv_ctrl_frame return void.

At the moment, the function always returns _FAIL, the caller does not
check the return value.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 1a79c3f46bbf..931bd81b0886 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -795,8 +795,8 @@ static int sta2ap_data_frame(struct adapter *adapter,
 	return ret;
 }
 
-static int validate_recv_ctrl_frame(struct adapter *padapter,
-				    struct recv_frame *precv_frame)
+static void validate_recv_ctrl_frame(struct adapter *padapter,
+				     struct recv_frame *precv_frame)
 {
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
 	struct sta_priv *pstapriv = &padapter->stapriv;
@@ -805,11 +805,11 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 	/* uint len = precv_frame->len; */
 
 	if (!ieee80211_is_ctl(fc))
-		return _FAIL;
+		return;
 
 	/* receive the frames that ra(a1) is my address */
 	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN))
-		return _FAIL;
+		return;
 
 	/* only handle ps-poll */
 	if (GetFrameSubType(pframe) == WIFI_PSPOLL) {
@@ -821,7 +821,7 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
 
 		if (!psta || psta->aid != aid)
-			return _FAIL;
+			return;
 
 		/* for rx pkt statistics */
 		psta->sta_stats.rx_ctrl_pkts++;
@@ -847,7 +847,7 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 		}
 
 		if (wmmps_ac)
-			return _FAIL;
+			return;
 
 		if (psta->state & WIFI_STA_ALIVE_CHK_STATE) {
 			psta->expire_to = pstapriv->expire_to;
@@ -905,8 +905,6 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 			spin_unlock_bh(&pxmitpriv->lock);
 		}
 	}
-
-	return _FAIL;
 }
 
 struct recv_frame *recvframe_chk_defrag(struct adapter *padapter, struct recv_frame *precv_frame);
-- 
2.30.2

