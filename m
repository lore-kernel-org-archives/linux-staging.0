Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0DB3D65
	for <linux-staging@lists.linux.dev>; Thu,  2 Jun 2022 19:56:34 +0000 (UTC)
Received: from ipservice-092-217-081-045.092.217.pools.vodafone-ip.de ([92.217.81.45] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nwqdb-0003py-Lj; Thu, 02 Jun 2022 21:37:43 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/11] staging: r8188eu: calculate the addba response length
Date: Thu,  2 Jun 2022 21:37:20 +0200
Message-Id: <20220602193726.280922-6-martin@kaiser.cx>
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

An addba response always ends with the timeout field. The length of the
addba response is the offset of the end of the timeout field in the struct
ieee80211_mgmt that defines the message.

Use offsetofend to calculate this offset and drop the intermediate pktlen
increments as we add addba response components.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b391273969af..2a13546e585c 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5441,18 +5441,14 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 		break;
 	case WLAN_ACTION_ADDBA_RESP:
 		mgmt->u.action.u.addba_resp.action_code = WLAN_ACTION_ADDBA_RESP;
-		pattrib->pktlen++;
 		mgmt->u.action.u.addba_resp.dialog_token = pmlmeinfo->ADDBA_req.dialog_token;
-		pattrib->pktlen++;
 		mgmt->u.action.u.addba_resp.status = cpu_to_le16(status);
-		pattrib->pktlen += 2;
 		capab = le16_to_cpu(pmlmeinfo->ADDBA_req.BA_para_set) & 0x3f;
 		capab |= u16_encode_bits(64, IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK);
 		capab |= u16_encode_bits(pregpriv->ampdu_amsdu, IEEE80211_ADDBA_PARAM_AMSDU_MASK);
 		mgmt->u.action.u.addba_req.capab = cpu_to_le16(capab);
-		pattrib->pktlen += 2;
 		mgmt->u.action.u.addba_resp.timeout = pmlmeinfo->ADDBA_req.BA_timeout_value;
-		pattrib->pktlen += 2;
+		pattrib->pktlen = offsetofend(struct ieee80211_mgmt, u.action.u.addba_resp.timeout);
 		break;
 	case WLAN_ACTION_DELBA:
 		mgmt->u.action.u.delba.action_code = WLAN_ACTION_DELBA;
-- 
2.30.2

