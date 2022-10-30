Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8508F4E
	for <linux-staging@lists.linux.dev>; Sun, 30 Oct 2022 17:33:50 +0000 (UTC)
Received: from ipservice-092-217-067-184.092.217.pools.vodafone-ip.de ([92.217.67.184] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1opCBv-000469-UZ; Sun, 30 Oct 2022 18:33:48 +0100
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH v2 09/13] staging: r8188eu: clean up on_action_public
Date: Sun, 30 Oct 2022 18:33:22 +0100
Message-Id: <20221030173326.1588647-10-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221030173326.1588647-1-martin@kaiser.cx>
References: <20221030173326.1588647-1-martin@kaiser.cx>
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
Changes in v2
- don't remove the ret variable, it's already gone

 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 6d95d3bc23e6..b3cef3504ad3 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3813,23 +3813,16 @@ static unsigned int on_action_public_default(struct recv_frame *precv_frame)
 static void on_action_public(struct adapter *padapter, struct recv_frame *precv_frame)
 {
 	struct ieee80211_mgmt *mgmt = (struct ieee80211_mgmt *)precv_frame->rx_data;
-	u8 *pframe = precv_frame->rx_data;
-	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
-	u8 action;
 
 	/* check RA matches or not */
 	if (memcmp(myid(&padapter->eeprompriv), mgmt->da, ETH_ALEN))
 		return;
 
-	action = frame_body[1];
-	switch (action) {
-	case ACT_PUBLIC_VENDOR:
+	/* All members of the action enum start with action_code. */
+	if (mgmt->u.action.u.s1g.action_code == WLAN_PUB_ACTION_VENDOR_SPECIFIC)
 		on_action_public_vendor(precv_frame);
-		break;
-	default:
+	else
 		on_action_public_default(precv_frame);
-		break;
-	}
 }
 
 static void OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_frame)
-- 
2.30.2

