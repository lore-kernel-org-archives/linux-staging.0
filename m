Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E65123AF
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 20:08:17 +0000 (UTC)
Received: from dslb-178-004-168-011.178.004.pools.vodafone-ip.de ([178.4.168.11] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nhd66-0001vc-Bu; Thu, 21 Apr 2022 22:08:14 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/4] staging: r8188eu: on_action_spct does nothing
Date: Thu, 21 Apr 2022 22:08:02 +0200
Message-Id: <20220421200805.192083-3-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421200805.192083-1-martin@kaiser.cx>
References: <20220421200805.192083-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One of the entries in OnAction_tbl refers to on_action_spct. This function
reads some information but it performs no action. Remove on_action_spct
and its entry in OnAction_tbl.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 37 ---------------------
 drivers/staging/r8188eu/include/ieee80211.h |  1 -
 2 files changed, 38 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 2d52e9b84786..d185280a0b93 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -33,7 +33,6 @@ static mlme_handler mlme_sta_tbl[] = {
 };
 
 static struct action_handler OnAction_tbl[] = {
-	{RTW_WLAN_CATEGORY_SPECTRUM_MGMT,	 "ACTION_SPECTRUM_MGMT", on_action_spct},
 	{RTW_WLAN_CATEGORY_QOS, "ACTION_QOS", &OnAction_qos},
 	{RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &OnAction_dls},
 	{RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},
@@ -1476,42 +1475,6 @@ unsigned int OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame
 	return _SUCCESS;
 }
 
-unsigned int on_action_spct(struct adapter *padapter, struct recv_frame *precv_frame)
-{
-	unsigned int ret = _FAIL;
-	struct sta_info *psta = NULL;
-	struct sta_priv *pstapriv = &padapter->stapriv;
-	u8 *pframe = precv_frame->rx_data;
-	u8 *frame_body = (u8 *)(pframe + sizeof(struct ieee80211_hdr_3addr));
-	u8 category;
-	u8 action;
-
-	psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
-
-	if (!psta)
-		goto exit;
-
-	category = frame_body[0];
-	if (category != RTW_WLAN_CATEGORY_SPECTRUM_MGMT)
-		goto exit;
-
-	action = frame_body[1];
-	switch (action) {
-	case RTW_WLAN_ACTION_SPCT_MSR_REQ:
-	case RTW_WLAN_ACTION_SPCT_MSR_RPRT:
-	case RTW_WLAN_ACTION_SPCT_TPC_REQ:
-	case RTW_WLAN_ACTION_SPCT_TPC_RPRT:
-		break;
-	case RTW_WLAN_ACTION_SPCT_CHL_SWITCH:
-		break;
-	default:
-		break;
-	}
-
-exit:
-	return ret;
-}
-
 unsigned int OnAction_qos(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	return _SUCCESS;
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 81b16ca93429..69fdccff88a0 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -596,7 +596,6 @@ static inline int is_broadcast_mac_addr(const u8 *addr)
 
 /* Action category code */
 enum rtw_ieee80211_category {
-	RTW_WLAN_CATEGORY_SPECTRUM_MGMT = 0,
 	RTW_WLAN_CATEGORY_QOS = 1,
 	RTW_WLAN_CATEGORY_DLS = 2,
 	RTW_WLAN_CATEGORY_BACK = 3,
-- 
2.30.2

