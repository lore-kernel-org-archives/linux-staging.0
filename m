Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C0C2F21
	for <linux-staging@lists.linux.dev>; Sun, 26 Jun 2022 18:07:42 +0000 (UTC)
Received: from dslb-188-104-057-109.188.104.pools.vodafone-ip.de ([188.104.57.109] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1o5Wfa-00073R-OY; Sun, 26 Jun 2022 20:07:38 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] staging: r8188eu: drop return value from receive_disconnect
Date: Sun, 26 Jun 2022 20:07:34 +0200
Message-Id: <20220626180734.287137-1-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The receive_disconnect function always returns _SUCCESS. None of the
callers checks the return value. We can remove it.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 5 ++---
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 3 +--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index cce0575e93b7..fc6e06d7b5ca 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -6191,14 +6191,14 @@ void start_clnt_assoc(struct adapter *padapter)
 	set_link_timer(pmlmeext, REASSOC_TO);
 }
 
-unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
+void receive_disconnect(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
 {
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 
 	/* check A3 */
 	if (!(!memcmp(MacAddr, get_my_bssid(&pmlmeinfo->network), ETH_ALEN)))
-		return _SUCCESS;
+		return;
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE) {
 		if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
@@ -6209,7 +6209,6 @@ unsigned int receive_disconnect(struct adapter *padapter, unsigned char *MacAddr
 			report_join_res(padapter, -2);
 		}
 	}
-	return _SUCCESS;
 }
 
 static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 71864733b1c0..56c0e584bb6c 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -468,8 +468,7 @@ unsigned int update_MSC_rate(struct HT_caps_element *pHT_caps);
 void Update_RA_Entry(struct adapter *padapter, u32 mac_id);
 void set_sta_rate(struct adapter *padapter, struct sta_info *psta);
 
-unsigned int receive_disconnect(struct adapter *padapter,
-				unsigned char *macaddr, unsigned short reason);
+void receive_disconnect(struct adapter *padapter, unsigned char *macaddr, unsigned short reason);
 
 unsigned char get_highest_rate_idx(u32 mask);
 int support_short_GI(struct adapter *padapter, struct HT_caps_element *caps);
-- 
2.30.2

