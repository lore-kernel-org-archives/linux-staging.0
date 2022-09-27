Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF737B
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 02:06:51 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mc2v84qgwz1P6vP;
	Tue, 27 Sep 2022 10:02:28 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 10:06:42 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:06:41 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <Larry.Finger@lwfinger.net>, <phil@philpotter.co.uk>,
	<paskripkin@gmail.com>, <gregkh@linuxfoundation.org>, <martin@kaiser.cx>,
	<straube.linux@gmail.com>, <marcus.yu.56@gmail.com>, <makvihas@gmail.com>,
	<linux-staging@lists.linux.dev>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH -next] staging: r8188eu: Use skb_put_data() instead of skb_put/memcpy pair
Date: Tue, 27 Sep 2022 10:40:50 +0800
Message-ID: <20220927024050.13556-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected

Use skb_put_data() instead of skb_put() and memcpy(), which is shorter
and clear. Drop the tmp variable that is not needed any more.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/staging/r8188eu/core/rtw_recv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 353c7468367a..44f92ce63440 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1412,7 +1412,6 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 	u8	nr_subframes, i;
 	unsigned char *pdata;
 	struct rx_pkt_attrib *pattrib;
-	unsigned char *data_ptr;
 	struct sk_buff *sub_skb, *subframes[MAX_SUBFRAME_COUNT];
 
 	struct recv_priv *precvpriv = &padapter->recvpriv;
@@ -1447,8 +1446,7 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 		sub_skb = dev_alloc_skb(nSubframe_Length + 12);
 		if (sub_skb) {
 			skb_reserve(sub_skb, 12);
-			data_ptr = (u8 *)skb_put(sub_skb, nSubframe_Length);
-			memcpy(data_ptr, pdata, nSubframe_Length);
+			skb_put_data(sub_skb, pdata, nSubframe_Length);
 		} else {
 			sub_skb = skb_clone(prframe->pkt, GFP_ATOMIC);
 			if (sub_skb) {
-- 
2.17.1

