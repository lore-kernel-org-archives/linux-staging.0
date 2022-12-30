Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F782F34
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:15:51 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJZn-0004hN-C2; Fri, 30 Dec 2022 18:53:51 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/4] staging: r8188eu: merge on_action_public_vendor into its caller
Date: Fri, 30 Dec 2022 18:53:23 +0100
Message-Id: <20221230175326.90617-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221230175326.90617-1-martin@kaiser.cx>
References: <20221230175326.90617-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apart from declaring variables, on_action_public_vendor is only an if
statement. Merge this function into its only caller. This makes the code a
tiny bit smaller.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 1b9cf7596a76..cfa65813d3f2 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3735,15 +3735,6 @@ static unsigned int on_action_public_p2p(struct recv_frame *precv_frame)
 	return _SUCCESS;
 }
 
-static void on_action_public_vendor(struct recv_frame *precv_frame)
-{
-	u8 *pframe = precv_frame->rx_data;
-	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
-
-	if (!memcmp(frame_body + 2, P2P_OUI, 4))
-		on_action_public_p2p(precv_frame);
-}
-
 static void on_action_public_default(struct recv_frame *precv_frame)
 {
 	u8 *pframe = precv_frame->rx_data;
@@ -3758,12 +3749,16 @@ static void on_action_public_default(struct recv_frame *precv_frame)
 static void on_action_public(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
+	u8 *pframe = precv_frame->rx_data;
+	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 
 	/* All members of the action enum start with action_code. */
-	if (mgmt->u.action.u.s1g.action_code == WLAN_PUB_ACTION_VENDOR_SPECIFIC)
-		on_action_public_vendor(precv_frame);
-	else
+	if (mgmt->u.action.u.s1g.action_code == WLAN_PUB_ACTION_VENDOR_SPECIFIC) {
+		if (!memcmp(frame_body + 2, P2P_OUI, 4))
+			on_action_public_p2p(precv_frame);
+	} else {
 		on_action_public_default(precv_frame);
+	}
 }
 
 static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
-- 
2.30.2

