Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D335184D
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 16:15:10 +0000 (UTC)
Received: from dslb-094-219-036-010.094.219.pools.vodafone-ip.de ([94.219.36.10] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nnjYk-00045H-6Y; Sun, 08 May 2022 18:15:02 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: use back action codes from ieee80211.h
Date: Sun,  8 May 2022 18:14:50 +0200
Message-Id: <20220508161451.115847-5-martin@kaiser.cx>
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

Use the defines from ieee80211.h for the back action codes.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 1061732b9a25..2a7b85aefa56 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1496,16 +1496,16 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 		return _SUCCESS;
 	action = frame_body[1];
 	switch (action) {
-	case RTW_WLAN_ACTION_ADDBA_REQ: /* ADDBA request */
+	case WLAN_ACTION_ADDBA_REQ:
 		memcpy(&pmlmeinfo->ADDBA_req, &frame_body[2], sizeof(struct ADDBA_request));
 		process_addba_req(padapter, (u8 *)&pmlmeinfo->ADDBA_req, mgmt->sa);
 
 		if (pmlmeinfo->bAcceptAddbaReq)
-			issue_action_BA(padapter, mgmt->sa, RTW_WLAN_ACTION_ADDBA_RESP, 0);
+			issue_action_BA(padapter, mgmt->sa, WLAN_ACTION_ADDBA_RESP, 0);
 		else
-			issue_action_BA(padapter, mgmt->sa, RTW_WLAN_ACTION_ADDBA_RESP, 37);/* reject ADDBA Req */
+			issue_action_BA(padapter, mgmt->sa, WLAN_ACTION_ADDBA_RESP, 37);/* reject ADDBA Req */
 		break;
-	case RTW_WLAN_ACTION_ADDBA_RESP: /* ADDBA response */
+	case WLAN_ACTION_ADDBA_RESP:
 		status = get_unaligned_le16(&frame_body[3]);
 		tid = ((frame_body[5] >> 2) & 0x7);
 		if (status == 0) {	/* successful */
@@ -1515,7 +1515,7 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 			psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
 		}
 		break;
-	case RTW_WLAN_ACTION_DELBA: /* DELBA */
+	case WLAN_ACTION_DELBA:
 		if ((frame_body[3] & BIT(3)) == 0) {
 			psta->htpriv.agg_enable_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
 			psta->htpriv.candidate_tid_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
-- 
2.30.2

