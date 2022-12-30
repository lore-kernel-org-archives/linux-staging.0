Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5602F34
	for <linux-staging@lists.linux.dev>; Fri, 30 Dec 2022 18:15:40 +0000 (UTC)
Received: from dslb-188-097-208-179.188.097.pools.vodafone-ip.de ([188.97.208.179] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1pBJZq-0004hN-0s; Fri, 30 Dec 2022 18:53:54 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/4] staging: r8188eu: remove intermediate token variable
Date: Fri, 30 Dec 2022 18:53:26 +0100
Message-Id: <20221230175326.90617-5-martin@kaiser.cx>
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

Remove the token variable in on_action_public and use frame_body[2] as
function parameter. This saves another few lines of code.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 310e60c4b639..dc181e491b34 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3739,15 +3739,13 @@ static void on_action_public(struct adapter *padapter, struct recv_frame *precv_
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
 	u8 *frame_body = (u8 *)&mgmt->u;
-	u8 token;
 
 	/* All members of the action enum start with action_code. */
 	if (mgmt->u.action.u.s1g.action_code == WLAN_PUB_ACTION_VENDOR_SPECIFIC) {
 		if (!memcmp(frame_body + 2, P2P_OUI, 4))
 			on_action_public_p2p(precv_frame);
 	} else {
-		token = frame_body[2];
-		rtw_action_public_decache(precv_frame, token);
+		rtw_action_public_decache(precv_frame, frame_body[2]);
 	}
 }
 
-- 
2.30.2

