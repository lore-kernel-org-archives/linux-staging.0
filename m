Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A24C98
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:07:17 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJmj-0004rR-4g; Fri, 30 Dec 2022 19:07:13 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/20] staging: r8188eu: simplify frame type check
Date: Fri, 30 Dec 2022 19:06:35 +0100
Message-Id: <20221230180646.91008-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230180646.91008-1-martin@kaiser.cx>
References: <20221230180646.91008-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder the code in rtw_make_wlanhdr to make the function simpler.
There's a large if statement to check that we process only data frames.
Revert the condition and exit for non-data frames.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 139 ++++++++++++------------
 1 file changed, 70 insertions(+), 69 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 2bccb9ca42e9..502f9a6f4250 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -809,90 +809,91 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 	SetFrameSubType(fctrl, pattrib->subtype);
 
-	if (pattrib->subtype & IEEE80211_FTYPE_DATA) {
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
-			/* to_ds = 1, fr_ds = 0; */
-			/* Data transfer to AP */
-			SetToDs(fctrl);
-			memcpy(pwlanhdr->addr1, get_bssid(pmlmepriv), ETH_ALEN);
-			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
-			memcpy(pwlanhdr->addr3, pattrib->dst, ETH_ALEN);
-
-			if (pqospriv->qos_option)
-				qos_option = true;
-		} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
-			/* to_ds = 0, fr_ds = 1; */
-			SetFrDs(fctrl);
-			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
-			memcpy(pwlanhdr->addr2, get_bssid(pmlmepriv), ETH_ALEN);
-			memcpy(pwlanhdr->addr3, pattrib->src, ETH_ALEN);
-
-			if (psta->qos_option)
-				qos_option = true;
-		} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
-			   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
-			memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
-			memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
-			memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
-
-			if (psta->qos_option)
-				qos_option = true;
-		} else {
-			res = _FAIL;
-			goto exit;
-		}
+	if (!(pattrib->subtype & IEEE80211_FTYPE_DATA))
+		return _SUCCESS;
+
+	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
+		/* to_ds = 1, fr_ds = 0; */
+		/* Data transfer to AP */
+		SetToDs(fctrl);
+		memcpy(pwlanhdr->addr1, get_bssid(pmlmepriv), ETH_ALEN);
+		memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
+		memcpy(pwlanhdr->addr3, pattrib->dst, ETH_ALEN);
+
+		if (pqospriv->qos_option)
+			qos_option = true;
+	} else if (check_fwstate(pmlmepriv,  WIFI_AP_STATE)) {
+		/* to_ds = 0, fr_ds = 1; */
+		SetFrDs(fctrl);
+		memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
+		memcpy(pwlanhdr->addr2, get_bssid(pmlmepriv), ETH_ALEN);
+		memcpy(pwlanhdr->addr3, pattrib->src, ETH_ALEN);
 
-		if (pattrib->mdata)
-			SetMData(fctrl);
+		if (psta->qos_option)
+			qos_option = true;
+	} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) ||
+		   check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
+		memcpy(pwlanhdr->addr1, pattrib->dst, ETH_ALEN);
+		memcpy(pwlanhdr->addr2, pattrib->src, ETH_ALEN);
+		memcpy(pwlanhdr->addr3, get_bssid(pmlmepriv), ETH_ALEN);
 
-		if (pattrib->encrypt)
-			SetPrivacy(fctrl);
+		if (psta->qos_option)
+			qos_option = true;
+	} else {
+		res = _FAIL;
+		goto exit;
+	}
 
-		if (qos_option) {
-			qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
+	if (pattrib->mdata)
+		SetMData(fctrl);
 
-			if (pattrib->priority)
-				SetPriority(qc, pattrib->priority);
+	if (pattrib->encrypt)
+		SetPrivacy(fctrl);
 
-			SetEOSP(qc, pattrib->eosp);
+	if (qos_option) {
+		qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
 
-			SetAckpolicy(qc, pattrib->ack_policy);
-		}
+		if (pattrib->priority)
+			SetPriority(qc, pattrib->priority);
 
-		/* TODO: fill HT Control Field */
+		SetEOSP(qc, pattrib->eosp);
 
-		/* Update Seq Num will be handled by f/w */
-		if (psta) {
-			psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
-			psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
+		SetAckpolicy(qc, pattrib->ack_policy);
+	}
 
-			pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
+	/* TODO: fill HT Control Field */
 
-			SetSeqNum(hdr, pattrib->seqnum);
+	/* Update Seq Num will be handled by f/w */
+	if (psta) {
+		psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
+		psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
 
-			/* check if enable ampdu */
-			if (pattrib->ht_en && psta->htpriv.ampdu_enable) {
-				if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
-					pattrib->ampdu_en = true;
-			}
+		pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
 
-			/* re-check if enable ampdu by BA_starting_seqctrl */
-			if (pattrib->ampdu_en) {
-				u16 tx_seq;
+		SetSeqNum(hdr, pattrib->seqnum);
 
-				tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
+		/* check if enable ampdu */
+		if (pattrib->ht_en && psta->htpriv.ampdu_enable) {
+			if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
+				pattrib->ampdu_en = true;
+		}
 
-				/* check BA_starting_seqctrl */
-				if (SN_LESS(pattrib->seqnum, tx_seq)) {
-					pattrib->ampdu_en = false;/* AGG BK */
-				} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
+		/* re-check if enable ampdu by BA_starting_seqctrl */
+		if (pattrib->ampdu_en) {
+			u16 tx_seq;
 
-					pattrib->ampdu_en = true;/* AGG EN */
-				} else {
-					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
-					pattrib->ampdu_en = true;/* AGG EN */
-				}
+			tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
+
+			/* check BA_starting_seqctrl */
+			if (SN_LESS(pattrib->seqnum, tx_seq)) {
+				pattrib->ampdu_en = false;/* AGG BK */
+			} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
+				psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) & 0xfff;
+
+				pattrib->ampdu_en = true;/* AGG EN */
+			} else {
+				psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) & 0xfff;
+				pattrib->ampdu_en = true;/* AGG EN */
 			}
 		}
 	}
-- 
2.30.2

