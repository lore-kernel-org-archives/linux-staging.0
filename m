Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AE62F2A
	for <linux-staging@lists.linux.dev>; Sat, 29 Oct 2022 17:24:03 +0000 (UTC)
Received: from dslb-188-097-213-253.188.097.pools.vodafone-ip.de ([188.97.213.253] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1oopYu-00074v-Cy; Sat, 29 Oct 2022 19:24:00 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 09/13] staging: r8188eu: clean up on_action_public
Date: Sat, 29 Oct 2022 19:23:33 +0200
Message-Id: <20221029172337.1574593-10-martin@kaiser.cx>
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

Use the struct mgmt to read the action_code. This is much simpler than
parsing the message ourselves.

Add a comment about reading the action code. All members of the action
enum start with an action_code byte. It does not matter which member we
use.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 40539fa3b5a2..b3cef3504ad3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3813,24 +3813,16 @@ static unsigned int on_action_public_default(struct recv_frame *precv_frame)
 static void on_action_public(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
-	unsigned int ret = _FAIL;
-	u8 *pframe = precv_frame->rx_data;
-	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
-	u8 action;
 
 	/* check RA matches or not */
 	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))
 		return;
 
-	action = frame_body[1];
-	switch (action) {
-	case ACT_PUBLIC_VENDOR:
-		ret = on_action_public_vendor(precv_frame);
-		break;
-	default:
-		ret = on_action_public_default(precv_frame);
-		break;
-	}
+	/* All members of the action enum start with action_code. */
+	if (mgmt->u.action.u.s1g.action_code == WLAN_PUB_ACTION_VENDOR_SPECIFIC)
+		on_action_public_vendor(precv_frame);
+	else
+		on_action_public_default(precv_frame);
 }
 
 static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
-- 
2.30.2

