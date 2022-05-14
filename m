Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B963258E
	for <linux-staging@lists.linux.dev>; Sat, 14 May 2022 16:48:00 +0000 (UTC)
Received: from dslb-188-097-047-153.188.097.pools.vodafone-ip.de ([188.97.47.153] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1npuvm-0003kw-T1; Sat, 14 May 2022 18:47:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 6/7] staging: r8188eu: check for initiator vs recipient
Date: Sat, 14 May 2022 18:47:39 +0200
Message-Id: <20220514164740.282552-7-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220514164740.282552-1-martin@kaiser.cx>
References: <20220514164740.282552-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For an incoming delba message, the code checks if the delba was sent by
the data initiator or by the data recipient.

Rewrite this check using the ieee80211 helpers, making the code easier to
understand.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 9aa6d09b2e74..af525d633fd7 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1517,10 +1517,11 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 		}
 		break;
 	case WLAN_ACTION_DELBA:
-		if ((frame_body[3] & BIT(3)) == 0) {
+		if (u16_get_bits(le16_to_cpu(mgmt->u.action.u.delba.params),
+				 IEEE80211_DELBA_PARAM_INITIATOR_MASK) == WLAN_BACK_RECIPIENT) {
 			psta->htpriv.agg_enable_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
 			psta->htpriv.candidate_tid_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
-		} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
+		} else {
 			tid = (frame_body[3] >> 4) & 0x0F;
 			preorder_ctrl =  &psta->recvreorder_ctrl[tid];
 			preorder_ctrl->enable = false;
-- 
2.30.2

