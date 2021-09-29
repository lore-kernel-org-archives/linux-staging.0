Received: from qq.com (smtpbg474.qq.com [59.36.132.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1322FAF
	for <linux-staging@lists.linux.dev>; Wed, 29 Sep 2021 11:06:42 +0000 (UTC)
X-QQ-mid: bizesmtp32t1632913579tuinqiev
Received: from localhost.localdomain (unknown [124.126.19.250])
	by esmtp6.qq.com (ESMTP) with 
	id ; Wed, 29 Sep 2021 19:06:17 +0800 (CST)
X-QQ-SSF: 0140000000200050C000B00A0000000
X-QQ-FEAT: EFGWNRz8vG7HF6LDufti88NAbi0+lBK5A4Reg9bOwD2tKQPy6ScIrRSHCS8EG
	Rah2GFzRxN8b18xLgW9COtnhaPLnTXXMWlFEM4HhOg3nizOHo/D8MHzchKxoDCNK0+7z8kl
	k+7tVu+lyk4pG4lkpJatt8duALEBTwy+ZL3IDIRHMYEQdc4FPDuKONY3vhHKKH5wcbhuuh1
	smqbyoTErPpSOo87Y7riqI+ezpC/CdxnTQlelT6NZ2P02Ctds+VStgg8YZmyDrrS+1dlc3g
	/mXW8+pPNCb85yUv9lUYHGvA+LU6ncBRxv2/+ZlVma/Rn3VQj9h+fMbec2I9SJXVpATe2Qm
	UwV1EqccQoDRDYNFEaXhDQEUzOxZQ==
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
Date: Wed, 29 Sep 2021 19:06:13 +0800
Message-Id: <20210929110613.29979-1-guolongji@uniontech.com>
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
Changes in v2:
- Drop unnecessary "pstat->passoc_req = NULL;"
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

