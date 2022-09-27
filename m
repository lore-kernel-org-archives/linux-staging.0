Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 790FF7B
	for <linux-staging@lists.linux.dev>; Tue, 27 Sep 2022 02:13:21 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mc2x46bBDzWgyQ;
	Tue, 27 Sep 2022 10:04:08 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 10:08:12 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 10:08:12 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <gregkh@linuxfoundation.org>, <wjsota@gmail.com>,
	<linux-staging@lists.linux.dev>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH -next] staging: rtl8192e: cmdpkt: Use skb_put_data() instead of skb_put/memcpy pair
Date: Tue, 27 Sep 2022 10:42:20 +0800
Message-ID: <20220927024220.14044-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected

Use skb_put_data() instead of skb_put() and memcpy(), which is shorter
and clear.

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
index cd8bbc358d01..57b4c8433e8e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
@@ -61,8 +61,7 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 			tcb_desc->txbuf_size = frag_length;
 		}
 
-		seg_ptr = skb_put(skb, frag_length);
-		memcpy(seg_ptr, data, (u32)frag_length);
+		skb_put_data(skb, data, frag_length);
 
 		if (type == DESC_PACKET_TYPE_INIT &&
 		    (!priv->rtllib->check_nic_enough_desc(dev, TXCMD_QUEUE) ||
-- 
2.17.1

