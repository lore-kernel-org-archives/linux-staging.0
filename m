Received: from qq.com (smtpbg456.qq.com [59.36.132.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE23FCB
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 03:39:46 +0000 (UTC)
X-QQ-mid: bizesmtp37t1632713460t1d43yo7
Received: from localhost.localdomain (unknown [124.126.19.250])
	by esmtp6.qq.com (ESMTP) with 
	id ; Mon, 27 Sep 2021 11:30:58 +0800 (CST)
X-QQ-SSF: 0140000000200040C000B00B0000000
X-QQ-FEAT: 68rqSogMCG88dFhlqQRZlfXHgkbJHdgnvEUYpAKEeWduBDZVTOGMmfXjte4Iy
	SpEho6jgy3A1sTREGkl9KsAQ0KFyGOAeIt8BGidM/EU5MoWw6TkHPvqJp5EVSejtzj7cMqA
	t3zsHABn30auPMIyMfyOI0r8w66LXmoKNSUkoICb/0+Qi6PCEEKJ+vw+rbKXCqQgQKaAcS4
	rp2PjR7+2ytV6eSHA1q/arbdrFB6ksH2H56D3RFSwRLZHuy55+ThkfZ15mqOaYyO0jf4O2/
	YX8XOtBFo5+wD/VH8FfHe3CBXAxsy9GTMx2ZsdDYvMYf4qEobdpulH2HQdGVClnLXUZid3f
	iYnVYvw3F1MQ8Vhlmxrzhw1BiU3FA==
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
Subject: [PATCH] staging: rtl8723bs: remove meaningless pstat->passoc_req check in OnAssocReq()
Date: Mon, 27 Sep 2021 11:30:56 +0800
Message-Id: <20210927033056.27503-1-guolongji@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgweb:qybgweb16

kfree(NULL) is safe and the check 'if (pstat->passoc_req)' before kfree
is not necessary.

Signed-off-by: Longji Guo <guolongji@uniontech.com>
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

