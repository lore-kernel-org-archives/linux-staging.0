Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABAA2FB9
	for <linux-staging@lists.linux.dev>; Thu, 27 May 2021 12:11:52 +0000 (UTC)
Received: from dggeml767-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FrR2M077szYnBt;
	Thu, 27 May 2021 19:50:03 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggeml767-chm.china.huawei.com (10.1.199.177) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 27 May 2021 19:52:42 +0800
Received: from huawei.com (10.175.127.227) by dggpeml500020.china.huawei.com
 (7.185.36.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 27 May
 2021 19:52:42 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <gregkh@linuxfoundation.org>, <ross.schm.dev@gmail.com>,
	<fabioaiuto83@gmail.com>, <marcocesati@gmail.com>, <fmdefrancesco@gmail.com>,
	<linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: <weiyongjun1@huawei.com>, <yuehaibing@huawei.com>,
	<yangjihong1@huawei.com>, <yukuai3@huawei.com>, <libaokun1@huawei.com>
Subject: [PATCH -next] staging: rtl8723bs: Remove set but not used variable 'reason_code'
Date: Thu, 27 May 2021 20:02:10 +0800
Message-ID: <20210527120210.321810-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.25.4
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/staging/rtl8723bs/core/rtw_mlme_ext.c: In function 'OnAction_back':
drivers/staging/rtl8723bs/core/rtw_mlme_ext.c:1729:30: warning:
 variable ‘reason_code’ set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: Baokun Li <libaokun1@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 9fc612fb736f..97b3c2965770 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1721,7 +1721,7 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char 	*frame_body;
 	unsigned char 	category, action;
-	unsigned short	tid, status, reason_code = 0;
+	unsigned short	tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 	u8 *pframe = precv_frame->u.hdr.rx_data;
@@ -1790,9 +1790,6 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 					~BIT((frame_body[3] >> 4) & 0xf);
 				psta->htpriv.candidate_tid_bitmap &=
 					~BIT((frame_body[3] >> 4) & 0xf);
-
-				/* reason_code = frame_body[4] | (frame_body[5] << 8); */
-				reason_code = get_unaligned_le16(&frame_body[4]);
 			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
 				tid = (frame_body[3] >> 4) & 0x0F;
 
-- 
2.25.4

