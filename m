Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D19E2580
	for <linux-staging@lists.linux.dev>; Sat, 14 May 2022 16:48:02 +0000 (UTC)
Received: from dslb-188-097-047-153.188.097.pools.vodafone-ip.de ([188.97.47.153] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1npuvn-0003kw-N9; Sat, 14 May 2022 18:47:51 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 7/7] staging: r8188eu: use the tid in delba processing
Date: Sat, 14 May 2022 18:47:40 +0200
Message-Id: <20220514164740.282552-8-martin@kaiser.cx>
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

Extract the tid from the delba frame regardless of the recipient/initiator
setting. Use the extracted tid when we process the delba frame.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index af525d633fd7..b24c6a79646d 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1517,12 +1517,13 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 		}
 		break;
 	case WLAN_ACTION_DELBA:
+		tid = u16_get_bits(le16_to_cpu(mgmt->u.action.u.delba.params),
+				   IEEE80211_DELBA_PARAM_TID_MASK);
 		if (u16_get_bits(le16_to_cpu(mgmt->u.action.u.delba.params),
 				 IEEE80211_DELBA_PARAM_INITIATOR_MASK) == WLAN_BACK_RECIPIENT) {
-			psta->htpriv.agg_enable_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
-			psta->htpriv.candidate_tid_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
+			psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
+			psta->htpriv.candidate_tid_bitmap &= ~BIT(tid);
 		} else {
-			tid = (frame_body[3] >> 4) & 0x0F;
 			preorder_ctrl =  &psta->recvreorder_ctrl[tid];
 			preorder_ctrl->enable = false;
 			preorder_ctrl->indicate_seq = 0xffff;
-- 
2.30.2

