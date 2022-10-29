Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE5A2F2A
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:24:00 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopYr-00074v-9L; Sat, 29 Oct 2022 19:23:57 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 05/13] staging: r8188eu: make OnAction_p2p static void
Date: Sat, 29 Oct 2022 19:23:29 +0200
Message-Id: <20221029172337.1574593-6-martin@kaiser.cx>
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

OnAction_p2p is called only by OnAction, its return value is not checked.
We can make it a static void function.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 9 ++++-----
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 3 ---
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b13593523fd0..0c2db015656f 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3833,7 +3833,7 @@ static void on_action_public(struct adapter *padapter, struct recv_frame *precv_
 	}
 }
 
-unsigned int OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
+static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	u8 *frame_body;
 	u8 category, OUI_Subtype;
@@ -3843,16 +3843,16 @@ unsigned int OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_fra
 
 	/* check RA matches or not */
 	if (memcmp(myid(&padapter->eeprompriv), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
-		return _SUCCESS;
+		return;
 
 	frame_body = (unsigned char *)(pframe + sizeof(struct ieee80211_hdr_3addr));
 
 	category = frame_body[0];
 	if (category != RTW_WLAN_CATEGORY_P2P)
-		return _SUCCESS;
+		return;
 
 	if (be32_to_cpu(*((__be32 *)(frame_body + 1))) != P2POUI)
-		return _SUCCESS;
+		return;
 
 	len -= sizeof(struct ieee80211_hdr_3addr);
 	OUI_Subtype = frame_body[5];
@@ -3870,7 +3870,6 @@ unsigned int OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_fra
 	default:
 		break;
 	}
-	return _SUCCESS;
 }
 
 static void OnAction(struct adapter *padapter, struct recv_frame *precv_frame)
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 4ccdce1ad9be..ce5b57e23e53 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -536,9 +536,6 @@ void start_clnt_auth(struct adapter *padapter);
 void start_clnt_join(struct adapter *padapter);
 void start_create_ibss(struct adapter *padapter);
 
-unsigned int OnAction_p2p(struct adapter *padapter,
-			  struct recv_frame *precv_frame);
-
 void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res);
 void mlmeext_sta_del_event_callback(struct adapter *padapter);
 void mlmeext_sta_add_event_callback(struct adapter *padapter,
-- 
2.30.2

