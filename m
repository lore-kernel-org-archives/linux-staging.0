Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904011FB4
	for <linux-staging@lists.linux.dev>; Thu, 24 Aug 2023 07:46:26 +0000 (UTC)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.57])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RWZqL5sNdz1L96n;
	Thu, 24 Aug 2023 15:44:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 24 Aug
 2023 15:46:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <gregkh@linuxfoundation.org>, <philipp.g.hortmann@gmail.com>,
	<straube.linux@gmail.com>, <seanm@seanm.ca>, <mikem@ring3k.org>,
	<Larry.Finger@lwfinger.net>, <wlanfae@realtek.com>,
	<linux-staging@lists.linux.dev>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next 0/2] staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()
Date: Thu, 24 Aug 2023 15:45:55 +0800
Message-ID: <20230824074557.1928715-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected

It is not allowed to call kfree_skb() from hardware interrupt
context or with interrupts being disabled. This patchset is
trying to add all skb to a free list, then free them after
spin_unlock_irqrestore() at once.

Jinjie Ruan (2):
  staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()
  staging: rtl8192e: Do not call kfree_skb() under spin_lock_irqsave()

 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 22 ++++++++++++--------
 drivers/staging/rtl8192e/rtllib_softmac.c    |  6 +++++-
 2 files changed, 18 insertions(+), 10 deletions(-)

-- 
2.34.1

