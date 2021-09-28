Received: from qq.com (smtpbg477.qq.com [59.36.132.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305C372
	for <linux-staging@lists.linux.dev>; Tue, 28 Sep 2021 06:13:53 +0000 (UTC)
X-QQ-mid: bizesmtp38t1632809610t1dfvbmb
Received: from localhost.localdomain (unknown [111.207.172.18])
	by esmtp6.qq.com (ESMTP) with 
	id ; Tue, 28 Sep 2021 14:13:28 +0800 (CST)
X-QQ-SSF: 0140000000200050C000B00A0000000
X-QQ-FEAT: 17DF3wlGPwAznzzCQ4oOQgw4VMBSna94fl6yC9jTQd7QZAblxuXE50GcsJTaJ
	akd9IVxK/PDV+wp4qJq4PzFq4hg2WLJ8Hv03HzAnpNVCfB3dN1SJhwtE9bR/cEBjwUhd4TP
	NUGcYX3MsRrFtPIy7bCabUI/oiZUqxN5HX66kiBzIUjZqBJEv4/BhcRxcGe/+jsxJyMvdQy
	AZo3CAEhXpZKMYxgj5Pck8PbXxdQVlx790aIzaVAV2wnC5G7FC6EuaXDHVbePxrz8vcg7ru
	bnxEE9YRUu/v/ylnZZUyRZ6/ewrKpJeh/DspTgtWC+fO+5E1Z7DS7bxZqNOLr63+8LtdDOg
	NxhEfjfouhxC6bqoiH+L1RDJH12og==
X-QQ-GoodBg: 2
From: Longji Guo <guolongji@uniontech.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com
Cc: ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	hdegoede@redhat.com,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longji Guo <guolongji@uniontech.com>
Subject: [PATCH v2] staging: rtl8723bs: remove meaningless pstat->passoc_req check in OnAssocReq()
Date: Tue, 28 Sep 2021 14:13:19 +0800
Message-Id: <20210928061319.4784-1-guolongji@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgweb:qybgweb14

kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
is not necessary.

Signed-off-by: Longji Guo <guolongji@uniontech.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 375d2a742dd2..51390a30fa55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1344,12 +1344,8 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
 
 		spin_lock_bh(&pstat->lock);
-		if (pstat->passoc_req) {
-			kfree(pstat->passoc_req);
-			pstat->passoc_req = NULL;
-			pstat->assoc_req_len = 0;
-		}
-
+		kfree(pstat->passoc_req);
+		pstat->assoc_req_len = 0;
 		pstat->passoc_req =  rtw_zmalloc(pkt_len);
 		if (pstat->passoc_req) {
 			memcpy(pstat->passoc_req, pframe, pkt_len);
-- 
2.20.1

