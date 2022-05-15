Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC4AA49
	for <linux-staging@lists.linux.dev>; Sun, 15 May 2022 15:28:29 +0000 (UTC)
Received: from dslb-188-096-141-066.188.096.pools.vodafone-ip.de ([188.96.141.66] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nqGAS-0006Dx-Gb; Sun, 15 May 2022 17:28:24 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>,
	Joe Perches <joe@perches.com>
Subject: [PATCH] staging: r8188eu: use defines for addba response status
Date: Sun, 15 May 2022 17:27:59 +0200
Message-Id: <20220515152759.335889-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the numeric values with defines from ieee80211.h.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---

This should be applied after yesterday's series "more cleanups in
OnAction_back".

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b24c6a79646d..65330baa5a73 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1504,7 +1504,8 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 		preorder_ctrl->enable = pmlmeinfo->bAcceptAddbaReq;
 
 		issue_action_BA(padapter, mgmt->sa, WLAN_ACTION_ADDBA_RESP,
-				pmlmeinfo->bAcceptAddbaReq ? 0 : 37);
+				pmlmeinfo->bAcceptAddbaReq ?
+					WLAN_STATUS_SUCCESS : WLAN_STATUS_REQUEST_DECLINED);
 		break;
 	case WLAN_ACTION_ADDBA_RESP:
 		tid = u16_get_bits(le16_to_cpu(mgmt->u.action.u.addba_resp.capab),
-- 
2.30.2

