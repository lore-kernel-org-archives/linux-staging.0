Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB1B621
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 01:52:41 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RX2wf37TGzrSFy;
	Fri, 25 Aug 2023 09:50:58 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 25 Aug
 2023 09:52:30 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <gregkh@linuxfoundation.org>, <philipp.g.hortmann@gmail.com>,
	<straube.linux@gmail.com>, <Larry.Finger@lwfinger.net>,
	<wlanfae@realtek.com>, <mikem@ring3k.org>, <seanm@seanm.ca>,
	<linux-staging@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v2 0/3] staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()
Date: Fri, 25 Aug 2023 09:52:10 +0800
Message-ID: <20230825015213.2697347-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

It is not allowed to call kfree_skb() from hardware interrupt
context or with interrupts being disabled. This patchset is
trying to use dev_kfree_skb_irq() or add all skb to a free list, then
free them after spin_unlock_irqrestore() at once.

Changes in v2:
- Combine the three patches into one patch set.
- Update the commit message and subject prefix.

Jinjie Ruan (3):
  staging: rtl8192e: rtl_core: Call dev_kfree_skb_irq() instead of
    kfree_skb() under spin_lock_irqsave()
  staging: rtl8192e: rtl_core: Do not call kfree_skb() under
    spin_lock_irqsave() for _rtl92e_irq()
  Staging: rtl8192e: rtllib_softmac: Do not call kfree_skb() under
    spin_lock_irqsave()

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 24 ++++++++++++--------
 drivers/staging/rtl8192e/rtllib_softmac.c    |  6 ++++-
 2 files changed, 19 insertions(+), 11 deletions(-)

-- 
2.34.1

