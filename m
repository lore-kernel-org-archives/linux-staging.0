Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC6C1FDA
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:55:20 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V5-0008D7-UZ; Sun, 03 Apr 2022 18:54:52 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/11] staging: r8188eu: remove to_fr_ds from struct rx_pkt_attrib
Date: Sun,  3 Apr 2022 18:54:34 +0200
Message-Id: <20220403165438.357728-8-martin@kaiser.cx>
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

to_fr_ds in struct rx_pkt_attrib stores the values of the to_ds and
from_ds bits of an incoming data frame. to_fr_ds is set by parsing the
frame control bytes and it's used only in validate_recv_data_frame.

Remove to_fr_ds from struct rx_pkt_attrib and use the ieee80211 helpers
to distinguish between the four different cases for to_ds, from_ds.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c    | 26 +++++++++-------------
 drivers/staging/r8188eu/include/rtw_recv.h |  1 -
 drivers/staging/r8188eu/include/wifi.h     |  2 --
 3 files changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index c200e1251545..0098f3de31d7 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -958,25 +958,22 @@ static int validate_recv_data_frame(struct adapter *adapter,
 
 	memcpy(pattrib->bssid, pbssid, ETH_ALEN);
 
-	switch (pattrib->to_fr_ds) {
-	case 0:
-		memcpy(pattrib->ra, pda, ETH_ALEN);
-		memcpy(pattrib->ta, psa, ETH_ALEN);
-		ret = sta2sta_data_frame(adapter, precv_frame, &psta);
-		break;
-	case 1:
+	/* address4 is used only if both to_ds and from_ds are set */
+	if (ieee80211_has_a4(hdr->frame_control))
+		return _FAIL;
+
+	if (ieee80211_has_fromds(hdr->frame_control)) {
 		memcpy(pattrib->ra, pda, ETH_ALEN);
 		memcpy(pattrib->ta, pbssid, ETH_ALEN);
 		ret = ap2sta_data_frame(adapter, precv_frame, &psta);
-		break;
-	case 2:
+	} else if (ieee80211_has_tods(hdr->frame_control)) {
 		memcpy(pattrib->ra, pbssid, ETH_ALEN);
 		memcpy(pattrib->ta, psa, ETH_ALEN);
 		ret = sta2ap_data_frame(adapter, precv_frame, &psta);
-		break;
-	default:
-		ret = _FAIL;
-		break;
+	} else {
+		memcpy(pattrib->ra, pda, ETH_ALEN);
+		memcpy(pattrib->ta, psa, ETH_ALEN);
+		ret = sta2sta_data_frame(adapter, precv_frame, &psta);
 	}
 
 	if (ret == _FAIL || ret == RTW_RX_HANDLED)
@@ -1035,7 +1032,6 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 
 	int retval = _FAIL;
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
-	u8 *ptr = precv_frame->rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
 	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
 
@@ -1048,8 +1044,6 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	if ((hdr->frame_control & cpu_to_le16(IEEE80211_FCTL_VERS)) != 0)
 		return _FAIL;
 
-	pattrib->to_fr_ds = get_tofr_ds(ptr);
-
 	pattrib->frag_num = le16_to_cpu(hdr->seq_ctrl) & IEEE80211_SCTL_FRAG;
 	pattrib->seq_num = IEEE80211_SEQ_TO_SN(le16_to_cpu(hdr->seq_ctrl));
 
diff --git a/drivers/staging/r8188eu/include/rtw_recv.h b/drivers/staging/r8188eu/include/rtw_recv.h
index 4ac4e6b3e177..59b4773bc3c9 100644
--- a/drivers/staging/r8188eu/include/rtw_recv.h
+++ b/drivers/staging/r8188eu/include/rtw_recv.h
@@ -80,7 +80,6 @@ struct rx_pkt_attrib {
 	u8	drvinfo_sz;
 	u8	shift_sz;
 	u8	hdrlen; /* the WLAN Header Len */
-	u8	to_fr_ds;
 	u8	amsdu;
 	bool	qos;
 	u8	priority;
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index eb3cb1fb285f..a252a416d3e5 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -152,8 +152,6 @@ enum WIFI_REG_DOMAIN {
 
 #define GetFrDs(pbuf)	(((*(__le16 *)(pbuf)) & cpu_to_le16(_FROM_DS_)) != 0)
 
-#define get_tofr_ds(pframe)	((GetToDs(pframe) << 1) | GetFrDs(pframe))
-
 #define SetMFrag(pbuf)	\
 	*(__le16 *)(pbuf) |= cpu_to_le16(_MORE_FRAG_)
 
-- 
2.30.2

