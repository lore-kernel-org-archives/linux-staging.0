Received: from qq.com (smtpbg473.qq.com [59.36.132.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374EC3FC8
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 11:49:43 +0000 (UTC)
X-QQ-mid: bizesmtp34t1632743369teo9bqwy
Received: from localhost.localdomain (unknown [111.207.172.18])
	by esmtp6.qq.com (ESMTP) with 
	id ; Mon, 27 Sep 2021 19:49:27 +0800 (CST)
X-QQ-SSF: 0140000000200050C000B00H0000000
X-QQ-FEAT: hR9GyqeohSh8WDgs/PpICt1k85Os4VHBBJmML3ClDIKFYGUlq40W+RDuE1eYl
	yA6+3sldSzsGPmGzkHxPaiIbrkLkmxv/fjCmsxIiXOahcHPaISIAnqcT3tt/s2BsjCia2gZ
	VAdlpv9blGUGBM70Vjw3BN+Vv47NMwEqJGO6x8W9Ww8rygW5+8Q5QMJsQdNt4mUYdD47XN6
	zPXFhXmGc61BIu+MK3pPTtKfJakteKI450D7+YoDN/P6ApCMMYRk2j3vrt3vGoLh9RqAaN9
	LIU5KAr8VTktm8S8fxQQsBl+EvTZVjXT4NTHjX8TSpTm6eIkomjr9CbAL7A4Iu/DHYKAjnl
	1D5PPyRfsJNPoT88gVhWFLBkWnbhYa9H4k69G1P
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
Date: Mon, 27 Sep 2021 19:49:25 +0800
Message-Id: <20210927114925.15940-1-guolongji@uniontech.com>
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

