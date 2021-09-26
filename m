Received: from qq.com (smtpbg466.qq.com [59.36.132.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94F872
	for <linux-staging@lists.linux.dev>; Sun, 26 Sep 2021 10:46:24 +0000 (UTC)
X-QQ-mid: bizesmtp40t1632652218tezn9pwg
Received: from localhost.localdomain (unknown [124.126.19.250])
	by esmtp6.qq.com (ESMTP) with 
	id ; Sun, 26 Sep 2021 18:30:17 +0800 (CST)
X-QQ-SSF: 0140000000200020C000000F0000000
X-QQ-FEAT: Mzskoac49Oi03Y9nzIB+fKO6AQ9MLo6Ds6JBHd8/Tqgg6NdsPYwV9PuIddPO9
	AkJZUuNqPMrEdLI+czJZYjcX+gDVkHDC7tSj60SaPjWroemcCwKGO2S067fZ0dFFcMDXdIa
	sJeaAKyAFl1gNY/S/sslJ0SAmA2bnPK34GpENp3TdYY1bCWWvFDPCQ+PVitBOO4uq23zSlJ
	yLgi1i9CPVnIvoIxjiS4QPpV9v4YS4gxgSLSHFB9enq7eXBGeQYZdOMkWitnjWcJlR660j+
	qoUEFbMx34LFc3yK42PWhxxK8eKBCV6Pf91Nbr5BiCZZ6SypJnlVz/VcBoZ5EZMtjYNXHzk
	p1r+GZ6AlAju26jsunwRV3vOR1aDg==
X-QQ-GoodBg: 1
From: guolongji <guolongji@uniontech.com>
To: gregkh@linuxfoundation.org,
	fabioaiuto83@gmail.com
Cc: ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	guolongji <guolongji@uniontech.com>
Subject: [PATCH] staging: rtl8723bs: remove meaningless pstat->passoc_req check in OnAssocReq()
Date: Sun, 26 Sep 2021 18:30:14 +0800
Message-Id: <20210926103014.30088-1-guolongji@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1

kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
is not possible.

Signed-off-by: guolongji <guolongji@uniontech.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 375d2a742dd2..a46ab97524aa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1344,11 +1344,9 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			issue_asocrsp(padapter, status, pstat, WIFI_REASSOCRSP);
 
 		spin_lock_bh(&pstat->lock);
-		if (pstat->passoc_req) {
-			kfree(pstat->passoc_req);
-			pstat->passoc_req = NULL;
-			pstat->assoc_req_len = 0;
-		}
+		kfree(pstat->passoc_req);
+		pstat->passoc_req = NULL;
+		pstat->assoc_req_len = 0;
 
 		pstat->passoc_req =  rtw_zmalloc(pkt_len);
 		if (pstat->passoc_req) {
-- 
2.20.1



