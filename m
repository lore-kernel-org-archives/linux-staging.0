Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA55C1387
	for <linux-staging@lists.linux.dev>; Wed, 23 Mar 2022 07:49:14 +0000 (UTC)
Received: from dslb-178-004-173-157.178.004.pools.vodafone-ip.de ([178.4.173.157] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nWvjy-0003JV-Qa; Wed, 23 Mar 2022 08:49:10 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/7] staging: r8188eu: use standard mechanisms for data frames
Date: Wed, 23 Mar 2022 08:48:56 +0100
Message-Id: <20220323074859.177425-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220323074859.177425-1-martin@kaiser.cx>
References: <20220323074859.177425-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use defines and macros from ieee80211.h to check for data frames and
to define data frame subtypes.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c |  5 +++--
 drivers/staging/r8188eu/core/rtw_xmit.c |  4 ++--
 drivers/staging/r8188eu/include/wifi.h  | 17 ++++++++---------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index f1983f3ff9f3..7b1c83e502f0 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1283,8 +1283,9 @@ struct recv_frame *recvframe_chk_defrag(struct adapter *padapter, struct recv_fr
 	psta_addr = pfhdr->attrib.ta;
 	psta = rtw_get_stainfo(pstapriv, psta_addr);
 	if (!psta) {
-		u8 type = GetFrameType(pfhdr->rx_data);
-		if (type != WIFI_DATA_TYPE) {
+		__le16 fc = *(__le16 *)pfhdr->rx_data;
+
+		if (ieee80211_is_data(fc)) {
 			psta = rtw_get_bcmc_stainfo(padapter);
 			pdefrag_q = &psta->sta_recvpriv.defrag_q;
 		} else {
diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index c2a550e7250e..781dc80ff9ed 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -497,7 +497,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 	pattrib->pkt_hdrlen = ETH_HLEN;/* pattrib->ether_type == 0x8100) ? (14 + 4): 14; vlan tag */
 
 	pattrib->hdrlen = WLAN_HDR_A3_LEN;
-	pattrib->subtype = WIFI_DATA_TYPE;
+	pattrib->subtype = IEEE80211_FTYPE_DATA;
 	pattrib->priority = 0;
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE | WIFI_ADHOC_STATE | WIFI_ADHOC_MASTER_STATE)) {
@@ -717,7 +717,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 
 	SetFrameSubType(fctrl, pattrib->subtype);
 
-	if (pattrib->subtype & WIFI_DATA_TYPE) {
+	if (pattrib->subtype & IEEE80211_FTYPE_DATA) {
 		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)) {
 			/* to_ds = 1, fr_ds = 0; */
 			/* Data transfer to AP */
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 47b73fde2006..c71334f3986a 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -13,7 +13,6 @@
 #define WLAN_SSID_MAXLEN	32
 
 enum WIFI_FRAME_TYPE {
-	WIFI_DATA_TYPE =	(BIT(3)),
 	WIFI_QOS_DATA_TYPE	= (BIT(7)|BIT(3)),	/*  QoS Data */
 };
 
@@ -41,14 +40,14 @@ enum WIFI_FRAME_SUBTYPE {
 	WIFI_CFEND_CFACK    = (BIT(7) | BIT(6) | BIT(5) | BIT(4) | IEEE80211_FTYPE_CTL),
 
 	/*  below is for data frame */
-	WIFI_DATA           = (0 | WIFI_DATA_TYPE),
-	WIFI_DATA_CFACK     = (BIT(4) | WIFI_DATA_TYPE),
-	WIFI_DATA_CFPOLL    = (BIT(5) | WIFI_DATA_TYPE),
-	WIFI_DATA_CFACKPOLL = (BIT(5) | BIT(4) | WIFI_DATA_TYPE),
-	WIFI_DATA_NULL      = (BIT(6) | WIFI_DATA_TYPE),
-	WIFI_CF_ACK         = (BIT(6) | BIT(4) | WIFI_DATA_TYPE),
-	WIFI_CF_POLL        = (BIT(6) | BIT(5) | WIFI_DATA_TYPE),
-	WIFI_CF_ACKPOLL     = (BIT(6) | BIT(5) | BIT(4) | WIFI_DATA_TYPE),
+	WIFI_DATA           = (0 | IEEE80211_FTYPE_DATA),
+	WIFI_DATA_CFACK     = (BIT(4) | IEEE80211_FTYPE_DATA),
+	WIFI_DATA_CFPOLL    = (BIT(5) | IEEE80211_FTYPE_DATA),
+	WIFI_DATA_CFACKPOLL = (BIT(5) | BIT(4) | IEEE80211_FTYPE_DATA),
+	WIFI_DATA_NULL      = (BIT(6) | IEEE80211_FTYPE_DATA),
+	WIFI_CF_ACK         = (BIT(6) | BIT(4) | IEEE80211_FTYPE_DATA),
+	WIFI_CF_POLL        = (BIT(6) | BIT(5) | IEEE80211_FTYPE_DATA),
+	WIFI_CF_ACKPOLL     = (BIT(6) | BIT(5) | BIT(4) | IEEE80211_FTYPE_DATA),
 	WIFI_QOS_DATA_NULL	= (BIT(6) | WIFI_QOS_DATA_TYPE),
 };
 
-- 
2.30.2

