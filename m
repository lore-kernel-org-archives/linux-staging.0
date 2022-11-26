Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB5117F7
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:01:39 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxcU-0000Ub-Q4; Sat, 26 Nov 2022 17:01:34 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 01/10] staging: r8188eu: replace one GetAddr3Ptr call
Date: Sat, 26 Nov 2022 17:01:20 +0100
Message-Id: <20221126160129.178697-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221126160129.178697-1-martin@kaiser.cx>
References: <20221126160129.178697-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define a struct ieee80211_mgmt in the OnBeacon function. Use it to replace
one GetAddr3Ptr call. This is a tiny step towards making GetAddr3Ptr
obsolete.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 93696892ec7d..80342b53a129 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -560,6 +560,7 @@ static void OnProbeRsp(struct adapter *padapter, struct recv_frame *precv_frame)
 
 static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 {
+	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 	int cam_idx;
 	struct sta_info	*psta;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
@@ -576,7 +577,7 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 		return;
 	}
 
-	if (!memcmp(GetAddr3Ptr(pframe), get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
+	if (!memcmp(mgmt->bssid, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)) {
 		if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 			/* we should update current network before auth, or some IE is wrong */
 			pbss = kmalloc(sizeof(struct wlan_bssid_ex), GFP_ATOMIC);
-- 
2.30.2

