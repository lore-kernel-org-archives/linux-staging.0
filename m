Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29623A0
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 20:08:16 +0000 (UTC)
Received: from dslb-178-004-168-011.178.004.pools.vodafone-ip.de ([178.4.168.11] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nhd65-0001vc-8t; Thu, 21 Apr 2022 22:08:13 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: remove dummy entries from OnAction_tbl
Date: Thu, 21 Apr 2022 22:08:01 +0200
Message-Id: <20220421200805.192083-2-martin@kaiser.cx>
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

Unlike mlme_sta_tbl, OnAction_tbl is an array of structs.

OnAction iterates over the array to find the entry for a specific action
category. No action is performed if a category has no entry.

We can remove the entries that point to the dummy function DoReserved.
These were the last users of DoReserved, the function itself can be
removed as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 8 --------
 drivers/staging/r8188eu/include/ieee80211.h | 3 ---
 2 files changed, 11 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 190de0b59c42..2d52e9b84786 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -38,10 +38,7 @@ static struct action_handler OnAction_tbl[] = {
 	{RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &OnAction_dls},
 	{RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},
 	{RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public},
-	{RTW_WLAN_CATEGORY_RADIO_MEASUREMENT, "ACTION_RADIO_MEASUREMENT", &DoReserved},
-	{RTW_WLAN_CATEGORY_FT, "ACTION_FT",	&DoReserved},
 	{RTW_WLAN_CATEGORY_HT,	"ACTION_HT",	&OnAction_ht},
-	{RTW_WLAN_CATEGORY_SA_QUERY, "ACTION_SA_QUERY", &DoReserved},
 	{RTW_WLAN_CATEGORY_WMM, "ACTION_WMM", &OnAction_wmm},
 	{RTW_WLAN_CATEGORY_P2P, "ACTION_P2P", &OnAction_p2p},
 };
@@ -3959,11 +3956,6 @@ unsigned int OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
 	return _SUCCESS;
 }
 
-unsigned int DoReserved(struct adapter *padapter, struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
 struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv)
 {
 	struct xmit_frame			*pmgntframe;
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 0e37cd8974b5..81b16ca93429 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -601,10 +601,7 @@ enum rtw_ieee80211_category {
 	RTW_WLAN_CATEGORY_DLS = 2,
 	RTW_WLAN_CATEGORY_BACK = 3,
 	RTW_WLAN_CATEGORY_PUBLIC = 4, /* IEEE 802.11 public action frames */
-	RTW_WLAN_CATEGORY_RADIO_MEASUREMENT  = 5,
-	RTW_WLAN_CATEGORY_FT = 6,
 	RTW_WLAN_CATEGORY_HT = 7,
-	RTW_WLAN_CATEGORY_SA_QUERY = 8,
 	RTW_WLAN_CATEGORY_TDLS = 12,
 	RTW_WLAN_CATEGORY_WMM = 17,
 	RTW_WLAN_CATEGORY_P2P = 0x7f,/* P2P action frames */
-- 
2.30.2

