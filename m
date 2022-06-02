Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A643D72
	for <linux-staging@lists.linux.dev>; Thu,  2 Jun 2022 19:37:52 +0000 (UTC)
Received: from ipservice-092-217-081-045.092.217.pools.vodafone-ip.de ([92.217.81.45] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nwqde-0003py-PW; Thu, 02 Jun 2022 21:37:47 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/11] staging: r8188eu: clarify the contents of the delba params
Date: Thu,  2 Jun 2022 21:37:23 +0200
Message-Id: <20220602193726.280922-9-martin@kaiser.cx>
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

The delba parameters field contains an initiator/receiver flag and the
tid. The caller of issue_action_BA passes these components in the status
parameter.

Extract the two components from status and use u16_encode_bits to copy
them into the parameters field. This should clarify what's going on and
should make it easier to replace the status parameter in the future.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b4d22dae212a..7968674a0705 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5377,7 +5377,7 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	struct registry_priv *pregpriv = &padapter->registrypriv;
 	struct ieee80211_mgmt *mgmt;
-	u16 capab;
+	u16 capab, params;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -5450,6 +5450,9 @@ void issue_action_BA(struct adapter *padapter, unsigned char *raddr, unsigned ch
 		mgmt->u.action.u.delba.action_code = WLAN_ACTION_DELBA;
 		pattrib->pktlen++;
 		mgmt->u.action.u.delba.params = cpu_to_le16((status & 0x1F) << 3);
+		params = u16_encode_bits((status & 0x1), IEEE80211_DELBA_PARAM_INITIATOR_MASK);
+		params |= u16_encode_bits((status >> 1) & 0xF, IEEE80211_DELBA_PARAM_TID_MASK);
+		mgmt->u.action.u.delba.params = cpu_to_le16(params);
 		pattrib->pktlen += 2;
 		mgmt->u.action.u.delba.reason_code = cpu_to_le16(WLAN_STATUS_REQUEST_DECLINED);
 		pattrib->pktlen += 2;
-- 
2.30.2

