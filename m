Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF791856
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 16:15:06 +0000 (UTC)
Received: from dslb-094-219-036-010.094.219.pools.vodafone-ip.de ([94.219.36.10] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nnjYf-00045H-Fu; Sun, 08 May 2022 18:14:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/5] staging: r8188eu: read addr2 from ieee80211_mgmt
Date: Sun,  8 May 2022 18:14:47 +0200
Message-Id: <20220508161451.115847-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220508161451.115847-1-martin@kaiser.cx>
References: <20220508161451.115847-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a struct ieee80211_mgmt variable in the OnAction_back function. Use
it to read addr2. For management frames, addr2 is the source address (sa).

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 848b5051aa13..2f67e3c08191 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1467,7 +1467,7 @@ unsigned int OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame
 
 unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_frame)
 {
-	u8 *addr;
+	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 	struct sta_info *psta = NULL;
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char		*frame_body;
@@ -1485,8 +1485,7 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
 			return _SUCCESS;
 
-	addr = GetAddr2Ptr(pframe);
-	psta = rtw_get_stainfo(pstapriv, addr);
+	psta = rtw_get_stainfo(pstapriv, mgmt->sa);
 
 	if (!psta)
 		return _SUCCESS;
@@ -1501,12 +1500,12 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 		switch (action) {
 		case RTW_WLAN_ACTION_ADDBA_REQ: /* ADDBA request */
 			memcpy(&pmlmeinfo->ADDBA_req, &frame_body[2], sizeof(struct ADDBA_request));
-			process_addba_req(padapter, (u8 *)&pmlmeinfo->ADDBA_req, addr);
+			process_addba_req(padapter, (u8 *)&pmlmeinfo->ADDBA_req, mgmt->sa);
 
 			if (pmlmeinfo->bAcceptAddbaReq)
-				issue_action_BA(padapter, addr, RTW_WLAN_ACTION_ADDBA_RESP, 0);
+				issue_action_BA(padapter, mgmt->sa, RTW_WLAN_ACTION_ADDBA_RESP, 0);
 			else
-				issue_action_BA(padapter, addr, RTW_WLAN_ACTION_ADDBA_RESP, 37);/* reject ADDBA Req */
+				issue_action_BA(padapter, mgmt->sa, RTW_WLAN_ACTION_ADDBA_RESP, 37);/* reject ADDBA Req */
 			break;
 		case RTW_WLAN_ACTION_ADDBA_RESP: /* ADDBA response */
 			status = get_unaligned_le16(&frame_body[3]);
-- 
2.30.2

