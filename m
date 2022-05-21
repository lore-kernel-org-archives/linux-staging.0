Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8F33211
	for <linux-staging@lists.linux.dev>; Sat, 21 May 2022 15:38:43 +0000 (UTC)
Received: from dslb-188-096-138-194.188.096.pools.vodafone-ip.de ([188.96.138.194] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nsRBa-0007XY-5j; Sat, 21 May 2022 17:38:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 07/12] staging: r8188eu: use mgmt to set the action codes
Date: Sat, 21 May 2022 17:38:19 +0200
Message-Id: <20220521153824.218196-8-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220521153824.218196-1-martin@kaiser.cx>
References: <20220521153824.218196-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the mgmt structure in issue_action_BA to set the action codes.
We have to distinguish between the different message types.

We also have to increment the packet length manually as we're no longer
calling rtw_set_fixed_ie, which increments the length.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index dd736416ddcf..efffbbfd495e 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5411,10 +5411,11 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 
 	mgmt->u.action.category = WLAN_CATEGORY_BACK;
 	pattrib->pktlen++;
-	pframe = rtw_set_fixed_ie(pframe, 1, &(action), &pattrib->pktlen);
 
 	switch (action) {
 	case WLAN_ACTION_ADDBA_REQ:
+		mgmt->u.action.u.addba_req.action_code = WLAN_ACTION_ADDBA_REQ;
+		pattrib->pktlen++;
 		do {
 			pmlmeinfo->dialogToken++;
 		} while (pmlmeinfo->dialogToken == 0);
@@ -5440,6 +5441,8 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
 		break;
 	case WLAN_ACTION_ADDBA_RESP:
+		mgmt->u.action.u.addba_resp.action_code = WLAN_ACTION_ADDBA_RESP;
+		pattrib->pktlen++;
 		pframe = rtw_set_fixed_ie(pframe, 1, &pmlmeinfo->ADDBA_req.dialog_token, &pattrib->pktlen);
 		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&status, &pattrib->pktlen);
 		BA_para_set = le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f;
@@ -5455,6 +5458,8 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&pmlmeinfo->ADDBA_req.BA_timeout_value, &pattrib->pktlen);
 		break;
 	case WLAN_ACTION_DELBA:
+		mgmt->u.action.u.delba.action_code = WLAN_ACTION_DELBA;
+		pattrib->pktlen++;
 		BA_para_set = (status & 0x1F) << 3;
 		le_tmp = cpu_to_le16(BA_para_set);
 		pframe = rtw_set_fixed_ie(pframe, 2, (unsigned char *)&le_tmp, &pattrib->pktlen);
-- 
2.30.2

