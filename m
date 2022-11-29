Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4772BA45
	for <linux-staging@lists.linux.dev>; Tue, 29 Nov 2022 20:52:10 +0000 (UTC)
Received: from dslb-188-104-061-001.188.104.pools.vodafone-ip.de ([188.104.61.1] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p07aC-0001pO-Aq; Tue, 29 Nov 2022 21:52:00 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/5] staging: r8188eu: use ieee80211_mgmt to parse addresses
Date: Tue, 29 Nov 2022 21:51:48 +0100
Message-Id: <20221129205152.128172-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221129205152.128172-1-martin@kaiser.cx>
References: <20221129205152.128172-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a struct ieee80211_mgmt in the OnDisassoc function and use it to
parse the addresses in the incoming disassoc message. This replaces some
driver-specific functions for address parsing.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index d32b2d569e23..b2b2cb57ed04 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1427,6 +1427,7 @@ static void OnDeAuth(struct adapter *padapter, struct recv_frame *precv_frame)
 
 static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 {
+	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 	u16 reason;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
@@ -1434,8 +1435,7 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 	u8 *pframe = precv_frame->rx_data;
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
-	/* check A3 */
-	if (!(!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
+	if (memcmp(mgmt->bssid, get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
 		return;
 
 	if (pwdinfo->rx_invitereq_info.scan_op_ch_only) {
@@ -1449,7 +1449,7 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 		struct sta_info *psta;
 		struct sta_priv *pstapriv = &padapter->stapriv;
 
-		psta = rtw_get_stainfo(pstapriv, GetAddr2Ptr(pframe));
+		psta = rtw_get_stainfo(pstapriv, mgmt->sa);
 		if (psta) {
 			u8 updated = 0;
 
@@ -1466,7 +1466,7 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 
 		return;
 	} else {
-		receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
+		receive_disconnect(padapter, mgmt->bssid, reason);
 	}
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 }
-- 
2.30.2

