Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A8A2F32
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:24:06 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopYx-00074v-Qd; Sat, 29 Oct 2022 19:24:03 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 13/13] staging: r8188eu: check destination address in OnAction
Date: Sat, 29 Oct 2022 19:23:37 +0200
Message-Id: <20221029172337.1574593-14-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221029172337.1574593-1-martin@kaiser.cx>
References: <20221029172337.1574593-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All subfunctions of OnAction check if the destination address matches the
local interface's address. It's simpler to move this check to OnAction.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 93f3d387e92d..e985fc5fc575 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1492,9 +1492,6 @@ static void OnAction_back(struct adapter *padapter, struct recv_frame *precv_fra
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->rx_data;
 	struct sta_priv *pstapriv = &padapter->stapriv;
-	/* check RA matches or not */
-	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))/* for if1, sta/ap mode */
-		return;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
@@ -3795,10 +3792,6 @@ static void on_action_public(struct adapter *padapter, struct recv_frame *precv_
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 
-	/* check RA matches or not */
-	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))
-		return;
-
 	/* All members of the action enum start with action_code. */
 	if (mgmt->u.action.u.s1g.action_code == WLAN_PUB_ACTION_VENDOR_SPECIFIC)
 		on_action_public_vendor(precv_frame);
@@ -3808,17 +3801,12 @@ static void on_action_public(struct adapter *padapter, struct recv_frame *precv_
 
 static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
 {
-	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 	u8 *frame_body;
 	u8 OUI_Subtype;
 	u8 *pframe = precv_frame->rx_data;
 	uint len = precv_frame->len;
 	struct	wifidirect_info	*pwdinfo = &padapter->wdinfo;
 
-	/* check RA matches or not */
-	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))/* for if1, sta/ap mode */
-		return;
-
 	frame_body = (unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 
 	if (be32_to_cpu(*((__be32 *)(frame_body + 1))) != P2POUI)
@@ -3835,6 +3823,9 @@ static void OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 
+	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))
+		return;
+
 	switch (mgmt->u.action.category) {
 	case WLAN_CATEGORY_BACK:
 		OnAction_back(padapter, precv_frame);
-- 
2.30.2

