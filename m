Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2AC3D79
	for <linux-staging@lists.linux.dev>; Thu,  2 Jun 2022 19:37:53 +0000 (UTC)
Received: from ipservice-092-217-081-045.092.217.pools.vodafone-ip.de ([92.217.81.45] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nwqdg-0003py-PL; Thu, 02 Jun 2022 21:37:48 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/11] staging: r8188eu: calculate the delba length
Date: Thu,  2 Jun 2022 21:37:24 +0200
Message-Id: <20220602193726.280922-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220602193726.280922-1-martin@kaiser.cx>
References: <20220602193726.280922-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use offsetofend to calculate the length of the delba message.

We are now calculating all message lengths based on the offset of their
last field. All intermediate updates of pattrib->pktlen can be removed.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 7968674a0705..565e447bb75e 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5401,10 +5401,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	mgmt->seq_ctrl = cpu_to_le16(pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
 
-	pattrib->pktlen = sizeof(struct ieee80211_hdr_3addr);
-
 	mgmt->u.action.category = WLAN_CATEGORY_BACK;
-	pattrib->pktlen++;
 
 	switch (action) {
 	case WLAN_ACTION_ADDBA_REQ:
@@ -5448,14 +5445,12 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 		break;
 	case WLAN_ACTION_DELBA:
 		mgmt->u.action.u.delba.action_code = WLAN_ACTION_DELBA;
-		pattrib->pktlen++;
 		mgmt->u.action.u.delba.params = cpu_to_le16((status & 0x1F) << 3);
 		params = u16_encode_bits((status & 0x1), IEEE80211_DELBA_PARAM_INITIATOR_MASK);
 		params |= u16_encode_bits((status >> 1) & 0xF, IEEE80211_DELBA_PARAM_TID_MASK);
 		mgmt->u.action.u.delba.params = cpu_to_le16(params);
-		pattrib->pktlen += 2;
 		mgmt->u.action.u.delba.reason_code = cpu_to_le16(WLAN_STATUS_REQUEST_DECLINED);
-		pattrib->pktlen += 2;
+		pattrib->pktlen = offsetofend(struct ieee80211_mgmt, u.action.u.delba.reason_code);
 		break;
 	default:
 		break;
-- 
2.30.2

