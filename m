Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F8670
	for <linux-staging@lists.linux.dev>; Sat, 29 May 2021 10:15:13 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Fscms1h04zYmyg;
	Sat, 29 May 2021 18:12:29 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 18:15:10 +0800
Received: from huawei.com (10.175.127.227) by dggema762-chm.china.huawei.com
 (10.1.198.204) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sat, 29
 May 2021 18:15:09 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <gregkh@linuxfoundation.org>, <fabioaiuto83@gmail.com>
CC: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<yukuai3@huawei.com>, <yi.zhang@huawei.com>
Subject: [PATCH V2] staging: rtl8723bs: core: rtw_mlme_ext.c: remove deadcode
Date: Sat, 29 May 2021 18:24:31 +0800
Message-ID: <20210529102431.3173753-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210529100137.GA1416@agape.jhs>
References: <20210529100137.GA1416@agape.jhs>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected

'CHECK_EVENT_SEQ' is not defined anywhere, remove the deadcode.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 97b3c2965770..2b95a49ab469 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -6006,7 +6006,7 @@ static struct fwevent wlanevents[] = {
 
 u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 {
-	u8 evt_code, evt_seq;
+	u8 evt_code;
 	u16 evt_sz;
 	uint	*peventbuf;
 	void (*event_callback)(struct adapter *dev, u8 *pbuf);
@@ -6017,19 +6017,8 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 
 	peventbuf = (uint *)pbuf;
 	evt_sz = (u16)(*peventbuf&0xffff);
-	evt_seq = (u8)((*peventbuf>>24)&0x7f);
 	evt_code = (u8)((*peventbuf>>16)&0xff);
 
-
-	#ifdef CHECK_EVENT_SEQ
-	/*  checking event sequence... */
-	if (evt_seq != (atomic_read(&pevt_priv->event_seq) & 0x7f)) {
-		pevt_priv->event_seq = (evt_seq+1)&0x7f;
-
-		goto _abort_event_;
-	}
-	#endif
-
 	/*  checking if event code is valid */
 	if (evt_code >= MAX_C2HEVT)
 		goto _abort_event_;
-- 
2.25.4

