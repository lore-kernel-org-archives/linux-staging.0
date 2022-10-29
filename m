Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC8B2F2E
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:23:59 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopYq-00074v-Fq; Sat, 29 Oct 2022 19:23:56 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 04/13] staging: r8188eu: make OnAction_back static void
Date: Sat, 29 Oct 2022 19:23:28 +0200
Message-Id: <20221029172337.1574593-5-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221029172337.1574593-1-martin@kaiser.cx>
References: <20221029172337.1574593-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OnAction_back is called only by OnAction, its return value is not checked.
We can make it a static void function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 13 +++++--------
 drivers/staging/r8188eu/include/rtw_mlme_ext.h |  2 --
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index caa73f16dbf9..b13593523fd0 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1481,7 +1481,7 @@ static void OnDisassoc(struct adapter *padapter, struct recv_frame *precv_frame)
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 }
 
-unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_frame)
+static void OnAction_back(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 	struct sta_info *psta = NULL;
@@ -1494,21 +1494,20 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	/* check RA matches or not */
 	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))/* for if1, sta/ap mode */
-		return _SUCCESS;
+		return;
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		if (!(pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS))
-			return _SUCCESS;
+			return;
 
 	psta = rtw_get_stainfo(pstapriv, mgmt->sa);
-
 	if (!psta)
-		return _SUCCESS;
+		return;
 
 	frame_body = (unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 
 	if (!pmlmeinfo->HT_enable)
-		return _SUCCESS;
+		return;
 	/* All union members start with an action code, it's ok to use addba_req. */
 	switch (mgmt->u.action.u.addba_req.action_code) {
 	case WLAN_ACTION_ADDBA_REQ:
@@ -1550,8 +1549,6 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 	default:
 		break;
 	}
-
-	return _SUCCESS;
 }
 
 static int get_reg_classes_full_count(struct p2p_channels *channel_list)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index ec2e9352011b..4ccdce1ad9be 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -536,8 +536,6 @@ void start_clnt_auth(struct adapter *padapter);
 void start_clnt_join(struct adapter *padapter);
 void start_create_ibss(struct adapter *padapter);
 
-unsigned int OnAction_back(struct adapter *padapter,
-			   struct recv_frame *precv_frame);
 unsigned int OnAction_p2p(struct adapter *padapter,
 			  struct recv_frame *precv_frame);
 
-- 
2.30.2

