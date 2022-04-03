Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533A1FDB
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 16:55:12 +0000 (UTC)
Received: from dslb-094-219-033-178.094.219.pools.vodafone-ip.de ([94.219.33.178] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nb3V8-0008D7-BK; Sun, 03 Apr 2022 18:54:54 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 10/11] staging: r8188eu: don't call get_hdr_bssid
Date: Sun,  3 Apr 2022 18:54:37 +0200
Message-Id: <20220403165438.357728-11-martin@kaiser.cx>
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

Do not call get_hdr_bssid from validate_recv_data_frame.

We already distinguish between the four cases for to_ds, from_ds. Copy
the bssid address as described in the "DS bit usage" table in
include/linux/ieee80211.h.

Eventually, we should remove get_hdr_bssid (and other similar
driver-specific parsing functions).

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 63ce66489146..e9209785b1c9 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -937,7 +937,6 @@ static int validate_recv_data_frame(struct adapter *adapter,
 				    struct recv_frame *precv_frame)
 {
 	u8 bretry;
-	u8 *pbssid;
 	struct sta_info *psta = NULL;
 	u8 *ptr = precv_frame->rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
@@ -947,15 +946,9 @@ static int validate_recv_data_frame(struct adapter *adapter,
 
 	bretry = ieee80211_has_retry(hdr->frame_control);
 
-	pbssid = get_hdr_bssid(ptr);
-	if (!pbssid)
-		return _FAIL;
-
 	memcpy(pattrib->dst, ieee80211_get_DA(hdr), ETH_ALEN);
 	memcpy(pattrib->src, ieee80211_get_SA(hdr), ETH_ALEN);
 
-	memcpy(pattrib->bssid, pbssid, ETH_ALEN);
-
 	/* address4 is used only if both to_ds and from_ds are set */
 	if (ieee80211_has_a4(hdr->frame_control))
 		return _FAIL;
@@ -963,12 +956,16 @@ static int validate_recv_data_frame(struct adapter *adapter,
 	memcpy(pattrib->ra, hdr->addr1, ETH_ALEN);
 	memcpy(pattrib->ta, hdr->addr2, ETH_ALEN);
 
-	if (ieee80211_has_fromds(hdr->frame_control))
+	if (ieee80211_has_fromds(hdr->frame_control)) {
+		memcpy(pattrib->bssid, hdr->addr2, ETH_ALEN);
 		ret = ap2sta_data_frame(adapter, precv_frame, &psta);
-	else if (ieee80211_has_tods(hdr->frame_control))
+	} else if (ieee80211_has_tods(hdr->frame_control)) {
+		memcpy(pattrib->bssid, hdr->addr1, ETH_ALEN);
 		ret = sta2ap_data_frame(adapter, precv_frame, &psta);
-	else
+	} else {
+		memcpy(pattrib->bssid, hdr->addr3, ETH_ALEN);
 		ret = sta2sta_data_frame(adapter, precv_frame, &psta);
+	}
 
 	if (ret == _FAIL || ret == RTW_RX_HANDLED)
 		return ret;
-- 
2.30.2

