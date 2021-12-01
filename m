Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187F72C80
	for <linux-staging@lists.linux.dev>; Wed,  1 Dec 2021 09:43:57 +0000 (UTC)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4J3vKv37JPzQj7k;
	Wed,  1 Dec 2021 17:43:47 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 1 Dec 2021 17:43:54 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Wed, 1 Dec
 2021 17:43:54 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-staging@lists.linux.dev>
CC: <gregkh@linuxfoundation.org>, <paskripkin@gmail.com>,
	<dan.carpenter@oracle.com>
Subject: [PATCH -next 0/3] some fix and cleanup for rtl8192e
Date: Wed, 1 Dec 2021 17:50:33 +0800
Message-ID: <20211201095036.1763163-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected

patch #1, #2:
  fix error handle case in alloc_rtllib()

patch #3:
  remove unnecessary assignment

Yang Yingliang (3):
  staging: rtl8192e: return error code from rtllib_softmac_init()
  staging: rtl8192e: rtllib_module: fix error handle case in
    alloc_rtllib()
  staging: rtl8192e: rtllib_module: remove unnecessary assignment

 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 drivers/staging/rtl8192e/rtllib_module.c  | 17 ++++++++++++-----
 drivers/staging/rtl8192e/rtllib_softmac.c |  6 ++++--
 3 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.25.1

