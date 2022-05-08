Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E71858
	for <linux-staging@lists.linux.dev>; Sun,  8 May 2022 16:15:08 +0000 (UTC)
Received: from dslb-094-219-036-010.094.219.pools.vodafone-ip.de ([94.219.36.10] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nnjYn-00045H-RK; Sun, 08 May 2022 18:15:05 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/5] staging: r8188eu: read back action code from ieee80211_mgmt
Date: Sun,  8 May 2022 18:14:51 +0200
Message-Id: <20220508161451.115847-6-martin@kaiser.cx>
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

Read the back action code from struct ieee80211_mgmt.

struct ieee80211_mgmt contains an "action" union. Each of its members
starts with an 8-bit action code. Treat the union as addba_req when we
read the action code although we do not yet know if it is an addba_req.
This approach is similar to ieee80211_iface_process_skb.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 2a7b85aefa56..8a9236ba7c66 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1471,7 +1471,6 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 	struct sta_info *psta = NULL;
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char		*frame_body;
-	unsigned char		action;
 	unsigned short	tid, status;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
@@ -1494,8 +1493,8 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 
 	if (!pmlmeinfo->HT_enable)
 		return _SUCCESS;
-	action = frame_body[1];
-	switch (action) {
+	/* All union members start with an action code, it's ok to use addba_req. */
+	switch (mgmt->u.action.u.addba_req.action_code) {
 	case WLAN_ACTION_ADDBA_REQ:
 		memcpy(&pmlmeinfo->ADDBA_req, &frame_body[2], sizeof(struct ADDBA_request));
 		process_addba_req(padapter, (u8 *)&pmlmeinfo->ADDBA_req, mgmt->sa);
-- 
2.30.2

