Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6492583
	for <linux-staging@lists.linux.dev>; Sat, 14 May 2022 16:47:59 +0000 (UTC)
Received: from dslb-188-097-047-153.188.097.pools.vodafone-ip.de ([188.97.47.153] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1npuvm-0003kw-3Q; Sat, 14 May 2022 18:47:50 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/7] staging: r8188eu: use BIT(tid) instead of manual shift
Date: Sat, 14 May 2022 18:47:38 +0200
Message-Id: <20220514164740.282552-6-martin@kaiser.cx>
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

Use BIT(tid) instead of 1 << tid when we process an addba response.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index d5ea074c62f4..9aa6d09b2e74 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1510,7 +1510,7 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 		tid = u16_get_bits(le16_to_cpu(mgmt->u.action.u.addba_resp.capab),
 				   IEEE80211_ADDBA_PARAM_TID_MASK);
 		if (mgmt->u.action.u.addba_resp.status == 0) {	/* successful */
-			psta->htpriv.agg_enable_bitmap |= 1 << tid;
+			psta->htpriv.agg_enable_bitmap |= BIT(tid);
 			psta->htpriv.candidate_tid_bitmap &= ~BIT(tid);
 		} else {
 			psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
-- 
2.30.2

