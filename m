Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CC323AF
	for <linux-staging@lists.linux.dev>; Thu, 21 Apr 2022 20:08:19 +0000 (UTC)
Received: from dslb-178-004-168-011.178.004.pools.vodafone-ip.de ([178.4.168.11] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nhd68-0001vc-2b; Thu, 21 Apr 2022 22:08:16 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: remove OnAction_dls
Date: Thu, 21 Apr 2022 22:08:04 +0200
Message-Id: <20220421200805.192083-5-martin@kaiser.cx>
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

Remove the empty function OnAction_dls and its entry in OnAction_tbl.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 ------
 drivers/staging/r8188eu/include/ieee80211.h | 1 -
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index ed776de064ec..f426e26341ee 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -33,7 +33,6 @@ static mlme_handler mlme_sta_tbl[] = {
 };
 
 static struct action_handler OnAction_tbl[] = {
-	{RTW_WLAN_CATEGORY_DLS, "ACTION_DLS", &OnAction_dls},
 	{RTW_WLAN_CATEGORY_BACK, "ACTION_BACK", &OnAction_back},
 	{RTW_WLAN_CATEGORY_PUBLIC, "ACTION_PUBLIC", on_action_public},
 	{RTW_WLAN_CATEGORY_HT,	"ACTION_HT",	&OnAction_ht},
@@ -1474,11 +1473,6 @@ unsigned int OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame
 	return _SUCCESS;
 }
 
-unsigned int OnAction_dls(struct adapter *padapter, struct recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
 unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	u8 *addr;
diff --git a/drivers/staging/r8188eu/include/ieee80211.h b/drivers/staging/r8188eu/include/ieee80211.h
index 2dd1318651ff..fe2dc2a0a802 100644
--- a/drivers/staging/r8188eu/include/ieee80211.h
+++ b/drivers/staging/r8188eu/include/ieee80211.h
@@ -596,7 +596,6 @@ static inline int is_broadcast_mac_addr(const u8 *addr)
 
 /* Action category code */
 enum rtw_ieee80211_category {
-	RTW_WLAN_CATEGORY_DLS = 2,
 	RTW_WLAN_CATEGORY_BACK = 3,
 	RTW_WLAN_CATEGORY_PUBLIC = 4, /* IEEE 802.11 public action frames */
 	RTW_WLAN_CATEGORY_HT = 7,
-- 
2.30.2

