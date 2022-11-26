Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB4F20E6
	for <linux-staging@lists.linux.dev>; Sat, 26 Nov 2022 16:01:44 +0000 (UTC)
Received: from dslb-188-096-151-149.188.096.pools.vodafone-ip.de ([188.96.151.149] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oyxca-0000Ub-21; Sat, 26 Nov 2022 17:01:40 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 08/10] staging: r8188eu: stop beacon processing if kmalloc fails
Date: Sat, 26 Nov 2022 17:01:27 +0100
Message-Id: <20221126160129.178697-9-martin@kaiser.cx>
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

If we cannot allocate a struct wlan_bssid_ex in the OnBeacon function, we
should stop processing the incoming beacon message and return.

For kmalloc failures, the current code just skips the update of network
and beacon info and tries to continue with the authentication. The update
would set the encryption algorithm that should be used for the
authentication.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index a15998d912a7..76424bcba416 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -575,13 +575,14 @@ static void OnBeacon(struct adapter *padapter, struct recv_frame *precv_frame)
 	if (pmlmeinfo->state & WIFI_FW_AUTH_NULL) {
 		/* we should update current network before auth, or some IE is wrong */
 		pbss = kmalloc(sizeof(struct wlan_bssid_ex), GFP_ATOMIC);
-		if (pbss) {
-			if (collect_bss_info(padapter, precv_frame, pbss) == _SUCCESS) {
-				update_network(&pmlmepriv->cur_network.network, pbss, padapter, true);
-				rtw_get_bcn_info(&pmlmepriv->cur_network);
-			}
-			kfree(pbss);
+		if (!pbss)
+			return;
+
+		if (collect_bss_info(padapter, precv_frame, pbss) == _SUCCESS) {
+			update_network(&pmlmepriv->cur_network.network, pbss, padapter, true);
+			rtw_get_bcn_info(&pmlmepriv->cur_network);
 		}
+		kfree(pbss);
 
 		/* check the vendor of the assoc AP */
 		pmlmeinfo->assoc_AP_vendor = check_assoc_AP(pframe + sizeof(struct ieee80211_hdr_3addr), len - sizeof(struct ieee80211_hdr_3addr));
-- 
2.30.2

