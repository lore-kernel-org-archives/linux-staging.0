Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36209BA28
	for <linux-staging@lists.linux.dev>; Tue, 29 Nov 2022 20:52:19 +0000 (UTC)
Received: from dslb-188-104-061-001.188.104.pools.vodafone-ip.de ([188.104.61.1] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1p07aQ-0001pO-3E; Tue, 29 Nov 2022 21:52:14 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/5] staging: r8188eu: read reason code from ieee80211_mgmt
Date: Tue, 29 Nov 2022 21:51:49 +0100
Message-Id: <20221129205152.128172-3-martin@kaiser.cx>
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

Use the struct ieee80211_mgmt to read the reason code instead of parsing
the message manually.

Remove the pframe pointer, it's no longer used.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b2b2cb57ed04..fe58d4e3e260 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1432,7 +1432,6 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
-	u8 *pframe = precv_frame->rx_data;
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
 	if (memcmp(mgmt->bssid, get_my_bssid(&pmlmeinfo->network), ETH_ALEN))
@@ -1443,7 +1442,7 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 		_set_timer(&pwdinfo->reset_ch_sitesurvey, 10);
 	}
 
-	reason = le16_to_cpu(*(__le16 *)(pframe + WLAN_HDR_A3_LEN));
+	reason = le16_to_cpu(mgmt->u.disassoc.reason_code);
 
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		struct sta_info *psta;
-- 
2.30.2

