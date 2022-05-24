Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC28804
	for <linux-staging@lists.linux.dev>; Tue, 24 May 2022 09:01:06 +0000 (UTC)
Received: from 162.sub194.ddfr.nl ([83.136.194.162] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1ntQPW-0006Y3-6j; Tue, 24 May 2022 11:01:02 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 12/12] staging: r8188eu: calculate the addba request length
Date: Tue, 24 May 2022 11:00:29 +0200
Message-Id: <20220524090029.242584-13-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220524090029.242584-1-martin@kaiser.cx>
References: <20220521153824.218196-1-martin@kaiser.cx>
 <20220524090029.242584-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When issue_action_BA compiles an addba request, it does not add any
extensions. start_seq_num is the last field of the addba request.

The length of the request is the offset of the end of start_seq_num in the
struct ieee80211_mgmt that defines the message.

Use offsetofend to calculate this offset and drop the intermediate pktlen
increments as we add addba request components. (We have to keep the
increments for other message types until we use offsetofend for them as
well.)

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 408aa0a28382..5446e19d8d09 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5413,22 +5413,18 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	switch (action) {
 	case WLAN_ACTION_ADDBA_REQ:
 		mgmt->u.action.u.addba_req.action_code = WLAN_ACTION_ADDBA_REQ;
-		pattrib->pktlen++;
 		do {
 			pmlmeinfo->dialogToken++;
 		} while (pmlmeinfo->dialogToken == 0);
 		mgmt->u.action.u.addba_req.dialog_token = pmlmeinfo->dialogToken;
-		pattrib->pktlen++;
 
 		/* immediate ack & 64 buffer size */
 		capab = u16_encode_bits(64, IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK);
 		capab |= u16_encode_bits(1, IEEE80211_ADDBA_PARAM_POLICY_MASK);
 		capab |= u16_encode_bits(status, IEEE80211_ADDBA_PARAM_TID_MASK);
 		mgmt->u.action.u.addba_req.capab = cpu_to_le16(capab);
-		pattrib->pktlen += 2;
 
 		mgmt->u.action.u.addba_req.timeout = cpu_to_le16(5000); /* 5 ms */
-		pattrib->pktlen += 2;
 
 		psta = rtw_get_stainfo(pstapriv, raddr);
 		if (psta) {
@@ -5439,7 +5435,9 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 			BA_starting_seqctrl = start_seq << 4;
 		}
 		mgmt->u.action.u.addba_req.start_seq_num = cpu_to_le16(BA_starting_seqctrl);
-		pattrib->pktlen += 2;
+
+		pattrib->pktlen = offsetofend(struct ieee80211_mgmt,
+					      u.action.u.addba_req.start_seq_num);
 		break;
 	case WLAN_ACTION_ADDBA_RESP:
 		mgmt->u.action.u.addba_resp.action_code = WLAN_ACTION_ADDBA_RESP;
-- 
2.30.2

